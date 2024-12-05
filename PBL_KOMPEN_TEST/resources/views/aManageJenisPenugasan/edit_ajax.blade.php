@empty($aManageJenisPenugasan)
<div id="modal-master" class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
        <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Kesalahan</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <div class="modal-body">
            <div class="alert alert-danger">
                <h5><i class="icon fas fa-ban"></i> Kesalahan!!!</h5>
                Data yang Anda cari tidak ditemukan.
            </div>
            <a href="{{ url('/aManageJenisPenugasan') }}" class="btn btn-warning">Kembali</a>
        </div>
    </div>
</div>
@else
<form action="{{ url('/aManageJenisPenugasan/' . $aManageJenisPenugasan->id_jenis_tugas . '/update_ajax') }}" method="POST" id="form-edit">
    @csrf
    @method('PUT')
    <div id="modal-master" class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Edit Jenis Penugasan</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label>Jenis Penugasan</label>
                    <input value="{{ $aManageJenisPenugasan->jenis_tugas }}" type="text" name="jenis_tugas" id="jenis_tugas" class="form-control" required>
                    <small id="error-jenis_tugas" class="error-text form-text text-danger"></small>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" data-dismiss="modal" class="btn btn-warning">Batal</button>
                <button type="submit" class="btn btn-primary">Simpan</button>
            </div>
        </div>
    </div>
</form>

<script>
    $(document).ready(function() {
        // Validasi form edit
        $("#form-edit").validate({
            rules: {
                jenis_tugas: {
                    required: true,
                    minlength: 3,
                    maxlength: 50
                }
            },
            submitHandler: function(form) {
                // Kirim data dengan AJAX
                $.ajax({
                    url: form.action,
                    type: form.method,
                    data: $(form).serialize(),
                    success: function(response) {
                        if (response.status) {
                            // Menutup modal setelah berhasil simpan
                            $('#modal-master').modal('hide');
                            
                            // Menampilkan notifikasi sukses
                            Swal.fire({
                                icon: 'success',
                                title: 'Berhasil',
                                text: response.message
                            });

                            // Update tampilan data di DataTable
                            var row = dataLevel.row('#row-' + response.data.id_jenis_tugas);  // Gantilah sesuai dengan ID baris di tabel Anda
                            row.data([
                                response.data.id_jenis_tugas,  // kolom ID
                                response.data.jenis_tugas      // kolom jenis tugas
                            ]).draw();  // Merender ulang baris yang diupdate

                        } else {
                            // Menampilkan pesan error di bawah input field
                            $('.error-text').text('');
                            $.each(response.msgField, function(prefix, val) {
                                $('#error-' + prefix).text(val[0]);
                            });
                            Swal.fire({
                                icon: 'error',
                                title: 'Terjadi Kesalahan',
                                text: response.message
                            });
                        }
                    },
                    error: function(xhr) {
                        // Menampilkan pesan error jika terjadi masalah saat pengiriman data
                        Swal.fire({
                            icon: 'error',
                            title: 'Kesalahan Server',
                            text: 'Silakan coba lagi nanti.'
                        });
                    }
                });
                return false;  // Mencegah form untuk melakukan submit default
            },
            errorElement: 'span',
            errorPlacement: function(error, element) {
                // Menambahkan kelas invalid-feedback pada elemen error
                error.addClass('invalid-feedback');
                element.closest('.form-group').append(error);
            },
            highlight: function(element, errorClass, validClass) {
                // Memberikan kelas is-invalid pada elemen yang error
                $(element).addClass('is-invalid');
            },
            unhighlight: function(element, errorClass, validClass) {
                // Menghapus kelas is-invalid pada elemen yang valid
                $(element).removeClass('is-invalid');
            }
        });
    });
</script>

@endempty
