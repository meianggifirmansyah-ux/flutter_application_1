# CHANGELOG

## v0.3 - Data Module
Tanggal: 2026-11-15

Perubahan:
- Menambahkan rancangan model data buku menggunakan class Task.
- Menambahkan atribut data berupa id, title, author, pages, available, dan color.
- Menambahkan local/mock data sebagai penyimpanan sementara.
- Menampilkan daftar koleksi buku menggunakan ListView.builder.
- Menambahkan fitur tambah buku (Create).
- Menambahkan fitur tampil data buku (Read).
- Menambahkan fitur ubah data buku (Update) melalui form edit.
- Menambahkan fitur hapus buku (Delete).
- Menambahkan dialog konfirmasi sebelum menghapus data.
- Menambahkan empty state ketika daftar buku kosong.
- Menambahkan SnackBar sebagai user feedback setelah operasi CRUD.
- Mengintegrasikan form dan validasi dari Form & Validation v0.2 dengan Data Module.
- Memastikan navigasi dari Navigation v0.1 tetap berjalan.

Bukti: 

## v0.2 - Form & Validation
Tanggal: [YYYY-MM-DD]

Perubahan:
- Menambahkan halaman form untuk memasukkan data buku.
- Menambahkan input judul buku.
- Menambahkan input nama penulis.
- Menambahkan input jumlah halaman.
- Mengimplementasikan Form dan GlobalKey<FormState>.
- Menambahkan validasi wajib isi pada seluruh input.
- Menambahkan validasi minimal tiga karakter pada judul buku.
- Menambahkan validasi jumlah halaman harus berupa angka.
- Menambahkan pesan error pada input yang tidak valid.
- Menambahkan SnackBar sebagai user feedback.
- Menggunakan TextEditingController untuk mengelola input.
- Menggunakan StatefulWidget dan setState() untuk pengelolaan state.

Bukti:


## v0.1 - Navigation
Tanggal: [YYYY-MM-DD]

Perubahan:
- Membuat struktur navigasi aplikasi Perpustakaan Digital.
- Menambahkan halaman Home.
- Menambahkan halaman Data.
- Menambahkan halaman Profile.
- Mengimplementasikan navigasi antarhalaman menggunakan Navigator.
- Menggunakan MaterialPageRoute untuk perpindahan halaman.
- Menambahkan struktur tampilan dasar menggunakan Flutter Material Design.

Bukti:


## v0.0 - Prototype
Tanggal: [YYYY-MM-DD]

Perubahan:
- Membuat project awal menggunakan Flutter.
- Menyiapkan struktur dasar aplikasi.
- Mengatur konfigurasi project melalui pubspec.yaml.
- Menyiapkan file utama aplikasi main.dart.
- Membuat rancangan awal aplikasi Perpustakaan Digital.
- Menyiapkan dasar pengembangan antarmuka aplikasi.

Bukti:
