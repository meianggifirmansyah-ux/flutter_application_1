import 'package:flutter/material.dart';

void main() => runApp(const LibraryApp());

enum AppScreen { home, login, catalog, detail, loans, profile }

const previewScreen = AppScreen.home;

const blue = Color(0xFF2563EB);
const ink = Color(0xFF111827);
const muted = Color(0xFF6B7280);
const background = Color(0xFFF8FAFC);
const border = Color(0xFFE5E7EB);

class LibraryApp extends StatelessWidget {
  const LibraryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Perpustakaan Digital',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: background,
        colorScheme: ColorScheme.fromSeed(seedColor: blue),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: ink, fontSize: 14),
        ),
      ),
      home: const LibraryScreen(screen: previewScreen),
    );
  }
}

class Book {
  final String title;
  final String author;
  final int pages;
  final bool available;
  final Color color;

  const Book(
    this.title,
    this.author,
    this.pages,
    this.available,
    this.color,
  );
}

const books = [
  Book(
    'Senja di Perpustakaan',
    'A. Kurniawan',
    240,
    true,
    Color(0xFF314B5A),
  ),
  Book(
    'Ilmu Alam untuk Pemula',
    'Dr. Lestari',
    312,
    false,
    Color(0xFF65816A),
  ),
  Book(
    'Sejarah Kota Lama',
    'B. Pratama',
    168,
    true,
    Color(0xFFA88755),
  ),
];

class LibraryScreen extends StatelessWidget {
  final AppScreen screen;

  const LibraryScreen({super.key, required this.screen});

  @override
  Widget build(BuildContext context) {
    final index = switch (screen) {
      AppScreen.catalog => 1,
      AppScreen.loans => 2,
      AppScreen.profile => 3,
      _ => 0,
    };

    final content = switch (screen) {
      AppScreen.home => const HomeView(),
      AppScreen.login => const LoginView(),
      AppScreen.catalog => const CatalogView(),
      AppScreen.detail => const DetailView(),
      AppScreen.loans => const LoansView(),
      AppScreen.profile => const ProfileView(),
    };

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: content,
        ),
      ),
      bottomNavigationBar: screen == AppScreen.login
          ? null
          : BottomNavigationBar(
              currentIndex: index,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              selectedItemColor: blue,
              unselectedItemColor: muted,
              selectedFontSize: 11,
              unselectedFontSize: 11,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  label: 'Beranda',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: 'Cari',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.menu_book_outlined),
                  label: 'Pinjaman',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline),
                  label: 'Profil',
                ),
              ],
            ),
    );
  }
}

// Elemen tampilan bersama

Widget label(
  String value, {
  double size = 14,
  Color color = ink,
  FontWeight weight = FontWeight.normal,
}) {
  return Text(
    value,
    style: TextStyle(
      fontSize: size,
      color: color,
      fontWeight: weight,
      height: 1.4,
    ),
  );
}

Widget gap([double height = 16]) => SizedBox(height: height);

Widget panel(Widget child, {Color color = Colors.white}) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(18),
      border: Border.all(color: border),
    ),
    child: child,
  );
}

Widget heading(String title, String subtitle) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 22),
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              label(title, size: 22, weight: FontWeight.w700),
              gap(4),
              label(subtitle, size: 12, color: muted),
            ],
          ),
        ),
        const SizedBox(width: 12),
        const CircleAvatar(
          radius: 20,
          backgroundColor: Color(0xFFEFF6FF),
          child: Text(
            'AK',
            style: TextStyle(
              color: blue,
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget badge(String text, {bool warning = false}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
    decoration: BoxDecoration(
      color: warning
          ? const Color(0xFFFEF3C7)
          : const Color(0xFFECFDF5),
      borderRadius: BorderRadius.circular(20),
    ),
    child: label(
      text,
      size: 10,
      color: warning
          ? const Color(0xFF92400E)
          : const Color(0xFF047857),
      weight: FontWeight.w600,
    ),
  );
}

Widget action(String text, {bool secondary = false}) {
  return Container(
    width: double.infinity,
    alignment: Alignment.center,
    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
    decoration: BoxDecoration(
      color: secondary ? Colors.white : blue,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: secondary ? border : blue),
    ),
    child: label(
      text,
      color: secondary ? blue : Colors.white,
      weight: FontWeight.w600,
    ),
  );
}

Widget searchBox() {
  return panel(
    Row(
      children: [
        const Icon(Icons.search, color: muted, size: 20),
        const SizedBox(width: 10),
        Expanded(
          child: label(
            'Cari buku, penulis, atau topik',
            size: 12,
            color: muted,
          ),
        ),
      ],
    ),
    color: background,
  );
}

Widget statistic(String title, String value) {
  return panel(
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label(title, size: 11, color: muted),
        gap(5),
        label(value, size: 20, weight: FontWeight.w700),
      ],
    ),
    color: background,
  );
}

Widget statistics(
  String firstLabel,
  String firstValue,
  String secondLabel,
  String secondValue,
) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(child: statistic(firstLabel, firstValue)),
      const SizedBox(width: 12),
      Expanded(child: statistic(secondLabel, secondValue)),
    ],
  );
}

Widget cover(Book book, {bool large = false}) {
  return Container(
    width: large ? 144 : 64,
    height: large ? 196 : 88,
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: book.color,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.auto_stories_outlined,
          color: Colors.white,
          size: large ? 48 : 24,
        ),
        gap(8),
        Text(
          book.title,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: large ? 15 : 8,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    ),
  );
}

Widget bookCard(Book book) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: panel(
      Row(
        children: [
          cover(book),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                label(book.title, weight: FontWeight.w600),
                gap(4),
                label(book.author, size: 12, color: muted),
                gap(8),
                Wrap(
                  spacing: 8,
                  runSpacing: 6,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    badge(
                      book.available ? 'Tersedia' : 'Dipinjam',
                      warning: !book.available,
                    ),
                    label(
                      '${book.pages} halaman',
                      size: 10,
                      color: muted,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

// 1. Beranda

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        heading('Perpustakaan Digital', 'Selamat datang'),
        searchBox(),
        gap(20),
        panel(
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              label('Ringkasan Pinjaman', weight: FontWeight.w700),
              gap(4),
              label(
                '3 buku aktif • 2 butuh diperpanjang',
                size: 12,
                color: muted,
              ),
              gap(14),
              statistics('Pinjaman aktif', '3', 'Tersisa', '12 hari'),
            ],
          ),
        ),
        gap(24),
        Row(
          children: [
            Expanded(
              child: label(
                'Katalog Buku',
                size: 18,
                weight: FontWeight.w700,
              ),
            ),
            label('Lihat semua', size: 12, color: blue),
          ],
        ),
        gap(14),
        ...books.map(bookCard),
      ],
    );
  }
}

// 2. Masuk

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  Widget field(String title, String value, IconData icon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label(title, size: 12, weight: FontWeight.w600),
        gap(8),
        panel(
          Row(
            children: [
              Icon(icon, color: muted, size: 20),
              const SizedBox(width: 10),
              Expanded(child: label(value, size: 13, color: muted)),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        gap(28),
        const Center(
          child: CircleAvatar(
            radius: 36,
            backgroundColor: Color(0xFFEFF6FF),
            child: Icon(Icons.menu_book, size: 36, color: blue),
          ),
        ),
        gap(20),
        Center(
          child: label(
            'Perpustakaan Digital',
            size: 24,
            weight: FontWeight.w700,
          ),
        ),
        gap(8),
        const Text(
          'Temukan cerita, perluas wawasan.\n'
          'Semua buku, dalam genggaman.',
          textAlign: TextAlign.center,
          style: TextStyle(color: muted, height: 1.5),
        ),
        gap(32),
        label(
          'Selamat datang kembali',
          size: 20,
          weight: FontWeight.w700,
        ),
        gap(6),
        label('Masuk untuk melanjutkan bacaan Anda.', color: muted),
        gap(24),
        field('Email', 'andi.kurniawan@email.com', Icons.mail_outline),
        gap(16),
        field('Kata sandi', '••••••••••', Icons.lock_outline),
        gap(16),
        Wrap(
          spacing: 20,
          runSpacing: 8,
          children: [
            label('☐ Ingat saya', size: 12, color: muted),
            label('Lupa kata sandi?', size: 12, color: blue),
          ],
        ),
        gap(24),
        action('Masuk'),
        gap(16),
        const Center(
          child: Text(
            'Belum punya akun? Daftar sekarang',
            style: TextStyle(color: blue, fontSize: 12),
          ),
        ),
        gap(28),
        panel(
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              label('Satu akun, banyak pengetahuan',
                  weight: FontWeight.w600),
              gap(8),
              label(
                'Pinjam buku digital, simpan bacaan favorit, '
                'dan pantau jadwal pengembalian.',
                size: 12,
                color: muted,
              ),
            ],
          ),
          color: const Color(0xFFEFF6FF),
        ),
        gap(20),
        label(
          'Dengan masuk, Anda menyetujui Ketentuan Layanan '
          'dan Kebijakan Privasi.',
          size: 10,
          color: muted,
        ),
      ],
    );
  }
}

// 3. Katalog

class CatalogView extends StatelessWidget {
  const CatalogView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        heading('Katalog Buku', 'Temukan bacaan berikutnya'),
        searchBox(),
        gap(16),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            for (final category in ['Semua', 'Fiksi', 'Sains', 'Sejarah'])
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 9,
                ),
                decoration: BoxDecoration(
                  color: category == 'Semua' ? blue : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: category == 'Semua' ? blue : border,
                  ),
                ),
                child: label(
                  category,
                  size: 12,
                  color: category == 'Semua' ? Colors.white : muted,
                ),
              ),
          ],
        ),
        gap(24),
        Row(
          children: [
            Expanded(
              child: label('3 buku ditemukan', weight: FontWeight.w600),
            ),
            label('Rekomendasi', size: 12, color: muted),
          ],
        ),
        gap(14),
        ...books.map(bookCard),
        gap(8),
        panel(
          label(
            'Buku sedang dipinjam? Buka detail buku untuk '
            'melihat ketersediaan koleksi.',
            size: 12,
            color: muted,
          ),
        ),
      ],
    );
  }
}

// 4. Detail buku

class DetailView extends StatelessWidget {
  const DetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final book = books.first;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.arrow_back, color: ink),
            const SizedBox(width: 12),
            label('Detail Buku', size: 20, weight: FontWeight.w700),
          ],
        ),
        gap(24),
        Center(child: cover(book, large: true)),
        gap(22),
        label(book.title, size: 24, weight: FontWeight.w700),
        gap(6),
        label(book.author, color: muted),
        gap(12),
        Wrap(
          spacing: 10,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            badge('Tersedia'),
            label('Fiksi • Novel', size: 12, color: muted),
          ],
        ),
        gap(20),
        panel(
          Wrap(
            spacing: 24,
            runSpacing: 12,
            children: [
              _metadata('Halaman', '240'),
              _metadata('Bahasa', 'Indonesia'),
              _metadata('Format', 'E-book'),
            ],
          ),
        ),
        gap(24),
        label('Tentang buku', size: 18, weight: FontWeight.w700),
        gap(10),
        label(
          'Di antara rak buku dan cahaya senja, seorang penjaga '
          'perpustakaan menemukan catatan yang mengubah caranya '
          'memandang hidup. Kisah hangat tentang pertemuan, '
          'kenangan, dan keberanian memulai kembali.',
          color: muted,
        ),
        gap(22),
        panel(
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              label('Buku ini sedang Anda pinjam',
                  weight: FontWeight.w600),
              gap(6),
              label(
                'Hingga 25 Okt 2026 • tersisa 12 hari',
                size: 12,
                color: blue,
              ),
              gap(8),
              label(
                'Status “Tersedia” berlaku untuk koleksi; '
                'pinjaman Anda tetap aktif.',
                size: 11,
                color: muted,
              ),
            ],
          ),
          color: const Color(0xFFEFF6FF),
        ),
        gap(20),
        action('Baca buku'),
        gap(10),
        action('Simpan ke favorit', secondary: true),
      ],
    );
  }

  Widget _metadata(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label(title, size: 11, color: muted),
        gap(4),
        label(value, weight: FontWeight.w600),
      ],
    );
  }
}

// 5. Pinjaman

class LoansView extends StatelessWidget {
  const LoansView({super.key});

  Widget loan(Book book, String date, {bool needsRenewal = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: panel(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                cover(book),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      label(book.title, weight: FontWeight.w600),
                      gap(5),
                      label(
                        '${book.author} • ${book.pages} halaman',
                        size: 11,
                        color: muted,
                      ),
                      gap(8),
                      label('Jatuh tempo $date', size: 11, color: muted),
                    ],
                  ),
                ),
              ],
            ),
            gap(14),
            badge(
              needsRenewal ? 'Perlu diperpanjang' : 'Tersisa 12 hari',
              warning: needsRenewal,
            ),
            gap(12),
            action(
              needsRenewal ? 'Perpanjang' : 'Baca buku',
              secondary: needsRenewal,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        heading('Pinjaman Saya', 'Kelola bacaan dan masa pinjaman'),
        statistics('Pinjaman aktif', '3', 'Butuh diperpanjang', '2'),
        gap(24),
        Row(
          children: [
            label('Aktif (3)', color: blue, weight: FontWeight.w700),
            const SizedBox(width: 24),
            label('Riwayat', color: muted),
          ],
        ),
        gap(18),
        loan(books[1], '15 Okt 2026', needsRenewal: true),
        loan(books[2], '16 Okt 2026', needsRenewal: true),
        loan(books[0], '25 Okt 2026'),
        label(
          'Per 13 Okt 2026 • Data contoh. Perpanjangan '
          'mengikuti ketersediaan koleksi.',
          size: 11,
          color: muted,
        ),
      ],
    );
  }
}

// 6. Profil

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  Widget menu(IconData icon, String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: panel(
        Row(
          children: [
            Icon(icon, color: blue, size: 22),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  label(title, weight: FontWeight.w600),
                  gap(3),
                  label(subtitle, size: 11, color: muted),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: muted),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        heading('Profil', 'Akun dan preferensi membaca'),
        panel(
          Column(
            children: [
              const CircleAvatar(
                radius: 34,
                backgroundColor: Color(0xFFEFF6FF),
                child: Text(
                  'AK',
                  style: TextStyle(
                    color: blue,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              gap(14),
              label('Andi Kurniawan', size: 20, weight: FontWeight.w700),
              gap(5),
              label('andi.kurniawan@email.com', size: 12, color: muted),
              gap(5),
              label('ID Anggota: PD-2026-0142', size: 11, color: muted),
              gap(12),
              badge('Anggota aktif'),
              gap(16),
              action('Edit profil', secondary: true),
            ],
          ),
        ),
        gap(16),
        statistics('Buku aktif', '3', 'Perlu diperpanjang', '2'),
        gap(24),
        menu(
          Icons.person_outline,
          'Informasi pribadi',
          'Nama, email, dan data anggota',
        ),
        menu(
          Icons.notifications_outlined,
          'Notifikasi',
          'Pengingat jatuh tempo dan buku baru',
        ),
        menu(
          Icons.lock_outline,
          'Keamanan akun',
          'Kelola kata sandi Anda',
        ),
        menu(
          Icons.help_outline,
          'Bantuan & dukungan',
          'Panduan dan kontak perpustakaan',
        ),
        gap(8),
        action('Keluar', secondary: true),
        gap(20),
        Center(
          child: label(
            'Perpustakaan Digital • Versi 1.0.0',
            size: 11,
            color: muted,
          ),
        ),
      ],
    );
  }
}
