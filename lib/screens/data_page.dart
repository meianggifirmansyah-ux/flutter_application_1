
import 'package:flutter/material.dart';
import '../models/task.dart';
import '../widgets/task_card.dart';
import '../services/book_storage.dart';
import 'form_page.dart';

class DataPage extends StatefulWidget {
  const DataPage({super.key});

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  List<Task> _tasks = [];
  bool _isLoading = true;

  // Controller pencarian
  final TextEditingController _searchController =
      TextEditingController();

  String _searchQuery = '';

  // Mock Data awal
  List<Task> _initialBooks() {
    return [
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
      Task(
        id: 3,
        title: 'Belajar Flutter untuk Pemula',
        author: 'Budi Santoso',
        pages: 180,
        available: true,
        color: const Color(0xFF8A6D9F),
      ),
    ];
  }

  int get _nextId {
    if (_tasks.isEmpty) return 1;

    return _tasks
            .map((book) => book.id)
            .reduce((a, b) => a > b ? a : b) +
        1;
  }

  @override
  void initState() {
    super.initState();
    _loadBooks();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  // MEMUAT DATA BUKU
  Future<void> _loadBooks() async {
    final hasSaved = await BookStorage.hasSavedBooks();

    List<Task> loadedBooks;

    if (hasSaved) {
      loadedBooks = await BookStorage.loadBooks();
    } else {
      loadedBooks = _initialBooks();
      await BookStorage.saveBooks(loadedBooks);
    }

    if (!mounted) return;

    setState(() {
      _tasks = loadedBooks;
      _isLoading = false;
    });
  }

  // MENYIMPAN DATA
  Future<void> _saveBooks() async {
    await BookStorage.saveBooks(_tasks);
  }

  // FITUR PENCARIAN BUKU
  List<Task> get _filteredBooks {
    final query = _searchQuery.trim().toLowerCase();

    if (query.isEmpty) {
      return _tasks;
    }

    return _tasks.where((book) {
      final title = book.title.toLowerCase();
      final author = book.author.toLowerCase();

      return title.contains(query) ||
          author.contains(query);
    }).toList();
  }

  // TAMBAH DAN EDIT BUKU
  Future<void> _openForm({
    Task? task,
    int? index,
  }) async {
    final result = await Navigator.push<Task>(
      context,
      MaterialPageRoute(
        builder: (_) => FormPage(
          nextId: task?.id ?? _nextId,
          taskToEdit: task,
        ),
      ),
    );

    if (!mounted || result == null) return;

    setState(() {
      if (index == null) {
        _tasks.add(result);
      } else {
        _tasks[index] = result;
      }
    });

    await _saveBooks();

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          index == null
              ? 'Buku berhasil ditambahkan!'
              : 'Buku berhasil diperbarui!',
        ),
      ),
    );
  }

  // HAPUS BUKU
  Future<void> _confirmDelete(int index) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Konfirmasi Hapus'),
          content: Text(
            'Apakah Anda yakin ingin menghapus '
            '"${_tasks[index].title}"?',
          ),
          actions: [
            TextButton(
              onPressed: () =>
                  Navigator.pop(dialogContext, false),
              child: const Text('Batal'),
            ),
            TextButton(
              onPressed: () =>
                  Navigator.pop(dialogContext, true),
              child: const Text(
                'Hapus',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );

    if (!mounted || confirm != true) return;

    setState(() {
      _tasks.removeAt(index);
    });

    await _saveBooks();

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Buku berhasil dihapus'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const primaryBlue = Color(0xFF2864E8);

    final filteredBooks = _filteredBooks;

    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),

      // APP BAR
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Katalog Buku',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w800,
                color: Color(0xFF202938),
              ),
            ),
            Text(
              'Temukan bacaan berikutnya',
              style: TextStyle(
                fontSize: 10,
                color: Color(0xFF8993A1),
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: CircleAvatar(
              radius: 16,
              backgroundColor: Color(0xFFEDF3FF),
              child: Text(
                'AK',
                style: TextStyle(
                  color: primaryBlue,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),

      // BODY
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                // KOLOM PENCARIAN
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    16, 12, 16, 8,
                  ),
                  child: TextField(
                    controller: _searchController,
                    onChanged: (value) {
                      setState(() {
                        _searchQuery = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText:
                          'Cari buku, penulis, atau topik',
                      hintStyle: const TextStyle(
                        fontSize: 11,
                        color: Color(0xFF9AA2AE),
                      ),
                      prefixIcon: const Icon(
                        Icons.search,
                        size: 20,
                      ),
                      suffixIcon: _searchQuery.isNotEmpty
                          ? IconButton(
                              icon: const Icon(
                                Icons.close,
                                size: 18,
                              ),
                              onPressed: () {
                                _searchController.clear();
                                setState(() {
                                  _searchQuery = '';
                                });
                              },
                            )
                          : null,
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding:
                          const EdgeInsets.symmetric(
                        vertical: 12,
                      ),
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(13),
                        borderSide: const BorderSide(
                          color: Color(0xFFE8ECF2),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(13),
                        borderSide: const BorderSide(
                          color: Color(0xFFE8ECF2),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(13),
                        borderSide: const BorderSide(
                          color: primaryBlue,
                        ),
                      ),
                    ),
                  ),
                ),

                // JUMLAH BUKU
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Row(
                    children: [
                      Text(
                        '${filteredBooks.length} buku ditemukan',
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const Spacer(),
                      const Text(
                        'Koleksi Buku',
                        style: TextStyle(
                          color: primaryBlue,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),

                // DAFTAR BUKU
                Expanded(
                  child: filteredBooks.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.search_off,
                                size: 48,
                                color: Color(0xFFADB7C5),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                _tasks.isEmpty
                                    ? 'Belum ada koleksi buku.'
                                    : 'Buku tidak ditemukan.',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF596579),
                                ),
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                'Coba gunakan kata kunci lain.',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF8993A1),
                                ),
                              ),
                            ],
                          ),
                        )
                      : ListView.builder(
                          padding: const EdgeInsets.only(
                            bottom: 20,
                          ),
                          itemCount: filteredBooks.length,
                          itemBuilder: (context, index) {
                            final task = filteredBooks[index];
                            final originalIndex =
                                _tasks.indexOf(task);

                            return TaskCard(
                              task: task,
                              onEdit: () => _openForm(
                                task: task,
                                index: originalIndex,
                              ),
                              onDelete: () =>
                                  _confirmDelete(originalIndex),
                            );
                          },
                        ),
                ),
              ],
            ),

      // TOMBOL TAMBAH BUKU
      floatingActionButton: FloatingActionButton(
        onPressed: _isLoading ? null : () => _openForm(),
        backgroundColor: primaryBlue,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }
}
