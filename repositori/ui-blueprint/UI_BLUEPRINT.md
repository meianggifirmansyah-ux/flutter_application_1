
Nama Aplikasi: 
Perpustakaan Digital

Tema Aplikasi: 
Literasi dan pengelolaan peminjaman buku.

Target Pengguna:  
Mahasiswa, pelajar, dan pengguna yang ingin mencari buku serta memantau peminjaman.

Tujuan Aplikasi:
Membantu pengguna melihat katalog buku, mengetahui informasi dan ketersediaan buku, serta memantau daftar pinjaman.

Daftar Screen

1. Beranda (Home)

Fungsi: Menampilkan sambutan, ringkasan pinjaman, pencarian, dan rekomendasi buku.

Komponen: AppBar, ikon perpustakaan, teks sambutan, kolom pencarian, ringkasan pinjaman, daftar kartu buku, dan navigasi bawah.


3. Katalog Buku

Fungsi: Menampilkan daftar buku yang tersedia untuk dilihat pengguna.

Komponen: AppBar, judul halaman, kolom pencarian, pilihan kategori, jumlah buku, kartu buku, sampul buku, judul, nama penulis, jumlah halaman, dan status ketersediaan.

4. Detail Buku

Fungsi: Menampilkan informasi lengkap mengenai buku yang dipilih.

Komponen: Tombol kembali, sampul buku, judul, nama penulis, kategori, status ketersediaan, informasi halaman, bahasa, format buku, deskripsi, tombol baca buku, dan tombol simpan ke favorit.

5. Pinjaman Saya

Fungsi: Menampilkan daftar buku yang sedang dipinjam beserta informasi jatuh tempo.

Komponen: AppBar, ringkasan pinjaman aktif, informasi buku yang perlu diperpanjang, kartu pinjaman, tanggal jatuh tempo, label status, tombol perpanjang, dan tombol baca buku.

6. Profil

Fungsi: Menampilkan identitas anggota dan menu pengaturan akun.

Komponen: AppBar, inisial pengguna, nama, email, ID anggota, status anggota, tombol edit profil, ringkasan buku aktif, menu informasi pribadi, notifikasi, keamanan akun, bantuan, dan tombol keluar.

Alur Maju

- Beranda → Katalog Buku
- Beranda → Detail Buku
- Beranda → Pinjaman Saya
- Beranda → Profil
- Katalog Buku → Detail Buku
- Detail Buku → Pinjaman Saya
- Masuk → Beranda
- Profil → Informasi Pribadi
- Profil → Notifikasi
- Profil → Keamanan Akun
- Profil → Bantuan

Alur Kembali

- Katalog Buku → Beranda
- Detail Buku → Katalog Buku
- Pinjaman Saya → Beranda
- Profil → Beranda
- Masuk → Beranda setelah proses masuk berhasil

Beberapa alur di atas merupakan rancangan navigasi. Pada source code saat ini, sebagian tombol dan fitur masih berupa tampilan antarmuka dan belum terhubung dengan fungsi aplikasi sepenuhnya