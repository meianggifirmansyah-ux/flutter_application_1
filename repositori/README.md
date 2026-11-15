# Data Module v0.3

## Deskripsi
Aplikasi prototype Flutter sederhana untuk mendemonstrasikan sistem navigasi antarhalaman, pengelolaan state form input, serta penanganan event menggunakan Flutter Web.

## Milestone Saat Ini
Data Module v0.3

## Versi
v0.3 - Data Module

## Daftar Screen
- Home (`HomePage`): Halaman utama berisi sambutan dan tombol navigasi.
- Fitur Utama (`FeaturePage`): Halaman yang menampilkan daftar fitur/tugas menggunakan Card dan ListTile.
- Profil (`ProfilePage`): Halaman input pengguna menggunakan TextField interaktif dan SnackBar.
- FormPage (`Form Validasi`): Halaman form input yang dilengkapi validasi (validator) untuk memasukkan data buku baru (Judul, Penulis, Jumlah Halaman) yang kemudian dikirimkan kembali ke DataPage.
- DataPage (Data Module / Katalog): Halaman utama untuk mengelola data buku yang menerapkan operasi CRUD (Create, Read, Update, Delete), lengkap dengan empty state dan user feedback (SnackBar & dialog konfirmasi hapus).

## Model Data
Task:
- id
- title
- author
- pages 
- available

## Sumber Data
Data sementara di memori aplikasi menggunakan List dan mock data.

## Fitur BAB 7
- Menambahkan model data sederhana.
- Menambahkan local/mock data.
- Menampilkan daftar data menggunakan ListView.builder.
- Menambahkan fitur tambah data.
- Menambahkan fitur ubah data sederhana.
- Menambahkan fitur hapus data.
- Menambahkan empty state ketika data kosong.
- Menambahkan SnackBar sebagai user feedback.
- Memastikan navigasi v0.1 dan Form & Validation v0.2 tetap berjalan.   

## Aturan Validasi
- Judul Buku: Wajib diisi dan minimal 3 karakter.
- Penulis: Wajib diisi dan tidak boleh kosong.
- Jumlah Halaman: Wajib diisi dan harus berupa angka yang valid.

## Skenario Uji

- Data awal tampil.
- Tambah data.
- Ubah data.
- Hapus data.
- Empty state.
- Navigasi tetap berjalan.
- Form lama tetap berjalan.

## Bukti Running
Tambahkan screenshot atau link video singkat aplikasi berjalan.

## Catatan AI
Disini saya menggunakan AI untuk membantu Menjelaskan fungsi List<Task>, setState(), dan ListView.builder.