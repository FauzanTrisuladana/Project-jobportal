@extends('layouts.app')

@section('content')
<div class="container">
	<h2>Tambah Lowongan</h2>
	<form action="{{ route('jobs.store') }}" method="POST" enctype="multipart/form-data">
		@csrf
		<input type="text" name="title" placeholder="Judul Lowongan" class="form-control mb-2">
		<textarea name="description" placeholder="Deskripsi" class="form-control mb-2"></textarea>
		<input type="text" name="location" placeholder="Lokasi" class="form-control mb-2">
		<input type="text" name="company" placeholder="Nama Perusahaan" class="form-control mb-2">
		<input type="number" name="salary" placeholder="Gaji" class="form-control mb-2">
		<select name="job_type" class="form-control mb-2">
			<option value="">Pilih Jenis Pekerjaan</option>
			<option value="Full-time" {{ old('job_type') == 'Full-time' ? 'selected' : '' }}>Full-time</option>
			<option value="Part-time" {{ old('job_type') == 'Part-time' ? 'selected' : '' }}>Part-time</option>
		</select>
		<input type="file" name="logo" class="form-control mb-2">
		<button type="submit" class="btn btn-primary">Simpan</button>
	</form>
</div>
@endsection
