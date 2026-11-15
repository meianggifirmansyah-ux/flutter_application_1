import 'package:flutter/material.dart';
import '../models/task.dart';

class DetailPage extends StatelessWidget {
  final Task task;

  const DetailPage({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final statusColor =
        task.available ? const Color(0xFF17A05D) : const Color(0xFFCC9A1A);
    final statusBg =
        task.available ? const Color(0xFFE8F8F0) : const Color(0xFFFFF4DB);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Detail Buku'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xFFE4E9F2)),
            ),
            child: Row(
              children: [
                Container(
                  width: 92,
                  height: 120,
                  decoration: BoxDecoration(
                    color: task.color.withValues(alpha: 0.18),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.menu_book,
                    color: task.color,
                    size: 40,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        task.title,
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        task.author,
                        style: const TextStyle(
                          color: Color(0xFF7D8798),
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: statusBg,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          task.available ? 'Tersedia' : 'Dipinjam',
                          style: TextStyle(
                            color: statusColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 11,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Fiksi • Novel',
                        style: TextStyle(
                          color: Color(0xFF3367E8),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: const Color(0xFFE4E9F2)),
            ),
            child: Row(
              children: [
                _InfoColumn(label: 'Halaman', value: '${task.pages}'),
                _InfoColumn(label: 'Bahasa', value: 'Indonesia'),
                _InfoColumn(label: 'Format', value: 'E-book'),
              ],
            ),
          ),
          const SizedBox(height: 18),
          const Text(
            'Tentang buku',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Di antara rak buku dan cahaya senja, ${task.title} menghadirkan pengalaman membaca yang hangat dan bermakna. Buku ini dapat menjadi pilihan menarik untuk menambah wawasan dan menemani waktu luang Anda.',
            style: const TextStyle(
              color: Color(0xFF7D8798),
              fontSize: 13,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xFFF1F6FF),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Row(
              children: [
                Icon(Icons.info_outline, color: Color(0xFF3367E8)),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Status "Tersedia" berlaku untuk koleksi; peminjaman Anda tetap aktif.',
                    style: TextStyle(
                      color: Color(0xFF3367E8),
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          FilledButton(
            onPressed: () {},
            style: FilledButton.styleFrom(
              backgroundColor: const Color(0xFF3367E8),
              minimumSize: const Size.fromHeight(52),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            child: Text(task.available ? 'Baca buku' : 'Sedang dipinjam'),
          ),
          const SizedBox(height: 10),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.white,
              minimumSize: const Size.fromHeight(52),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              side: const BorderSide(color: Color(0xFFE4E9F2)),
            ),
            child: const Text('Simpan ke favorit'),
          ),
        ],
      ),
    );
  }
}

class _InfoColumn extends StatelessWidget {
  final String label;
  final String value;

  const _InfoColumn({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Color(0xFF919CAD),
              fontSize: 11,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}