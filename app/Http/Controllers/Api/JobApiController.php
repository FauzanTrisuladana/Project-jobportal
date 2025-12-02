<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Job;
use Illuminate\Http\Request;

class JobApiController extends Controller
{
	/**
	 * @OA\Get(
	 *     path="/api/public/jobs",
	 *     summary="Get public job listings (no auth)",
	 *     tags={"Jobs"},
	 *     @OA\Parameter(
	 *         name="keyword",
	 *         in="query",
	 *         description="Search text applied to title, company, and location",
	 *         required=false,
	 *         @OA\Schema(type="string")
	 *     ),
	 *     @OA\Parameter(
	 *         name="company",
	 *         in="query",
	 *         description="Filter by company name (partial match)",
	 *         required=false,
	 *         @OA\Schema(type="string")
	 *     ),
	 *     @OA\Parameter(
	 *         name="location",
	 *         in="query",
	 *         description="Filter by job location (partial match)",
	 *         required=false,
	 *         @OA\Schema(type="string")
	 *     ),
	 *     @OA\Parameter(
	 *         name="page",
	 *         in="query",
	 *         description="Page number (default 1)",
	 *         required=false,
	 *         @OA\Schema(type="integer", minimum=1)
	 *     ),
	 *     @OA\Parameter(
	 *         name="per_page",
	 *         in="query",
	 *         description="Items per page (default 10)",
	 *         required=false,
	 *         @OA\Schema(type="integer")
	 *     ),
	 *     @OA\Response(
	 *         response=200,
	 *         description="List of jobs",
	 *         @OA\JsonContent(
	 *             type="array",
	 *             @OA\Items(
	 *                 @OA\Property(property="id", type="integer"),
	 *                 @OA\Property(property="title", type="string"),
	 *                 @OA\Property(property="company", type="string"),
	 *                 @OA\Property(property="location", type="string")
	 *             )
	 *         )
	 *     )
	 * )
	 */
	/**
	 * @OA\Get(
	 *     path="/api/jobs",
	 *     summary="Get all job listings",
	 *     tags={"Jobs"},
	 *     security={{"bearerAuth":{}}},
		*     @OA\Parameter(
		*         name="keyword",
		*         in="query",
		*         description="Search text applied to title, company, and location",
		*         required=false,
		*         @OA\Schema(type="string")
		*     ),
		*     @OA\Parameter(
		*         name="company",
		*         in="query",
		*         description="Filter by company name (partial match)",
		*         required=false,
		*         @OA\Schema(type="string")
		*     ),
		*     @OA\Parameter(
		*         name="location",
		*         in="query",
		*         description="Filter by job location (partial match)",
		*         required=false,
		*         @OA\Schema(type="string")
		*     ),
        *     @OA\Parameter(
        *         name="page",
        *         in="query",
        *         description="Page number (default 1)",
        *         required=false,
        *         @OA\Schema(type="integer", minimum=1)
        *     ),
		*     @OA\Parameter(
		*         name="per_page",
		*         in="query",
		*         description="Items per page (default 10)",
		*         required=false,
		*         @OA\Schema(type="integer")
		*     ),
	 *     @OA\Response(
	 *         response=200,
	 *         description="List of jobs",
	 *         @OA\JsonContent(
	 *             type="array",
	 *             @OA\Items(
	 *                 @OA\Property(property="id", type="integer"),
	 *                 @OA\Property(property="title", type="string"),
	 *                 @OA\Property(property="company", type="string"),
	 *                 @OA\Property(property="location", type="string")
	 *             )
	 *         )
	 *     )
	 * )
	 */
	public function index(Request $req)
	{
		// optional search & pagination
		$q = Job::query();
		if ($req->filled('keyword')) {
			$kw = $req->keyword;
			$q->where(function ($s) use ($kw) {
				$s->where('title', 'like', "%$kw%")
				  ->orWhere('company', 'like', "%$kw%")
				  ->orWhere('location', 'like', "%$kw%") ;
			});
		}
		if ($req->filled('company')) {
			$q->where('company', 'like', '%'.$req->get('company').'%');
		}
		if ($req->filled('location')) {
			$q->where('location', 'like', '%'.$req->get('location').'%');
		}
		$jobs = $q->orderBy('created_at', 'desc')->paginate($req->get('per_page', 10));
		return response()->json($jobs);
	}

	public function show(Job $job)
	{
		return response()->json($job);
	}

	public function store(Request $req)
	{
		// cek role admin
		if ($req->user()->role !== 'admin') {
			return response()->json(['message' => 'Forbidden'], 403);
		}

		$data = $req->validate([
			'title' => 'required',
			'description' => 'required',
			'location' => 'required',
			'company' => 'required',
			'salary' => 'nullable|integer',
		]);

		$job = Job::create($data);
		return response()->json(['message' => 'Created', 'job' => $job], 201);
	}

	public function update(Request $req, Job $job)
	{
		if ($req->user()->role !== 'admin') {
			return response()->json(['message' => 'Forbidden'], 403);
		}

		$data = $req->validate([
			'title' => 'sometimes|required',
			'description' => 'sometimes|required',
			'location' => 'sometimes|required',
			'company' => 'sometimes|required',
			'salary' => 'nullable|integer',
		]);

		$job->update($data);
		return response()->json(['message' => 'Updated', 'job' => $job]);
	}

	public function destroy(Request $req, Job $job)
	{
		if ($req->user()->role !== 'admin') {
			return response()->json(['message' => 'Forbidden'], 403);
		}
		$job->delete();
		return response()->json(['message' => 'Deleted']);
	}
}
