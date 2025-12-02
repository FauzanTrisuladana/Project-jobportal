<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Application;
use App\Models\Job;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class ApplicationApiController extends Controller
{
	/**
	 * @OA\Get(
	 *     path="/api/applications",
	 *     summary="List applications (admin)",
	 *     tags={"Applications"},
	 *     security={{"bearerAuth":{}}},
	 *     @OA\Parameter(
	 *         name="per_page",
	 *         in="query",
	 *         description="Items per page (default 10)",
	 *         required=false,
	 *         @OA\Schema(type="integer")
	 *     ),
	 *     @OA\Response(response=200, description="List of applications")
	 * )
	 */
	public function index(Request $req)
	{
		if ($req->user()->role !== 'admin') {
			return response()->json(['message' => 'Forbidden'], 403);
		}
		$apps = Application::with(['user', 'job'])
			->latest()
			->paginate($req->get('per_page', 10));
		return response()->json($apps);
	}

	/**
	 * @OA\Post(
	 *     path="/api/jobs/{job}/apply",
	 *     summary="Apply to a job (authenticated user)",
	 *     tags={"Applications"},
	 *     security={{"bearerAuth":{}}},
	 *     @OA\Parameter(name="job", in="path", required=true, @OA\Schema(type="integer")),
	 *     @OA\RequestBody(
	 *             required=true,
	 *             @OA\MediaType(
	 *                 mediaType="multipart/form-data",
	 *                 @OA\Schema(
	 *                     type="object",
	 *                     required={"cv"},
	 *                     @OA\Property(
	 *                         property="cv",
	 *                         type="string",
	 *                         format="binary"
	 *                     )
	 *                 )
	 *             )
	 *         ),
	 *     @OA\Response(response=201, description="Application submitted"),
	 *     @OA\Response(response=422, description="Validation failed")
	 * )
	 */
	public function store(Request $req, Job $job)
	{
		// Job Seeker apply (upload CV optional via API multipart)
		$req->validate([
			'cv' => 'required|file|mimes:pdf|max:2048',
		]);

		$cvPath = $req->file('cv')->store('cvs', 'public');

		$app = Application::create([
			'user_id' => $req->user()->id,
			'job_id' => $job->id,
			'cv' => $cvPath,
			'status' => 'Pending',
		]);

		return response()->json(['message' => 'Application submitted', 'application' => $app], 201);
	}

	/**
	 * @OA\Patch(
	 *     path="/api/applications/{application}/status",
	 *     summary="Update application status (admin)",
	 *     tags={"Applications"},
	 *     security={{"bearerAuth":{}}},
	 *     @OA\Parameter(name="application", in="path", required=true, @OA\Schema(type="integer")),
	 *     @OA\RequestBody(
	 *         required=true,
	 *         @OA\JsonContent(
	 *             required={"status"},
	 *             @OA\Property(property="status", type="string", enum={"Accepted","Rejected"})
	 *         )
	 *     ),
	 *     @OA\Response(response=200, description="Status updated"),
	 *     @OA\Response(response=403, description="Forbidden"),
	 *     @OA\Response(response=422, description="Validation failed")
	 * )
	 */
	public function updateStatus(Request $req, Application $application)
	{
		if ($req->user()->role !== 'admin') {
			return response()->json(['message' => 'Forbidden'], 403);
		}

		$data = $req->validate([
			'status' => 'required|in:Accepted,Rejected',
		]);

		$application->status = $data['status'];
		$application->save();

		return response()->json([
			'message' => 'Status updated',
			'application' => $application->fresh(['user', 'job']),
		]);
	}
}
