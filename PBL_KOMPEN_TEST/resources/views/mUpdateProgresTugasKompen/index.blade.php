@extends('layouts.m_template')
<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha384-oWB6aKicF9NxLpVd+IFpKzHZLt9aN8zrZvvOA43Ry1c7fTBKaxUboog5YZaJ+8+X" crossorigin="anonymous"></script>

@section('content')
<div class="card card-outline card-primary">
    <div class="card-header">
        <h3 class="card-title">{{ $page->title }}</h3>
    </div>
    <div class="card-body">
        @if (session('success'))
        <div class="alert alert-success">{{ session('success') }}</div>
        @endif
        @if (session('error'))
        <div class="alert alert-danger">{{ session('error') }}</div>
        @endif

        <table class="table table-bordered table-striped table-hover table-sm" id="table_user">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Pemberi Tugas</th>
                    <th>Nama Tuags</th>
                    <th>Jam Kompen</th>
                    <th>Waktu Pengerjaan</th>
                    <th>Progres</th>
                    <th>Aksi</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($progressData as $key => $progress)
                    <tr data-id="{{ $progress->id_tugas_kompen }}">
                        <td>{{ $key + 1 }}</td>
                        <td>{{ $progress->pemberi_kompen }}</td>
                        <td>{{ $progress->nama_tugas }}</td>
                        <td>{{ $progress->jam_kompen }}</td>
                        <td>{{ $progress->waktu_pengerjaan }}</td>
                        <td>
                            <span class="editable-progress" data-id="{{ $progress->id_tugas_kompen }}">
                                {{ $progress->progres ?? '-' }}
                            </span>
                        </td>
                        <td>
                        <button class="btn btn-warning btn-sm edit-progress-btn" data-id="{{ $progress->id_tugas_kompen }}">
                            Update Progress
                        </button>
                    </td>
                @endforeach
            </tbody>
        </table>
    </div>
</div>
<div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true"></div>
<div id="myModal" class="modal fade animate shake" tabindex="-1" role="dialog" data backdrop="static"
    data-keyboard="false" data-width="75%" aria-hidden="true"></div>
@endsection

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
    $(document).ready(function () {
        // Open modal to edit progress
        $('.edit-progress-btn').on('click', function () {
            const taskId = $(this).data('id');

            // Fetch the task data dynamically via AJAX (optional, you may have it in the table)
            $.ajax({
                url: `/fetch-tugas-data/${taskId}`, // Define this route to fetch data if needed
                type: 'GET',
                success: function (data) {
                    $('#myModal').html(data).modal('show');
                },
                error: function (xhr, status, error) {
                    alert('Failed to fetch task data: ' + error);
                }
            });
        });

        // Save updated progress
        $(document).on('click', '#save-progress-btn', function () {
            const taskId = $('#task-id').val();
            const progress = $('#progress-input').val();

            $.ajax({
                url: `/update-progress/${taskId}`,
                type: 'POST',
                data: {
                    _token: '{{ csrf_token() }}',
                    progress: progress
                },
                success: function (response) {
                    alert('Progress updated successfully!');
                    // Optionally update the UI
                    $(`tr[data-id="${taskId}"] .editable-progress`).text(progress);
                    $('#myModal').modal('hide');
                },
                error: function (xhr, status, error) {
                    alert('Failed to update progress: ' + error);
                }
            });
        });
    });
</script>
