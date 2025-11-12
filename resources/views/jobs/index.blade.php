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
        <div class="flex gap-2">
            <a href="{{ route('jobs.create') }}" class="w-full px-3 py-2 text-sm font-medium rounded-md bg-green-600 hover:bg-red-700 text-white m-5">Tambah Lowongan</a>
            {{-- <form action="/jobs/import" method="POST"
                enctype="multipart/form-data">
                @csrf
                <input class="text-white" type="file" name="file" required>
                <button type="submit" class="btn btn-info text-white">Import Lowongan</button>
            </form> --}}
        </div>
    @endif

	<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
		@forelse($jobs as $job)
	    <div class="bg-gray-800 rounded-lg shadow overflow-hidden flex flex-col mt-2">
		    <div class="flex flex-row p-6">
			    <div class="p-4 flex-1 flex flex-col justify-between">
				    <div>
                        <h5 class="text-lg font-semibold text-white">{{ $job->title }}</h5>
                        <p class="text-sm text-white mb-2">{{ $job->company }}</p>
                        <div class="text-sm text-white space-y-1">
                            <p>📝 {{ $job->description }}</p>
                            <p>📍 {{ $job->location }}</p>
                            <p>💰 Rp {{ number_format($job->salary, 0, ',', '.') }}</p>
                            <p>👜 {{ $job->job_type }}</p>
                        </div>
				    </div>
			    </div>
				<div class="flex-shrink-0 flex items-center justify-center w-40 p-4 mr-4">
                    @if($job->logo)
                        <img src="{{ asset('storage/' . $job->logo) }}" alt="{{ $job->company }}" class="object-cover rounded-r-lg" style="max-height:200px; max-width:160px;">
                    @else
                        <div class="h-40 w-40 bg-gray-700 flex items-center justify-center rounded-r-lg">
                            <span class="text-white">No Logo</span>
                        </div>
                    @endif
			    </div>
		    </div>
            {{-- kalau role admin --}}
            @if(Auth::check() && Auth::user()->role === 'admin')
                <div class="p-4 border-t border-gray-700">
                    <div class="flex gap-2">
                        <a href="{{ route('jobs.edit', $job->id) }}" class="flex-1 inline-flex items-center justify-center px-3 py-2 text-sm font-medium rounded-md bg-yellow-500 hover:bg-yellow-600 text-white">Edit</a>
                        <form action="{{ route('jobs.destroy', $job->id) }}" method="POST" class="flex-1">
                            @csrf
                            @method('DELETE')
                            <button class="w-full px-3 py-2 text-sm font-medium rounded-md bg-red-600 hover:bg-red-700 text-white" onclick="return confirm('Hapus data?')">Hapus</button>
                        </form>
                    </div>
                </div>
            @endif
            @if(Auth::check() && Auth::user()->role === 'user')
                <form action="{{ route('apply.store', $job->id) }}" method="POST" enctype="multipart/form-data" class="flex items-center gap-2 mb-6 p-4 border-t border-gray-700">
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
