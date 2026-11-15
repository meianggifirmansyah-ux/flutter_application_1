import 'package:flutter/material.dart';

class LoansPage extends StatelessWidget {
  const LoansPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Pinjaman Saya'),
            SizedBox(height: 2),
            Text(
              'Kelola bacaan dan masa pinjaman',
              style: TextStyle(
                fontSize: 11,
                color: Color(0xFF8B95A5),
                fontWeight: FontWeight.w400,
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
                  color: Color(0xFF3367E8),
                  fontSize: 10,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Row(
            children: [
              Expanded(
                child: _SmallInfoCard(
                  title: 'Pinjaman aktif',
                  value: '3',
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: _SmallInfoCard(
                  title: 'Butuh diperpanjang',
                  value: '2',
                ),
              ),
            ],
          ),
          SizedBox(height: 14),
          _LoanTabBar(),
          SizedBox(height: 14),
          _LoanItemCard(
            title: 'Ilmu Alam untuk Pemula',
            subtitle: 'Dr. Lestari • 312 halaman',
            dueDate: 'Jatuh tempo 15 Okt 2026',
            status: 'Perlu diperpanjang',
            urgent: true,
          ),
          _LoanItemCard(
            title: 'Sejarah Kota Lama',
            subtitle: 'B. Pratama • 168 halaman',
            dueDate: 'Jatuh tempo 16 Okt 2026',
            status: 'Perlu diperpanjang',
            urgent: true,
          ),
          _LoanItemCard(
            title: 'Senja di Perpustakaan',
            subtitle: 'A. Kurniawan • 240 halaman',
            dueDate: 'Jatuh tempo 25 Okt 2026',
            status: 'Tersisa 12 hari',
            urgent: false,
          ),
          SizedBox(height: 10),
          Text(
            'Per 13 Okt 2026 • Data contoh. Perpanjangan mengikuti ketersediaan koleksi.',
            style: TextStyle(
              color: Color(0xFF9DA7B6),
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}

class _SmallInfoCard extends StatelessWidget {
  final String title;
  final String value;

  const _SmallInfoCard({
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE4E9F2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFF7D8798),
              fontSize: 11,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}

class _LoanTabBar extends StatelessWidget {
  const _LoanTabBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE4E9F2)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xFFEFF4FF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                'Aktif (3)',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF3367E8),
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                ),
              ),
            ),
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Riwayat',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF8B95A5),
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LoanItemCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String dueDate;
  final String status;
  final bool urgent;

  const _LoanItemCard({
    required this.title,
    required this.subtitle,
    required this.dueDate,
    required this.status,
    required this.urgent,
  });

  @override
  Widget build(BuildContext context) {
    final statusColor =
        urgent ? const Color(0xFFAF6B11) : const Color(0xFF198F58);
    final statusIcon =
        urgent ? Icons.access_time : Icons.check_circle_outline;

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
        side: const BorderSide(color: Color(0xFFE4E9F2)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 50,
                  height: 62,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF0F4F8),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.menu_book,
                    color: Color(0xFF3367E8),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: const TextStyle(
                          color: Color(0xFF7D8798),
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        dueDate,
                        style: const TextStyle(
                          color: Color(0xFF7D8798),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Icon(statusIcon, size: 16, color: statusColor),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    status,
                    style: TextStyle(
                      color: statusColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(urgent ? 'Perpanjang' : 'Baca buku'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}