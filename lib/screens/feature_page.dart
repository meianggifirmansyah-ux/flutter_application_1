import 'package:flutter/material.dart';
import '../models/task.dart';
import '../widgets/task_card.dart';
import 'form_page.dart';

class DataPage extends StatefulWidget {
  const DataPage({super.key});

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  // Local / Mock Data awal (Simulasi data yang aman)
  final List<Task> _tasks = [
    Task(
      id: 1,
      title: 'Senja di Perpustakaan',
      author: 'A. Kurniawan',
      pages: 240,
      available: true,
      color: const Color(0xFF314B5A),
    ),
    Task(
      id: 2,
      title: 'Ilmu Alam untuk Pemula',
      author: 'Dr. Lestari',
      pages: 312,
      available: false,
      color: const Color(0xFF65816A),
    ),
  ];

  int _nextId = 3;

  // Fungsi Create / Tambah Data (Menerima input dari FormPage)
  void _navigateAndAddForm(BuildContext context) async {
    final result = await Navigator.push<Task>(
      context,
      MaterialPageRoute(
        builder: (context) => FormPage(nextId: _nextId),
      ),
    );

    if (result != null) {
      setState(() {
        _tasks.add(result);
        _nextId++;
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Data buku berhasil ditambahkan!')),
        );
      }
    }
  }

  // Fungsi Update Sederhana
  void _updateTask(int index) {
    setState(() {
      _tasks[index].title = '${_tasks[index].title} (Revisi)';
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Data berhasil diperbarui')),
    );
  }

  // Fungsi Delete dengan Dialog Konfirmasi (Penguatan UX)
  void _confirmDelete(int index) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Konfirmasi Hapus'),
          content: const Text('Apakah Anda yakin ingin menghapus buku ini?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
                setState(() {
                  _tasks.removeAt(index);
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Data berhasil dihapus')),
                );
              },
              child: const Text('Hapus', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Module v0.3 (CRUD)'),
        backgroundColor: const Color(0xFF2563EB),
        foregroundColor: Colors.white,
      ),
      // Empty State Handling: Tampilkan pesan jika data kosong
      body: _tasks.isEmpty
          ? const Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Belum ada data koleksi buku.\nSilakan tambahkan data baru menggunakan tombol (+).',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xFF6B7280), fontSize: 14),
                ),
              ),
            )
          : ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                return TaskCard(
                  task: _tasks[index],
                  onEdit: () => _updateTask(index),
                  onDelete: () => _confirmDelete(index),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateAndAddForm(context),
        backgroundColor: const Color(0xFF2563EB),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}