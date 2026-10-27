# Navigation v0.1

## Deskripsi
Aplikasi prototype Flutter sederhana untuk mendemonstrasikan sistem navigasi antarhalaman, pengelolaan state form input, serta penanganan event menggunakan Flutter Web.

## Milestone Saat Ini
Form & Validation v0.2

## Versi
v0.2 - Form & Validation

## Daftar Screen
- Home (`HomePage`): Halaman utama berisi sambutan dan tombol navigasi.
- Fitur Utama (`FeaturePage`): Halaman yang menampilkan daftar fitur/tugas menggunakan Card dan ListTile.
- Profil (`ProfilePage`): Halaman input pengguna menggunakan TextField interaktif dan SnackBar.
- FormPage (`Form Validasi`): Halaman form input yang dilengkapi validasi (validator) untuk memasukkan data buku baru (Judul, Penulis, Jumlah Halaman) yang kemudian dikirimkan kembali ke DataPage.
- DataPage (Data Module / Katalog): Halaman utama untuk mengelola data buku yang menerapkan operasi CRUD (Create, Read, Update, Delete), lengkap dengan empty state dan user feedback (SnackBar & dialog konfirmasi hapus).

## Fitur BAB 6
- Menambahkan form input tervalidasi (Form & TextFormField).

- Menambahkan aturan validasi input wajib diisi, panjang karakter, dan tipe data.

- Menampilkan pesan error yang jelas pada input tidak valid.

- Menampilkan user feedback menggunakan SnackBar.

- Menggunakan state sederhana (StatefulWidget & setState).

## Aturan Validasi
- Judul Buku: Wajib diisi dan minimal 3 karakter.
- Penulis: Wajib diisi dan tidak boleh kosong.
- Jumlah Halaman: Wajib diisi dan harus berupa angka yang valid.

## Skenario Uji
Form kosong (menampilkan pesan error validasi) 
- Judul buku terlalu pendek (< 3 karakter)
- Jumlah halaman bukan angka
- Form valid (data berhasil disimpan ke list dan SnackBar muncul)  
- Read data awal dan data baru
- Update data buku
- Delete data buku dengan dialog konfirmasi
- Tampilan Empty State saat data kosong 
- Navigasi antar halaman tetap berjalan lancar

## Bukti Running
Tambahkan screenshot atau link video singkat aplikasi berjalan.

## Catatan AI
Disini saya menggunakan AI untuk membantu menjelaskan cara kerja validasi pada TextFormField, meninjau fungsi setState pada pengelolaan list CRUD