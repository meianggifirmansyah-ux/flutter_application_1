import 'package:flutter/material.dart';
import '../models/task.dart'; // Sesuaikan menjadi '../models/task.dart' jika folder Anda bernama models

class FormPage extends StatefulWidget {
  final int nextId;

  const FormPage({super.key, required this.nextId});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _authorController = TextEditingController();
  final TextEditingController _pagesController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _authorController.dispose();
    _pagesController.dispose();
    super.dispose();
  }

  void _submitForm() {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Periksa kembali input yang belum valid'),
            backgroundColor: Colors.red,
          ),
        );
      }
      return;
    }

    // Buat objek Task baru berdasarkan input form yang valid (Operasi Create)
    final newTask = Task(
      id: widget.nextId,
      title: _titleController.text,
      author: _authorController.text,
      pages: int.tryParse(_pagesController.text) ?? 100,
      available: true,
      color: const Color(0xFF314B5A),
    );

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Data buku berhasil diproses dan disimpan'),
          backgroundColor: Colors.green,
        ),
      );
    }

    // Kembali ke halaman sebelumnya dengan membawa data buku baru
    Navigator.pop(context, newTask);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Validasi Buku'),
        backgroundColor: const Color(0xFF2563EB),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const Text(
                'Form Tambah Koleksi Buku',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              // Input Judul Buku
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Judul Buku',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Judul buku tidak boleh kosong';
                  }
                  if (value.length < 3) {
                    return 'Judul buku minimal 3 karakter';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              // Input Penulis
              TextFormField(
                controller: _authorController,
                decoration: const InputDecoration(
                  labelText: 'Penulis',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama penulis tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              // Input Jumlah Halaman
              TextFormField(
                controller: _pagesController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Jumlah Halaman',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Jumlah halaman harus diisi';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Jumlah halaman harus berupa angka';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2563EB),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text('Simpan Buku'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}