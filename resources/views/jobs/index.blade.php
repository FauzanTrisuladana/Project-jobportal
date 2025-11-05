@extends('layouts.app')

@section('content')
<div class="container">
	<h2>Daftar Lowongan</h2>
    @if(session('success'))
        <div class="alert alert-success">
            {{ session('success') }}
        </div>
    @endif
	<a href="{{ route('jobs.create') }}" class="btn btn-success mb-3">Tambah Lowongan</a>

	<div class="row">
		@forelse($jobs as $job)
		<div class="col-md-6 col-lg-4 mb-4">
			<div class="card h-100">
				@if($job->logo)
					<img src="{{ asset('storage/' . $job->logo) }}" class="card-img-top" alt="{{ $job->company }}" style="height: 200px; object-fit: cover;">
				@else
					<div class="card-img-top bg-secondary d-flex align-items-center justify-content-center" style="height: 200px;">
						<span class="text-white">No Logo</span>
					</div>
				@endif
				<div class="card-body">
					<h5 class="card-title">{{ $job->title }}</h5>
					<h6 class="card-subtitle mb-2 text-muted">{{ $job->company }}</h6>
					<p class="card-text">
						<small class="text-muted">
							<i class="bi bi-geo-alt"></i> {{ $job->location }}<br>
							<i class="bi bi-cash"></i> Rp {{ number_format($job->salary, 0, ',', '.') }}<br>
							<i class="bi bi-briefcase"></i> {{ $job->job_type }}
						</small>
					</p>
				</div>
				<div class="card-footer bg-transparent">
					<div class="d-flex gap-2">
						<a href="{{ route('jobs.edit', $job->id) }}" class="btn btn-warning btn-sm flex-fill">Edit</a>
						<form action="{{ route('jobs.destroy', $job->id) }}" method="POST" class="flex-fill">
							@csrf
							@method('DELETE')
							<button class="btn btn-danger btn-sm w-100" onclick="return confirm('Hapus data?')">Hapus</button>
						</form>
					</div>
				</div>
			</div>
		</div>
		@empty
		<div class="col-12">
			<div class="alert alert-info text-center">
				Belum ada lowongan pekerjaan.
			</div>
		</div>
		@endforelse
	</div>
</div>
@endsection
