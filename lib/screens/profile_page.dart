import 'package:flutter/material.dart';
import 'login.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  void _logout(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const LoginPage()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    const primaryBlue = Color(0xFF3367E8);

    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Profil'),
            SizedBox(height: 2),
            Text(
              'Akun dan preferensi membaca',
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
                  color: primaryBlue,
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
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: const Color(0xFFE4E9F2)),
            ),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 32,
                  backgroundColor: Color(0xFFEDF3FF),
                  child: Text(
                    'AK',
                    style: TextStyle(
                      color: primaryBlue,
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Andi Kurniawan',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'andi.kurniawan@email.com',
                  style: TextStyle(
                    color: Color(0xFF8B95A5),
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'ID Anggota: PD-2026-0142',
                  style: TextStyle(
                    color: Color(0xFF8B95A5),
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8F8F0),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'Anggota aktif',
                    style: TextStyle(
                      color: Color(0xFF1C9A5F),
                      fontWeight: FontWeight.w700,
                      fontSize: 11,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: () {},
                  child: const Text('Edit profil'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: const [
              Expanded(
                child: _ProfileStatCard(
                  value: '3',
                  label: 'Buku aktif',
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: _ProfileStatCard(
                  value: '2',
                  label: 'Perlu diperpanjang',
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          const _ProfileMenuTile(
            icon: Icons.person_outline,
            title: 'Informasi pribadi',
            subtitle: 'Nama, email, dan data anggota',
          ),
          const _ProfileMenuTile(
            icon: Icons.notifications_none,
            title: 'Notifikasi',
            subtitle: 'Pengingat jatuh tempo dan buku baru',
          ),
          const _ProfileMenuTile(
            icon: Icons.shield_outlined,
            title: 'Keamanan akun',
            subtitle: 'Kelola kata sandi Anda',
          ),
          const _ProfileMenuTile(
            icon: Icons.help_outline,
            title: 'Bantuan & dukungan',
            subtitle: 'Panduan dan kontak perpustakaan',
          ),
          const SizedBox(height: 14),
          OutlinedButton.icon(
            onPressed: () => _logout(context),
            style: OutlinedButton.styleFrom(
              backgroundColor: const Color(0xFFF1F6FF),
              minimumSize: const Size.fromHeight(50),
              side: BorderSide.none,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            icon: const Icon(Icons.logout, color: primaryBlue),
            label: const Text(
              'Keluar',
              style: TextStyle(
                color: primaryBlue,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 14),
          const Text(
            'Perpustakaan Digital • Versi 1.0.0',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFFB1B8C4),
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileStatCard extends StatelessWidget {
  final String value;
  final String label;

  const _ProfileStatCard({
    required this.value,
    required this.label,
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
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              color: Color(0xFF8B95A5),
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileMenuTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _ProfileMenuTile({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: Color(0xFFE4E9F2)),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: const Color(0xFFF1F6FF),
          child: Icon(icon, color: const Color(0xFF3367E8)),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(
            color: Color(0xFF8B95A5),
            fontSize: 12,
          ),
        ),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}