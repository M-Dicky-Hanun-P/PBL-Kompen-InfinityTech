<form id="form-update-progress" data-id="{{ $progress->id_tugas_kompen }}" method="POST">
    @csrf
    <div class="form-group">
        <label for="progres">Progres (dalam persen)</label>
        <input type="number" name="progres" id="progres" class="form-control" value="{{ $progress->progres }}" required min="0" max="100">
    </div>
    <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Batal</button>
        <button type="submit" class="btn btn-primary">Simpan</button>
    </div>
</form>
