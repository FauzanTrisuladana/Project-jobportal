<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

/**
* @OA\SecurityScheme(
* securityScheme="bearerAuth",
* type="http",
* scheme="bearer"
*)
*/
class AuthController extends Controller
{
	/**
	 * @OA\Post(
	 *     path="/api/register",
	 *     summary="Register a new user",
	 *     tags={"Auth"},
	*     @OA\RequestBody(
	*         required=true,
	*         @OA\JsonContent(
	*             required={"name","email","password"},
	*             @OA\Property(property="name", type="string", example="Fauzan"),
	*             @OA\Property(property="email", type="string", format="email", example="fauzan@example.com"),
	*             @OA\Property(property="password", type="string", minLength=6, example="secret123")
	*         )
	*     ),
	 *     @OA\Response(
	 *         response=201,
	 *         description="Registered",
	 *         @OA\JsonContent(
	 *             @OA\Property(property="status", type="string", example="success"),
	 *             @OA\Property(property="message", type="string", example="Registered"),
	 *             @OA\Property(property="user", type="object",
	 *                 @OA\Property(property="id", type="integer"),
	 *                 @OA\Property(property="name", type="string"),
	 *                 @OA\Property(property="email", type="string")
	 *             )
	 *         )
	 *     ),
	 *     @OA\Response(
	 *         response=422,
	 *         description="Validation failed"
	 *     )
	 * )
	 */
	public function register(Request $req)
	{
		$data = $req->validate([
			'name' => 'required|string',
			'email' => 'required|email|unique:users,email',
			'password' => 'required|min:6',
		]);

		$user = User::create([
			'name' => $data['name'],
			'email' => $data['email'],
			'password' => Hash::make($data['password']),
			'role' => 'user', // default job seeker
		]);

		return response()->json([
            'status' => 'success',
            'message' => 'Registered',
            'user' => $user
        ], 201);
	}

	/**
	 * @OA\Post(
	 *     path="/api/login",
	 *     summary="Login and get token",
	 *     tags={"Auth"},
	*     @OA\RequestBody(
	*         required=true,
	*         @OA\JsonContent(
	*             required={"email","password"},
	*             @OA\Property(property="email", type="string", format="email", example="fauzan@example.com"),
	*             @OA\Property(property="password", type="string", example="secret123")
	*         )
	*     ),
	 *     @OA\Response(
	 *         response=200,
	 *         description="Login success",
	 *         @OA\JsonContent(
	 *             @OA\Property(property="status", type="string", example="success"),
	 *             @OA\Property(property="message", type="string", example="Login success"),
	 *             @OA\Property(property="token", type="string")
	 *         )
	 *     ),
	 *     @OA\Response(
	 *         response=401,
	 *         description="Invalid credentials"
	 *     ),
	 *     @OA\Response(
	 *         response=422,
	 *         description="Validation failed"
	 *     )
	 * )
	 */
	public function login(Request $req)
	{
		$credentials = $req->validate([
			'email' => 'required|email',
			'password' => 'required',
		]);

		if (!Auth::attempt($credentials)) {
			return response()->json([
                'status' => 'error',
                'message' => 'Invalid credentials'
            ], 401);
		}

		/** @var \App\Models\User $user */
		$user = Auth::user();
		$token = $user->createToken('api-token')->plainTextToken;

		return response()->json([
            'status' => 'success',
			'message' => 'Login success',
			'token' => $token,
			'user' => $user
		]);
	}

	/**
	 * @OA\Post(
	 *     path="/api/logout",
	 *     summary="Logout (revoke current token)",
	 *     tags={"Auth"},
	 *     security={{"bearerAuth":{}}},
	 *     @OA\Response(
	 *         response=200,
	 *         description="Logged out",
	 *         @OA\JsonContent(
	 *             @OA\Property(property="status", type="string", example="success"),
	 *             @OA\Property(property="message", type="string", example="Logged out")
	 *         )
	 *     ),
	 *     @OA\Response(
	 *         response=401,
	 *         description="Unauthorized"
	 *     )
	 * )
	 */
	public function logout(Request $req)
	{
		$req->user()->currentAccessToken()->delete();
		return response()->json([
            'status' => 'success',
            'message' => 'Logged out'
        ]);
	}
}
