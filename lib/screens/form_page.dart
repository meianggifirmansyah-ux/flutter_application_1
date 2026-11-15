
import 'package:flutter/material.dart';
import '../models/task.dart';

class FormPage extends StatefulWidget {
  final int nextId;
  final Task? taskToEdit;

  const FormPage({
    super.key,
    required this.nextId,
    this.taskToEdit,
  });

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _titleController =
      TextEditingController();

  final TextEditingController _authorController =
      TextEditingController();

  final TextEditingController _pagesController =
      TextEditingController();

  bool get isEditing => widget.taskToEdit != null;

  @override
  void initState() {
    super.initState();

    // Mengisi form dengan data lama ketika mode edit
    if (isEditing) {
      final task = widget.taskToEdit!;

      _titleController.text = task.title;
      _authorController.text = task.author;
      _pagesController.text = task.pages.toString();
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _authorController.dispose();
    _pagesController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (!(_formKey.currentState?.validate() ?? false)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Periksa kembali input yang belum valid'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    final oldTask = widget.taskToEdit;

    final result = Task(
      id: oldTask?.id ?? widget.nextId,
      title: _titleController.text.trim(),
      author: _authorController.text.trim(),
      pages: int.parse(_pagesController.text),
      available: oldTask?.available ?? true,
      color: oldTask?.color ?? const Color(0xFF314B5A),
    );

    Navigator.pop(context, result);
  }

  @override
  Widget build(BuildContext context) {
    const blue = Color(0xFF2864E8);

    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),

      appBar: AppBar(
        title: Text(
          isEditing ? 'Edit Buku' : 'Tambah Buku',
        ),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF202938),
        elevation: 0,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),

        child: Form(
          key: _formKey,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: [
              Text(
                isEditing
                    ? 'Perbarui Informasi Buku'
                    : 'Tambah Koleksi Buku',
                style: const TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w800,
                ),
              ),

              const SizedBox(height: 7),

              Text(
                isEditing
                    ? 'Ubah informasi buku yang ingin diperbarui.'
                    : 'Lengkapi informasi buku yang akan ditambahkan.',
                style: const TextStyle(
                  color: Color(0xFF7D8794),
                  fontSize: 12,
                ),
              ),

              const SizedBox(height: 24),

              // JUDUL BUKU
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Judul Buku',
                  hintText: 'Masukkan judul buku',
                  prefixIcon: const Icon(Icons.menu_book),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Judul buku tidak boleh kosong';
                  }

                  if (value.trim().length < 3) {
                    return 'Judul buku minimal 3 karakter';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 17),

              // PENULIS
              TextFormField(
                controller: _authorController,
                decoration: InputDecoration(
                  labelText: 'Nama Penulis',
                  hintText: 'Masukkan nama penulis',
                  prefixIcon: const Icon(Icons.person_outline),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Nama penulis wajib diisi';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 17),

              // JUMLAH HALAMAN
              TextFormField(
                controller: _pagesController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Jumlah Halaman',
                  hintText: 'Contoh: 180',
                  prefixIcon: const Icon(Icons.description_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Jumlah halaman wajib diisi';
                  }

                  final pages = int.tryParse(value);

                  if (pages == null || pages <= 0) {
                    return 'Masukkan jumlah halaman yang valid';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 28),

              // TOMBOL SIMPAN
              SizedBox(
                height: 50,

                child: FilledButton(
                  onPressed: _submitForm,
                  style: FilledButton.styleFrom(
                    backgroundColor: blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),

                  child: Text(
                    isEditing ? 'Simpan Perubahan' : 'Simpan Buku',
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
