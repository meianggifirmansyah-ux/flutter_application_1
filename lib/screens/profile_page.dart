import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Pengguna'),
        backgroundColor: const Color(0xFF2563EB),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Center(
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Color(0xFFEFF6FF),
                child: Text(
                  'AK',
                  style: TextStyle(
                    color: Color(0xFF2563EB),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Andi Kurniawan',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text(
              'andi.kurniawan@email.com',
              style: TextStyle(color: Color(0xFF6B7280)),
            ),
            const SizedBox(height: 4),
            const Text(
              'ID Anggota: PD-2026-0142',
              style: TextStyle(color: Color(0xFF6B7280), fontSize: 12),
            ),
            const SizedBox(height: 24),
            Card(
              child: ListTile(
                leading: const Icon(Icons.book, color: Color(0xFF2563EB)),
                title: const Text('Buku Dipinjam Aktif'),
                trailing: const Text('3 Buku', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.security, color: Color(0xFF2563EB)),
                title: const Text('Keamanan Akun'),
                subtitle: const Text('Kelola sandi dan data'),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Fitur keamanan akun dipilih')),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                minimumSize: const Size.fromHeight(45),
              ),
              child: const Text('Keluar / Kembali'),
            ),
          ],
        ),
      ),
    );
  }
}