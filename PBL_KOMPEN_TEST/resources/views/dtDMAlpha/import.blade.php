<form action="{{ url('/dtDMAlpha/import_ajax') }}" method="POST" id="form-import" enctype="multipart/form-data">
    @csrf
    <div id="modal-master" class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Import Data Alpha Mahasiswa</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label>Download Template</label>
                    <a href="{{ asset('template_mahasiswa.xlsx') }}" class="btn btn-success btn-sm" download>
                        <i class="fa fa-file-excel"></i> Download
                    </a>
                </div>
                <div class="form-group">
                    <label for="file_mahasiswa">Pilih File</label>
                    <input type="file" name="file_mahasiswa" id="file_mahasiswa" class="form-control" required>
                    <small id="error-file_mahasiswa" class="error-text form-text text-danger"></small>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-warning" data-dismiss="modal">Batal</button>
                <button type="submit" class="btn btn-primary">Upload</button>
            </div>
        </div>
    </div>
</form>

<script>
    $(document).ready(function() {
        $("#form-import").validate({
            rules: {
                file_mahasiswa: {
                    required: true,
                    extension: "xlsx" // Membatasi hanya untuk file dengan ekstensi .xlsx
                },
            },
            messages: {
                file_mahasiswa: {
                    required: "File wajib diunggah.",
                    extension: "Hanya file dengan format .xlsx yang diperbolehkan."
                }
            },
            submitHandler: function(form) {
                var formData = new FormData(form); // Menggunakan FormData untuk mendukung file upload
                
                $.ajax({
                    url: form.action,
                    type: form.method,
                    data: formData,
                    processData: false, // Mematikan pemrosesan otomatis data
                    contentType: false, // Mematikan pengaturan content-type otomatis
                    success: function(response) {
                        if (response.status) {
                            $('#modal-master').modal('hide'); // Sembunyikan modal
                            Swal.fire({
                                icon: 'success',
                                title: 'Berhasil',
                                text: response.message
                            });
                            if (typeof tableMahasiswa !== 'undefined') {
                                tableMahasiswa.ajax.reload(); // Reload DataTable jika didefinisikan
                            }
                        } else {
                            $('.error-text').text('');
                            if (response.msgField) {
                                $.each(response.msgField, function(prefix, val) {
                                    $('#error-' + prefix).text(val[0]);
                                });
                            }
                            Swal.fire({
                                icon: 'error',
                                title: 'Terjadi Kesalahan',
                                text: response.message
                            });
                        }
                    },
                    error: function(xhr) {
                        Swal.fire({
                            icon: 'error',
                            title: 'Terjadi Kesalahan',
                            text: 'Gagal mengirim data ke server. Silakan coba lagi.'
                        });
                    }
                });
                return false; // Cegah submit default
            },
            errorElement: 'span',
            errorPlacement: function(error, element) {
                error.addClass('invalid-feedback');
                element.closest('.form-group').append(error);
            },
            highlight: function(element) {
                $(element).addClass('is-invalid');
            },
            unhighlight: function(element) {
                $(element).removeClass('is-invalid');
            }
        });
    });
</script>
