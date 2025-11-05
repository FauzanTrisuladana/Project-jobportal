@extends('layouts.app')

@section('content')
<div class="max-w-3xl mx-auto py-8 px-4">
	<div class="bg-white shadow rounded-lg p-6">
		<h2 class="text-2xl font-semibold mb-6">Edit Lowongan</h2>
		<form action="{{ route('jobs.update', $job->id) }}" method="POST" enctype="multipart/form-data" class="space-y-4">
			@csrf
			@method('PUT')
			<div>
				<input type="text" name="title" placeholder="Judul Lowongan" value="{{ old('title', $job->title) }}" class="block w-full rounded-md border border-gray-300 px-3 py-2 shadow-sm focus:border-indigo-500 focus:ring-indigo-500" />
			</div>
			<div>
				<textarea name="description" placeholder="Deskripsi" rows="4" class="block w-full rounded-md border border-gray-300 px-3 py-2 shadow-sm focus:border-indigo-500 focus:ring-indigo-500">{{ old('description', $job->description) }}</textarea>
			</div>
			<div>
				<input type="text" name="location" placeholder="Lokasi" value="{{ old('location', $job->location) }}" class="block w-full rounded-md border border-gray-300 px-3 py-2 shadow-sm focus:border-indigo-500 focus:ring-indigo-500" />
			</div>
			<div>
				<input type="text" name="company" placeholder="Nama Perusahaan" value="{{ old('company', $job->company) }}" class="block w-full rounded-md border border-gray-300 px-3 py-2 shadow-sm focus:border-indigo-500 focus:ring-indigo-500" />
			</div>
			<div>
				<input type="number" name="salary" placeholder="Gaji" value="{{ old('salary', $job->salary) }}" class="block w-full rounded-md border border-gray-300 px-3 py-2 shadow-sm focus:border-indigo-500 focus:ring-indigo-500" />
			</div>
			<div>
				<select name="job_type" class="block w-full rounded-md border border-gray-300 px-3 py-2 shadow-sm focus:border-indigo-500 focus:ring-indigo-500">
					<option value="">Pilih Jenis Pekerjaan</option>
					<option value="Full-time" {{ old('job_type', $job->job_type) == 'Full-time' ? 'selected' : '' }}>Full-time</option>
					<option value="Part-time" {{ old('job_type', $job->job_type) == 'Part-time' ? 'selected' : '' }}>Part-time</option>
				</select>
			</div>
			@if($job->logo)
				<div>
					<img src="{{ asset('storage/' . $job->logo) }}" width="80" alt="Logo" class="rounded">
				</div>
			@endif
			<div>
				<input type="file" name="logo" class="block w-full rounded-md border border-gray-300 px-3 py-2 shadow-sm focus:border-indigo-500 focus:ring-indigo-500" />
			</div>
			<div class="pt-2">
				<button type="submit" class="inline-flex items-center rounded-md bg-indigo-600 px-4 py-2 text-white hover:bg-indigo-700 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">Update</button>
			</div>
		</form>
	</div>
	@if ($errors->any())
		<div class="mt-4 rounded-md border border-red-200 bg-red-50 p-4 text-red-700">
			<ul class="list-disc ms-5">
				@foreach ($errors->all() as $error)
					<li>{{ $error }}</li>
				@endforeach
			</ul>
		</div>
	@endif
</div>
@endsection
