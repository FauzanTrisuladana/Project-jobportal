@extends('layouts.app')

@section('content')
<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
	<h2 class="text-2xl font-semibold mb-4 text-white">Daftar Lowongan</h2>
	@if(session('success'))
	   <div class="mb-4 rounded-md border border-green-200 bg-success-50 p-3 text-white bg-green-600">
		   {{ session('success') }}
	   </div>
    @endif

    @if(Auth::check() && Auth::user()->role === 'admin')
        <div class="flex flex-col md:flex-row gap-4 mb-6 p-4 bg-gray-800 rounded-lg shadow">
            <div class="flex flex-col sm:flex-row gap-3 items-center">
                <a href="{{ route('jobs.create') }}" class="inline-flex items-center justify-center px-4 py-2 text-sm font-medium rounded-md bg-green-600 hover:bg-green-700 text-white transition">Tambah Lowongan</a>
                <a href="{{ route('jobs.sample') }}" class="inline-flex items-center justify-center px-4 py-2 text-sm font-medium rounded-md bg-indigo-500 hover:bg-indigo-600 text-white transition">Download Contoh Excel</a>
            </div>
            <form action="/jobs/import" method="POST" enctype="multipart/form-data" class="flex flex-col sm:flex-row gap-3 items-center flex-1 mt-4 md:mt-0">
                @csrf
                <input type="file" name="file" required class="block rounded-md border border-gray-600 px-3 py-2 text-sm focus:border-indigo-500 focus:ring-indigo-500 bg-gray-700 text-white file:mr-4 file:py-1 file:px-3 file:rounded-md file:border-0 file:text-sm file:font-semibold file:bg-indigo-600 file:text-white hover:file:bg-indigo-700 file:cursor-pointer">
                <button type="submit" class="inline-flex items-center justify-center px-4 py-2 text-sm font-medium rounded-md bg-indigo-600 hover:bg-indigo-700 text-white transition">Import Lowongan</button>
            </form>
        </div>
    @endif

	<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
		@forelse($jobs as $job)
	    <div class="bg-gray-800 rounded-lg shadow overflow-hidden flex flex-col mt-2">
		    @if($job->logo)
                <img src="{{ asset('storage/' . $job->logo) }}" alt="{{ $job->company }}" class="w-full h-48 object-cover">
            @else
                <div class="w-full h-48 bg-gray-700 flex items-center justify-center">
                    <span class="text-white text-lg">No Logo</span>
                </div>
            @endif
            <div class="p-6">
                <h5 class="text-lg font-semibold text-white">{{ $job->title }}</h5>
                <p class="text-sm text-white mb-2">{{ $job->company }}</p>
                <div class="text-sm text-white space-y-1">
                    <p>📝 {{ $job->description }}</p>
                    <p>📍 {{ $job->location }}</p>
                    <p>💰 Rp {{ number_format($job->salary, 0, ',', '.') }}</p>
                    <p>👜 {{ $job->job_type }}</p>
                </div>
		    </div>
            {{-- kalau role admin --}}
            @if(Auth::check() && Auth::user()->role === 'admin')
                <div class="p-4 border-t border-gray-700 mt-auto">
                    <div class="flex gap-2">
                        <a href="{{ route('jobs.applicants', $job->id) }}" class="inline-flex items-center rounded-md border border-transparent bg-gray-600 px-3 py-1 text-xs font-semibold text-white transition hover:bg-gray-700 focus:outline-none focus:ring-2 focus:ring-gray-600 focus:ring-offset-2">Aplicant</a>
                        <a href="{{ route('jobs.edit', $job->id) }}" class="flex-1 inline-flex items-center justify-center px-3 py-2 text-sm font-medium rounded-md bg-yellow-500 hover:bg-yellow-600 text-white">Edit</a>
                        <form action="{{ route('jobs.destroy', $job->id) }}" method="POST" class="flex-1">
                            @csrf
                            @method('DELETE')
                            <button class="w-full px-3 py-2 text-sm font-medium rounded-md bg-red-600 hover:bg-red-700 text-white" onclick="return confirm('Hapus data?')">Hapus</button>
                        </form>
                    </div>
                </div>
            @endif
            {{-- kalau role user --}}
            @if(Auth::check() && Auth::user()->role === 'user')
                <form action="{{ route('apply.store', $job->id) }}" method="POST" enctype="multipart/form-data" class="flex flex-col gap-3 mb-6 p-4 border-t border-gray-700 mt-auto">
                    @csrf
                    <input type="file" name="cv" required class="block rounded-md border border-gray-300 px-3 py-2 text-sm focus:border-indigo-500 focus:ring-indigo-500 bg-white text-gray-900" />
                    <button type="submit" class="inline-flex items-center rounded-md bg-indigo-600 px-4 py-2 text-white hover:bg-indigo-700 text-sm font-medium">Lamar</button>
                </form>
            @endif
		</div>
		@empty
            <div class="col-span-full">
                <div class="p-4 text-center rounded-md border border-blue-200 bg-blue-800 text-white">
                    Belum ada lowongan pekerjaan.
                </div>
            </div>
		@endforelse
	</div>
</div>
@endsection
