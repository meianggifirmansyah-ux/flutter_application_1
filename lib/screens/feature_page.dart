
import 'package:flutter/material.dart';

class FeaturePage extends StatelessWidget {
  const FeaturePage({super.key});

  @override
  Widget build(BuildContext context) {
    const blue = Color(0xFF2864E8);

    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),

      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pinjaman Saya',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              'Kelola bacaan dan masa pinjaman',
              style: TextStyle(
                fontSize: 10,
                color: Colors.grey,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),

      body: ListView(
        padding: const EdgeInsets.all(14),
        children: [
          // RINGKASAN PINJAMAN
          Row(
            children: const [
              Expanded(
                child: _SummaryCard(
                  title: 'Pinjaman aktif',
                  value: '3',
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: _SummaryCard(
                  title: 'Butuh diperpanjang',
                  value: '2',
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          // TAB
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: const Color(0xFFE8ECF2),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(9),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEDF4FF),
                      borderRadius: BorderRadius.circular(9),
                    ),
                    child: const Text(
                      'Aktif (3)',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: blue,
                        fontWeight: FontWeight.w700,
                        fontSize: 11,
                      ),
                    ),
                  ),
                ),
                const Expanded(
                  child: Text(
                    'Riwayat',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 11,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 13),

          const _LoanCard(
            title: 'Ilmu Alam untuk Pemula',
            author: 'Dr. Lestari • 312 halaman',
            dueDate: 'Jatuh tempo 15 Okt 2026',
            urgent: true,
          ),

          const _LoanCard(
            title: 'Sejarah Kota Lama',
            author: 'B. Pratama • 168 halaman',
            dueDate: 'Jatuh tempo 16 Okt 2026',
            urgent: true,
          ),

          const _LoanCard(
            title: 'Senja di Perpustakaan',
            author: 'A. Kurniawan • 240 halaman',
            dueDate: 'Jatuh tempo 25 Okt 2026',
            urgent: false,
          ),

          const SizedBox(height: 8),

          const Text(
            'Data pinjaman merupakan data simulasi.',
            style: TextStyle(
              fontSize: 9,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

// KARTU RINGKASAN
class _SummaryCard extends StatelessWidget {
  final String title;
  final String value;

  const _SummaryCard({
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: const Color(0xFFE8ECF2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 9,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: const TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}

// KARTU BUKU PINJAMAN
class _LoanCard extends StatelessWidget {
  final String title;
  final String author;
  final String dueDate;
  final bool urgent;

  const _LoanCard({
    required this.title,
    required this.author,
    required this.dueDate,
    required this.urgent,
  });

  @override
  Widget build(BuildContext context) {
    final statusColor = urgent
        ? const Color(0xFF9A541B)
        : const Color(0xFF16865D);

    return Card(
      color: Colors.white,
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: const BorderSide(
          color: Color(0xFFE8ECF2),
        ),
      ),

      child: Padding(
        padding: const EdgeInsets.all(11),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 48,
                  height: 58,
                  decoration: BoxDecoration(
                    color: const Color(0xFFEDF2EC),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.menu_book,
                    color: Color(0xFF65816A),
                    size: 25,
                  ),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        author,
                        style: const TextStyle(
                          fontSize: 9,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        dueDate,
                        style: const TextStyle(
                          fontSize: 9,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const Divider(height: 18),

            Row(
              children: [
                Icon(
                  urgent
                      ? Icons.access_time
                      : Icons.check_circle_outline,
                  size: 14,
                  color: statusColor,
                ),

                const SizedBox(width: 5),

                Expanded(
                  child: Text(
                    urgent
                        ? 'Perlu diperpanjang'
                        : 'Tersisa 12 hari',
                    style: TextStyle(
                      color: statusColor,
                      fontSize: 9,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),

                TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Fitur ini masih berupa simulasi.',
                        ),
                      ),
                    );
                  },
                  child: Text(
                    urgent ? 'Perpanjangan' : 'Baca buku',
                    style: const TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
