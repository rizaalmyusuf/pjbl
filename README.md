# Dokumentasi Proyek PJBL

Proyek ini adalah aplikasi web berbasis CodeIgniter untuk pengelolaan Project Based Learning. Aplikasi menyediakan tiga peran utama: administrator, teacher/guru, dan student group/kelompok siswa.

## Daftar Isi

1. [Gambaran Umum](#gambaran-umum)
2. [Kebutuhan Minimal Sistem](#kebutuhan-minimal-sistem)
3. [Instalasi](#instalasi)
4. [Konfigurasi](#konfigurasi)
5. [Struktur Fitur](#struktur-fitur)
6. [Cara Penggunaan](#cara-penggunaan)
7. [Data Awal](#data-awal)
8. [Catatan Penting](#catatan-penting)

## Gambaran Umum

Aplikasi ini digunakan untuk mengelola proyek pembelajaran berbasis tugas. Alur utamanya adalah:

- Administrator mengelola akun teacher.
- Teacher membuat dan mengelola project, phase/tahap, serta student group.
- Student group mengakses project yang ditugaskan, mengunduh materi, dan mengunggah hasil kerja.

## Kebutuhan Minimal Sistem

Sebelum menjalankan aplikasi, siapkan lingkungan berikut:

- Sistem operasi: Windows, Linux, atau macOS.
- Web server: Apache atau Nginx.
- PHP: 7.2 atau lebih baru disarankan.
- Database: MySQL atau MariaDB.
- Ekstensi PHP yang umum dipakai: `mysqli`, `mbstring`, `fileinfo`, `session`, dan `gd` bila diperlukan untuk file/gambar.
- Izin tulis ke folder:
  - `application/cache`
  - `application/logs`
  - `uploads`

## Instalasi

1. Letakkan folder proyek ini di web root server, misalnya `htdocs/pjbl` atau folder virtual host seperti `pjbl.test`.
2. Buat database baru di MySQL/MariaDB.
3. Import file SQL berikut ke database yang sudah dibuat:
   - `application/database/pjbl.sql`
4. Sesuaikan koneksi database di `application/config/database.php`.
5. Sesuaikan base URL di `application/config/config.php`.
6. Pastikan folder upload dan cache memiliki izin tulis.
7. Buka aplikasi melalui browser, lalu masuk ke halaman login.

## Konfigurasi

Bagian konfigurasi utama yang biasanya perlu diperiksa:

- `application/config/config.php`
  - `base_url` harus sesuai dengan alamat aplikasi.
  - `index_page` sudah diset kosong, jadi URL menggunakan format bersih.
- `application/config/database.php`
  - pastikan hostname, username, password, dan nama database benar.
- `application/config/routes.php`
  - halaman awal aplikasi diarahkan ke controller `login`.

## Struktur Fitur

### Administrator

- Login ke sistem.
- Melihat daftar teacher.
- Menambah, mengubah, dan menghapus teacher.
- Mengubah profil dan kata sandi akun admin.

### Teacher/Guru

- Login ke sistem.
- Membuat project baru.
- Mengunggah file pretest project.
- Mengubah atau menghapus project.
- Menambahkan, mengubah, dan menghapus phase/tahap project.
- Membuat dan mengelola student group.
- Melihat detail project dan hasil kerja student group.
- Memberi status lulus, nilai, dan komentar pada hasil kerja siswa.

### Student Group/Kelompok Siswa

- Login ke sistem.
- Melihat project yang ditugaskan.
- Melihat urutan phase/tahap project.
- Mengunduh materi tiap phase.
- Mengunggah hasil kerja pretest dan tugas phase.
- Mengubah profil dan kata sandi akun kelompok.

## Cara Penggunaan

### 1. Login

1. Buka halaman utama aplikasi.
2. Masukkan username dan password sesuai akun yang tersedia.
3. Setelah login berhasil, sistem akan mengarahkan pengguna ke halaman sesuai perannya.

### 2. Alur Administrator

1. Login sebagai administrator.
2. Masuk ke halaman manajemen teacher.
3. Tambah teacher baru jika diperlukan.
4. Ubah atau hapus akun teacher dari daftar yang tersedia.
5. Gunakan menu profil untuk memperbarui data akun admin.

### 3. Alur Teacher/Guru

1. Login sebagai teacher.
2. Buat project baru melalui halaman project.
3. Unggah file pretest dan isi informasi project.
4. Tambahkan phase/tahap proyek beserta file materinya.
5. Buat student group untuk project terkait.
6. Buka detail project untuk melihat daftar group dan progres phase.
7. Periksa file hasil kerja yang diunggah student group.
8. Berikan status lulus, nilai, dan komentar.
9. Jika project sudah selesai, tandai sebagai completed agar tidak bisa diubah lagi.

### 4. Alur Student Group

1. Login sebagai student group.
2. Buka daftar project yang tersedia untuk kelompok tersebut.
3. Baca informasi project dan file pretest.
4. Ikuti phase secara berurutan sesuai alur yang disediakan.
5. Unduh materi phase lalu unggah hasil kerja sebelum deadline.
6. Pantau status tugas, komentar, dan nilai dari teacher.
7. Perbarui profil kelompok jika diperlukan.

## Data Awal

File database bawaan sudah berisi contoh data awal untuk memudahkan pengujian. Beberapa akun contoh yang tersedia pada dump database:

- Administrator: `rizalmyusuf007`
- Teacher: `guru`
- Student group: `basisdata1`

Jika Anda memakai data awal ini, sesuaikan kata sandi dengan isi database hasil impor atau reset datanya sesuai kebutuhan lingkungan Anda.

## Catatan Penting

- Aplikasi menyimpan file unggahan ke folder `uploads`.
- Nama file unggahan dibentuk otomatis oleh sistem untuk membedakan project, phase, dan user.
- Saat project sudah ditandai selesai, perubahan pada project dan phase dibatasi.
- Jika aplikasi dijalankan di lingkungan lokal dengan virtual host, pastikan domain lokal sudah diarahkan ke folder proyek ini.
