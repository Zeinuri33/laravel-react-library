-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: mysql:3306
-- Generation Time: May 23, 2026 at 04:18 AM
-- Server version: 8.4.8
-- PHP Version: 8.3.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('digilib-cache-0ac2fbe0fbeabcb4246cc0342c0dbe0e', 'i:1;', 1778318851),
('digilib-cache-0ac2fbe0fbeabcb4246cc0342c0dbe0e:timer', 'i:1778318851;', 1778318851),
('digilib-cache-1941c08916e6dcacf9fcd8ca6fff44de', 'i:1;', 1779500305),
('digilib-cache-1941c08916e6dcacf9fcd8ca6fff44de:timer', 'i:1779500305;', 1779500305),
('digilib-cache-35fee63920751b47a09c4b8891edbbb7', 'i:5;', 1778318744),
('digilib-cache-35fee63920751b47a09c4b8891edbbb7:timer', 'i:1778318744;', 1778318744),
('digilib-cache-40df9b06439caee594b9f52bf8df319c', 'i:1;', 1779331672),
('digilib-cache-40df9b06439caee594b9f52bf8df319c:timer', 'i:1779331672;', 1779331672),
('digilib-cache-a364a3a9c0e33c0a9782d2dbca4eaf9a', 'i:1;', 1778318751),
('digilib-cache-a364a3a9c0e33c0a9782d2dbca4eaf9a:timer', 'i:1778318751;', 1778318751),
('digilib-cache-admin@gmail.com|172.18.0.1', 'i:1;', 1779331672),
('digilib-cache-admin@gmail.com|172.18.0.1:timer', 'i:1779331672;', 1779331672),
('digilib-cache-admin|172.18.0.1', 'i:5;', 1778318744),
('digilib-cache-admin|172.18.0.1:timer', 'i:1778318744;', 1778318744),
('digilib-cache-admin123|172.18.0.1', 'i:1;', 1778318751),
('digilib-cache-admin123|172.18.0.1:timer', 'i:1778318751;', 1778318751),
('digilib-cache-contoh@gmail.com|172.18.0.1', 'i:1;', 1778318851),
('digilib-cache-contoh@gmail.com|172.18.0.1:timer', 'i:1778318851;', 1778318851),
('digilib-cache-spatie.permission.cache', 'a:3:{s:5:\"alias\";a:4:{s:1:\"a\";s:2:\"id\";s:1:\"b\";s:4:\"name\";s:1:\"c\";s:10:\"guard_name\";s:1:\"r\";s:5:\"roles\";}s:11:\"permissions\";a:37:{i:0;a:4:{s:1:\"a\";i:1;s:1:\"b\";s:10:\"lihat-user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:7;}}i:1;a:4:{s:1:\"a\";i:2;s:1:\"b\";s:11:\"tambah-user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:7;}}i:2;a:4:{s:1:\"a\";i:3;s:1:\"b\";s:9:\"edit-user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:7;}}i:3;a:4:{s:1:\"a\";i:4;s:1:\"b\";s:10:\"hapus-user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:7;}}i:4;a:4:{s:1:\"a\";i:5;s:1:\"b\";s:10:\"lihat-role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:7;}}i:5;a:4:{s:1:\"a\";i:6;s:1:\"b\";s:11:\"tambah-role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:7;}}i:6;a:4:{s:1:\"a\";i:7;s:1:\"b\";s:9:\"edit-role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:7;}}i:7;a:4:{s:1:\"a\";i:8;s:1:\"b\";s:10:\"hapus-role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:7;}}i:8;a:4:{s:1:\"a\";i:9;s:1:\"b\";s:11:\"lihat-akses\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:7;}}i:9;a:4:{s:1:\"a\";i:10;s:1:\"b\";s:12:\"tambah-akses\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:7;}}i:10;a:4:{s:1:\"a\";i:11;s:1:\"b\";s:10:\"edit-akses\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:7;}}i:11;a:4:{s:1:\"a\";i:12;s:1:\"b\";s:11:\"hapus-akses\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:7;}}i:12;a:4:{s:1:\"a\";i:19;s:1:\"b\";s:14:\"lihat-fakultas\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:7;}}i:13;a:4:{s:1:\"a\";i:20;s:1:\"b\";s:11:\"lihat-prodi\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:7;}}i:14;a:4:{s:1:\"a\";i:21;s:1:\"b\";s:11:\"lihat-dosen\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:7;}}i:15;a:4:{s:1:\"a\";i:22;s:1:\"b\";s:15:\"lihat-mahasiswa\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:7;}}i:16;a:4:{s:1:\"a\";i:23;s:1:\"b\";s:15:\"tambah-fakultas\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:7;}}i:17;a:4:{s:1:\"a\";i:24;s:1:\"b\";s:13:\"edit-fakultas\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:7;}}i:18;a:4:{s:1:\"a\";i:25;s:1:\"b\";s:14:\"hapus-fakultas\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:7;}}i:19;a:4:{s:1:\"a\";i:26;s:1:\"b\";s:12:\"tambah-prodi\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:7;}}i:20;a:4:{s:1:\"a\";i:27;s:1:\"b\";s:10:\"edit-prodi\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:7;}}i:21;a:4:{s:1:\"a\";i:28;s:1:\"b\";s:11:\"hapus-prodi\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:7;}}i:22;a:4:{s:1:\"a\";i:29;s:1:\"b\";s:12:\"tambah-dosen\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:7;}}i:23;a:4:{s:1:\"a\";i:30;s:1:\"b\";s:10:\"edit-dosen\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:7;}}i:24;a:4:{s:1:\"a\";i:31;s:1:\"b\";s:11:\"hapus-dosen\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:7;}}i:25;a:4:{s:1:\"a\";i:32;s:1:\"b\";s:16:\"tambah-mahasiswa\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:7;}}i:26;a:4:{s:1:\"a\";i:33;s:1:\"b\";s:14:\"edit-mahasiswa\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:7;}}i:27;a:4:{s:1:\"a\";i:34;s:1:\"b\";s:15:\"hapus-mahasiswa\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:7;}}i:28;a:4:{s:1:\"a\";i:40;s:1:\"b\";s:17:\"lihat-plagiasi_ta\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:7;}}i:29;a:4:{s:1:\"a\";i:41;s:1:\"b\";s:16:\"edit-plagiasi_ta\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:7;}}i:30;a:4:{s:1:\"a\";i:42;s:1:\"b\";s:18:\"tambah-plagiasi_ta\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:7;}}i:31;a:4:{s:1:\"a\";i:43;s:1:\"b\";s:17:\"hapus-plagiasi_ta\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:7;}}i:32;a:4:{s:1:\"a\";i:44;s:1:\"b\";s:20:\"lihat-plagiasi_nonta\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:7;}}i:33;a:4:{s:1:\"a\";i:45;s:1:\"b\";s:17:\"lihat-dokumentasi\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:7;}}i:34;a:4:{s:1:\"a\";i:46;s:1:\"b\";s:18:\"tambah-dokumentasi\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:7;}}i:35;a:4:{s:1:\"a\";i:47;s:1:\"b\";s:16:\"edit-dokumentasi\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:7;}}i:36;a:4:{s:1:\"a\";i:48;s:1:\"b\";s:17:\"hapus-dokumentasi\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:7;}}}s:5:\"roles\";a:2:{i:0;a:3:{s:1:\"a\";i:2;s:1:\"b\";s:4:\"user\";s:1:\"c\";s:3:\"web\";}i:1;a:3:{s:1:\"a\";i:7;s:1:\"b\";s:5:\"admin\";s:1:\"c\";s:3:\"web\";}}}', 1779586648);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `doc_kategori`
--

CREATE TABLE `doc_kategori` (
  `id` bigint UNSIGNED NOT NULL,
  `kategori` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `doc_kategori`
--

INSERT INTO `doc_kategori` (`id`, `kategori`, `created_at`, `updated_at`) VALUES
(5, 'Pengenalan', '2026-05-19 11:17:16', '2026-05-20 15:31:09');

-- --------------------------------------------------------

--
-- Table structure for table `dokumentasi`
--

CREATE TABLE `dokumentasi` (
  `id` bigint UNSIGNED NOT NULL,
  `doc_kategori_id` bigint UNSIGNED NOT NULL,
  `judul` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `konten` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dokumentasi`
--

INSERT INTO `dokumentasi` (`id`, `doc_kategori_id`, `judul`, `slug`, `konten`, `created_at`, `updated_at`) VALUES
(5, 5, 'Perpustakaan Ibrahimy', 'tentang-perpustakaan-ibrahimy', '<h2><strong>Profil Perpustakaan Ibrahimy</strong></h2><p><a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"https://www.lib.ibrahimy.ac.id/\">Perpustakaan Ibrahimy</a> merupakan pusat layanan informasi, literasi, dan pengembangan akademik yang berada di bawah naungan Pondok Pesantren Salafiyah Syafi’iyah Sukorejo Situbondo. Perpustakaan ini hadir sebagai sarana pendukung pendidikan, penelitian, pengkajian keislaman, serta pengembangan intelektual bagi santri, mahasiswa, dosen, dan masyarakat umum.</p><h2><strong>Perpustakaan Berbasis Teknologi Digital</strong></h2><p>Perpustakaan Ibrahimy tidak hanya berfungsi sebagai tempat penyimpanan koleksi buku, tetapi juga menjadi pusat pembelajaran modern yang mengintegrasikan layanan perpustakaan konvensional dengan teknologi digjhgyfgital.</p><p>Melalui sistem perpustakaan berbasis online, pengguna dapat mengakses:</p><ul><li><p>Katalog koleksi perpustakaan</p></li><li><p>Repository karya ilmiah</p></li><li><p>Resource guide</p></li><li><p>Layanan perpustakaan digital</p></li><li><p>Berbagai sumber referensi akademik lainnya</p></li></ul><p>Dengan sistem ini, akses informasi dapat dilakukan secara lebih mudah, cepat, dan efisien.</p><h2><strong>Unit Layanan Perpustakaan</strong></h2><p>Dalam pengembangannya, Perpustakaan Ibrahimy memiliki beberapa unit layanan yang tersebar di lingkungan pesantren dan perguruan tinggi, di antaranya:</p><ul><li><p>Perpustakaan Pusat Putra</p></li><li><p>Perpustakaan Pusat Putri</p></li><li><p>Perpustakaan Fakultas Ilmu Kesehatan (FIK)</p></li><li><p>Perpustakaan Fakultas Syariah dan Ekonomi Islam (FSEI)</p></li></ul><p>Setiap unit layanan dirancang untuk mendukung kebutuhan literasi dan akademik sesuai lingkungan dan bidang keilmuan masing-masing.</p><h2><strong>Koleksi dan Bidang Keilmuan</strong></h2><p>Koleksi Perpustakaan Ibrahimy mencakup berbagai bidang keilmuan, seperti:</p><ul><li><p>Keislaman dan kitab turats</p></li><li><p>Pendidikan</p></li><li><p>Sosial dan humaniora</p></li><li><p>Teknologi informasi</p></li><li><p>Kesehatan</p></li><li><p>Psikologi</p></li><li><p>Sejarah dan kebudayaan</p></li><li><p>Literatur umum dan referensi akademik</p></li></ul><p>Koleksi tersebut tersedia dalam bentuk cetak maupun digital guna mendukung kebutuhan pembelajaran dan penelitian sivitas akademika.</p><h2><strong>Layanan Digital Library</strong></h2><p>Melalui Digilib Ibrahimy, pengguna dapat mengakses berbagai koleksi digital dan karya ilmiah secara online dengan lebih mudah dan cepat. Sistem ini menyediakan layanan perpustakaan digital yang mendukung:</p><ul><li><p>Penelusuran informasi akademik</p></li><li><p>Repository karya ilmiah</p></li><li><p>Akses referensi digital</p></li><li><p>Dokumentasi koleksi ilmiah</p></li></ul><p>Digilib Ibrahimy dirancang untuk mempermudah pengguna dalam mencari dan mengakses sumber informasi berdasarkan:</p><ul><li><p>Judul</p></li><li><p>Penulis</p></li><li><p>Subjek</p></li><li><p>Kategori koleksi digital</p></li></ul><p>Dengan layanan berbasis web ini, akses terhadap sumber belajar dan literatur akademik dapat dilakukan kapan saja dan di mana saja secara lebih efektif dan efisien.</p><h2><strong>Pengembangan Budaya Literasi</strong></h2><p>Selain layanan koleksi, Perpustakaan Ibrahimy juga aktif mengembangkan budaya literasi melalui berbagai program dan publikasi, seperti:</p><ul><li><p>Buletin mingguan literasi</p></li><li><p>Review dan resensi buku</p></li><li><p>Pengembangan minat baca</p></li><li><p>Kerja sama antar perpustakaan</p></li><li><p>Penguatan literasi digital</p></li></ul><p>Program-program tersebut bertujuan untuk meningkatkan budaya membaca, kemampuan literasi informasi, dan pemanfaatan sumber pengetahuan di lingkungan pesantren dan perguruan tinggi.</p><h2><strong>Kerja Sama dan Pengembangan Layanan</strong></h2><p>Perpustakaan Ibrahimy terus menjalin kerja sama dengan berbagai institusi untuk meningkatkan kualitas layanan dan pengembangan sumber daya pustakawan.</p><p>Kerja sama tersebut meliputi:</p><ul><li><p>Pengembangan koleksi perpustakaan</p></li><li><p>Pertukaran informasi</p></li><li><p>Penguatan layanan digital</p></li><li><p>Pengembangan kompetensi pustakawan</p></li><li><p>Kolaborasi antar perpustakaan perguruan tinggi</p></li></ul><p>Melalui kolaborasi ini, Perpustakaan Ibrahimy berupaya menghadirkan layanan yang semakin profesional dan berkualitas.</p><h2><strong>Komitmen dan Semangat Perpustakaan</strong></h2><p>Dengan semangat <em>“Membangun intelektual paripurna menuju pemberdayaan umat”</em>, Perpustakaan Ibrahimy berkomitmen menjadi pusat literasi pesantren yang:</p><ul><li><p>Modern</p></li><li><p>Inklusif</p></li><li><p>Adaptif terhadap perkembangan teknologi informasi</p></li><li><p>Berorientasi pada pelayanan akademik</p></li><li><p>Tetap menjaga nilai-nilai keislaman dan tradisi kepesantrenan</p></li></ul><p>&nbsp;</p>', '2026-05-19 11:17:16', '2026-05-21 16:16:50'),
(7, 5, 'Digilib Ibrahimy', 'tentang-digilib-ibrahimy', '<img src=\"http://localhost/storage/dokumentasi/R1feu8OUmwtvpq78yyHaiukxIzFFAcqX6rVKhbLt.png\" alt=\"digilib\" title=\"digilib\" class=\"\n                    my-4\n                    block\n                    mx-auto w-full\n                \"><p></p><h2><strong>Pengertian Digilib Ibrahimy</strong></h2><p><a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"https://digilib.ibrahimy.ac.id/\">Digilib Ibrahimy</a> merupakan layanan perpustakaan digital yang dikembangkan oleh Perpustakaan Ibrahimy sebagai sarana akses informasi dan sumber referensi akademik berbasis digital di lingkungan Pondok Pesantren Salafiyah Syafi’iyah Sukorejo Situbondo. Platform ini hadir untuk mendukung kebutuhan pembelajaran, penelitian, serta pengembangan literasi digital bagi santri, mahasiswa, dosen, dan seluruh sivitas akademika.</p><p></p><h2><strong>Tujuan Pengembangan Digilib</strong></h2><p>Digilib Ibrahimy dirancang sebagai pusat layanan koleksi digital yang memungkinkan pengguna mengakses berbagai karya ilmiah dan sumber referensi secara online tanpa harus datang langsung ke perpustakaan. Kehadiran sistem ini bertujuan untuk:</p><ul><li><p>Mempermudah akses informasi akademik</p></li><li><p>Mendukung kegiatan pembelajaran dan penelitian</p></li><li><p>Mengembangkan budaya literasi digital</p></li><li><p>Menjadi pusat dokumentasi karya ilmiah sivitas akademika</p></li><li><p>Meningkatkan kualitas layanan perpustakaan berbasis teknologi</p></li></ul><p></p><h2><strong>Koleksi Digital</strong></h2><p>Melalui Digilib Ibrahimy, pengguna dapat menelusuri dan membaca berbagai koleksi digital seperti:</p><ul><li><p>Skripsi dan karya ilmiah mahasiswa</p></li><li><p>Artikel dan publikasi akademik</p></li><li><p>Dokumen penelitian</p></li><li><p>Referensi pendidikan dan keislaman</p></li><li><p>Koleksi literasi digital lainnya</p></li></ul><p></p><h2><strong>Kemudahan Akses dan Pencarian</strong></h2><p>Dengan tampilan sistem yang sederhana dan mudah digunakan, Digilib Ibrahimy membantu pengguna dalam melakukan pencarian koleksi berdasarkan:</p><ul><li><p>Judul dokumen</p></li><li><p>Nama penulis</p></li><li><p>Subjek pembahasan</p></li><li><p>Kategori koleksi</p></li><li><p>Kata kunci tertentu</p></li></ul><p>Sistem ini dirancang agar proses pencarian informasi dapat dilakukan secara lebih cepat, efektif, dan efisien.</p><p></p><h2><strong>Transformasi Layanan Digital</strong></h2><p>Sebagai bagian dari transformasi layanan perpustakaan modern, Digilib Ibrahimy menjadi bentuk pengembangan layanan informasi berbasis teknologi yang mendukung budaya akademik dan literasi digital di lingkungan pesantren dan perguruan tinggi.</p><p>Kehadiran platform ini diharapkan mampu memperluas akses pengetahuan sehingga informasi dan referensi ilmiah dapat diakses kapan saja dan di mana saja.</p><p></p><h2><strong>Pusat Dokumentasi Karya Ilmiah</strong></h2><p>Selain sebagai media akses koleksi digital, Digilib Ibrahimy juga berfungsi sebagai sarana dokumentasi dan publikasi karya ilmiah sivitas akademika Ibrahimy agar dapat:</p><ul><li><p>Tersimpan secara digital</p></li><li><p>Terkelola dengan baik</p></li><li><p>Mudah diakses kembali</p></li><li><p>Dimanfaatkan sebagai sumber pembelajaran</p></li><li><p>Mendukung pengembangan ilmu pengetahuan</p></li></ul><p></p><h2><strong>Komitmen Pengembangan Layanan</strong></h2><p>Melalui pengembangan layanan digital ini, Perpustakaan Ibrahimy terus berupaya menghadirkan sistem perpustakaan yang:</p><ul><li><p>Modern</p></li><li><p>Inklusif</p></li><li><p>Mudah diakses</p></li><li><p>Adaptif terhadap perkembangan teknologi informasi</p></li><li><p>Tetap menjaga nilai-nilai kepesantrenan dan tradisi literasi Islam</p></li></ul><p>&nbsp;</p>', '2026-05-21 02:51:09', '2026-05-21 09:07:55'),
(8, 5, 'Visi & Misi Layanan', 'visi-misi-layanan', '<h2>Visi</h2><p>Menjadi pusat informasi dan layanan perpustakaan berbasis pesantren yang unggul, inovatif, dan berdaya saing di tingkat Asia untuk mendukung terwujudnya Universitas Ibrahimy sebagai Perguruan Tinggi Pesantren yang Unggul dan Berdaya Saing Global pada Tahun 2042.</p><p></p><h2><strong>Misi</strong></h2><p>Untuk mewujudkan visi tersebut, Perpustakaan Ibrahimy memiliki beberapa misi sebagai berikut:</p><p><strong>1. Menyediakan Sumber Informasi yang Berkualitas, Relevan, dan Berkesinambungan</strong></p><p>Perpustakaan Ibrahimy berupaya menyediakan berbagai sumber informasi dan koleksi pustaka yang sesuai dengan kebutuhan akademik, keislaman, penelitian, serta perkembangan ilmu pengetahuan. Koleksi yang tersedia terus dikembangkan secara berkelanjutan agar tetap relevan dan bermanfaat bagi civitas akademika maupun masyarakat.</p><p><strong>2. Mengembangkan Layanan Perpustakaan Modern dan Inovatif</strong></p><p>Perpustakaan Ibrahimy terus meningkatkan kualitas layanan dengan memanfaatkan teknologi informasi dan sistem digital guna menciptakan layanan yang cepat, mudah diakses, efektif, serta mengikuti perkembangan zaman dan kebutuhan pengguna.</p><p><strong>3. Meningkatkan Kompetensi Profesional Pustakawan</strong></p><p>Perpustakaan Ibrahimy berkomitmen meningkatkan kemampuan, keterampilan, dan profesionalisme pustakawan melalui pelatihan, pengembangan kompetensi, serta peningkatan kualitas sumber daya manusia agar mampu memberikan pelayanan terbaik kepada pengguna.</p><p><strong>4. Menguatkan Budaya Literasi, Riset, dan Kajian Ilmiah</strong></p><p>Perpustakaan Ibrahimy mendukung terciptanya budaya membaca, menulis, penelitian, dan pengkajian ilmiah melalui berbagai kegiatan literasi, edukasi, diskusi akademik, serta penyediaan sumber referensi yang mendukung pengembangan ilmu pengetahuan.</p><p><strong>5. Membangun Jejaring dan Kerja Sama Nasional maupun Internasional</strong></p><p>Perpustakaan Ibrahimy menjalin kerja sama dengan berbagai lembaga pendidikan, perpustakaan, institusi, dan organisasi baik di tingkat nasional maupun internasional guna memperluas akses informasi, meningkatkan kualitas layanan, dan memperkuat pengembangan perpustakaan.</p><p><strong>6. Mengelola Perpustakaan secara Efektif, Akuntabel, dan Berstandar Internasional</strong></p><p>Perpustakaan Ibrahimy berupaya menerapkan tata kelola perpustakaan yang profesional, transparan, efektif, dan akuntabel dengan mengacu pada standar pengelolaan perpustakaan modern agar mampu memberikan layanan yang optimal dan berdaya saing global.</p><p>&nbsp;</p>', '2026-05-21 03:00:28', '2026-05-21 04:33:43'),
(9, 5, 'Tata Tertib Perpustakaan', 'tata-tertib', '<h2><strong>Ketentuan Umum</strong></h2><p>Tata tertib <a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"https://www.lib.ibrahimy.ac.id/\">perpustakaan ibrahimy </a>dibuat untuk menjaga kenyamanan, ketertiban, keamanan, dan kelancaran layanan bagi seluruh pemustaka. Setiap pengguna layanan Perpustakaan Ibrahimy diharapkan mematuhi seluruh aturan yang berlaku selama berada di lingkungan perpustakaan maupun saat menggunakan layanan digital.</p><h2><strong>Kewajiban Pengunjung</strong></h2><p>Setiap pengunjung perpustakaan diwajibkan untuk:</p><ul><li><p>Menjaga ketenangan dan kenyamanan ruang baca</p></li><li><p>Berpakaian sopan dan rapi sesuai norma pesantren dan kampus</p></li><li><p>Menjaga kebersihan lingkungan perpustakaan</p></li><li><p>Menitipkan barang bawaan pada tempat yang telah disediakan apabila diperlukan</p></li><li><p>Menggunakan fasilitas perpustakaan dengan baik dan bertanggung jawab</p></li><li><p>Mematuhi arahan petugas perpustakaan</p></li></ul><h2><strong>Aturan Penggunaan Koleksi</strong></h2><p>Dalam menggunakan koleksi perpustakaan, pemustaka wajib:</p><ul><li><p>Menjaga kondisi buku dan koleksi perpustakaan</p></li><li><p>Tidak mencoret, melipat, merobek, atau merusak koleksi</p></li><li><p>Mengembalikan buku sesuai waktu peminjaman yang telah ditentukan</p></li><li><p>Melakukan proses peminjaman melalui prosedur resmi perpustakaan</p></li><li><p>Mengganti koleksi yang hilang atau rusak sesuai ketentuan yang berlaku</p></li></ul><h2><strong>Larangan di Area Perpustakaan</strong></h2><p>Untuk menjaga kenyamanan bersama, pengunjung dilarang:</p><ul><li><p>Membuat kegaduhan atau berbicara terlalu keras</p></li><li><p>Membawa makanan dan minuman ke area koleksi dan ruang baca</p></li><li><p>Merokok di area perpustakaan</p></li><li><p>Menggunakan fasilitas perpustakaan untuk kegiatan yang tidak berkaitan dengan akademik dan literasi</p></li><li><p>Memindahkan koleksi tanpa izin petugas</p></li><li><p>Mengakses atau menggunakan akun pengguna lain tanpa izin</p></li></ul><h2><strong>Ketentuan Peminjaman dan Pengembalian</strong></h2><p>Pemustaka yang melakukan peminjaman buku wajib memperhatikan ketentuan berikut:</p><ul><li><p>Peminjaman menggunakan kartu anggota atau akun resmi perpustakaan</p></li><li><p>Jumlah dan lama peminjaman mengikuti aturan layanan yang berlaku</p></li><li><p>Keterlambatan pengembalian dapat dikenakan sanksi atau denda</p></li><li><p>Buku referensi tertentu hanya dapat dibaca di tempat</p></li><li><p>Perpanjangan peminjaman dilakukan sebelum masa pinjam berakhir</p></li></ul><h2><strong>Penggunaan Layanan Digital</strong></h2><p>Dalam menggunakan layanan Digilib dan sistem perpustakaan digital, pengguna diharapkan:</p><ul><li><p>Menggunakan akun secara bertanggung jawab</p></li><li><p>Tidak menyebarluaskan akses akun kepada pihak lain</p></li><li><p>Menggunakan koleksi digital untuk kepentingan pendidikan dan penelitian</p></li><li><p>Tidak melakukan plagiarisme atau penyalahgunaan karya ilmiah</p></li><li><p>Mematuhi hak cipta dan etika penggunaan informasi digital</p></li></ul><h2><strong>Etika dan Sikap Pemustaka</strong></h2><p>Setiap pemustaka diharapkan memiliki sikap:</p><ul><li><p>Sopan dan menghormati petugas maupun pengguna lain</p></li><li><p>Bertanggung jawab terhadap fasilitas yang digunakan</p></li><li><p>Menjaga adab dan budaya literasi</p></li><li><p>Menggunakan perpustakaan sebagai sarana belajar dan pengembangan ilmu pengetahuan</p></li></ul><h2><strong>Sanksi Pelanggaran</strong></h2><p>Pelanggaran terhadap tata tertib perpustakaan dapat dikenakan sanksi sesuai ketentuan yang berlaku, antara lain:</p><ul><li><p>Teguran lisan atau tertulis</p></li><li><p>Pembatasan layanan perpustakaan</p></li><li><p>Denda keterlambatan</p></li><li><p>Penggantian koleksi yang rusak atau hilang</p></li><li><p>Penonaktifan sementara hak layanan perpustakaan</p></li></ul><h2><strong>Penutup</strong></h2><p>Dengan mematuhi tata tertib perpustakaan, seluruh pengguna turut mendukung terciptanya lingkungan literasi yang nyaman, tertib, kondusif, dan bermanfaat bagi seluruh sivitas akademika serta masyarakat pengguna layanan Perpustakaan Ibrahimy.</p><p>&nbsp;</p>', '2026-05-23 02:27:01', '2026-05-23 03:00:32');

-- --------------------------------------------------------

--
-- Table structure for table `dosens`
--

CREATE TABLE `dosens` (
  `id` bigint UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nidn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kontak` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prodi_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dosens`
--

INSERT INTO `dosens` (`id`, `nama`, `nidn`, `kontak`, `prodi_id`, `created_at`, `updated_at`) VALUES
(1, 'Dr. Kandiri, M.Pd.I', '2111116501', '085259690629', 8, NULL, NULL),
(2, 'Dr. Minhaji, M.Pd.I', '2110117001', '081336699039', 8, NULL, NULL),
(3, 'Dr. Arfandi, M.Pd.I', '21099118502', '081234997100', 8, NULL, NULL),
(4, 'Dr. Asmuki, M.HI', '2105048201', '087866172890', 8, NULL, NULL),
(5, 'Dr. Moh. Zamili, M.M.Pd', '2103038301', '082244995150', 8, NULL, NULL),
(6, 'Eriyanto, M.Pd.I', '2126097901', '082232173091', 8, NULL, NULL),
(7, 'Drs. Munif Shaleh, M.Ag', '2125095901', '082321927259', 8, NULL, NULL),
(8, 'Dra. Hasanah, M.Pd.I', '2127026601', '081338344308', 8, NULL, NULL),
(9, 'Shokhibul Mighfar, M.Pd.I', '2117127701', '081330958826', 8, NULL, NULL),
(10, 'Junaidi, M.Pd', '2103037902', '081336121037', 8, NULL, NULL),
(11, 'Drs. Mahmudi, M.Pd.I', '2104016801', '081233786639', 8, NULL, NULL),
(12, 'Dr. H. M. Holil, M. Pd.I', '2011108502', '082226425898', 8, NULL, NULL),
(13, 'Moh. Hafid, M.Pd.I', '2020108003', '085232921502', 8, NULL, NULL),
(14, 'H. Muhamad Abdul Manan, M.Pd.I', '2104058702', '082330201228', 8, NULL, NULL),
(15, 'Abdul Muis, M.Pd.I', '2004088701', '085748895232', 8, NULL, NULL),
(16, 'Agus Supriadi, M.Pd.I', '2004088701', '085311140791', 8, NULL, NULL),
(17, 'ST. Shofiyah,M.Pd.I', '2124069002', '085259759396', 8, NULL, NULL),
(18, 'Dr. Rif\'ah,M.Pd.I', '2119087401', '082335403564', 8, NULL, NULL),
(19, 'Muslimin,M.PdI', '0715058003', '082232603079', 8, NULL, NULL),
(20, 'H. Hasan Ruzakki,M.Pd', '0715109202', '085236123339', 8, NULL, NULL),
(21, 'Miftahul Alimin,M.Pd', '0720029203', '082333310917', 8, NULL, NULL),
(22, 'Wardani,M.Pd', '0729049303', '082333598950', 8, NULL, NULL),
(23, 'Dr. Luluk Maktumah, M.Pd.I', '2118047801', '081249971790', 8, NULL, NULL),
(24, 'Wedi Samsudi,M.PdI', '0715028404', '081234833033', 8, NULL, NULL),
(25, 'Mujtaba, S.Pd, M.S.W', NULL, '081218174437', 8, NULL, NULL),
(26, 'Moh. Nawafil, M.Pd.I', NULL, '085854816259', 8, NULL, NULL),
(27, 'Dr. Maskuri, M.Pd.I', '2108086901', '081234694000', 8, NULL, NULL),
(28, 'Dr. Khoirul Anwar, M.H.I', '2110068001', '085258329870', 8, NULL, NULL),
(29, 'Drs. Ahmadi M., M.PdI., M.HI', '2117036801', '082335314999', 8, NULL, NULL),
(30, 'Dr. H. Akhsan, M.Pd.', '2107037401', '082117746464', 8, NULL, NULL),
(31, 'Almannah Wassalwa, SS., M.Pd.I', '2114029001', '085292929855', 8, NULL, NULL),
(32, 'Amirul Mukminin, M.PdI', '2014049001', '082330644253', 8, NULL, NULL),
(33, 'Aisyatul Hanun, M.PdI.', '2011208901', '082330450746', 8, NULL, NULL),
(34, 'Shofwatul Fu\'adah,MPd', '0707109102', '085257838680', 8, NULL, NULL),
(35, 'Dr. Taufiqurrahman, M.Pd.I', '2104017901', '081221818808', 8, NULL, NULL),
(36, 'Dr. Ilzam Dhaifi, M.Pd.', '2121087902', '082331900705', 10, NULL, NULL),
(37, 'Khulusinniyah, M.Pd.I.', '2107028201', '085232651050', 10, NULL, NULL),
(38, 'Farhatin Masruroh, M.Pd.I.', '2106078302', '085228886883', 10, NULL, NULL),
(39, 'Aushafil Karimah, M.Pd.I.', '2124068101', '085292985246', 10, NULL, NULL),
(40, 'Tri Wahyu Martiningsih,M.Pd.', '0704038605', '082257814543', 10, NULL, NULL),
(41, 'Maswar, M.Pd.', '2010048901', '081249269720', 11, NULL, NULL),
(42, 'Dian Noer Asy\'ary, M.Pd', '2113039104', '085258588346', 11, NULL, NULL),
(43, 'Moh. Atikurrahman, M.Pd.', '0706078802', '081806615051', 11, NULL, NULL),
(44, 'Mohammad Tohir, M.Pd', '0710018201', '085649672572', 11, NULL, NULL),
(45, 'Saiful, M.Pd.', '0710127803', '085336180371', 11, NULL, NULL),
(46, 'Diah Ayu Rizki Pradita, M.Pd.', '0718049501', '081232658197', 11, NULL, NULL),
(47, 'Ahmad Choirul Anam, M.Pd.', '0702079402', '081934896978', 11, NULL, NULL),
(48, 'Drs. H. Subyanto, MHI.', '2112116501', '082338505627', 2, NULL, NULL),
(49, 'Dr. A. Muhyiddin Khotib, MHI.', '2106076701', '081259998294', 2, NULL, NULL),
(50, 'Imam Fawaid, MHI.', '2113037601', '085236559232', 2, NULL, NULL),
(51, 'Dr. R. Fakhrurrazi, MHI.', '2129048201', '085259412637', 2, NULL, NULL),
(52, 'Dr. Mirwan, S.Pd.I, MH.', '071219008', '085215666901', 2, NULL, NULL),
(53, 'Dr. Nahei, MHI.', '2112027001', '082334841617', 4, NULL, NULL),
(54, 'Muhammad Jufri, SH., MHI.', '2112057201', '081331396859', 4, NULL, NULL),
(55, 'Arif Hariyanto, MHI.', '2106097501', '085258821255', 4, NULL, NULL),
(56, 'Dr. Ainun Najib, MH.', '2124058001', '081234545444', 4, NULL, NULL),
(57, 'Faiz Zainuddin, MHI.', '2113058702', '082330514781', 4, NULL, NULL),
(58, 'Mawardi, SHI., MHI.', '2118058003', '085258280500', 4, NULL, NULL),
(59, 'Abd. Rahman Saleh, SH. MH.', '0702087103', '081358027441', 4, NULL, NULL),
(60, 'Ahmad Faidal, MHI.', '2102057703', '085231296268', 4, NULL, NULL),
(61, 'Dr. H. Nawawi, M.Ag.', '2108067101', '085330867176', 3, NULL, NULL),
(62, 'Syarifuddin, MHI.', '2107057801', '081358466664', 3, NULL, NULL),
(63, 'Subaidi, S.Ag., MHI.', '2127047401', '081249208894', 3, NULL, NULL),
(64, 'Mustofa, MHI.', '2112027901', '085230593129', 3, NULL, NULL),
(65, 'Makhshushi Zakiyah, SE., MHI.', '2111038301', '081231230966', 3, NULL, NULL),
(66, 'Misbahul Ali, M.E.I.', '2117107801', '085230403524', 3, NULL, NULL),
(67, 'Sukandi, MHI.', '2124087401', '082336166914', 3, NULL, NULL),
(68, 'Hali Makki, SHI., MHI.', '2004108701', '082316319982', 3, NULL, NULL),
(69, 'Nihayatut Tasliyah, MHI.', '2120028401', '082338630207', 3, NULL, NULL),
(70, 'Ummal Khoiriyah, MHI.', '2025029001', '087757576790', 3, NULL, NULL),
(71, 'Imroatus Sholiha, M.E.I.', '2105059102', '082251603342', 3, NULL, NULL),
(72, 'Zainul Anwar, S.Sy., ME.', '0701079005', '082332662772', 3, NULL, NULL),
(73, 'Asmito, S.HI., ME.', '0726098108', '082335338292', 3, NULL, NULL),
(74, 'Syamhadi, M. Kom.', '0708029303', '082312756606', 3, NULL, NULL),
(75, 'Nailul Marom, S.HI., ME.', '0722128608', '082332691515', 3, NULL, NULL),
(76, 'M. Zikwan, S.Sy., MH.', '2108098903', '082228306953', 5, NULL, NULL),
(77, 'Risma Fahrul Amin, S. PdI., M.Pd.', '2130128901', '087858498809', 5, NULL, NULL),
(78, 'Ahmadi, SE., MHI.', '2103078101', '085314678871', 5, NULL, NULL),
(79, 'Ach. Zubairi, M.Kom.', '2106129003', '085342590009', 5, NULL, NULL),
(80, 'Amir, M.Pd.I.', '2109028802', '085233060341', 5, NULL, NULL),
(81, 'Nanda Hidayan Sono, S. Kom., M.Pd., MM.', '2109049102', '082302323402', 5, NULL, NULL),
(82, 'Zainuddin, M.Pd.', '2113048703', '081913866560', 5, NULL, NULL),
(83, 'Ahmad Iqbal Fathoni, SE.Sy., MH.', '0728119205', '082234031002', 5, NULL, NULL),
(84, 'Ahmad Royhan Firdausy, S. Sy., M.Ag.', '0707089301', '081287074041', 5, NULL, NULL),
(85, 'Abd. Hafidz Ali, MM.', '0710108205', '081235508332', 5, NULL, NULL),
(86, 'Moh. Rivqi Amin, S. Kom., MM.', '0720119402', '085732803690', 5, NULL, NULL),
(87, 'Ahmad Syauqil Ulum, SE.,MM.', NULL, '083847057611', 5, NULL, NULL),
(88, 'Safarinda Imani, SE., M. SEI.', '0717089301', '08970927637', 5, NULL, NULL),
(89, 'Rizki Hidayaturrochman, S.E., MM.', '0712129502', '085236131804', 5, NULL, NULL),
(90, 'Ahmad Fawaiz, SE., MM.', '0717089402', '082232033976', 5, NULL, NULL),
(91, 'Achmad, S.Ag., M.Pd.I.', '2018057502', '085230754871', 1, NULL, NULL),
(92, 'Zainol Hasan, S.Th.I., M. Hum.', '2122028102', '082330303344', 1, NULL, NULL),
(93, 'Mohammad Fauzen Adiman, M.Kom.', '0716119204', '082264150894', 1, NULL, NULL),
(94, 'Imro\'atun Shoimah, M.Pd.I., M. Akun.', '0713029103', '082234796140', 1, NULL, NULL),
(95, 'Su\'ud Wahedi, S.Pd., M.Akun.', '0711129501', '081332065955', 1, NULL, NULL),
(96, 'Himawan Pradipta, SE., M. Akun.', '0709128203', '085204969285', 1, NULL, NULL),
(97, 'Dhofir Miftah, S.E.I., M. Akun.', '0701018608', '082234145647', 1, NULL, NULL),
(98, 'Prof. Dr. H. A. Yasid, Ma., Ll.M.', NULL, '081553120147', 2, NULL, NULL),
(99, 'Drs. H. Fathurrahman, Ms., MH., M.HES.', NULL, '082131535347', 4, NULL, NULL),
(100, 'A. Khairuddin, M.Pd.I.', '2102026801', '085204609836', 7, NULL, NULL),
(101, 'Wisri, S.Ag., M.Pd.I., M.Sos.', '2106067603', '085336080338', 7, NULL, NULL),
(102, 'Drs. Imam Syafi\'i, M.Pd.I.', '2108055601', '085338327387', 7, NULL, NULL),
(103, 'Dr. Nur Ainiyah, MA.', '2103087802', '081249208157', 7, NULL, NULL),
(104, 'Prof. Dr. Hj. Nurul Azizah, S.Ag., M.Pd.I.,MA', '2119067401', '081358175555', 7, NULL, NULL),
(105, 'Yohandi, M.Pd.I., M.Sos.', '2113018601', '082236361811', 7, NULL, NULL),
(106, 'Aminul Alimin, M.Sos.', '0708018005', '081249447661', 7, NULL, NULL),
(107, 'Dr. Wawan Juandi, M.Ag.', '2123086301', '08123459349', 6, NULL, NULL),
(108, 'Abd Mughni, M.Pd.I.', '2101015901', '082331029090', 6, NULL, NULL),
(109, 'Samsul Arifin, S.Ag., M.Pd.', '2110127201', '081336262720', 6, NULL, NULL),
(110, 'Mohamat Hadori, S.Ag. MA.', '2101017501', '082332679381', 6, NULL, NULL),
(111, 'Saifullah, S.Ag. MA.', '2107077401', '082335484065', 6, NULL, NULL),
(112, 'Hanik Mufaridah, S.Kom.I., M.Pd.', '2104028903', '082244692003', 6, NULL, NULL),
(113, 'As\'ad, S.Kom.I., M.Pd.', '2105089001', '082333882411', 6, NULL, NULL),
(114, 'M. Syakur, S.Sos.I., M.Pd.', '0723118201', '082131030947', 6, NULL, NULL),
(115, 'Ach. Firman Ilahi, M.Pd.', NULL, '085334268206', 6, NULL, NULL),
(116, 'Drs. Mohammad Isfironi, MHI.', NULL, '085257643284', 7, NULL, NULL),
(117, 'Abd. Ghofur, M.Kom.', '0711088303', '085234666909', 17, NULL, NULL),
(118, 'Ahmad Homaidi, M.Kom.', '0705078901', '085258824038', 17, NULL, NULL),
(119, 'Muhasshanah, M.Kom.', '0721058704', '087751100087', 17, NULL, NULL),
(120, 'Lukman Fakih Lidimilah, M.Kom', '0715099001', '085335121701', 17, NULL, NULL),
(121, 'Zaehol Fatah, M.Kom.', '0715057801', '085336080337', 16, NULL, NULL),
(122, 'Ahmad Lutfi, M.Kom', '0714108803', '085259759369', 16, NULL, NULL),
(123, 'Ahmad Baijuri, M.Kom.', '0715078902', '085234551166', 16, NULL, NULL),
(124, 'Fajriyanto, M.Kom.', '0717089104', '082223291061', 16, NULL, NULL),
(125, 'Muhammad Ali Ridla, M.Kom.', '0728089102', '081353669222', 16, NULL, NULL),
(126, 'Hermanto, M.Kom', '0708087807', '085746864648', 15, NULL, NULL),
(127, 'Sunardi, S.Si., M.Kom.', '0722038603', '085337745637', 15, NULL, NULL),
(128, 'Akhlis Munazilin, S.Kom., M.T.', '0712098601', '082139643838', 15, NULL, NULL),
(129, 'Jarot Dwi Prasetyo, M.T.', '0717077904', '082132341946', 15, NULL, NULL),
(130, 'Hari Santoso, M.T.', '0704018808', '085233334691', 15, NULL, NULL),
(131, 'Nur Azise, M.Kom.', '0730108802', '082300010119', 16, NULL, NULL),
(132, 'Firman Santoso, M.Kom.', '0722129201', '082331214399', 15, NULL, NULL),
(133, 'Irma Yunita, M.Kom.', '0719118404', '082119996519', 17, NULL, NULL),
(134, 'Lovi Sandra, M.Sc', '0722058401', '085285444285', 14, NULL, NULL),
(135, 'Dr. T. Ramli, S.Pi., M.P', '0724078002', '081335429330', 14, NULL, NULL),
(136, 'Dr. Ir. Abdul Muqsith, M. Ling .', '0713076902', '082244712498', 13, NULL, NULL),
(137, 'Dr. Ach. Khumaidi, M.P.', '0722049001', '085232193563', 13, NULL, NULL),
(138, 'Dr. Moh. Awaludin Adam, M.P.', '0730068701', '087865867060', 13, NULL, NULL),
(139, 'Dimas Galang Prakosa, M.P.', '0731109002', '081573888991', 13, NULL, NULL),
(140, 'Dr. Ir. Musyaffa Rafiqie, M.Si', '0006006401', '081351955803', 13, NULL, NULL),
(141, 'Abdul Wafi, S.Pi., M.P,', '0705049103', '082301583122', 13, NULL, NULL),
(142, 'Ulfatul Mardiyah, S.Si., M.P', '0711069004', '082244440514', 14, NULL, NULL),
(143, 'Siti Nur Aisyah Jamil, M.P', '0717119005', '085230713369', 14, NULL, NULL),
(144, 'Rahwan, M.Pd.I', '0705066704', '085236596939', 14, NULL, NULL),
(145, 'Mohammad Fadlil Adhim, M.T', '0729059202', '081914721510', 12, NULL, NULL),
(146, 'M. Ainur Ridlo, M. Si.', '0707049204', '082337957972', 12, NULL, NULL),
(147, 'Syamsun Ramli, M.T', '0729077804', '082333759759', 12, NULL, NULL),
(148, 'Muhammad Ihwan, M.HI', '0714098205', '082300011145', 17, NULL, NULL),
(149, 'Yona Wahyu Lolita, M.Si', '0711097803', '082334709378', 17, NULL, NULL),
(150, 'Farihin Lazim, M.Tr.T', '0711099201', '085257227194', 15, NULL, NULL),
(151, 'Helyatin Nisyak, M.Kom.', '0726029402', '082324830002', 17, NULL, NULL),
(152, 'Nadzirotul Fithriyah, M.Kom', '0726049403', '082310682644', 17, NULL, NULL),
(153, 'Abdus Samad, M.Kom.', '0709099006', '082333859485', 17, NULL, NULL),
(154, 'Syarif Aminul Khoiri, M.Kom.', '0725089501', '081249057246', 17, NULL, NULL),
(155, 'A. Hamdani, M.Kom', '0730068804', '085384101631', 17, NULL, NULL),
(156, 'Moh. Afifuddin, M.Pd.', '0724069204', '085232802343', 12, NULL, NULL),
(157, 'Adi Susanto, M. Kom.', '0708079104', '085230754175', 17, NULL, NULL),
(158, 'Selvia Noer Agustin, S.Ars', NULL, '082139419743', 12, NULL, NULL),
(159, 'Kotot Sutjahjo, S.Pd.', NULL, '085117110591', 12, NULL, NULL),
(160, 'Muh. Ali Syahbana, M. Si.', NULL, '081337246059', 12, NULL, NULL),
(161, 'Zeinul Arifin, S.Kom', NULL, '085939393844', 17, NULL, NULL),
(162, 'Sofa Izzad Kholilurrohman, S.Ds.', NULL, '081226626103', 12, NULL, NULL),
(163, 'Muhammad Fawaid, S.Kom', NULL, '085222300387', 15, NULL, NULL),
(164, 'Taufik Hidayat, S.T.', NULL, '085236998871', 12, NULL, NULL),
(165, 'Rahmawaty Hasan, S.Farm.,M.Farm', '0714049501', '085399955257', 23, NULL, NULL),
(166, 'Ana Maria Ulfa,S.Farm.M.Farm', '0706109601', '085648916998', 23, NULL, NULL),
(167, 'apt. Burhanudin Gasim Soka, S. Farm., M. Farm.', '0606029302', '082225616164', 23, NULL, NULL),
(168, 'Rini Junaidah,S.HI, M.H.', '0710107904', '081336201717', 23, NULL, NULL),
(169, 'apt. Fauzi Rahman, S.Farm.,M.Farm', '0727039201', '082297017827', 23, NULL, NULL),
(170, 'Udrika Lailatul Qodri, S.Si.,M.Si.', '0714109203', '082233847861', 23, NULL, NULL),
(171, 'Dr. Dewi Ratih Tirto Sari, S.Si.,M.Si', '0727049401', '085955183647', 23, NULL, NULL),
(172, 'Bdn. Dewi Andariya Ningsih, S.ST., M.Keb', '0705048906', '081330166123', 22, NULL, NULL),
(173, 'Bdn. Neny Yuli Susanti, S.ST., M.Keb', '0703078705', '082237810501', 22, NULL, NULL),
(174, 'Astik Umiyah, S.ST.,M.Kes', '0714048602', '081231295274', 22, NULL, NULL),
(175, 'Bdn. Lia Fitria, S.ST., M.Keb', '0731058602', '085236348619', 22, NULL, NULL),
(176, 'Hayatul Rahimah, S.ST., M.Keb', '0720018805', '085258824781', 22, NULL, NULL),
(177, 'Fauzah Cholashotul I\'anah, S.ST, M.Keb', '0725099004', '085258824039', 22, NULL, NULL),
(178, 'Ifa Nurhasanah, S.Tr. Keb., M. Kes', '0710029201', '085335724774', 22, NULL, NULL),
(179, 'Bdn. Lea Ingne Reffita, S.ST.Keb.,M.Kes ', '0701079202', '082233639229', 22, NULL, NULL),
(180, 'Eliyawati, S.ST.,M.Kes', '0712048804', '082118629622', 22, NULL, NULL),
(181, 'Dr. Azizatul Hamidiyah, S.KM.,M.Kes', '0722049101', '081217889937', 22, NULL, NULL),
(182, 'Roni Yanto, M.Acc', '0704088903', '081331810923', 18, NULL, NULL),
(183, 'Ach. Zukin, M. Pd. I', '0713028803', '085258823826', 18, NULL, NULL),
(184, 'Abd. Mujib, M.Akun.', '0714048603', '085230699285', 18, NULL, NULL),
(185, 'Luckman ashary, SE.,MM.', '0716108102', '085350349999', 18, NULL, NULL),
(186, 'Ahmad Yunus, MH.', '0721029301', '085210273968', 19, NULL, NULL),
(187, 'Dairani, SH., MH.', '0716069202', '082330439826', 19, NULL, NULL),
(188, 'Fathorrahman, S.H., MH', '0712038903', '082139428406', 19, NULL, NULL),
(189, 'Dr. Syahrul Ibad, S.IP., M.AP.', '0709098503', '085235585360', 19, NULL, NULL),
(190, 'Fathol Bari, SH., MH', '0726077902', '081334734914', 19, NULL, NULL),
(191, 'Teguh Wicaksono, SH., M.Kn', '0722028204', '081234639208', 19, NULL, NULL),
(192, 'Albadri, M. Pd.', '0708068908', '081331514515', 21, NULL, NULL),
(193, 'Dwi Nur Hadiyansyah, M. Pd.', '0731089101', '085101930848', 21, NULL, NULL),
(194, 'Mislawi yadi, M. Pd.', '0725038903', '087783168205', 21, NULL, NULL),
(195, 'Annisa Kurnia Asri, M. Pd.', '0717129004', '082190007545', 21, NULL, NULL),
(196, 'Muzdhalifa, M. Pd.', '0703068802', '085257353596', 21, NULL, NULL),
(197, 'Yulia Tutik Nurfia, M.Pd.', '0707078807', '082302001988', 21, NULL, NULL),
(198, 'M. Hilmy Hidayatullah, S.Pd.I., M. Pd.', '0707039003', '087857933123', 21, NULL, NULL),
(199, 'Afif Sabil, M. Pd.', '859404793', '085940479317', 21, NULL, NULL),
(200, 'Nuril Firdaus, M.Pd.', '0714039404', '087859448004', 21, NULL, NULL),
(201, 'Rizki Maulana Hidayatullah, M.Psi., Psikolog', '0717099103', '082234255422', 20, NULL, NULL),
(202, 'Suyanti, M.Psi', '0703096601', '081358676541', 20, NULL, NULL),
(203, 'Finanin Nur Indana, S. Psi., M. Psi', '0711069202', '085704345794', 20, NULL, NULL),
(204, 'Nur Hasan M.A.,', '2015028102', '081333341767', 20, NULL, NULL),
(205, 'Dimas Agil Permadi, M.Psi. Psikolog', '0704109102', '082139135832', 20, NULL, NULL),
(206, 'Aisyatin Kamila, MA.', '0727029501', '085222063020', 20, NULL, NULL),
(207, 'Fauzul Adim Ubaidillah, M.Psi', '0709059206', '081222111360', 20, NULL, NULL),
(208, 'KH. Ach. Fadlail, SH. MH.', '2102057703', NULL, 4, NULL, NULL),
(209, 'KHR. Ach. Azaim Ibrahimy, MH.', '0725018002', NULL, 4, NULL, NULL),
(210, 'Dr. (HC). KH. M. Khafifuddin, M.Ag.', '2120055001', NULL, 4, NULL, NULL),
(211, 'Hj. Ukhtul Iffah, S.S, M.Pd', '2110068001', NULL, 8, NULL, NULL),
(212, 'Hj. Djuwairiyah, S.Ag, M.Pd.I, Ph.D', '2113037101', NULL, 8, NULL, NULL),
(213, 'H. Mohamad Aso Samsuddin, M.Pd.I', '2120037301', NULL, 8, NULL, NULL),
(214, 'Prof. Dr. H. Mokhammad Baharun, M.Ag.', '2121105401', NULL, 7, NULL, NULL),
(215, 'Kamil Agung Muslimin, M.T', '0709048806', '', 12, NULL, NULL),
(216, 'Hendrarto Widodo., S.E.,  M.Ak.', '0710047801', '081249318679', 18, NULL, NULL),
(217, 'Nanang Asfufi, M. Ak.', '0722128802', '081919630533', 18, NULL, NULL),
(218, 'Yulius Efendi, SH., M.Kn', '07109077903', '085203330005', 19, NULL, NULL),
(219, 'Moh. Ali Hofi, MH.', '0723079103', '085234111222', 19, NULL, NULL),
(220, 'Sirrul Bari, M. Pd.', '0721039204', '082216353989', 21, NULL, NULL),
(221, 'Imamatin Listya Putri, SE., M. Akun.', '0724058904', '082132299500', 1, NULL, NULL),
(222, 'Ahmad Hamdi, S.PdI, MHI.', '2126037802', '085359597088', 3, NULL, NULL),
(223, 'H. Muh. Hamdi Zain, S.Sos., S.Pd., M.AP.', NULL, '', 3, NULL, NULL),
(224, 'Zainur Rafik, S.HI., ME.', '0710038606', '085334993686', 3, NULL, NULL),
(225, 'Ahmad Basri Saifur Rahman, MHI.', NULL, '', 2, NULL, NULL),
(226, 'H. Abd. Rahman, SH., MH.', '0709077301', '', 2, NULL, NULL),
(227, 'H. Syarifuddin, MHI.', '0714098803', '082336866372', 2, NULL, NULL),
(228, 'Heriyanto, SH., MH.', '2128088701', '085218225005', 2, NULL, NULL),
(229, 'H. Ach. Cholily Setyabudi, SH. MH.', NULL, '', 4, NULL, NULL),
(230, 'Drs. H. Nur Chozin, SH., MH.', NULL, '', 4, NULL, NULL),
(231, 'H. Zainuddin, MHI.', NULL, '', 4, NULL, NULL),
(232, 'Ahmad Muzayyin, S.Sy., MH.', '0701089004', '082132293905', 4, NULL, NULL),
(233, 'Misba Huddin, MHI.', '2112048701', '082234674952', 5, NULL, NULL),
(234, 'Drs. M.Khairuddin, MM., Awp.', NULL, '', 5, NULL, NULL),
(235, 'Daryoto Mulyadi Candra, ST., MM.', '0714028203', '082148868608', 5, NULL, NULL),
(236, 'Alif Akbarul Muslim, MM.', '0729069201', '082234512046', 5, NULL, NULL),
(237, 'Agung Budi Wicaksono, S. Farm., Apt.', NULL, '', 23, NULL, NULL),
(238, 'drh. Wuryanti Handayani, M.Si', NULL, '', 22, NULL, NULL),
(239, 'Dwi Dasa Suryantoro,S.H., M.H', NULL, '', 22, NULL, NULL),
(240, 'Edy Supriyono, M.Sos.', '0701018105', '', 7, NULL, NULL),
(241, 'Dra. Kustutik, M.Pd.I', '2116062601', '', 8, NULL, NULL),
(242, 'Dr. Muhammad Kholison, M.Pd.I', '2110028203', '', 9, NULL, NULL),
(243, 'Maulidi, MA., MH.', NULL, '', 11, NULL, NULL),
(244, 'Dr. Sawiya, M.P', '0704028902', '081216037088', 14, NULL, NULL),
(245, 'Ismi Jazila, S.P., M.Si', '0705038303', '081334586060', 14, NULL, NULL),
(246, 'Ika Junia Ningsih, S.Pt., M.Ling', '0705118101', '085203386586', 14, NULL, NULL),
(247, 'Nadrotin Mawaddah, S.Pd, M.Pd.', '0713078802', '', 17, NULL, NULL),
(248, 'Dr. Moh. Asra, M.E.I', '2110056401', NULL, 2, NULL, NULL),
(249, 'Moch. Nuril Anwar', NULL, '081883412852', 7, NULL, NULL),
(250, 'Setyawardhana Nugraha, S.E, M.Akun', NULL, NULL, 18, NULL, NULL),
(251, 'Dr. KH. Muhammad Kholil, M.Pd.', NULL, '082226425898', 8, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fakultas`
--

CREATE TABLE `fakultas` (
  `id` bigint UNSIGNED NOT NULL,
  `fakultas` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dekan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fakultas`
--

INSERT INTO `fakultas` (`id`, `fakultas`, `dekan`, `created_at`, `updated_at`) VALUES
(1, 'Syariah dan Ekonomi Islam', '-', '2026-04-06 23:17:21', '2026-04-06 23:17:21'),
(2, 'Dakwah dan Ushuluddin', '-', '2026-04-06 23:17:31', '2026-04-14 14:03:55'),
(3, 'Tarbiyah', '-', '2026-04-06 23:17:39', '2026-04-06 23:17:39'),
(4, 'Sains dan Teknologi', '-', '2026-04-06 23:17:48', '2026-04-06 23:17:48'),
(5, 'Sosial dan Humaniora', '-', '2026-04-06 23:17:55', '2026-04-06 23:17:55'),
(6, 'Ilmu Kesehatan', '-', '2026-04-06 23:18:04', '2026-04-06 23:18:04');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswas`
--

CREATE TABLE `mahasiswas` (
  `id` bigint UNSIGNED NOT NULL,
  `lulusan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nim` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prodi_id` bigint UNSIGNED NOT NULL,
  `kecamatan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kabupaten` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provinsi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tugas_akhir` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verifikasi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mahasiswas`
--

INSERT INTO `mahasiswas` (`id`, `lulusan`, `nim`, `nama`, `jk`, `prodi_id`, `kecamatan`, `kabupaten`, `provinsi`, `tugas_akhir`, `verifikasi`, `created_at`, `updated_at`) VALUES
(1, '2024', '2020302014', 'Maulana Muhammad Muhyi Gebriel Haekal My Putra', '-', 9, 'Banyuputih', 'Situbondo', 'Jawa Timur', 'Pembuatan Modul ajar Ilmu Bayan pada Pembelajaran Ilmu Balaghah Di Marhala Wustho Lembaga Pengembangan Bahasa Arab (LPBA) Pondok Pesantren Salafiyah Syafi\'iyah Sukorejo Situbondo', 'Terverifikasi', NULL, '2026-04-07 08:42:11'),
(2, '2024', '2020401017', 'Anis Makiah', '-', 6, 'Rajeg', 'Tangerang', 'Banten', 'Nilai-nilai Konseling Perkawinan Dalam Novel Hati Suhita Karya Khilma Anis', '', NULL, NULL),
(3, '2024', '2019401015', 'Citra Sukmawati', '-', 6, 'Ijen', 'Bondowoso', 'Jawa Timur', 'Upaya Orang Tua Dalam Mengurangi Ketergantungan Tiktok Pada Anak Usia Dini Di Desa Ijen Kabupaten Bondowoso', '', NULL, NULL),
(4, '2024', '2020401018', 'Della Ayu Febiolia', '-', 6, 'Bangurejo', 'Banyuwangi', 'Jawa Timur', 'Nilai - Nilai Konseling Pranikah Pada Budaya Gredoan Suku Osing Di Macan Putih Kabupaten Banyuwangi', '', NULL, NULL),
(5, '2024', '2020401019', 'Dewi Aisyah', '-', 6, 'Pakong', 'Pamekasan', 'Jawa Timur', 'Peer Religius Guidance Antar Warga Binaan Dalam Meingkatkan Kesadaran Beribadah Dilembaga Pemasyarakatan Kelas IIA Banyuwangi', '', NULL, NULL),
(6, '2024', '2020401020', 'Faikotul Himmah', '-', 6, 'Cermee', 'Bondowoso', 'Jawa Timur', 'Bimbingan Keluarga Maslahah Sebagai Upaya Preventif Pernikahan Dini Di Kua Kecamatan Prajekan Kabupaten Bondowoso', '', NULL, NULL),
(7, '2024', '2020401021', 'Farida', '-', 6, 'Arjasa', 'Sumenep', 'Jawa Timur', 'Penerapan Tehnik REBT Dalam Mengatasi Kenakalan Remaja Santri Dipondok Pesantren Al Hidayah Arjasa Kangean Sumenep', '', NULL, NULL),
(8, '2024', '2020401007', 'Fathurrohman', '-', 6, 'Kabat', 'Banyuwangi', 'Jawa Timur', 'Peran Penyuluh Agama dalam Menjaga Kualitas Perilaku Moderasi Beragama di Kec. Rogojampi Kab. Banyuwangi', '', NULL, NULL),
(9, '2024', '2020401023', 'Lutfiana Auliya Nur Rohmah', '-', 6, 'Sumber Anyar', 'Situbondo', 'Jawa Timur', 'Bimbingan Pranikah Dalam Mewujudkan Keluarga Harmonis Di Kua Kecamatan Mlandingan Kabupaten Situbondo', '', NULL, NULL),
(10, '2024', '2020401024', 'Lutfiyah Hanim', '-', 6, 'Kalipuro', 'Banyuwangi', 'Jawa Timur', 'Konseling Behavioral dengan Teknik Reward dalam Meningkatkan Motivasi Belajar Santri Asrama Al-Khuzaimah', '', NULL, NULL),
(11, '2024', '2020401025', 'Nasyiatul Mauludah', '-', 6, 'Pujer ', 'Jember', 'Jawa Timur', 'Layanan Peer counseling dalam meningkatkan Penyesuaian diri Siswa SMP II Ma\'arif Bangsalsari Jember ', '', NULL, NULL),
(12, '2024', '2020401027', 'Nur Hamidah', '-', 6, 'Banyuputih', 'Situbondo', 'Jawa Timur', 'Riyadhah Dzikir Basmalah Sebagai Media Konseling Islam Dalam Acara Istighastah Jum\'at Manis Di Masjid Jamik Ibrahimy Pondok Pesantren Salafiyah Syafi\'iyah Sukorejo  Situbondo', '', NULL, NULL),
(13, '2024', '2020401028', 'Putri Intan Sariningsih', '-', 6, 'Kalipuro', 'Banyuwangi', 'Jawa Timur', 'Teknik Self Management Pada Pecandu Narkoba Melalui Konseling kelompok di Lembaga Pemasyarakatan Kelas IIA Banyuwangi(1)', '', NULL, NULL),
(14, '2024', '2020401029', 'Siti Aisah', '-', 6, 'Rogojampi', 'Banyuwangi', 'Jawa Timur', 'Implementasi Pola Asuh Demokratis Orang Tua Pada Siswa di MTsN 10 Banyuwangi', '', NULL, NULL),
(15, '2024', '2020401030', 'Siti Rukaiyah', '-', 6, 'Kopang', 'Lombok Tengah', 'NTB', 'Terapi Sholat Taqwiyatul Hifdzi Dalam Menanggulangi Kecemasan Menghafal Al-Qur\'an Asrama Tahfidzul Qur\'an Puteri Pondok Pesantren Salafiyah Syafi\'iyah Sukorejo', 'Terverifikasi', NULL, NULL),
(16, '2024', '2020401031', 'Sitti Hosnol Khotimah', '-', 6, 'Botolinggo', 'Bondowoso', 'Jawa Timur', 'Studi Kasus Tingginya Angka Pernikahan Dini Di Kecamatan Botolinggo Kabupaten Bondowoso', '', NULL, NULL),
(17, '2024', '2020401032', 'Sri Ningsih', '-', 6, 'Ra\'as', 'Sumenep', 'Jawa Timur', 'Upaya Guru Bimbingan Dan Konseling Dalam Melakukan Tindakan Preventif Perilaku Membolos Siswa Mts Nurul Iman Kecamatan Ra\'as Kebupaten Sumenep', '', NULL, NULL),
(18, '2024', '2020401014', 'Subhan', '-', 6, 'Sapeken', 'Sumenep', 'Jawa Timur', 'Layanan Bimbingan Kelompok pada Santri Baru dalam Proses Penyesuaian Diri Di Pondok Pesantren Salafiyah Syafi\'iyah Sukorejo', '', NULL, NULL),
(19, '2024', '2020401033', 'Tasya Dea Ananda Safitri', '-', 6, 'Banyuwangi', 'Banyuwangi', 'Jawa Timur', 'Coping Strategi Pada Santri Eks-Santri Binaan Di Pondok Pesantren Salafiyah Syafi\'iyah Sukorejo', '', NULL, NULL),
(20, '2024', '2020401015', 'Thariq Abdul Aziz', '-', 6, 'Bangsalsari', 'Jember', 'Jawa Timur', '\"Bimbingan Perkawinan Bagi Calon Pengantin untuk Mewujudkan Keluarga Sejahtera di Kantor Urusan Agama Kecamatan Bangsalsari Kabupaten Jember', 'Terverifikasi', NULL, NULL),
(21, '2024', '2019201012', 'Zainudin Ahmad', '-', 6, '-', 'Bekasi', 'Jawa Barat', 'Peran Konselor Islam Dalam Mencegah Perilaku Bullying Di Pondok Pesantren Salafiyah Syafi’iyah Sukorejo', '', NULL, NULL),
(22, '2024', '2020402041', 'Afrida Fitriani', '-', 7, 'Cilincing', 'Jakarta Utara', 'DKI Jakarta', 'Metode Dakwah Majelis Gubah Al-Haddad Pada Masyarakat Tanjung Priok Jakarta Utara', '', NULL, NULL),
(23, '2024', '2019402025', 'Ahmad Habibi', '-', 7, 'Koja', 'Jakarta Utara', 'DKI Jakarta', 'Slogan Mondhuk Entar Ngabdhi Ben Ngajhi Pondok Pesantren Salafiyah Syafi\'iyah Sukorejo Situbondo', 'Terverifikasi', NULL, NULL),
(24, '2024', '2020402014', 'Ansorik', '-', 7, 'Glagah', 'Banyuwangi', 'Jawa Timur', 'Makna Komunikasi Simbolik dalam Tradisi Mepe Kasur di Desa Kemiren Kecamatan Glagah Kabupaten Banyuwangi', 'Terverifikasi', NULL, NULL),
(25, '2024', '2020402026', 'Ayu Lestari', '-', 7, 'Wanasaba', 'Lombok Timur', 'NTB', 'Komunikasi Budaya Pada Tradisi Bau Nyale di Pulau Lombok', '', NULL, NULL),
(26, '2024', '2020402034', 'Baiq. Quratul Aini', '-', 7, 'Praya', 'Lombok Tengah', 'Jawa Timur', 'Makna Simbolik Tradisi Sorong Serah Aji Krame Desa Mertak Tombok Kecamatan Praya', '', NULL, NULL),
(27, '2024', '2020402033', 'Camelia Putri Amalia', '-', 7, 'Leces', 'Probolinggo', 'jawa Timur', 'Makna Pesan Dakwah Syarifah Halimah Alaydrus Melalui Media Sosial Instagram @halimahalaydrus', '', NULL, NULL),
(28, '2024', '2020402010', 'Handry Hamzan Wadi', '-', 7, 'Jonggat', 'Lombok Tengah', 'Nusa Tenggara Barat', 'Pola Komunikasi Tradisi Bejango di Dusun Beber Desa Pengenjek Kecamatan Jonggat Lombok Tengah', '', NULL, NULL),
(29, '2024', '2020402029', 'Holis Santi', '-', 7, 'Badung', 'Badung', 'Bali', 'Pesan Dakwah Aa Gym Pada Program Lentera Hati Radio VIS FM 101.5 Banyuwangi', '', NULL, NULL),
(30, '2024', '2020402027', 'Indah Rahmadhani', '-', 7, 'Kalisat', 'Jember', 'Jawa Timur', 'Strategi Dakwah Kyai Yazid Karimullah', '', NULL, NULL),
(31, '2024', '2020402037', 'Isetulaini', '-', 7, 'Mayang', 'Jember', 'Jawa Timur', 'Komunikasi Interpersonal Santri Pondok Pesantren Salafiyah Syafi\'iyah Sukorejo Situbondo', '', NULL, NULL),
(32, '2024', '2020402017', 'Juandi', '-', 7, 'Tebo Ilir', 'Tebo', 'Jambi', 'Dampak Smartphone pada Komunikasi Sosial Anak di Desa Betung Bedarah Barat Kecamatan Tebo Ilir Kabupaten Tebo ', '', NULL, NULL),
(33, '2024', '2020402032', 'Khurrin Nabila', '-', 7, 'Puger', 'Jember', 'Jawa Timur', 'Pola Komunikasi Interpersonal Kyai Dengan Santri Tahfidzul Qur\'an Dipondok Pesantren Al Haromain Jember', '', NULL, NULL),
(34, '2024', '2020402004', 'Lalu Hamzah Haz', '-', 7, 'Kopang', 'Lombok Tengah', 'Nusa Tenggara Barat', 'Komunikasi Budaya pada Tradisi Merarik di Desa Monggas Kecamatan Kopang Kabupaten Lombok Tengah', '', NULL, NULL),
(35, '2024', '2020402035', 'Maulidatul Hasanah', '-', 7, 'Palengaan', 'Pamekasan', 'Jawa Timur', 'Eksplorasi Pesan Pesan Dakwah Dalam Lirik Lagu Murobbi Gambus Revolusioner Al-Badar  ', '', NULL, NULL),
(36, '2024', '2020402001', 'Muhamad Haeril Ansori', '-', 7, 'Pekat', 'Dompu', 'Nusa Tenggara Barat', '\"Komunikasi Simbolik pada Tradisi Sembur Uthik-uthik Maulid Nabi di Banyuwangi', 'Terverifikasi', NULL, NULL),
(37, '2024', '2020402005', 'Muhamad Rodinul Hasmuni', '-', 7, 'Praya Tengah', 'Lombok Tengah', 'Nusa Tenggara Barat', 'Nilai - nilai Komunikasi Islam Dalam Al-Qur\'an Surah As-Shaffat/37 : 102', 'Terverifikasi', NULL, NULL),
(38, '2024', '2020402043', 'Muhamad Tarpi', '-', 7, 'Praya Barat', 'Lombok Tengah', 'Nusa Tenggara Barat', 'Pesan Dakwah dalam Channel Youtube Syiar NTB', 'Terverifikasi', NULL, NULL),
(39, '2024', '2020402018', 'Nailul Unais ', '-', 7, 'Ra\'as', 'Sumenep', 'Jawa Timur', 'Dakwah Kiai di Tengah Radikalisme', '', NULL, NULL),
(40, '2024', '2020402042', 'Nia Rahmi', '-', 7, 'Pujut', 'Lombok Tengah', 'NTB', 'Makna Komunikasi Interaksi Simbolik Pada Budaya  Sasak Di Desa Kawo', '', NULL, NULL),
(41, '2024', '2020402036', 'Rohmatul Hani', '-', 7, 'Tanah Merah', 'Bangkalan', 'Jawa Timur', 'Manajemen Radio Sritanjung FM Banyuwangi Sebagai Media Dakwah', '', NULL, NULL),
(42, '2024', '2020402028', 'Soliha Rohman', '-', 7, 'Banyuputih', 'Situbondo', 'Jawa Timur', 'Analisis Naratif Pada Pengajian Tafsir Jalalain Oleh KHR. Ach. Azaim Ibrahimy Di Chanel Youtube S3TV', '', NULL, NULL),
(43, '2024', '2020703011', 'Amelia Putri Widya Dhari Rizqullah', '-', 18, 'Asembagus', 'Situbondo', 'Jawa Timur', 'Analisis Sistem Informasi S1 – Akuntansi Persediaan Dalam Pengendalian Internal Digudang Pabrik Gula Asembagus', '', NULL, NULL),
(44, '2024', '2020703012', 'Aminatun Nur Sholeha', '-', 18, 'Wuluhan', 'Jember', 'Jawa Timur', 'Analisis Perhitungan Harga Pokok Produksi Dengan Metode Full Kosting Sebagai Dasar Penentuan Harga Jual (Studi Kasus UD Barokah Jember)', '', NULL, NULL),
(45, '2024', '2020703014', 'Ananda Firdausiyah', '-', 18, 'Jangkar', 'Situbondo', 'JAwa Timur', 'Analisis Penerapan S1 – Akuntansi Lingkungan Pada Pengelolaan Limbah Di Pabrik Gula Assembagoes Situbondo', '', NULL, NULL),
(46, '2024', '2020703018', 'Elsya Safitri', '-', 18, 'Delta Pawan', 'Ketapang', 'Kalimantan Barat', 'Analisis Kinerja Keuangan Unit Usaha Laundry Asrama Ma\'had Aly Putri Saat Pandemi Dan Sesudah Pandemi Covid-19', '', NULL, NULL),
(47, '2024', '2020703019', 'Hafifatul Hosniyah', '-', 18, 'Tlogosari', 'Bondowoso', 'Jawa Timur', 'Pengaruh Literasi Keuangan dan Pengetahuan Investasi terhadap Keputusan Investasi masyarakat Jebung Lor dengan Weton sebagai variabel moderasi', '', NULL, NULL),
(48, '2024', '2020703020', 'Hafifatul Nur Hayati', '-', 18, 'Songgon', 'Banyuwangi', 'Jawa Timur', 'Pengaruh Penerapan Sistem Informasi S1 – Akuntansi Dan Transparansi Laporan Keuangan Terhadap Kualitas Pelayanan Pasien Badan Penyelenggara Jaminan Sosial (BPJS) Di  Rumah Sakit Islam Fatimah Banyuwangi', '', NULL, NULL),
(49, '2024', '2020703021', 'Helma Jakiro', '-', 18, 'Bebandem', 'Karangasem', 'Bali', 'Analisis Cost And Benefit Dalam Penerapan Laporan Keuangan Berdasarkan Sak-Emkm Di Toko Cemerlang Karangasem Bali', '', NULL, NULL),
(50, '2024', '2020703022', 'Lailatul Holifah', '-', 18, 'Bondowoso', 'Bondowoso', 'Jawa Timur', 'E Analisis Implementasi Good Corporate Governance di Bank BPR Jatim Bank UMKM Jawa Timur Cabang Bondowoso', '', NULL, NULL),
(51, '2024', '2020703023', 'Lailatus Sa\'idah', '-', 18, 'Mangaran', 'Situbondo', 'Jawa Timur', 'Analisis Metode Penetapan Harga Jual Dengan Menggunakan Metode Cost Plus Princing (Studi Kasus UMKM UD Sumber Rizki Kecamatan Panarukan Kabupaten Situbondo)', '', NULL, NULL),
(52, '2024', '2020703025', 'Lu\'lu\'ul Mukarramah We', '-', 18, 'Gapura', 'Sumenep', 'Jawa Timur', 'Analisis Penerapan Aplikasi Sistem Keuangan Desa (Siskeudes) Dalam Pengelolaan Keuangan Desa Di Desa Grujugan Kecamatan Gapura Kabupaten Sumenep', '', NULL, NULL),
(53, '2024', '2020703026', 'Lutfiyah', '-', 18, 'Ra\'as', 'Sumenep', 'Jawa Timur', 'Penentuan Harga Jual Berdasarkan Metode Cost Plus Pricing di toko Lutfiyah Jaya dan di toko Kak Ros Badung Bali', '', NULL, NULL),
(54, '2024', '2020703029', 'Nindiya Ayu Safitri', '-', 18, 'Denpasar', 'Denpasar Barat', 'Bali', 'Analisis Perhitungan Harga Pokok Produksi Dengan Metode Job Order Costing Di Pt. Bel Nin Sejahtera Jaya Badung Bali', '', NULL, NULL),
(55, '2024', '2020703030', 'Novia Safitri', '-', 18, 'Jembrana', 'Jembrana', 'Bali', 'Implementasi Laporan Keuangan Berdasarkan Standar S1 – Akuntansi Keuangan Entitas Mikro Kecil Dan Menengah Pada Laporan Keuangan Usaha Mikro Kecil Dan Menengah (Studi Kasus Kedai Bakso Larosa Air Kuning Jembrana Bali)', '', NULL, NULL),
(56, '2024', '2020703032', 'Nur Hafida', '-', 18, 'Bungatan', 'Situbondo', 'Jawa Timur', 'Pemanfaatan Laba dan Arus Kas dalam Memprediksi Kondisi Financial Distress', '', NULL, NULL),
(57, '2024', '2020703033', 'Nur Qomariyah', '-', 18, 'Ra\'as', 'Sumenep', 'Jawa Timur', 'Analisis Sistem Pengendalian Internal pada Pengelolaan Dana Badan Usaha Milik Desa (BUMDES) Desa Jungkat Kecamatan Ra\'as Kabupaten Sumenep', '', NULL, NULL),
(58, '2024', '2020703035', 'Nurul Zayniyny', '-', 18, 'Wongsorejo', 'Banyuwangi', 'Jawa Timur', 'Analisis Pengelolaan Keuangan Di Rth Sumberkencono Kecamatan Wongsorejo Kabupaten Banyuwangi', '', NULL, NULL),
(59, '2024', '2020703036', 'Rhodiatul Rahmatillah', '-', 18, 'Asembagus', 'Situbondo', 'Jawa Timur', 'Harga Pokok Produksi Dengan Metode JOb Order Costing Di Meubel UD Syafiq Jaya Mojosari Asembagus Situbondo', '', NULL, NULL),
(60, '2024', '2020703037', 'Riska Firdayani Mujayyina', '-', 18, 'Giri', 'Banyuwangi', 'Jawa Timur', 'Analisis Perbedaan Omset Antara Hari Biasa Dan Hari Libur Pada Wisata Grand Watu Dodol (Gwd) Kabupaten Banyuwangi', '', NULL, NULL),
(61, '2024', '2020703041', 'Tantri Fitriyani', '-', 18, 'Rambipuji', 'Jember', 'Jawa Timur', 'Analisis Sistem S1 – Akuntansi Penggajian Terhadap Pengendalian Internal Pada Nor Coffee Indonesia Di Jember', '', NULL, NULL),
(62, '2024', '2020703042', 'Umi Nurul Latifah', '-', 18, 'Genteng', 'Banyuwangi', 'Jawa Timur', 'Analisis Strategi Pengelolaan Aset Desa Dan Kinerja Keuangan Pemerintah Desa Genteng Kulon Kecamatan Genteng Kabupaten Banyuwangi', '', NULL, NULL),
(63, '2024', '2020703043', 'Unika Nafta Safira', '-', 18, 'Bungatan', 'Situbondo', 'Jawa Timur', 'Analisis Penerapan Sistem Informasi S1 – Akuntansi Dalam Meningkatkan Kualitas Laporan Keuangan Di Kspp Syariah Bmt Nu Jawa Timur Cabang Bungatan Situbondo', '', NULL, NULL),
(64, '2024', '2020703044', 'Yesi Dwi Safitri', '-', 18, 'Arjasa', 'Situbondo', 'Jawa timur', 'Analisis Partisipasi Masyarakat Dalam Penyusunan Anggaran Pendapatan dan Belanja Desa Di Desa Ketowan Kacamatan Arjasa Kabupaten Situbondo', '', NULL, NULL),
(65, '2024', '2020703010', 'Yusril Mahendra', '-', 18, 'Terara', 'Lombok TImue', 'NTB', 'Analisis Penerapan S1 – Akuntansi Berdasarkan SAK-EMKM Pada UMKM Cv. Putri Khanza di Kecamatan Terara Kabupaten Lombok Timur', '', NULL, NULL),
(66, '2024', '2020702002', 'Abdillah Azihab', '-', 19, 'Sangiang', 'Pamarayan', 'Banten', 'The Power of Visum Et Repertum Evidence in Revealing the Crime of Premeditated Murder (Study of Decision No. 209/Pid. B/2021/PN. Jkt. Ut.)', 'Terverifikasi', NULL, NULL),
(67, '2024', '2020702003', 'Ach. Raziqin', '-', 19, 'Arjasa', 'Sumenep', 'Jawa Timur', 'Konsep Justice Collaborator Tindak Pidana Korupsi Dalam Perspektif Hukum Progresif', 'Terverifikasi', NULL, NULL),
(68, '2024', '2020702004', 'Achmad Nurul Mustofa', '-', 19, 'Licin', 'Banyuwangi', 'Jawa Timur', 'Tinjauan Yuridis Terhadap Perkawinan \'Colong\' Suku Adat Osing Banyuwangi Dalam Perspektif Hukum Pidana', '', NULL, NULL),
(69, '2024', '2020702060', 'Ahmad Ihzul Zubairi', '-', 19, 'Jangkar', 'Situbondo', 'Jawa Timur', 'Upaya Penindakan Terhadap Terduga Pelaku Tindak Pidana Terorisme Oleh Kepolisian Republik Indonesia', '', NULL, NULL),
(70, '2024', '2020702030', 'Aldila Uma Rista', '-', 19, 'Grujugan', 'Bondowoso', 'Jawa Timur', 'Pertanggung Jawaban Dalam Tindak Pidana Kekerasan Seksual Oleh Pelaku Anak Berdasarkan Undang-Undang Nomor 17 Tahun 2016 Tentang Perlindungan Anak (Studi Putusan Nomor 8/Pid.Sus-Anak/2023/Pn-Byw)', '', NULL, NULL),
(71, '2024', '2020702031', 'Alfin Afriyani', '-', 19, 'Tragah', 'Bangkalan', 'Jawa Timur', 'Mandatory Spending Pesantren Pasca Undang-Undang Nomor 18 Tahun 2019 Tentang Pesantren', '', NULL, NULL),
(72, '2024', '2020702006', 'Alfin Najmi', '-', 19, 'Guluk-guluk', 'Sumenep', 'Jawa Timur', 'Politik Blater Dalam Perspektif Undang-Undang Pemilu No.7 Tahun 2017 (Studi Kasus Pemilihan DPRD Kabupaten Sumenep Tahun 2024)', 'Terverifikasi', NULL, NULL),
(73, '2024', '2020702032', 'Anfa\'unnisa\'  Fidinir Rahman', '-', 19, 'Denpasar Timur', 'Denpasar', 'Bali', 'Perlindungan Hukum Terhadap Korban Penyalah Gunaan Teknik deepfake', '', NULL, NULL),
(74, '2024', '2019702024', 'Aulia Nisa', '-', 19, 'Bebandem', 'Karangasem', 'Bali', 'Peran Dan Fungsi DPRD Dalam Pemakzulan Kepala Daerah', '', NULL, NULL),
(75, '2024', '2019702026', 'Dina Yaniar Putri', '-', 19, 'Kalipuro', 'Banyuwangi', 'Jawa Timur', 'Penerapan Asas Sidang Terbuka Untuk Umum Dalam Penyelesaian Perkara Perdata Melalui E-Court', 'Terverifikasi', NULL, NULL),
(76, '2024', '2020702007', 'Farhan Agil', '-', 19, 'Tlogosari', 'Bondowoso', 'Jawa Timur', 'Analisis Penyelesaian Sengketa Kepemilikan Tanah Di Desa Patemon Kecamatan Tlogosari Kabupaten Bondowoso', '', NULL, NULL),
(77, '2024', '2019702029', 'Firnawati', '-', 19, 'Kangean', 'Sumenep', 'Jawa Timur', 'Pertanggung Jawaban Tindak Pidana Terhadap Pelaku Pengederan Tanpa Izin Edar (Studi Kasus Putusan Pengadilan Negeri Mataram NO. 111/Pid.B/2013/PN.Mtr)', 'Terverifikasi', NULL, NULL),
(78, '2024', '2019702030', 'Hindriyani', '-', 19, 'Nonggunong', 'Sumenep', 'Jawa Timur', 'Pembuktian Unsur Kesengajaan Dalam Tindak Pidana Pembunuhan Berdasarkan Pasal 338 Kuhp(Study Putusan No.122/Pid.B/2021/Pn.Situbondo)', '', NULL, NULL),
(79, '2024', '2019702031', 'Holifia', '-', 19, 'gayam', 'Sumenep', 'Jawa Timur', 'Perlindungan Hukum Terhadap Perempuan Sebagai Korban Tindak Pidana Kekerasan Dalam Rumah Tangga Berdasarkan Uu No. 23 Tahun 2004', '', NULL, NULL),
(80, '2024', '2019702033', 'Lailatur Rofiqoh', '-', 19, 'Mlandingan', 'Situbondo', 'Jawa Timur', 'Pertanggungjawaban Tindak Pidana Terhadap Pembunuhan Berencana (Study Putusan No.174/Pid.B/2023/Pn.Sit)', '', NULL, NULL),
(81, '2024', '2019702034', 'Maria Ulfa', '-', 19, 'Panji', 'Situbondo', 'Jawa Timur', 'Peran Bpn Sebagai Mediator Dalam Penyelenggara Penyelesaian Sengketa Pertanahan', 'Terverifikasi', NULL, NULL),
(82, '2024', '2020702041', 'Maulidhatul Mamluatil Hikmah', '-', 19, 'Panji', 'Situbondo', 'Jawa Timur', 'Perlindungan Hak-Hak Hukum Perempuan Penyandang Disabilitas Mental Korban Rudapaksa', '', NULL, NULL),
(83, '2024', '2020702013', 'Miftahul Anas', '-', 19, 'Wonosari', 'Bondowoso', 'Jawa Timur', 'Analisis Yuridis Pemenuhan Hak Kreditor Pasca Putusan Pailit', '', NULL, NULL),
(84, '2024', '2019702035', 'Millatul Hakimah', '-', 19, 'Pragaan', 'Sumenep', 'Jawa Timur', 'Ratio Decidendi Hakim Terhadap Nasab Anak Luar Nikah Serta Implementasinya (Analisis Putusan MK. No. 46/PUU-VIII/2010)', 'Terverifikasi', NULL, NULL),
(85, '2024', '2020702016', 'Muhammad Hasbi', '-', 19, '-', '-', '-', 'Upaya Pembelaan Diri Yang Melampaui Batas (Noodwer Exces) Pasal 49 Ayat (2)', '', NULL, NULL),
(86, '2024', '2020702043', 'Nilatul Mufidah', '-', 19, 'Kalipuro', 'Banyuwangi', 'Jawa Timur', 'Implikasi Putusan Mahkamah Konstitusi Nomor 33/Puu-Xiii/2015 Terhadap Praktik Dinasti Politik Pemilihan Kepala Daerah Di Indonesia', '', NULL, NULL),
(87, '2024', '2020702048', 'Nurul Hidayah', '-', 19, 'Kalipuro', 'Banyuwangi', 'Jawa Timur', 'Upaya  Hukum Diversi Pelaku Anak Dalam Pidana Bullying', 'Terverifikasi', NULL, NULL),
(88, '2024', '2020702025', 'Rovi Azmi', '-', 19, 'Singojuruh', 'Banyuwangi', 'Jawa Timur', 'Penegakan Hukum Terhadap Pekerja Seks Komersial(PSK) Dalam Praktik Prostitusi di Dusun Padang Bulan Kabupaten Banyuwangi', '', NULL, NULL),
(89, '2024', '2020702053', 'Siti Yuliana Novitasari', '-', 19, 'Pujer', 'Bondowoso', 'Jawa Timur', 'Penegakan Hukum Pemilu Terhadap Praktik Money Politic Di Indonesia', '', NULL, NULL),
(90, '2024', '2020702056', 'Yulfarikaini', '-', 19, 'Arjasa', 'Sumenep', 'Jawa Timur', 'Analisis Yuridis Normatif Terhadap Pertimbangan Hakim Pada Pelaku Pidana Pemerkosaan Atas Anak (Studi Putusan Nomor 86/Pid.Sus/2022/Pt Bdg)', '', NULL, NULL),
(91, '2024', '2020702026', 'Yusril Mahizza Saputra', '-', 19, 'Janapria ', 'Lombok Tengah', 'Nusa Tenggara Barat', 'Analisis Yuridis Peran Dan Fungsi BPD Sebagai Lembaga Aspiratif Dalam Pelaksanaan Sistem Pemerintahan Desa Berdasarkan Permendagri No.110 Tahun 2016 (Analisis Di Desa Prako, Kecamatan Janapria Lombok Tengah)', '', NULL, NULL),
(92, '2024', '2020704010', 'Alifa Nadia Kh Nisa', '-', 21, 'Sukowono', 'Jember', 'Jawa Timur', 'The Development Of Part Of Speech Pocket Book For Grammar Mastery For Students At The Seventh', '', NULL, NULL),
(93, '2024', '2020704012', 'Aswifatul Mu\'mina', '-', 21, 'Arjasa', 'Sumenep', 'Jawa Timur', 'The Correlation Between Student Pronunciation And Self-Confidence On Speaking Ability Of Mts Al-Wathoniyah Arjasa Sumenep', '', NULL, NULL),
(94, '2024', '2020704013', 'Cindy Komariah', '-', 21, 'Puger', 'Bondowoso', 'Jawa Timur', 'Development Of Speech Practice Book For Students Speaking Skill At English Departement Of Ibrahimy University', '', NULL, NULL),
(95, '2024', '2019704015', 'Dawil Karomah', '-', 21, 'Ra\'as', 'Sumenep', 'Jawa Timur', 'The Correlation Between Student Anxiety And Their Reading Comprehension At The Fourth Grade Of Mi Tanwirul Qulub Ketupat Raas', '', NULL, NULL),
(96, '2024', '2020704014', 'Faizatul Muyassaroh', '-', 21, 'Sumbersari', 'Jember', 'Jawa Timur', 'The Effect of Native Speaker Video Toward Student Speaking Skill', '', NULL, NULL),
(97, '2024', '2020704015', 'Fika Maulidatul Ula', '-', 21, 'Sapeken', 'Sumenep', 'Jawa Timur', 'The Effect Of Aladdin Movie On Student Speaking Skill At The Grade Intermediate In Syu\'batul Lughah Al-Khairiyah, Ma\'hadul Qur\'an Dormitory Female, Sukorejo Situbondo', '', NULL, NULL),
(98, '2024', '2020704016', 'Izza Fitrotin Nisa\'', '-', 21, 'Wongsorejo', 'Banyuwangi', 'Jawa Timur', 'THE USE OF PINKFONG ON Student VOCABULARY AT THE 4th GRADE OF MI NURUL KARIM BANGSRING BANYUWANGI IN THE ACADEMIC YEAR 2023/2024', '', NULL, NULL),
(99, '2024', '2020704007', 'Jadid Rahmi', '-', 21, 'Jembrana', 'Jembrana', 'Bali', 'The Effect of English Class 101 Channel on Students Speaking Skill at Intermediate Class of English Dormitory Salafiyah Syafi\'iyah Islamic Boarding School', '', NULL, NULL),
(100, '2024', '2020704019', 'Lailatul Badriyah', '-', 21, 'Banyuputih', 'Situbondo', 'Jawa Timur', 'IMPROVING Student ENGLISH VOCABULARY THROUGH SNAKE AND LADDER GAME LEARNING MEDIA OF VII E Student AT SMP 3 IBRAHIMY', '', NULL, NULL),
(101, '2024', '2020704021', 'Mas Chofsotul Muniroh', '-', 21, 'Wonocolo', 'Surabaya', 'Jawa Timur', 'Developing Tongue Twister Pocket Book on Pronunciation Mastery for Students of Excellent Community Room of Ma\'had Aly of Islamic Boarding School of', '', NULL, NULL),
(102, '2024', '2020704023', 'Mufarroha', '-', 21, 'Tanjung Bumi', 'Bangkalan', 'Jawa Timur', 'The Effect Of Mind Mapping On Students\' Recount Text Writing\'s Skill In Eighth Grade Of Smpn 1 Tanjung Bumi Bangkalan', '', NULL, NULL),
(103, '2024', '2020704025', 'Nofa Rifqiyanti', '-', 21, 'Kangayan', 'Sumenep', 'Jawa Timur', 'Developing Educational Game Application Toward Student Alphabet Understanding For Kindergarten Students Through Android Application', '', NULL, NULL),
(104, '2024', '2020704026', 'Novia Arianti', '-', 21, 'Janapria', 'Lombok Tengah', 'NTB', '\"The Effect Of English Podcast Videos On Teaching Speaking Skill At The Eighth Grade Of Mts Nw Pendem In The Academic Year 2024/2025\"', '', NULL, NULL),
(105, '2024', '2020704027', 'Puspita Laili', '-', 21, 'Arosbaya', 'Bangkalan', 'Jawa Timur', 'A Podcast Show \'Self Improvement\' On Students\' Speaking Skill At The Tenth Grade Of SMA Sa\'idiyah In Salafiyah Sa\'idiyah Buduran Arosbaya Bangkalan The Experimental Study', 'Terverifikasi', NULL, NULL),
(106, '2024', '2020704028', 'Putri Sahida', '-', 21, 'Benua Kayong', 'Ketapang', 'Kalimantan Barat', 'Factors causing the decline on Students\' interest toward english major based on teachers\' perception at islamic boarding house of salafiyah syafi\'iyah', '', NULL, NULL),
(107, '2024', '2020704029', 'Riskiyatun Hasanah', '-', 21, 'Arjasa', 'Situbondo', 'Jawa Timur', 'The Effect Of Vocabulary Self-Collection Strategy (Vss) To The Student Vocabulary Mastery At The Eigth Grade Of Smpi Sunan Bonang Situbondo', '', NULL, NULL),
(108, '2024', '2020704030', 'Rizqatin Mubarokah Zk', '-', 21, 'Banyuputih', 'Situbondo', 'Jawa Timur', 'The Impact Of The Tongue Twister Technique On Student Speaking Ability And Pronunciation At The 8th Grade Of Junior High School Of Naa Alasbuluh Wongsorejo Banyuwangi In Academic Year 2024/2025â€', '', NULL, NULL),
(109, '2024', '2020704031', 'Safira Munawaroh', '-', 21, 'Arjasa', 'Situbondo', 'Jawa Timur', 'Implementation Of Using Podcast To Improve Student Speaking Skill At Eight Grade Of Smpn 2 Arjasa Situbondo', '', NULL, NULL),
(110, '2024', '2020704032', 'Selfi Usmani Putri', '-', 21, 'Kalibaru', 'Banyuwangi', 'Jawa Timur', 'The Correlation Between Students Reading Aloud And Pronuncation At The Eleventh Grade Of SMK Negeri Kalibaru In The Academic Year 2024/2025', '', NULL, NULL),
(111, '2024', '2020704040', 'Siti Mutmainah', '-', 21, 'Jilbuk', 'Jember', 'Jawa Timur', '\"Developing Daily Expression Pocket Book In Teaching Speaking Skill At The Eighth Grade Of Mts Al Mushawwir\"', '', NULL, NULL),
(112, '2024', '2020704034', 'Siti Nur Humaidah', '-', 21, 'Sambaliung', 'Brau', 'Kalimantan Timur', 'Developing An English Dictionary Pocket Book Of Synonyms And Antonyms In Lbh Of Salafiyah Syafi\'iyah Sukorejo', '', NULL, NULL),
(113, '2024', '2020704035', 'Sitti Aisyah', '-', 21, 'Cerme', 'Bondowoso', 'Jawa Timur', 'Students\' Perception and Teachers\' Response on Picture Media in Learning Vocabulary', '', NULL, NULL),
(114, '2024', '2020704036', 'Sofwil Widad Fuadi', '-', 21, 'Sukowono', 'Jember', 'Jawa Timur', 'The Effect of Roundtable technique on Reading Narrative text at the Eighth grade of MTs Nurul Qarnain Sukowono Jember', '', NULL, NULL),
(115, '2024', '2020704037', 'Virgania Afifah Fajariah', '-', 21, 'Kalipuro', 'Banyuwangi', 'Jawa Timur', 'The Development Of English Storybook On Students\' Speakng Skill At Institute Of Al - Qomar Giri Banyuwangi', '', NULL, NULL),
(116, '2024', '2020704038', 'Zakiyah Fachira', '-', 21, 'Banyuputih', 'Situbondo', 'Jawatimur', 'Development Of Word Game Book In Teaching Vocabulary for Students at English Language Education Institute of Zainul Anwar Islamic Boarding School', '', NULL, NULL),
(117, '2024', '2020704039', 'Zilmi Kawila Aisyah', '-', 21, 'Jangkar', 'Situbondo', 'Jawa Timur', '\"The Effect Of Pop-Up Book On Student Vocabulary Mastery  At Intermediate Class In Language Boarding House Of Salafiyah Syafi\'iyah Sukorejo Situbondo\"', '', NULL, NULL),
(118, '2024', '2020701014', 'Ananda Ahwin Alfiana', '-', 20, 'Bobotsari', 'Purbalingga', 'Jawa Tengah', 'Hubungan Kecerdasan Emosi Dengan Strategi Coping Pada Mahasiswa Yang Bekerja ', '', NULL, NULL),
(119, '2024', '2020701049', 'Cindy Belkis Maharani', '-', 20, 'Pasar Kemis', 'Tangerang', 'Banten', 'Hubungan Kontrol Diri Dengan Perilaku Higienis Pada Santri Di Pondok Pesantren Salafiyah Syafi\'iyah Sukorejo', '', NULL, NULL),
(120, '2024', '2020701015', 'Dewi Shinta Nur Masturiyah', '-', 20, 'Mangaran', 'Situbondo', 'Jawa Timur', 'Dukungan Orang Tua Sebagai Prediktor Motivasi Belajar Anak Di Kabupaten Situbondo', '', NULL, NULL),
(121, '2024', '2020701017', 'Faiza Salsabila', '-', 20, 'Bebandem', 'Karangasrem', 'Bali', 'HUBUNGAN PERILAKU BULLYING DENGAN KESEHATAN MENTAL PADA SISWA Mtsn KARANGASEM BALI', '', NULL, NULL),
(122, '2024', '2020701018', 'Fitri Firdausiyah', '-', 20, 'Banyuputih', 'Situbondo', 'Jawa Timur', 'Hubungan Interaksi Sosial Dengan Identitas Sosial Pengguna Game Online Zepeto', '', NULL, NULL),
(123, '2024', '2020701019', 'Frieda Yonivita', '-', 20, '-', '-', '-', 'Pengaruh Perilaku Toxic Parent Kepala Kamar Terhadap Pembentukan Karakter Remaja Santri Pondok Pesantren Salafiyah Syafi\'iyah Sukorejo', '', NULL, NULL),
(124, '2024', '2020701021', 'Jasmin Aurelia Balkis', '-', 20, 'Banyuputih', 'Situbondo', 'Jawa Timur', 'Hubungan Premenstrual Syndrome Dengan Kontrol Diri Remaja Usia Akhir', '', NULL, NULL),
(125, '2024', '2020701023', 'Luluk Maktumah', '-', 20, 'Kalipuro', 'Banyuwangi', 'Jawa Timur', 'Hubungan Peer Support Dengan Prestasi Belajar Pada Remaja Awal', '', NULL, NULL),
(126, '2024', '2020701005', 'M. Sabilarrasyad Al Khariqi', '-', 20, 'Banyuputih', 'Situbondo', 'Jawa Timur', 'Hubungan Antara Adversity Quotient Dengan Motivasi Akademik Santri Remaja Akhir ', '', NULL, NULL),
(127, '2024', '2020701024', 'Maulidina Wahyu Lestari', '-', 20, 'Warurejo', 'Tegal', 'Jawa Tengah', 'Hubungan  Sense  Of  Community   Dengan Konformitas  Santri Putri Asrama  Bahasa Pondok Pesantren Salafiyah Syafi\'iyah Sukorejo', '', NULL, NULL),
(128, '2024', '2020701011', 'Muhammad Rizky Jaelani', '-', 20, 'Sukodono', 'Sidoarjo', 'Jawa Timur', 'Hubungan Religiusitas dengan Strategi Coping Stres Remaja Santri Pondok Pesantren Salafiyah Syafi\'iyah Sukorejo SItubondo', '', NULL, NULL),
(129, '2024', '2020701026', 'Murni Utami', '-', 20, 'Tebo Tengah', 'Tebo', 'Jambi', 'Hubungan Self Compassion Dengan Body Image Pada Remaja Putri Di Asrama Tahfidzul Qur\'an', '', NULL, NULL),
(130, '2024', '2020701029', 'Nadhiyah Raudlatul Jannah', '-', 20, 'Bangorejo', 'Banyuwangi', 'Jawa Timur', 'KONDISI MOOD SWING PADA REMAJA SAAT MENSTRUASI', '', NULL, NULL),
(131, '2024', '2020701012', 'Nailul Ulya', '-', 20, 'Bangsalsari', 'Jember', 'Jawa Timur', 'Hubungan Efikasi Diri dan Rasa Syukur Dengan Resiliensi Santri Tahfidz Al-Qur\'an Pondok Pesantren Salafiyah Syafi\'iyah Sukorejo', '', NULL, NULL),
(132, '2024', '2020701030', 'Ni\'matin Wafiyah', '-', 20, 'Banyuputih', 'Situbondo', 'Jawa Timur', 'Hubungan Kepatuhan Pada Kiai Dengan Perilaku Memilih Mahasiswi Santri Pada Pemilihan Presiden Dan Wakil Presiden Tahun 2024', '', NULL, NULL),
(133, '2024', '2020701031', 'Nur Milatussifa', '-', 20, 'Arjasa', 'Sumenep', 'Jawa Timur', 'Hubungan Pola Asuh Permisif Dengan Kenakalan Remaja Di Arjasa Kangean', '', NULL, NULL),
(134, '2024', '2020701032', 'Nurul Fahira', '-', 20, 'Gerokgak', 'Buleleng', 'Bali', 'Dinamika Resiliensi Pada Remaja Broken Heart', '', NULL, NULL),
(135, '2024', '2020701034', 'Qoimatun Adillah', '-', 20, 'Bungatan', 'Situbondo', 'Jawa Timur', 'Pengaruh Fear Of Missing Out Sosial Media Terhadap Perilaku Phubbing Pada Remaja Akhir', '', NULL, NULL),
(136, '2024', '2020701042', 'Siti Madinatul Izzah', '-', 20, 'Kabat', 'Banyuwangi', 'Jawa Timur', 'Psychological well-being Sebagai Prediktor Kontrol Diri Santri', '', NULL, NULL),
(137, '2024', '2020701043', 'Sulistiana Putri', '-', 20, 'Batukliang', 'Lombok tengah', 'NTB', 'Hubungan Antara Body Image Dengan Kepercayaan Diri Pada Siswa Madrasah Aliyah Nurul Ulum Mertak Tombok Nusa Tenggara Barat', '', NULL, NULL),
(138, '2024', '2020701046', 'Ulfatus Sofiya', '-', 20, 'Asembagus', 'Situbondo', 'Jawa Timur', 'Intimacy Pada Pasangan Romantis Suami Isteri Di Kabupaten Situbondo', '', NULL, NULL),
(139, '2024', '2020701050', 'Winda Sari', '-', 20, 'Pakuhaji', 'Tangerang', 'Banten', 'Hubungan Religiusitas Dengan Kepuasan Pernikahan Dini Pada Remaja Di Kabupaten Situbondo', 'Terverifikasi', NULL, NULL),
(140, '2024', '2020504002', 'Abdul Hamid', '-', 12, '-', '-', '-', 'Desain Mansion Di Desa Wisata Bukit Bengkaung', '', NULL, NULL),
(141, '2024', '2020504003', 'Achmad Muharom', '-', 12, '-', '-', '-', 'Arsitektur Fungsionalisme Mewujudkan Pasar Rakyat Higienis Tembok Dukuh Kota Surabaya ', '', NULL, NULL),
(142, '2024', '2020504016', 'Aisyah Dwi Romadhana', '-', 12, 'Cermee', 'Bondowoso', 'Jawa Timur', 'Redesain Madrasah Diniyah Takmiliyah Awaliyah Baitur Rahman Dengan Pendekatan Konsep Arsitektur Biophilic', '', NULL, NULL),
(143, '2024', '2020504004', 'Daniel Maulana', '-', 12, 'Tlogosari', 'Bondowoso', 'Jawa Timur', 'Redesain Sekolah Dasar Negeri (SDN) Tlogosari 2 dengan Konsep Arsitektur Modern', '', NULL, NULL),
(144, '2024', '2020504005', 'Fahmi Hafidh Al Basith', '-', 12, 'Cluring', 'Banyuwangi', 'Jawa Timur', 'Perancangan Sekolah TK Al Hasan di Banyuwangi dengan Pendekatan Konsep Arsitektur Perilaku', '', NULL, NULL),
(145, '2024', '2020504017', 'Hanunah Sofiatul Laily', '-', 12, 'Grujugan', 'Bondowoso', 'Jawa Timur', 'Perancangan Desain Rumah Ramah Lingkungan Di Kecamatan Ijen Bondowoso Dengan Konsep Arsitektur Bioklimatik', '', NULL, NULL),
(146, '2024', '2020504018', 'Istiana', '-', 12, 'Banyuputih', 'Situbondo', 'Jawa Timur', 'Penerapan Konsep Sustainable Design Pada Perancangan Masjid Di Desa Sumberejo (Batu Ambar)', '', NULL, NULL),
(147, '2024', '2020504008', 'Maisur Aniq', '-', 12, 'Balung', 'Jember', 'Jawa Timur', 'Pengaruh Modernisme pada Estetika Arsitektur dalam Desain studi Kasus Villa Bougenville  indah di Jember', '', NULL, NULL),
(148, '2024', '2020504011', 'Rabith Moh. Amin', '-', 12, '-', '-', '-', 'Perancangan Arsitektur Museum Wisata Religi Sebagai Media Publikasi Dan Komunikasi Pondok Pesantren Salafiyah Syafi\'iyah Sukorejo', '', NULL, NULL),
(149, '2024', '2020504012', 'Rifki Kuswanto', '-', 12, 'Wongsorejo', 'Banyuwangi', 'Jawa Timur', 'Revitalisasi Terminal Bus Sritanjung Dengan Pendekatan Arsitektur Neo Vernakuler Di Kabupaten Banyuwangi', 'Terverifikasi', NULL, NULL),
(150, '2024', '2020504014', 'Riski Maulana', '-', 12, 'Kalipuro', 'Banyuwangi', 'Jawa Timur', 'Perancangan Rumah Tinggal Di Desa Pesucen Kecamatan Kalupuro Kabupaten Banyuwangi Dengan Pendekatan Arsitektur Perilaku', 'Terverifikasi', NULL, NULL),
(151, '2024', '2020405015', 'Royhan Fikri Sabeila', '-', 12, 'Tenggarang', 'Bondowoso', 'Jawa Timur', 'Perancangan Asrama Pondok Pesantren Salafiyah Carang Urip Banyuwangi dengan Konsep Arsitektur Hijau', '', NULL, NULL),
(152, '2024', '2020504022', 'Wilda Novi Fitriyanti', '-', 12, 'Banyuputih', 'Situbondo', 'Jawa Timur', 'Optimalisasi Kenyamanan Termal Pada Wangi Homestay Banyuwangi', '', NULL, NULL),
(153, '2024', '2020504023', 'Zahrotul Qomariyah', '-', 12, 'Bangsalsari', 'Jember', 'Jawa Timur', 'Perancangan Raudatul Athfal  (Ra) Salafiyah Syafi\'iyah Langkap Dengan Pendekatan Arsitektur Organik', '', NULL, NULL),
(154, '2024', '2021506001', 'Ahmad Hakiki', '-', 13, 'Banyuputih', 'Situbondo', 'Jawa Timur', 'Teknik Pembesaran Udang Vaname (Litopenaus Vannamei) di Tambak UPT perikanan Budidaya Air Tawar/air Payau (UPT PBATAP) Gelung Panarukan Situbondo Jawa Timur', 'Terverifikasi', NULL, NULL),
(155, '2024', '2021506005', 'Fajrul Hikam', '-', 13, 'Tejakula', 'Buleleng', 'Bali', 'Teknik Pembenihan Kerapu Cantang (Epinephelus Fuscoguttatus x Epinephelus Lanceolatus) DI HSRT Indoraya Desa Bletok Kecamatan Bungatan Kabupaten Situbondo Jawa Timur', '', NULL, NULL),
(156, '2024', '2021506030', 'Hasbi Yallah Asidiqi', '-', 13, 'Ijen', 'Bondowoso', 'Jawa Timur', 'Teknik Pembenihan Ikan Lele Dumbo (Clarias Gariepinus) Dengan Sistem Probiotik Di Raja Lele Curah Jeru Situbondo Jawa Timur', '', NULL, NULL),
(157, '2024', '2021506011', 'M. Rafi Kafabi Rizki Mz', '-', 13, 'Singojuruh', 'Banyuwangi', 'Jawa Timur', 'Teknik Pembenihan Ikan Diskus (Symphysodon discus) di Mozza Aquatic', '', NULL, NULL),
(158, '2024', '2021506012', 'Moch. Khoiron Ramadhani', '-', 13, 'Asembagus ', 'Situbondo', 'Jawa Timur', 'Teknik Pembesaran Udang Vaname (litopenaeus vannamei) dengan sistem Kolam Bulat Udang Vanname (kodame) di Tambak UD. Zulfish', 'Terverifikasi', NULL, NULL),
(159, '2024', '2021506016', 'Muh. Faozan ', '-', 13, 'Kopang', 'Lombok Tengah', 'NTB', 'Teknik Pembesaran Ikan Lele Dumbo (Clarias Gariepinus) Secara Intensif Di Raja Lele Situbondo', '', NULL, NULL),
(160, '2024', '2021506023', 'Nurul Imam Hambali', '-', 13, 'Sukowono', 'Jember', 'Jawa Timur', 'Teknik Pembesaran Udang Vaname (Litopenaeus Vannamei) di Tambak Skala Rumah Tangga (SRT) Unit Pelaksana Teknis Perikanan Budidaya Air Tawar/Air Payau (UPT. PBATAP) Situbondo', '', NULL, NULL),
(161, '2024', '2020501004', 'Ahmad Ambari', '-', 15, 'Batang Asai', 'Sarolangun', 'Jambi', 'Rancang Bangun Sistem Kendali dan Monitoring Pintu Air Dam Berbasis Arduino dengan Implementasi Internet Of Things (IOT)', '', NULL, NULL),
(162, '2024', '2019501011', 'Ahmad Ivani', '-', 15, 'Kalibaru', 'Banyuwangi', 'Jawa Timur', 'Sistem Penyiraman Otomatis pada Bibit Tanaman Kopi berbasis IOT', '', NULL, NULL),
(163, '2024', '2019501016', 'Edi Ilham', '-', 15, 'Grokgak', 'Buleleng', 'Bali', 'Rancang Bangun Sistem Informasi Monitoring Kegiatan Ubudiyah Di Asrama Ma\'hadul Qur\'an Putri Menggunakan Bahasa Pemrograman Php Dan MySql', '', NULL, NULL),
(164, '2024', '2019501025', 'Facthur Miftawan Cahya', '-', 15, 'Kalijati', 'Subang', 'Jawa Barat', 'Prototype Penghitung Pengunjung Otomatis Pada Klinik Idaman As\'adiyah Berbasis Arduino Uno dan Sensor Pir', '', NULL, NULL),
(165, '2024', '2020501054', 'Faize Ramadani', '-', 15, '-', '-', '-', 'Rancang Bangun Prototype Penyiraman Tanaman Hortikultura Otomatis Berdasarkan Waktu Berbasis Arduino', '', NULL, NULL),
(166, '2024', '2020501055', 'Faizetul Jannah', '-', 15, 'Wongsorejo', 'Banyuwangi', 'Jawa Timur', 'Sistem Pendukung Keputusan Menentukan Jurusan Siswa Baru Smk Negeri Wongsorejo Menggunakan Metode Saw (Simple Additive Weighting)', '', NULL, NULL),
(167, '2024', '2018301011', 'Hasan Basri', '-', 15, '-', '-', '-', 'Sistem Informasi Jurnal Kegiatan Guru Mengajar Di SMP 1 Ibrahimy Berbasis Web', '', NULL, NULL),
(168, '2024', '2019501002', 'Irfan Kusnadi', '-', 15, 'Tempeh', 'Lumajang', 'Jawa Timur', 'Prototype Sistem Monitoring Deteksi Kebakaran dan Notifikasi Berbasis IOT (Internet of things)', '', NULL, NULL),
(169, '2024', '2020501036', 'Kamiliatul Husnah', '-', 15, 'Sumberwringin', 'Bondowoso', 'JAwa Timur', 'Rancang Bangun Alat Monitoring Ketinggian Air Dan Peringatan Dini Banjir Berbasis Internet Of Things(Iot)', '', NULL, NULL),
(170, '2024', '2020501037', 'Khoiriratun Nadiyah', '-', 15, 'Tlogosari', 'Bondowoso', 'Jawa Timur', 'SISTEM MONITORING SUHU RUANGAN KANDANG AYAM GUNA MEMPERMUDAH KINERJA PETERNAK BERBASIS ARDUINO ', '', NULL, NULL),
(171, '2024', '2019501036', 'Lailatul Fitriyah', '-', 15, 'Ra\'as', 'Sumenep', 'Jawa Timur', 'Rancang Bangun Prototype Sistem Buka Tutup Gorden Menggunakan Mikrokontroller Arduino Uno', 'Terverifikasi', NULL, NULL),
(172, '2024', '20205010052', 'Moch. Luthfi Jamil', '-', 15, '-', '-', '-', 'Perancangan Smart Home Dengan Memanfaatkan Mikrokontroller Arduino Berbasis Perintah Suara Via Android', '', NULL, NULL),
(173, '2024', '2020501014', 'Mokh. Rahul Al Aziz', '-', 15, 'Bangsalsari', 'Jember', 'Jawa Timur', 'Sistem Atap Buka Tutup Otomatis Dalam Penerapan Smart Cloteshline di Pondok Pesantren Salafiyah Syafi\'iyah Sukorejo Situbondo', 'Terverifikasi', NULL, NULL),
(174, '2024', '2020501018', 'Muhammad Haikal Bisri', '-', 15, 'Cakung Timur', 'Jakarta Timur', 'Jakarta', '\"Alat Monitoring Daya Listrik berbasis IOT pada Ponpes Salafiyah Syafi\'iyah Sukorejo (P2S3) menggunakan NodeMCU dan Blynk', '', NULL, NULL),
(175, '2024', '2019501028', 'Nailu Sofwatur Rohmani', '-', 15, 'Tenggarang', 'Bondowoso', 'Jawa Timur', 'Rancang Bangun Prototype Alat Pengering Singkong Otomatis Menggunakan Mikrokontroler Arduino Uno', '', NULL, NULL),
(176, '2024', '2020501020', 'Noer Khalis', '-', 15, '-', '-', '-', 'Rancang Bangun Sistem Monitoring Kualitas Air Di Pabrik Air Mineral P2S2 CV. Hafas Situbondo Berbasis Internet Of Things (IOT)', '', NULL, NULL),
(177, '2024', '2020501057', 'Nur Ima', '-', 15, '-', '-', '-', 'Sistem Pendukung Keputusan Seleksi Penerimaan Karyawan SPBU Sukorejo Banyuputih Menggunakan Metode Simple Additive Weighting (SAW)', '', NULL, NULL),
(178, '2024', '2020501058', 'Nuril Hasanah', '-', 15, '-', '-', '-', 'Sistem Pendukung Keputusan Seleksi Penerimaan Siswa Baru Di SMK Ibu Pakusari Menggunakan Metode AHP (Analitical Hierarchy Proses)', '', NULL, NULL),
(179, '2024', '2020501041', 'Nurul Fauziah', '-', 15, 'Tabanan', 'Tabanan', 'Bali', 'Rancang Bangun Sistem Pengontrol Irigasi Otomatis Menggunakan Mikrokontroler Arduino Uno', '', NULL, NULL),
(180, '2024', '2020501025', 'Salamun Haris', '-', 15, 'Tebo', 'Tebo Ilir', 'Jambi', 'Perancangan Pintu Otomatis Berbasis Arduino Menggunakan Sensor PIR', '', NULL, NULL),
(181, '2024', '2020501059', 'Selvi Puspita Sari', '-', 15, 'Sumberwringin', 'Bondowoso', 'Jawa Timur', 'Rancang Bangun Smart Home Berbasis Mikrokontroler Esp32 dan Blynk', 'Terverifikasi', NULL, NULL),
(182, '2024', '2020501062', 'Septia Nur Imania', '-', 15, 'Arjasa', 'Situbondo', 'Jawa Timur', 'Rancang bangun Prototype Buka Tutup Pintu Otomatis Berbasis Arduino uno Menggunakan Sensor Ultrasonik Di Toko Farid Collection', '', NULL, NULL),
(183, '2024', '2020501043', 'Widia Andriani', '-', 15, 'Janapriya', 'Lombok Tengah', 'NTB', 'Implementasi Metode Saw Pada Sistem Pendukung Keputusan Penentuan Penerima Beasiswa Mahasiswa Universitas Ibrahimy', '', NULL, NULL),
(184, '2024', '2020501048', 'Zulfi Amaliyah', '-', 15, 'Wongsorejo', 'Banyuwangi', 'Jawa Timur', 'Sistem Pendukung Keputusan Penentuan Siswa Siswi Berprestasi Menggunakan Metode SAW (Simple additive weighting) Pada SMA Ibrahimy Wongsorejo', '', NULL, NULL),
(185, '2024', '2020502038', 'Camelia Syarifa', '-', 16, 'Tlogosari', 'Bandowoso', 'Jawa Timur', 'sistem Informasi Inventory pada MTS Nurul Khulus Tlogosari Bondowoso Menggunakan PHP dan MYSQL', '', NULL, NULL),
(186, '2024', '2020502040', 'Devi Hamida', '-', 16, 'Kuta', 'Badung', 'Bali', 'Sistem Informasi Manajemen Skripsi Di Fakultas Sains & Teknologi Universitas Ibrahimy Berbasis Website', '', NULL, NULL),
(187, '2024', '2020502041', 'Elistia Aisyah', '-', 16, 'Tlogosari', 'Bondowoso', 'Jawa Timur', 'Perancangan Sistem Informasi Pengajuan Cuti Tenaga Medis Menggunakan Php dan Mysql Studi kasus UPTD Puskesmas Pujer', '', NULL, NULL),
(188, '2024', '2020502045', 'Fitradyah Ika Wahyudi', '-', 16, 'Sumberwringin', 'Bondowoso', 'Jawa Timur', 'Sistem Informasi Pengajuan Dan Pengaduan Masyarakat Pada Kecamatan Sumber Wringin', '', NULL, NULL),
(189, '2024', '2020502046', 'Halilatul Muallafa', '-', 16, 'Arjasa', 'Sumenep', 'Jawa Timur', 'Sistem Informasi Pemesanan Salon Kecantikan Pada Dream Skin Aesthetic Berbasis Web', '', NULL, NULL),
(190, '2024', '2020502047', 'Halimatus Sya\'diyah', '-', 16, 'Samarinda Utara', 'Samarinda', 'Kal-Tim', 'Sistem Informasi Persuratan Di Fakultas Sains Dan Teknologi Universitas Ibrahimy Menggunakan Php Dan Mysql', '', NULL, NULL),
(191, '2024', '2020502014', 'Lukman Ali Yasin', '-', 16, 'Gayam', 'Sumenep', 'jawa Timur', 'Sistem Pendukung Keputusan Penerimaan Peserta Didik Baru di MTs Bustanul Ulum Menggunakan Metode Smart (Simple Multi-Attibute Rating Technique)', '', NULL, NULL),
(192, '2024', '2020502053', 'Mega Rahma Putri ', '-', 16, 'Kelapa Gading', 'Kelapa Gading Timur', 'DKI Jakarta', 'Sistem Informasi Pendaftaran santri dipondok Pesantren Al-Wathoniyah 43 Jakarta Utara Berbasis Web Dengan Fitur Whatsapp Getewey.', '', NULL, NULL),
(193, '2024', '2020502022', 'Mohammad Nasta\'in', '-', 16, '-', '-', '-', 'Analisis Trend Minat Masyarakat Indonesia Terhadap Bitcoin Dalam Menghadapi Bitcoin Halving 2024', '', NULL, NULL),
(194, '2024', '2020502054', 'Nafilatul Lailiyah Lutfi', '-', 16, 'Situbondo', 'Situbondo', 'Jawa Timur', 'Sistem Informasi penelusuran Alumni (Trecer Study) Berbasis Web pada Fakultas Sains dan Teknologi Universitas Ibrahimy', '', NULL, NULL),
(195, '2024', '2020502055', 'Novia Bella', '-', 16, 'Asembagus', 'Situbondo', 'Jawa Timur', 'Aplikasi E- Learning Berbasis Web Di Mts Salafiyah Syafi\'iyah Sukorejo', '', NULL, NULL),
(196, '2024', '2020502026', 'Nur Kholiq', '-', 16, 'Kalipuro', 'Banyuwangi', 'Jawa Timur', 'Rancang Bangun E_Commerce Berbasis Website (Studi Kasus TB. Pilar Mas Kec. Wongsorejo)', 'Terverifikasi', NULL, NULL),
(197, '2024', '2020502058', 'Nur Lailatul Jamaati Latifa', '-', 16, 'Panarukan', 'Situbondo', 'Jawa Timur', 'Sistem Informasi Pelayanan Dan Pengaduan Mahasiswa Di Fakultas Sains & Teknologi Universitas Ibrahimy Berbasis Website', '', NULL, NULL),
(198, '2024', '2020502060', 'Putri Ariska Kamal', '-', 16, 'Denpasar Barat', 'Denpasar', 'Bali', 'Rancang Bangun Sistem Informasi Monitoring Kegiatan Ubudiyah Asrama Ma\'hadul Qur\'an Putri Menggunakan Bahasa Pemrograman PHP dan MySQL', '', NULL, NULL),
(199, '2024', '2020502028', 'Rifki Abdillah', '-', 16, 'Pujer ', 'Bondowoso', 'Jawa Timur', 'Sistem Informasi Geografis Pemetaan Kantor Dinas Pemerintah Kabupaten Bondowoso Berbasis Web', '', NULL, NULL),
(200, '2024', '2020503055', 'Rofi\'atus Sa\'diah', '-', 16, 'Tapen', 'Bondowoso', 'Jawa Timur', 'Rancang Bangun Sistem Informasi Pos (Point Of Sales ) Berbasis Website (Studi Kasus : Arshop Assalafi)', '', NULL, NULL),
(201, '2024', '2019502037', 'Siti Zahroh', '-', 16, 'Tlogosari', 'Bondowoso', 'Jawa Timur', 'Sistem Informasi Presensi Dan Penggajian Menggunakan Geolokasi Berbasis Web Di Madrasah Tsanawiyah Al-Furqon Curahdami ', '', NULL, NULL),
(202, '2024', '2020502030', 'Syamsuddin', '-', 16, 'Asembagus', 'Situbondo', 'Jawa Timur', 'Penentuan Pola Pelanggaran Santri pada Bagian Ubudiyah menggunakan Algoritma Apriori Studi Kasus Pondok Pesantren Salafiyah Syafi\'iyah Sukorejo', 'Terverifikasi', NULL, NULL),
(203, '2024', '2020502066', 'Tikatul Hasanah', '-', 16, '-', '-', '-', 'Rancang Bangun Rekomendasi Buku Bacaan Dengan Metode Apriori Di SMPN 1 Pujer Bondowoso', '', NULL, NULL),
(204, '2024', '2020502031', 'Ukhibul Hidayat', '-', 16, 'Sukasada', 'Buleleng', 'Bali', 'Sistem Informasi Geografis (SIG) Pemetaan Destinasi Wisata Di Kabupaten Buleleng Bali', 'Terverifikasi', NULL, NULL),
(205, '2024', '2020502068', 'Wildatul Hasanah', '-', 16, 'Silo', 'Jember', 'Jawa Timur', 'Sistem Informasi Absensi Kehadiran Siswa Berbasis Giolokasi Di SMK Nurul Islam Sempolan Jember', '', NULL, NULL),
(206, '2024', '2020502069', 'Zaidatul Horriye', '-', 16, 'Jangkar', 'Situbondo', 'Jawa Timur', 'Sistem Informasi Manajemen Masjid Berbasis website studi kasus masjid besar baitul muttaqin jangkar', '', NULL, NULL),
(207, '2024', '2020502070', 'Zelica Auril Nisa', '-', 16, 'Bebandem ', 'Karangasem', 'Bali', 'Sistem Informasi Pelanggaran Siswa Di Man Karangasem Berbasis Website Dengan Notifikasi Whatsapp', '', NULL, NULL),
(208, '2024', '2020505008', 'Husnul Khotima', '-', 14, 'Banyuputih', 'Banyuputih', 'Banyuputih', 'Analisis Kelayakan Pengembagan Unit Usaha Pengolahan Hasil Perikanan pada Bidang Usaha Milik Pesantren di Pondok Pesantren Salafiyah Syafi\'iyah Sukorejo', '', NULL, NULL),
(209, '2024', '2020505010', 'Maulidiya Wardani', '-', 14, 'Cermee', 'Bondowoso', 'Jawa Timur', 'Analisis Kesesuaian Mutu Pindang Ikan Layang (Decapterus Sp.)Terhadap Standar Nasional Indonesia', '', NULL, NULL),
(210, '2024', '2020503001', 'A. Muzacky Naufal Ammar', '-', 17, 'Kalipuro', 'Banyuwangi', 'Jawa TImur', 'Sistem Informasi Geografis Pemetaan Kerusakan Jalan di Kabupaten Banyuwangi Berbasis Website', '', NULL, NULL),
(211, '2024', '2019503017', 'Abdul Jalil', '-', 17, 'Jangkar', 'Situbondo', 'Jawa Timur', 'Implementasi Algoritma Support Vector Machine Untuk Klasifikasi Status Stunting Pada Balita', '', NULL, NULL),
(212, '2024', '2020503002', 'Abdul Rosid', '-', 17, 'Ijen', 'Bondowoso', 'Jawa Timur', 'Klasifikasi Penyakit Tanaman Kentang Berdasarkan Citra Daun dan Batang menggunakan Metode CNN dan GLCM', '', NULL, NULL),
(213, '2024', '2020503003', 'Ach. Ali Wahyudi', '-', 17, 'Mangaran', 'Situbondo', 'Jawa Timur', 'Sistem Pendukung Keputusan Penentuan Beasiswa pada SMP 1 Sunan Bonang dengan Penerapan Metode MOORA', '', NULL, NULL),
(214, '2024', '2020503006', 'Ahmad Badri Maulana Widat', '-', 17, 'Cermee', 'Bondowoso', 'Jawa Timur', 'Klasifikasi Kematangan Citra Buah Tomat Berdasarkan Ekstraksi Fitur Warna Menggunakan Metode K-NN', '', NULL, NULL),
(215, '2024', '2020503008', 'Ahmad Yogianto', '-', 17, '-', '-', '-', 'Implementasi Metode K-Nearest Neighbors (KNN) Untuk Klasifikasi Penyakit Jantung', '', NULL, NULL),
(216, '2024', '2019503065', 'Anjana Magfiroh', '-', 17, 'Siliragung', 'Banyuwangi', 'Jawa Timur', 'Sistem Informasi Monitoring Pelanggaran Santri Asrama Nurul Qoni\' Putri Pp. Salafiyah Syafi\'iyah Sukorejo Berbasis Web Dengan Notifikasi Whatsapp', '', NULL, NULL),
(217, '2024', '2020503011', 'Asep Ripa\'i', '-', 17, 'Salak', 'Subang', 'Jawa Barat', 'Deteksi Berita Hoax dengan Perbandingan Website Menggunakan Pendekatan Deep Learning Algoritma BERT', '', NULL, NULL),
(218, '2024', '2022503119', 'Bambang Iswantoro', '-', 17, 'Kapongan', 'Situbondo', 'Jawa Timur', 'Teknik Klasifikasi Memprediksi Penerimaan Siswa Baru Di SDN 1 Kapongan Menggunakan Metode Naive Bayes ', '', NULL, NULL),
(219, '2024', '2020503040', 'Dewi Sinta Nuriyatul Aini', '-', 17, 'Bangsalsari', 'Jember', 'Jawa Timur', 'Pemetaan Daerah Rawan Bencana Kabupaten Jember Menggunakan Algoritma K-Means Clustering', '', NULL, NULL),
(220, '2024', '2022503130', 'Dwitya Sitaresmi Suharjo', '-', 17, '-', '-', '-', 'Analisis Kebutuhan Pegawai Berdasarkan Peta Jabatan Pada Badan Kesatuan Bangsa Dan Politik Kabupaten Situbondo', '', NULL, NULL),
(221, '2024', '2022503110', 'Edwin Wira Liyanto', '-', 17, '-', '-', '-', 'Implementasi K-Means Clustering Dalam Pengelompokan Data Kunjungan Wisatawan Asing Di Provinsi Jawa Timur', '', NULL, NULL),
(222, '2024', '2022503111', 'Eko Fendy Hermawan', '-', 17, '-', '-', '-', 'Pengembangan Aplikasi Pejabat Pengelola Informasi Dan Dokumentasi Berbasis Website Menggunakan Framework Laravel Pada Dinas Komunikasi Dan Informatika Kabupaten Situbondo', '', NULL, NULL),
(223, '2024', '2022503112', 'Fahreza Adams Lazuardy', '-', 17, '-', '-', '-', 'Perbandingan Metode Klasifikasi Pengujian Kendaraan Bermotor Dengan Algoritma C4.5 Dan Naive Bayes', '', NULL, NULL),
(224, '2024', '2022503113', 'Failis Sabil', '-', 17, 'Situbondo', 'Situbondo', 'Jawa Timur', 'Penerapan Metode Single Exponential Smoothing Sebagai Sistem Pendukung Keputusan Penjualan Komputer Studi Kasus Toko Basic Computer Situbondo', '', NULL, NULL),
(225, '2024', '2020503042', 'Fara Abi Shafira', '-', 17, 'Singojuruh', 'Banyuwangi', 'Jawa Timur', 'Perancangan Sistem Informasi Pendataan Alumni Rayon Iksass Banyuwangi Menggunakan Php Dan Mysql', '', NULL, NULL);
INSERT INTO `mahasiswas` (`id`, `lulusan`, `nim`, `nama`, `jk`, `prodi_id`, `kecamatan`, `kabupaten`, `provinsi`, `tugas_akhir`, `verifikasi`, `created_at`, `updated_at`) VALUES
(226, '2024', '2020503014', 'Hidayat', '-', 17, 'Mempawah Timur', 'Mempawah', 'Kalimantan Barat', 'Analisis Sentimen Pengguna YouTube Tentang Rohingya Menggunakan Algoritma SVM (Support Vector Machine)', '', NULL, NULL),
(227, '2024', '2020503045', 'Iit Riyatul Hasanah', '-', 17, 'Binakal', 'Bondowoso', 'Jawa Timur', 'Sistem Informasi Manajemen Ekstrakulikuler di SMPN Binakal Berbasis Website WA Gateway', '', NULL, NULL),
(228, '2024', '2020503046', 'Kholifatus Sakinah', '-', 17, 'Wongsorejo', 'Banyuwangi', 'Jawa Timur', 'Perancangan Dan Implementasi E-Learning Berbasis Website Dengan Menggunakan Php Dan Mysql Pada Smk Ibrahimy Miftahul Ulum Bengkak-Wongsorejo', '', NULL, NULL),
(229, '2024', '2020503048', 'Lubabul Hasanah', '-', 17, 'Sumberwringin', 'Bondowoso', 'Jawa Timur', 'Rancang Bangun Sistem Kepuasan Pelayanan Konsumen Di Asthetic Naomiqueen Menggunakan PHP Dan MySQL', 'Terverifikasi', NULL, NULL),
(230, '2024', '2020503049', 'Luluk Nur Indahsari', '-', 17, 'Licin', 'Banyuwangi', 'Jawa Timur', 'Rancang Bangun Sistem Informasi Menggunakan Metode Customer Relationship Management (Crm) Pada Paglak Petung Cafe And Art Di Kabupaten Banyuwangi', 'Terverifikasi', NULL, NULL),
(231, '2024', '2020503018', 'M. Saiful Rizal', '-', 17, '-', '-', '-', 'Sistem Informasi Geografis Pencarian UMKM Di Kabupaten Banyuwangi Menggunakan Google Maps Api Berbasis Web', '', NULL, NULL),
(232, '2024', '2020503019', 'M. Tsaqif Daniyal Maula', '-', 17, 'Pagedongan', 'Banjarnegara', 'Jawa Tengah', 'Identifikasi Tingkat Kematangan Buah Carica dalam Pengolahan Citra Digital dengan Menggunakan Metode Transformasi Ruang Warna HSI', '', NULL, NULL),
(233, '2024', '2020503020', 'Masriyadi', '-', 17, 'Ra\'as', 'Sumenep', 'Jawa Timur', 'Sistem Informasi Geografis (GIS) Pemetaan tempat Wisata di Wilayah Kecamatan Ra\'as Berbasis Website', '', NULL, NULL),
(234, '2024', '2020503050', 'Maulidatul Mawaddah', '-', 17, 'Rambipuji', 'Jember', 'Jawa Timur', 'Implementasi Metode K-Nn Untuk Penentuan Status Kesehatan Janin', '', NULL, NULL),
(235, '2024', '2020503021', 'Mochammad Febrialdi Ansyah', '-', 17, '-', '-', '-', 'Analisis Sentimen Komentar Youtube Terhadap Tayangan #Terbaru! Temuan Penyimpangan Akhlak Di Ponpes Al-Zaitun Menggunakan Metode Naive Beyes', 'Terverifikasi', NULL, NULL),
(236, '2024', '2020503023', 'Moh. Riqza Al Halimi', '-', 17, 'Suboh', 'Situbondo', 'Jawa Timur', 'Sistem Pendukung Keputusan Dalam Penerimaan Karyawan Menggunakan Metode Weight Product (WP) pada BMT NU Cabang Suboh', 'Terverifikasi', NULL, NULL),
(237, '2024', '2020503025', 'Mohammad Fathor Iman', '-', 17, 'Arjasa', 'Situbondo', 'Jawa Timur', 'Sistem Pendukung Keputusan Penentuan Penerima Bantuan Langsung Tunai Dana Desa (BLT-DD) dengan Metode K-Nearest Neighbors (KNN) pada Desa Ketowan', '', NULL, NULL),
(238, '2024', '2020503090', 'Muhammad Khoironi', '-', 17, '-', '-', '-', 'Desain Implementasi Sistem Informasi Penjualan Suku Cadang Dan Pelayanan Pada Bengkel Ali Motor Berbasis Web', '', NULL, NULL),
(239, '2024', '2020503027', 'Muhammad Nailurrohman', '-', 17, 'Maesan', 'Bondowoso', 'Jawa Timur', 'Rancang Bangun Sistem Smart Key Pada Sepeda Motor Menggunakan Mikrokontroler Esp32 dan Android Via Bluetooth', '', NULL, NULL),
(240, '2024', '2022503118', 'Muhammad Ramadhani', '-', 17, '-', '-', '-', 'Prediksi Inflasi Bahan Pokok Menggunakan Metode Regresi Linear', '', NULL, NULL),
(241, '2024', '2020503028', 'Muhammad Rifki Muhtarom', '-', 17, 'Tenggarang', 'Bondowoso', 'jawa Timur', 'Penerapan Sistem Informasi Geografis Terhadap Pemetaan Letak Wisata Kabupaten Bondowoso Menggunakan Leaflet js Berbasis Web', '', NULL, NULL),
(242, '2024', '2020503052', 'Mutmainah', '-', 17, 'Prajurit Kulon', 'Mojokerto', 'Jawa Timur', 'Game Edukasi Pengenalan Kosa Kata Pada Anak Usia Dini Berbasis Android', '', NULL, NULL),
(243, '2024', '2019503056', 'Nuria Maulidah', '-', 17, 'Kalipuro', 'Banyuwangi', 'Jawa Timur', 'Sistem Informasi Keuangan Sekolah Berbasis Web Di MTs Ibrahimy Secang Kalipuro', 'Terverifikasi', NULL, NULL),
(244, '2024', '2020503054', 'Raodatul Wasilah', '-', 17, 'Mendoyo', 'Jembrana', 'Bali', 'Sistem Informasi Absensi Siswa Berbasis Web Dengan Notifikasi WA Gateway Pada Mts Negeri 2 Jembrana', '', NULL, NULL),
(245, '2024', '2020503057', 'Sinta Nuriyah Putri', '-', 17, 'Gapura', 'Sumenep', 'Jawa Timur', 'Implementasi Rancangan Sistem Pakar Deteksi Darah Haid Dan Istihadhah Dengan Metode Forward Chaining', '', NULL, NULL),
(246, '2024', '2020503059', 'Siti Maria Ulfa', '-', 17, 'Bungatan', 'Situbondo', 'Jawa Timur', 'Implementasi Firebase Pada Sistem Informasi Monitoring Perjanjian Kerjasama Berbasis Web Di Kabupaten Banyuwangi', '', NULL, NULL),
(247, '2024', '2020503060', 'Siti Nurul Ayni', '-', 17, 'Mayang', 'Jember', 'Jawa Timur', 'Penerapan Metode Waterfall Sistem Informasi Layanan Jasa Laundry Menggunakan Php Mysql', '', NULL, NULL),
(248, '2024', '2020503062', 'Siti Romlah', '-', 17, 'Tapen', 'Bondowoso', 'Jawa Timur', 'Implementasi M Etode Moora Dalam Sistem Pendukung Keputusan Pemilihan Siswa Terbaik Di Mi At-Taqwa Bondowoso', '', NULL, NULL),
(249, '2024', '2020503065', 'Sofi Sofiyatul Hikmah', '-', 17, 'Sumbawa', 'Sumbawa', 'NTB', 'Implementasi Metode Waterfall Pada Sistem Informasi Pencatatan Dan Pemeliharaan Barang Bukti Kepolisian Situbondo', '', NULL, NULL),
(250, '2024', '2022503120', 'Yanto', '-', 17, 'Situbondo', 'Situbondo', 'Jawa Timur', 'Implementasi Metode Clustering Dengan Algoritma DBSCAN Untuk Mengetahui Sentra Industri Berbasis Google Maps', '', NULL, NULL),
(251, '2024', '2022503121', 'Zainul Ihsan', '-', 17, 'Kapongan', 'Situbondo', 'Jawa Timur', 'Sistem Informasi Bimbingan Konseling Di Sekolah Menengah Kejuruan Islam Nurul Falah Berbasis Web', '', NULL, NULL),
(252, '2024', '2020205001', 'Bunga Raudatul Jannah', '-', 1, 'Silo', 'Jember', 'Jawa Timur', 'Pengaruh Corporate Social Responsibility (CRS) Terhadap Nilai Perusahan Melalui Kinerja Keuangan Pada Perusahaan Manufaktur Yang Terdaftar Di BEI Tahun 2021-2023', 'Terverifikasi', NULL, NULL),
(253, '2024', '2019205015', 'Cici Kirani', '-', 1, 'Klabang', 'Bondowoso', 'Jawa Timur', 'Analisis Asas Partisipasi Dlam Perencanaan Keuangan Desa Berdasarkan Premendegri Nomor 113 Tahun 2014 Tentang Pengelolaan Keuangan Desa Di Desa Leprak Kecamatan Klabang Kabupaten Bondowoso', 'Terverifikasi', NULL, NULL),
(254, '2024', '2020205002', 'Fitria', '-', 1, 'Botolinggo', 'Bondowoso', 'Jawa Timur', 'Pengaruh Perencanaan Pajak Beban pajak Tangguhan dan Profitabilitas Terhadap Manajemen Laba pada Perusahaan Manufaktur Yang Terdaftar di Bursa Efek Indonesia', 'Terverifikasi', NULL, NULL),
(255, '2024', '2018205042', 'Indah Wulandari', '-', 1, 'Silo', 'Jember', 'Jawa Timur', 'Analisis perlakuan S1 – Akuntansi persedian obat berdasarkan metode fifo dalam meningkatkan laba usaha kesehatan (Pada klinik idaman As\'adiya semberejo banyuputih situbondo)', 'Terverifikasi', NULL, NULL),
(256, '2024', '2020205004', 'Isoiyyatun Itfiyah', '-', 1, 'Bungatan', 'Situbondo', 'Jawa Timur', 'Pengaruh Modal Kerja dan Struktur Modal Terhadap Profitabilitas Perusahaan (Studi Kasus Pada Perusahaan Food And Baverage Yang Terdaftar Di BEI Tahun 2020-2023)', '', NULL, NULL),
(257, '2024', '2020205005', 'Novi Putri Nur Syarifah', '-', 1, 'Arjasa', 'Situbondo', 'Jawa Timur', 'Pengaruh Struktur Kepemilikan dan Kinerja Perusahaan Terhadap Return Saham Pada Indeks Perusahan Mes-BUMN 17 Yang tercatat di Bursa Efek Indonesia (BEI) Tahn 2023', 'Terverifikasi', NULL, NULL),
(258, '2024', '2020205006', 'Nur Aisyah', '-', 1, 'Grujugan', 'Bondowoso', 'Jawa Timur', 'Pengaruh Arus Kas Operasi Dan Laba S1 – Akuntansi Terhadap Return Saham Pada Perusahaan IDX-MES BUMN 17 yang Terdaftar di Bursa Efek Indonesia (BEI) Tahun 2022-2023', 'Terverifikasi', NULL, NULL),
(259, '2024', '2020205008', 'Nur Khalisah', '-', 1, 'Arjasa ', 'Sumenep', 'Jawa Timur', 'Analisis Mekanisme Penyaluran Dana Kredit Usaha rakyat (KUR) Dalam Meningkatkan Kinerja UMKM Masyarakat Kecamatan arjasa Kangean Sumenep (Studi Kasus di Bank BRI Unit Cabang Kangean)', '', NULL, NULL),
(260, '2024', '2020205009', 'Nuril Laili Kamila', '-', 1, 'Asembagus', 'Situbondo', 'Jawa Timur', 'Pengaruh Pengungkapan ESG (Environmental, Social, and Governance) Terhadap Kinerja Keuangan Perusahaan Yang Terdaftar di Beli (Bursa Efek Indonesia)', 'Terverifikasi', NULL, NULL),
(261, '2024', '2020205010', 'Nurul Lailatul Hasanah', '-', 1, 'Sukowono', 'Jember', 'Jawa Timur', 'Pengaruh Dewan Komisaris, Dewan Direksi dan Komite Audit Terhadap Kinerja Perusahaan Pada Perusahaan BUMN Yang Terdaftar Di ID-MES BUMN Periode 2023', 'Terverifikasi', NULL, NULL),
(262, '2024', '2020205012', 'Rika Nursafitri', '-', 1, 'Sampang', 'Sumenep', 'Jawa Timur', 'Analisis laporan Keuangan Pondok Pesantren Darul Mukhlisin Panggung Sampang Berdasarkan Pedoman S1 – Akuntansi Pesantren', 'Terverifikasi', NULL, NULL),
(263, '2024', '2020205013', 'Rodiyatun Nabila', '-', 1, 'Panji', 'Situbondo', 'Jawa Timur', 'Analisis Perlakuan S1 – Akuntansi Rahn Kendaraan Berdasarkan PSAK 107 (Studi Kasus Pada KSPPS BMT NU Cabang Mangaran Situbondo)', 'Terverifikasi', NULL, NULL),
(264, '2024', '2020205014', 'Selshabila Agustina', '-', 1, 'Wongsorejo', 'Banyuwangi', 'Jawa Timur', 'Pengaruh Kemudahan dan Manfaat terhadap Minat Nasabah Menggunakan Banking di BSI Banyuwangi', 'Terverifikasi', NULL, NULL),
(265, '2024', '2020205015', 'Shofiatul Arifah', '-', 1, 'Asembagus', 'Situbondo', 'Jawa Timur', 'Analisis Perbedaan Kinerja Sukuk dan Obligasi Pada Perusahaan Yang Terdaftar  Di Bursa Efek Indonesia', 'Terverifikasi', NULL, NULL),
(266, '2024', '2020205016', 'Sitti Halimah', '-', 1, 'Arjasa', 'Sumenep', 'Jawa Timur', 'Analisis Penentuan Harga Pokok Produksi Dengan Metode Full Costing dan Activity Based Costing Di CV. R.A Jaya Arjasa Kangean', 'Terverifikasi', NULL, NULL),
(267, '2024', '2020205017', 'Sofiyatul Hasanah', '-', 1, 'Pujer', 'Bondowoso', 'Jawa Timur', 'Implementasi S1 – Akuntansi Istishna\' (PSAK 104) Pada PT Anugerah Berkah Rahmad Bondowoso', 'Terverifikasi', NULL, NULL),
(268, '2024', '2020205018', 'Sri Wulandari', '-', 1, 'Asembagus', 'Situbondo', 'Jawa Timur', 'Analisis Pelaporan Keuangan MTs AS\'-ADIYAH Berdasarkan Interpretasi Standar S1 – Akuntansi Keuangan (ISAK) No. 35 di Dusun Belikeran Desa Kertosari Kecamatan Asembagus Kabupaten Situbondo', '', NULL, NULL),
(269, '2024', '2020205019', 'Uswatun Hasanah', '-', 1, 'Arjasa', 'Sumenep', 'Jawa Timur', 'Urgensi Independensi dan Profesional Auditor Dalam Praktik Audit Keuangan dan Kekayaan Pesantren Pada BPK2M Sukorejo Situbondo', 'Terverifikasi', NULL, NULL),
(270, '2024', '2020205020', 'Yuliyana', '-', 1, 'Kangean', 'Sumenep', 'Jawa Timur', 'Pengaruh Tingkat Kesehatan Bank dan Indeks Maqashid Syariah Terhadap Profit Profitabilitas Pada Perbankan Yang Terdaftar Di BEI', 'Terverifikasi', NULL, NULL),
(271, '2024', '2020205021', 'Ziana Zain', '-', 1, 'Arjasa', 'Kangean', 'Jawa Timur', 'Analisis Kinerja Berdasarkan Balanced Scorecard Pada KSPPS BMT UGT Nusantara Cabang Kangean', 'Terverifikasi', NULL, NULL),
(272, '2024', '2020203001', 'Ach. Ubaidillah Al-Ghifari', '-', 3, 'Glenmore', 'Banyuwangi', 'Jawa Timur', 'Perspektif Ekonomi Islam Tentang Mekanisme Pertukaran Valuta Atau Money Changer (As Sharf) Studi Kasus Di Tempat Pertukaran Valuta Asing PT. Hamdalah Di Desa Mimbaan, Kecamatan Panji, Kabupaten Situbondo', 'Terverifikasi', NULL, NULL),
(273, '2024', '2020203003', 'Ahmad Febri Adi', '-', 3, 'Arjasa', 'Sumenep', 'Jawa Timur', 'Implementasi Akad Mudhorabah Pada Investasi dalam Perspektif Ekonomi Syariah', 'Terverifikasi', NULL, NULL),
(274, '2024', '2020203004', 'Ahmad Firdaus', '-', 3, 'Tanjung Bumi', 'Bangkalan', 'Jawa Timur', 'Analisis Strategi Pelayanan Islami Dalam Meningkatkan Loyalitas Konsumen Toko Torpong Mart Tanjung Bumi Bangkalan', '', NULL, NULL),
(275, '2024', '2020203036', 'Aisyah', '-', 3, 'Balung', 'Jember', 'Jawa Timur', 'Implementasi Akad Wadi\'ah Pada Produk Sajadah Dalam Meningkatkan Minat Menabung Nasabah (Studi Kasus KSPPS BMT NU Jawa Timur Cabang Balung Jember', 'Terverifikasi', NULL, NULL),
(276, '2024', '2020203037', 'Aisyatul Mustafidah', '-', 3, 'Pakusari', 'Jember', 'Jawa Timur', 'Analisis Peran Wisata Edukasi TPA PAku Sari Dalam Meningkatkan Kesejahteraan Ekonomi Umat Studi Kasus Tempat Pembuangan Akhir (TPA) Paku Sari Jember', 'Terverifikasi', NULL, NULL),
(277, '2024', '2020203038', 'Ana Alya Maghfiroh', '-', 3, 'Wonosari', 'Bondowoso', 'Jawa TImur', 'Implementasi Marketing Syariah pada Produk Tabungan Mudharabah (TABAH) dalam Meningkatkan Minat Menabung Anggota di KSSPS BMT NU Jawa Timur Cabang Wonosari Bondowoso', 'Terverifikasi', NULL, NULL),
(278, '2024', '2020203039', 'Ayu Martinas', '-', 3, 'Arjasa', 'Situbondo', 'Jawa Timur', 'Strategi Pengembangan Sumber Daya Insani (SDI) Dalam Meningkatkan Kinerja Karyawan (Studi kasus di BMT NU Cabang Klabang Bondowoso)', 'Terverifikasi', NULL, NULL),
(279, '2024', '2020203009', 'Badrut Tamam', '-', 3, 'Pragaan', 'Sumenep', 'Jawa Timur', 'Analisis Strategi Pemasaran Syariah Dalam Membangun Loyalitas Konsumen Di Koppontren Produksi Air Minum Dalam Kemasan (AMDK) Merek Chellep Di Desa Sentol Laok Pragaan Sumenep', 'Terverifikasi', NULL, NULL),
(280, '2024', '2020203040', 'Dalilatul Hasanah', '-', 3, 'Banjar Barat', 'Sumenep', 'Jawa Timur', 'Analisis Motivasi Masyarakat dalam Melakukan Pembiayaan Mudharabah di BMT NU Jawa Timur Cabang Utama Gapura Sumenep', '', NULL, NULL),
(281, '2024', '2020203041', 'Deli Siti Rofikoh', '-', 3, 'Kalianyar', 'Bondowoso', 'Jawa Timur', 'Analisis Starategi Pemasaran Islami Produk Tabah (Tabungan Mudhorobah) Dalam Meningkatkan Jumlah Nasabah Di BMT NU Cabang Klabang Bondowoso', '', NULL, NULL),
(282, '2024', '2020203042', 'Eka Winaria', '-', 3, 'Montong Gading', 'Lombok Timur', 'Nusa Tenggara Barat', 'Perspektif Ekonomi Islam terhadap Peran Koperasi Insan Tani dalam Memenuhi Kebutuhan Anggota dan Masyarakat di Desa Kilang Kecamatan Montong Gading Nusa Tenggara Barat', '', NULL, NULL),
(283, '2024', '2020203012', 'Faikur Rahman', '-', 3, 'Gayam', 'Sumenep', 'Jawa Timur', 'Pengaruh Religiusitas dan Pelayanan Terhadap Loyalitas Nasabah Tabungan Mudhorobah Di KSPPS BMT NU Jawa Timur Cabang Gayam Sapudi Sumenep', '', NULL, NULL),
(284, '2024', '2020203013', 'Faiqur Rahman', '-', 3, 'Gapura', 'Sumenep', 'Jawa Timur', 'Strategi Pemasaran Syariah di Ibahim Aqiqah Cabang Sumenep Dalam Meningkatkan Loyalitas Konsumen', 'Terverifikasi', NULL, NULL),
(285, '2024', '2020203043', 'Fitriatus Sakdiyah', '-', 3, 'Tamanan', 'Bondowoso', 'Jawa Timur', 'Implementasi Strategi Pemasaran Islami dalam Meningkatkan Minat Nasabah (Studi Kasus di BMT Maslahah Cabang Sumberjambe Jember)', 'Terverifikasi', NULL, NULL),
(286, '2024', '2020203016', 'Hasbiyal Maulana', '-', 3, 'Jembrana', 'Jembrana', 'Bali', 'Implementasi akad mudharabah terhadap produk (tabah) tabungan mudharabah di KSPP.Syariah BMT NU jawa timur cabang besuki situbondo', 'Terverifikasi', NULL, NULL),
(287, '2024', '2020203044', 'Hilyatun Nisak', '-', 3, 'Ra\'as', 'Sumenep', 'Jawa Timur', 'Analisis Mekanisme Tabungan Sidik Fathonah (Simpanan Pendidikan Fathonah) Menggunakan Akad Mudharabah Muthlaqah di KSPP. Syariah BMT NU Jawa Timur Cabang Wongsorejo 1 Banyuwangi Strategi Pemasaran Syariah Dalam Upaya Meningkatkan Penjualan Produk Kerupuk', 'Terverifikasi', NULL, NULL),
(288, '2024', '2018203016', 'Holilur Rohman Sholeh', '-', 3, 'Jangkar', 'Situbondo', 'Jawa Timur', 'Strategi Pemasaran Syariah Dalam Upaya Meningkatkan Penjualan Produk Kerupuk Hor (Studi Kasus di UD HOR Desa Jangkar Kecamatan Jangkar Kabupaten Situbondo)', '', NULL, NULL),
(289, '2024', '2020203045', 'Intan Salmawati', '-', 3, 'Ketapang', 'Ketapang', 'Kalimantan Barat', 'Analisis Faktor Yang Mempengaruhi Nasabah Dalam Memilih Pembiayaan Di BMT UGT Nusantara Cabang Ketapang Kalimantan Barat', 'Terverifikasi', NULL, NULL),
(290, '2024', '2020203046', 'Kharismatul Ummah', '-', 3, 'Kabat', 'Banyuwangi', 'Jawa Timur', 'Pengaruh Legalitas Usaha dan Labelisasi Halal terhadap Tingkat Volume Penjualan Produk Kosmetik Wardah Skincare (Studi Kasus pada Market Penjualan di Daerah Banyuwangi)', 'Terverifikasi', NULL, NULL),
(291, '2024', '2020203018', 'Kholilurrahman', '-', 3, 'Nonggunong', 'Sumenep', 'Jawa Timur', 'Implementasi Strategi Pelayanan Dalam Meningkatkan Kepuasan Pelanggan Pada (PLTD) DI Pulau Manuk Desa Sonuk Kec. Nunggunung Kab. Sumenep Dalam Perspektif Ekonomi Islam', '', NULL, NULL),
(292, '2024', '2020203047', 'Ladila Istiqamah', '-', 3, 'Arjasa', 'Sumenep', 'Jawa Timur', 'Implementasi Strategi Pemasaran Islami Untuk Meningkatkan Penjualan Di Pasar Pao Desa Angkatan Rabe Kecamatan Arjasa Kangean', 'Terverifikasi', NULL, NULL),
(293, '2024', '2020203048', 'Laila Selviana', '-', 3, 'Banyuputih', 'Situbondo', 'Jawa Timur', 'Pengaruh Profitabilitas Sistem Bagi Hasil dan Pelayanan Islami Terhadap Minat Nasabah Berinvestasi di KSPP. Syariah BMT NU Jawa Timur Cabang 1 Wongsorejo', 'Terverifikasi', NULL, NULL),
(294, '2024', '2020203050', 'Lailatul Humaira', '-', 3, 'Batu Bulan', 'Mataram', 'Lombok Barat', 'Analisis Manajemen Tabungan Koperasi Syariah Dalam Menngkatkan Kesejahteraan Anggota (Studi Kasus BMT Al Iktishady BTN Mavila Bajur Labuapi Lombok Barat Nusa Tenggara Barat)', 'Terverifikasi', NULL, NULL),
(295, '2024', '2020203049', 'Lailatus Zahro', '-', 3, '-', 'Jember', 'Jawa Timur', 'Strategi Pemasaran Produk TARAWI (Tabungan Ukhrawi) dalam Meningkatkan Minat Menabung di BMT NU Cabang Klabang Kabupaten Bondowoso', '', NULL, NULL),
(296, '2024', '2020203051', 'Luluk Awwaliyah', '-', 3, 'Arjasa', 'Sumenep', 'Jawa Timur', 'Pengaruh Promosi dan Pelayanan Islami Terhadap Kepuasan Nasabah dalam Menabung di BMT NU Kangean', 'Terverifikasi', NULL, NULL),
(297, '2024', '2020203019', 'M. Ilham Qutsy', '-', 3, 'Kalisat', 'Jember', 'Jawa Timur', 'Strategi Pelayanan Pembukaan Rekening Online Pada Produk Tabungan Easy Wadi\'ah Dalam Meningkatkan Kepuasan Nasabah Di Bank Syariah Indonesia (BSI) Kantor Fungsional Funding (KFF) Pondok Pesantren Salafiyah Syafi\'iyah Sukorejo Situbondo', 'Terverifikasi', NULL, NULL),
(298, '2024', '2020203053', 'Madinatun Munawwarah', '-', 3, 'Gerokgak', 'Buleleng', 'Bali', 'Strategi Pemasaran Syariah Produk Cicil Emas Dalam Meningkatkan Minat Nasabah di Bank Syariah Indonesia KCP Banyuwangi S. Parman', '', NULL, NULL),
(299, '2024', '2020203054', 'Mahsuniatul Wasila', '-', 3, 'Sumenep', 'Sumenep', 'Jawa Timur', 'Analisis Strategi Pemasaran Produk Sinanum (Simpanan Haji dan Umrah) Dalam Meningkatkan Minat Nasabah di PT. BPRS Fajar sejahtra Kecamatan Kuta Badung Provinsi Bali', '', NULL, NULL),
(300, '2024', '2020203055', 'Maisatul Uhdiah', '-', 3, 'Cermee', 'Bondowoso', 'Jawa Timur', 'Pengaruh Pelayanan Islami dan Promosi Terhadap Minat Nasabah Menabung pada BMT NU Jawa Timur Cabang Kalipuro Banyuwangi', '', NULL, NULL),
(301, '2024', '2019203010', 'Matrosul', '-', 3, '-', '-', '-', 'Analisis Produk Pembiayaan Murabhahah Di KSPP. Syariah BMT NU Jawa Timur Cabang Kalisat Jember', '', NULL, NULL),
(302, '2024', '2020203021', 'Moh. Haidir Ali', '-', 3, 'Ra\'as', 'Sumenep', 'Jawa Timur', 'Implementasi Etos Kerja Islam Terhadap Kinerja Karyawan Kerambak Apung Sidomampir Di Desa Guwa-Guwa Kecamatan Ra\'as Kabupaten Sumenep', '', NULL, NULL),
(303, '2024', '2020203023', 'Mohammad Noval Abdullah', '-', 3, 'Kalisat', 'Jember ', 'Jawa Timur', 'Implementasi Akad Rahn pada Produk Pembiayaan di KSPPS BMT NU Jawa Timur Cabang Kalisat Jember Ditinjau dari Ekonomi Syariah', '', NULL, NULL),
(304, '2024', '2020203025', 'Muhamad Ariadi', '-', 3, 'Praya', 'Lombok Tengah', 'Nusa Tenggara Barat', 'Implementasi Pembiayaan dalam Usaha Masyarakat pada Bank Wakaf Mikro Ahmad Taqiuddin Mansur Lombok (BWM ATQIA)', '', NULL, NULL),
(305, '2024', '2020203027', 'Muhammad Kinan Taufiqur Rizki', '-', 3, 'Ledokombo', 'Jember', 'Jawa Timur', '\"Analisis Strategi Pemasaran Syariah Pada Produk Tabungan Mudlarabah (Tabah) Dalam Meningkatkan Minat Nasabah DI KSPP. Syariah BMT NU Jawa Timur Cabang Kalisat Jember', 'Terverifikasi', NULL, NULL),
(306, '2024', '2020203057', 'Munica Salsabila', '-', 3, 'Denpasa', 'Bangkalan', 'Jawa Timur', 'Analisis Penetapan Harga Jual Dalam Meningkatkan Profitabilitas Di Toko Hamdalah Asy-Syansiah Denpasar Bali', 'Terverifikasi', NULL, NULL),
(307, '2024', '2020203059', 'Nuril Habiba', '-', 3, 'Jangkar', 'Situbondo', 'Jawa Timur', 'Implementasi Akad Rahn Sebagai Produk Financing di BMT NU Jawa Timur Cabang Jangkar Situbondo dalam Meningkatkan Ekonomi Masyarakat', 'Terverifikasi', NULL, NULL),
(308, '2024', '2020203060', 'Nurul Azmi', '-', 3, 'Arjasa', 'Sumenep', 'Jawa Timur', 'Implementasi Strategi Pelayanan Islami dalam Meningkatkan Kepuasan Nasabah pada BMT UGT Nusantara Cabang Kangean Arjasa Sumenep Jawa Timur', 'Terverifikasi', NULL, NULL),
(309, '2024', '2020203061', 'Putri Diyah Ayu Lestari', '-', 3, 'Wongsorejo', 'Banyuwangi', 'Jawa Timur', 'Analisis Strategi Layanan Islami Dalam Meningkatkan Kepuasan Nasabah Di KSPPS BMT NU Jawa Timur Cabang Grujugan Bondowoso', '', NULL, NULL),
(310, '2024', '2020203062', 'Rifka Maufiroh', '-', 3, 'Pujer', 'Bondowoso', 'Jawa Timur', 'Implementasi Pembiayaan Akad Rahn dalam Perspektif Ekonomi Islam di KSPPS BMT NU Jawa Timur Cabang Wonosari Bondowoso', '', NULL, NULL),
(311, '2024', '2020203063', 'Riqqotul Amaniah', '-', 3, 'Rajeg', 'Tangerang', 'Banten', 'Mekanisme Pasar Sebagai Upaya Untuk Menciptakan Keseimbangan Pasar Menurut Teori Ibnu Khaldun', '', NULL, NULL),
(312, '2024', '2020203065', 'Shofiyaturrisqiyah', '-', 3, 'Wongsorejo', 'Banyuwangi', 'Jawa Timur', 'Implementasi Pemanfaatan Teknologi E-Commerce Dalam Memasarkan Produk Lokal Perspektif Ekonomi Syariah (Studi Kasus Pada Warung Sofi Kacangan Asri Gombengsari Banyuwangi)', 'Terverifikasi', NULL, NULL),
(313, '2024', '2020203052', 'Siti Madinatul Munawarah', '-', 3, 'Singaraja ', 'Singaraja', 'Bali', 'Analisis Pelaksanaan Akad Muzara\'ah Pada Tanaman Cengkeh Perspektif Ekonomi Islam (Studi Kasus di Desa Pegayaman Singaraja Bali)', '', NULL, NULL),
(314, '2024', '2020203067', 'Sugi Firdayanti', '-', 3, 'Kalipuro', 'Banyuwangi', 'Jawa Timur', 'Pengaruh Kualitas Produk Dan Labelisasi Halal Terhadap Minat Beli Konsumen (Studi Kasus Warung kopi Sofi Gombeng Sari Kalipuro Bayuwangi)', '', NULL, NULL),
(315, '2024', '2020203068', 'Vivi Ade Listiana', '-', 3, 'Batanghari Nuban', 'Lampung Timur', 'Lampung', 'Analisis Mekanisme pada Produk Pembiayaan Tanpa Jaminan Layanan Berbasis Jama\'ah (LASISMA) (Studi Kasus di KSPP. Syari\'ah BMT NU Jawa Timur Cabang Wongsorejo 2 Banyuwangi)', '', NULL, NULL),
(316, '2024', '2020203069', 'Winda Wirdatus Solehah', '-', 3, 'Bangsal Sari', 'Jember', 'Jawa Timur', 'Implementasi Strategi Pemasaran Islami Dalam Mengembangkan Produk Asuransi Syariah Jiwa Bersama (AJB) Bumiputera 1912 Cabang Jember', 'Terverifikasi', NULL, NULL),
(317, '2024', '2020203070', 'Yuliati Faridah', '-', 3, 'Arjasa', 'Sumenep', 'Jawa Timur', 'Analisis Kinerja Manajemen keuangan pada Koperasi As-Shofiyah Al-Kayyis Asrama Ma\'had Aly Putri pondok Pesantren Salafiyah Syafi\'iyah Sukorejo Situbondo', '', NULL, NULL),
(318, '2024', '2019201004', 'Achmad Fauzi', '-', 2, '-', '-', '-', 'Analisis Upah Buruh Panen Padi Dalam Perspektif Hukum Ekonomi Syariah Di Desa Kampung Tengah Kecamatan Sukowono Kabupaten Jember', '', NULL, NULL),
(319, '2024', '2020201019', 'Agustinah', '-', 2, 'Kota Dayak', 'Pontianak', 'Kalimantan Barat', 'Analisis Hukum Islam Terhadap Penerapan Sanksi Pada Pencairan Deposito Mudharabah Sebelum Jatuh Tempo (Studi Kasus Di Bank Muamalah Pontianak)', 'Terverifikasi', NULL, NULL),
(320, '2024', '2020201021', 'Aldina Rohma', '-', 2, 'Bengkak', 'Banyuwangi', 'Jawa Timur', 'Tinjauan Hukum Ekonomi Syariah Terhadap Praktik Tasharuf Dana Sehat Di Pondok Pesantren Salafiya Syafiiyah Sukorejo Situbondo', 'Terverifikasi', NULL, NULL),
(321, '2024', '2020201022', 'Anisatul Choiroh ', '-', 2, 'Tlogosari ', 'Bondowoso', 'Jawa Timur', 'Perspektif Hukum Ekonomi Syariah Terhadap Praktik Arisan Online Dengan Sistem Menurun (Studi Kasus di Desa Kembang Kecamatan Tlogosari Kabupaten Bondowoso)', '', NULL, NULL),
(322, '2024', '2020201024', 'Ayu Musyarrofah', '-', 2, 'Grujugan', 'Bondowoso', 'Jawa Timur', 'Tinjauan Hukum Islam Terhadap Pemberian Bonus Pada Biaya Umroh Di Pt Baginda Support System Banyuwangi', 'Terverifikasi', NULL, NULL),
(323, '2024', '2020201006', 'Chandra Anditia', '-', 2, 'Asembagus ', 'Situbondo', 'Jawa Timur', 'Tinjauan Hukum Islam Terhadap Transaksi Jual Beli Jagung Borongan (Studi Kasus Di desa bantal kecamatan asembagus kabupaten situbondo)', '', NULL, NULL),
(324, '2024', '2020201026', 'Dewi Nur Fatima', '-', 2, 'Jangkar ', 'Situbondo', 'Jawa Timur ', 'Perspektif Hukum Ekonomi Syariah Terhadap Jual Beli Emas Dengan Sistem Tukar Tambah (Studi Kasus di Toko Srikandi Asembagus Kecamatan Asembagus Kabupaten Situbondo)', '', NULL, NULL),
(325, '2024', '2020201027', 'Elok Nur Adhiyatus Sofiah', '-', 2, 'Peragaan Laok', 'Sumenep', 'JawaTimur', 'Perspektif Hukum Ekonomi Syariah Terhadap Pemesanan Pakaian Di Konveksi Juki Tailor Desa Rembang Kecamatan Peragaan Daya Kabupaten Sumenep', 'Terverifikasi', NULL, NULL),
(326, '2024', '2020201028', 'Farah Lailatul Maulidiah', '-', 2, 'Sumber Jambe', 'Jember', 'Jawa Timur', 'Perjanjian Bisnis Waralaba Berdasarkan Hukum Positif Dan Hukum Ekonomi Syariah', '', NULL, NULL),
(327, '2024', '2020201008', 'Farid Mukarrim', '-', 2, 'Batu Layar', 'Lombok Barat', 'Nusa Tenggara Barat', 'Analisis Fatwa Dewan Syariah Nasional MUI No. 108/DSN-MUI/X/2016 Terhadap Penerapan Wisata Syariah (Studi Pada Destinasi Wisata Pantai Senggigi Kecamatan Batu Layar Kabupaten Lombok Barat)', '', NULL, NULL),
(328, '2024', '2020201029', 'Faridatul Qibtiyah', '-', 2, '-', 'Situbondo', 'Jawa Timur', 'Perspektif Hukum Islam Terhadap Akad Mu\'athah Di Toko Sembako Dzakira Mart (Studi Kasus di Kecamatan Sanur Kabupaten Denpasar)', 'Terverifikasi', NULL, NULL),
(329, '2024', '2020201030', 'Fitri Ayuni', '-', 2, '-', '-', 'Bali', 'Perspektif Hukum Islam Terhadap Praktik Utang Piutang Kelompok Kembang Wangi Di Desa TegalBadeng Timur Kecamatan Neagara Kabupaten Jembrana', 'Terverifikasi', NULL, NULL),
(330, '2024', '2020201032', 'Halimatus Sa\'diyah', '-', 2, 'Grujugan Kidul', 'Bondowoso', 'Jawa Timur', 'Perspektif Hukum Ekonomi Syari\'ah Terhadap Penentuan Harga Dan Hasil Jasa Loundry  (Studi Kasus Di Asrama Ma\'hadul Qur\'an Putri Pondok Pesantren Salafiyah Syafi\'iyah SUkorejo Situbondo)', 'Terverifikasi', NULL, NULL),
(331, '2024', '2020201033', 'Husnul Hotimah', '-', 2, 'Jemberana', 'Jemberana', 'Bali', 'Perspektif Hukum Ekonomi Syariah Terhadap praktik Bagi Hasil Panen Bawang Merah Dengan Akad Muzara\'ah (Studi Kasus di Dusun Mimbo Desa Sumberanyar Kecamatan Banyuputih Kabupaten Situbondo)', 'Terverifikasi', NULL, NULL),
(332, '2024', '2020201034', 'Kamilatul Kamila', '-', 2, 'Pujer ', 'Bondowoso', 'Jawa Timur', 'Perspektif Hukum Islam Terhadap Zakat Propesi (Al- Mal Almustafad) Pada Advokat Lbh Mitra Santri Situbondo ', '', NULL, NULL),
(333, '2024', '2020201035', 'Lailatul Zahro', '-', 2, 'Asembagus', 'Situbondo', 'Jawa Timur', 'Tinjauan Hukum Ekonomi Syariah Terhadap Jual Beli Barang Rongsokan Secara Rombongan (Studi Kasus di Desa Wiringin Anom Kecamatan Asembagus Kabupaten Situbondo)', 'Terverifikasi', NULL, NULL),
(334, '2024', '2020201036', 'Lina Lutfia', '-', 2, 'Wongsorejo', 'Banyuwangi', 'Jawa Timur', 'perspektif Hukum Ekonomi Syariah Terhadap Hybrid Contract Dalam Pelaksanaan Sewa-Menyewa Tanah (Studi Kasus di Desa Alasbulu Kecamatan Wongsorejo Kabupaten Banyuwangi)', 'Terverifikasi', NULL, NULL),
(335, '2024', '2020201053', 'Mariyatun Nisa\'', '-', 2, 'Banyuputih', 'Situbondo', 'Jawa Timur', 'Tinjauan Hukum Terhadap Pemberian Kupon Undian Berhadiah (Studi Kasus Toko Inda Mart Asembagus Situbondo)', 'Terverifikasi', NULL, NULL),
(336, '2024', '201611017', 'Moh. Arief Susanto Assyawali', '-', 2, 'Banyuputih', 'Situbondo', 'Jawa Timur', 'Penerapan Harga Jual beli Ikan Menurut Perspektif Hukum Islam Di KUD Mina Rahayu Dusun Mimbo Desa Sumberanyar Kecamatan Banyuputih Kabupaten Situbondo', '', NULL, NULL),
(337, '2024', '2020201037', 'Noer Dina Kamilia', '-', 2, 'Banyuputih', 'Situbondo', 'Jawa Timur', 'Perspektif Hukum Islam Terhadap Praktik Tabugan Paket Sembako Ramadhan Berhadiah Di Musa\'adah Peracangan Studi Kasus Di Desa Sumberejo Kecamatan Banyuputih Kabupaten Situbondo', 'Terverifikasi', NULL, NULL),
(338, '2024', '2020201038', 'Noviatul Khomariyah', '-', 2, 'Sumberjambe', 'Jember', 'Jawa Timur', 'Perspektif Hukum Islam Terhadap Praktik Penetapan Margin Dalam Penjualan Batik Di Tinjau Dari Kualitas (Studi Batik \'Labako\' UD. Bintang Timur Sumber Pakem Sumber Jambe Jember)', 'Terverifikasi', NULL, NULL),
(339, '2024', '2020201040', 'Nurul Iffah Nazirah ', '-', 2, 'Arjasa', 'Sumenep', 'Jawa Timur', 'Perspektif Hukum Ekonomi Syariah Terhadap Praktik Jual Beli Pasir di Desa Bilis-bilis (Studi Kasus di Desa Bilis-bilis Kecamatan Arjasa kabupaten Sumenep)', '', NULL, NULL),
(340, '2024', '2020201041', 'Nurul Imamah', '-', 2, 'Waru ', 'Pamekkasan', 'Jawa Timur', 'Perspektif Hukum Islam Terhadap Praktik Pembelian Barang Kebersihan (Studi Kasus di Asrama Ma\'hadul Qur\'an Putri Pondok Pesantren Salafiyah Safi\'iyah Sukorejo Situbondo)', '', NULL, NULL),
(341, '2024', '2020201043', 'Rina Apriliya ', '-', 2, 'Mayang', 'Jember', 'Jawa Timur', 'PERSPEKTIF HUKUM ISLAM TERHADAP PEMBERIAN CALON KEPAA DESA PRA PEMILIHAN KEPALA DESA (STUDI KASUS DI DESA MAYANG KECAMATAB MAYANG KABUPATEN JEMBER)', '', NULL, NULL),
(342, '2024', '2020201044', 'Rohmatul Khofifah', '-', 2, 'Asembagus', 'Situbondo', 'Jawa Timur', 'Perspektif Hukum Islam Terhadap Praktik Pembayaran Jasa Telepon Di Wartel Pusat Putri', 'Terverifikasi', NULL, NULL),
(343, '2024', '2020201045', 'Rufaidatul Abidah', '-', 2, 'Glagah', 'Lamongan', 'Jawa Timur', 'Tinjauan Hukum Islam Terhadap Praktik Lelang Barang Santri (Studi Kasus Di Asrama Tahfidzul Qur\'an Putri Pondok Salafiyah Syafi\'iyah Sukorejo Situbondo)', 'Terverifikasi', NULL, NULL),
(344, '2024', '2020201048', 'Sopiatul Widat', '-', 2, 'Negara ', 'Jemberana', 'Bali', 'Pandangan Hukum Islam Terhadap Penggunaan Uang Hasil Ta\'zir Bil Maal (Studi Kasus di Asrama Ma\'had Aly Putri Pondok Pesantren Salafiyah Syafi\'iyah Sukorejo Situbondo)', 'Terverifikasi', NULL, NULL),
(345, '2024', '2020201017', 'Syarif Hidayatullah', '-', 2, 'Jangkar', 'Situbondo', 'Jawa Timur', 'Perspektif Hukum Islam Terhadap Praktik Konsinyasi Kripik Singkong (Studi Kasus UD. Sekar Abadi  Desa Pesanggrahan Kecamatan Jangkar Kabupaten Situbondo)', 'Terverifikasi', NULL, NULL),
(346, '2024', '2020201049', 'Syerilika Nova Nofia Dinata', '-', 2, 'Kalisat', 'Jember', 'Jawa Timur', 'Peralihan Akad Sewa Kepada Pihak Lain Sebelum Jatuh Tempo Dalam Tinjauan Hukum Islam (Studi Kasus Di Desa Sumberejo Banyuputih Situbondo)', 'Terverifikasi', NULL, NULL),
(347, '2024', '2020201050', 'Ulfiyatun Yusila', '-', 2, 'Asembagus', 'Situbondo', 'Jawa Timur', 'Perspektif Hukum Islam Terhadap Praktek Jual Beli pupuk Organik Dalam Sistem Tekar (Studi Kasus di Desa Telemung Kecamatan Kalipuro Kabupaten Banyuwangi)', 'Terverifikasi', NULL, NULL),
(348, '2024', '2020201051', 'Waqiaturrafika', '-', 2, 'Arjasa', 'Sumenep', 'Jawa Timur', 'Perspektif Hukum Islam Terhadap Praktik Amil Zakat Non Lembaga (Studi kasus Pengelola Zakat Oleh Guru Ngaji di Desa Sambakti Kecamatan Arjasa Kabupaten Sumenep)', 'Terverifikasi', NULL, NULL),
(349, '2024', '2020201052', 'Yuni Nur Faiqoh', '-', 2, 'Mangaran', 'Situbondo', 'Jawa Timur', 'tinjauan Hukum ekonomi Syariah Terhadap Penyelesaian Wanprestasi Pembiayaan Qardhul Hasan (Studi Kasus BMT Maslahah Olean Situbondo)', 'Terverifikasi', NULL, NULL),
(350, '2024', '2020202001', 'Abd. Munif', '-', 4, 'Arjasa', 'Sumenep', 'Jawa Timur', 'Perspektif Hukum Islam Terhadap Hiburan Lodrok dalam Perayaan Walimatul \'Ursy (Studi Kasus di Desa Buddi Kecamatan Arjasa Kabupaten Sumenep)', 'Terverifikasi', NULL, NULL),
(351, '2024', '2020202007', 'Anam Ma\'ruf', '-', 4, 'Ra\'as', 'Sumenep', 'Jawa Timur', 'Perspektif Hukum Islam Tentang Tradisi Lalamaran Setelah Pernikahan', '', NULL, NULL),
(352, '2024', '2020202029', 'Anisatul Farah Firdausiyah', '-', 4, 'Wongsorejo', 'Banyuwangi', 'Jawa Timur', 'Tinjauan Hukum Islam Terhadap perceraian Ghoib (Studi Analisis Putusan Pengadilan Agama Banyuwangi Perkara Nomor 2500/PDT. G/2023/PA.Bwi)', '', NULL, NULL),
(353, '2024', '2020202010', 'Badrul Arifin', '-', 4, 'Prajekan', 'Bondowoso', 'Jawa Timur', 'Perspektif Hukum Islam Terhadap Tradisi Tukaran Cincin Saat Pertunangan (Studi Kasus Di Desa Bandilan Kecamatan Prajekan Kabupaten Bondowoso)', 'Terverifikasi', NULL, NULL),
(354, '2024', '2020202031', 'Elysa Fatmawati', '-', 4, 'Kalipuro', 'Banyuwangi', 'Jawa Timur', 'Putusan Perceraian Berdasarkan kekerasan Psikis Dalam Perspektif Hukum Islam Dan Hukum Positif (Studi Kasus Putusn Hakim No. 3129/Pdt.G/2023/PA.Bwi)', '', NULL, NULL),
(355, '2024', '2020202012', 'Fahrurrozi', '-', 4, 'Terara', 'Lombok Timur', 'Nusa Tenggara Barat', 'Perspektif Hukum Islam Terhadap Tradisi Sembeq Senggeteng Dalam Pernikahan (Studi Kasus Di Desa Wakan Kecamatan Jerowaru Kabupaten Lombok Timur Nusa Tenggara Barat)', '', NULL, NULL),
(356, '2024', '2020202013', 'Fithriyan Azhary', '-', 4, 'Darmayasa', 'Banjarnegara', 'Jawa Tengah', 'Perspektif Hukum Islam Terhadap Tradisi Larangan Adu Cocor Dalam Pernikahan (studi Kasus di Desa Darmayasya Kecamatan Pejawaran Kabupaten Banjarnegara)', '', NULL, NULL),
(357, '2024', '2019202019', 'Fudaili', '-', 4, '-', '-', '-', 'Perspektif Hukum Islam Terhadap Peran Istri Berpendidikan Tinggi Dalam Membangun Keluarga Sakinah (Studi Kasus Di Desa Pancor Kecamatan Gayam Kabupaten Sumenep)', '', NULL, NULL),
(358, '2024', '2020202032', 'Hanifatus Sa\'diyah', '-', 4, 'Situbondo', 'Situbondo', 'Jawa Timur', 'Tinjauan Hukum Islam Terhadap Tradisi Penarikan BE-Ghibe Dalam Perceraian (Studi Kasus Desa Mlandingan Kulon Kecamatan Mlandingan Kabupaten Situbondo)', '', NULL, NULL),
(359, '2024', '2020202015', 'Imam Malik', '-', 4, 'Bangkalan', 'Bangkalan', 'Jawa Timur', 'Studi Komperatif Anatara Madzhab Syafi\'iyah dan Madzhab Hanafiyah Tentang Hukum Menikahkan Anak di Luar Nikah Oleh Ayah Biologisnya', 'Terverifikasi', NULL, NULL),
(360, '2024', '2020202033', 'Imamatul Diniyah', '-', 4, 'Purikaja', 'Denpasar', 'Bali', 'Tinjauan Hukum Islam Terhadap Praktik Akad Nikah dengan Bahasa Isyarat atau Tulisan Bagi Tunawicara (Studi kasus di KUA Kecamatan Kuta Badung Bali', 'Terverifikasi', NULL, NULL),
(361, '2024', '2020202016', 'Khairul Anwar', '-', 4, 'Ra\'as', 'Sumenep', 'Jawa Timur', 'Analisis Pertimbangan Hakim Dalam Menolak Dispensasi Nikah Perkara Nomor 2013/Pdt. P/2023 (Studi Kasus Pengadilan Agama Kelas 1 Jember)', '', NULL, NULL),
(362, '2024', '2020202034', 'Khusnul Khotimah', '-', 4, 'Dewata', 'Buleleng', 'Bali', 'Perspektif Hukum Islam Tentang Putusan Hakim Nomor 555/Pdt. P/2023/Bdw Penetapan Wali Adhal Studi Kasus Pengadilan Agama Bondowoso', 'Terverifikasi', NULL, NULL),
(363, '2024', '2020202017', 'M. Fauzan Hadi', '-', 4, 'Praya Barat', 'Lombok Tengah', 'NTB', 'Perspektif Hukum Islam Terhadap Penarikan Kembali Harta Pemberian Dalam Tradisi \'Mereweh\' (stadi Kasus di Desa Kabol Kecamatan Praya Barat Daya Kabupaten Lombok Tengah Nusatenggara Barat)  ', '', NULL, NULL),
(364, '2024', '2020202024', 'M. Sahru Romadhon', '-', 4, 'Gianyar', 'Gianyar', 'Bali', 'Tinjauan Hukum Islam Terhadap Tingginya Biaya Pesta Pernikahan Walimatul \'Ursy (Studi Kasus di Lingkungan Pasdelem Kelurahan Gianyar Kabupaten Gianyar)', '', NULL, NULL),
(365, '2024', '2020202036', 'Mas Ipadatul Munawaroh', '-', 4, 'Air Kuning', 'Jemberana', 'Bali', 'Perspektif Hukum Islam dan Kompilasi Hukum Islam (KHI) Terhadap Taklik Thalak (Studi Kasus di Pengadilan Agama Bondowoso)', 'Terverifikasi', NULL, NULL),
(366, '2024', '2020202019', 'Moh. Koidulghurril Muhajjalin', '-', 4, 'Gianyar', 'Gianyar', 'Bali', 'Perspektif Hukum islam Terhadap peran Wanita Single ParentDalam Pemenuhan Nafkah (Studi kasus di Lingkungan Candi Baru Gianyar Bali)', 'Terverifikasi', NULL, NULL),
(367, '2024', '2020202020', 'Mohammad Amyal', '-', 4, 'Pujer', 'Bondowoso', 'Jawa Timur', 'PERSPEKTIF HUKUM ISLAM TERHADAP PUTUSAN HAKIM NOMOR: 1690/Pdt.G/2023/PA.CIT TENTANG GUGATAN HAK ASUH ANAK PASCA PERCERAIAN (STUDI KASUS DI PENGADILAN SITUBONDO)', '', NULL, NULL),
(368, '2024', '2020202037', 'Nazilatul Firdausil Jannah', '-', 4, 'Tapen', 'Bondowoso', 'Jawa Timur', 'Perspektif Hukum Islam Terhadap Praktik Menarik Kembali Barang Bawaan Setelah Adanya Perceraian (Studi Kasus di Desa Kaporan Kecamatan Wonosari Kabupaten Bondowoso) ', '', NULL, NULL),
(369, '2024', '2020202038', 'Noermala Khoirunnisa Haqque', '-', 4, 'Tapen ', 'Bondowoso ', 'Jawa Timur', 'Perspektif Maslahah Mursalah Pada Penerapan Batas Usia Nikah Dalam UUD No. 16 Tahun 2019 (Studi Kasus Di Desa Taal Kecamatan Tapen Kabupaten Bondowoso) ', '', NULL, NULL),
(370, '2024', '2020202039', 'Nor Elize', '-', 4, '-', 'Situbondo', 'Jawa Timur', 'Studi Komparatif Kitab Uqudullujain dan Tafsir Al-dhawi Terhadap Pemenuhan Hak dan Kewajiban Suami Istri long Distance mariage (LDM) di Desa Sumbertengah Kecamatan Bungatan Situbondo', '', NULL, NULL),
(371, '2024', '2020202040', 'Nur Azizah', '-', 4, 'Banyuputih', 'Situbondo', 'Jawa Timur', 'Perspektif Hukum Islam Tentang Dampak Penolakan Isbat Nikah terhadap Hak Istri Dan Status Anak (Studi Analisa Putusan Pengadilan Perkara No: 813/PDT. P/2023/PA. Kraksaan)', '', NULL, NULL),
(372, '2024', '2020202041', 'Nur Dina Kamelia', '-', 4, 'kotaanyar', 'Probolinggo', 'Jawa Timur ', 'Perspektif Hukum Islam Terhadap \'Iddah dan Ihdad Bagi Wanita Karier Studi Kasus di Desa Sumberejo Kecamatan Banyuputih Kabupaten Situbondo', '', NULL, NULL),
(373, '2024', '2020202042', 'Nur Fadilatul Munawaroh', '-', 4, 'Gunosari', 'Bondowoso', 'Jawa Timur', 'Perspektif Hukum islam Terhadap Pemberlakukan Iddah Bagi Laki-laki 9Studi kasus penerapan Surat Edaran Dirjen Bimas islam Nomor P-005/Dj. III/Hk.00.7/10/2021 di KUA Arjasa Situbondo', 'Terverifikasi', NULL, NULL),
(374, '2024', '2020202043', 'Nuris Zulfah Addalilah', '-', 4, 'Asembagus', 'Situbondo', 'Jawa Timur', 'Tinjauan Hukum Islam Terhadap Putusan Hakim Nomor 1580/PDT.G/2021/PA.BDW Tentang Izin Poligami (Studi Kasus Pengadilan Agama Bondowoso)', 'Terverifikasi', NULL, NULL),
(375, '2024', '2020202044', 'Rina Ayu Lianingsih', '-', 4, 'Jerowaru', 'Lombok Timur', 'NTB', 'Tinjauan Hukum Islam Tentang Nikah Paksa (Studi kasus di Desa kabol Kecamatan Praya Barat Daya Kabupaten Lombok Tengah, NTB)', '', NULL, NULL),
(376, '2024', '2020202046', 'Siti Halimatus Sya\'diyah', '-', 4, 'Lembar', 'Lombok Barat', 'Nusa Tenggara Barat', 'Perspektif Hukum Islam terhadap Putusan Pengadilan Agama Banyuwangi No. 2876/PDT.G/2023/PA. Bwi Tentang Kumulasi Isbat Nikah dan Cerai Gugat)', '', NULL, NULL),
(377, '2024', '2020202027', 'Syaiful Bahri', '-', 4, 'Raas', 'Sumenep', 'JAWA TIMUR', 'PERSPEKTIF HUKUM ISLAM TERHADAP PEMENUHAN NAFKAH ISTRI BAGI SUAMI SEORANG PELAYAR (STUDI KASUS DE DESA KETUPAT KECAMATA RAAS KABUPATEN SUMENEP)', 'Terverifikasi', NULL, NULL),
(378, '2024', '2020202047', 'Trisna Egi Nuris Syamsih', '-', 4, 'Sumberjambe', 'jember', 'Jawa Timur', 'Perspektif Hukum Islam Terhadap Praktik Kontrak Muhalil (Studi Kasus di Desa Cumedek Kecamatan Sumberjambe Kabu', 'Terverifikasi', NULL, NULL),
(379, '2024', '2020202048', 'Uslifatul Jannah', '-', 4, 'Arjasa', 'Sumenep', 'Jawa Timur', 'Perspektif Hukum Islam Tentang Putusan Hakim No. 0884/PDT. P/2023/PA.Bwi Terhadap Penetapan Anak Hasil Dari Nikah Siri (Studi Kasus Pengadilan Agama Banyuwangi)', '', NULL, NULL),
(380, '2024', '2020204001', 'Abd. Wafi', '-', 5, 'Botolinggo', 'Bondowoso', 'Jawa Timur', 'Implementasi Strategi Promosi Syariah Dalam Meningkatkan Volume Penjualan Air Minum Kemasan A3 Fresh 02 (Studi kasus CV. Karunia Jaya Curahdami Kabupaten Bondowoso)', '', NULL, NULL),
(381, '2024', '2020204007', 'Ahmad Rian Efendi', '-', 5, 'Jemberana', 'Jemberana', 'Bali', 'Strategi Pemasaran Syariah Dalam Menghadapi persaingan Bisnis (Studi Kasus Dalam Rumah Makan Restu Bundo Di Pulukan Jemberana BALI)', 'Terverifikasi', NULL, NULL),
(382, '2024', '2019204011', 'Aidi Rifqi Zuhdi', '-', 5, '-', 'Sumenep', 'Jawa Timur', 'Implementasi Strategi Promosi Syariah dalam Meningkatkan Minat Konsumen (Studi Kasus Pada Toko Alfa Barokah Desa Gayam Kecamatan Gayam Kabupaten Sumenep Provinsi Jawa Timur)', '', NULL, NULL),
(383, '2024', '2020204053', 'A\'is Mulie Wuni Sapoan', '-', 5, 'Batukliang', 'Lombok Tengah', 'Nusa Tenggara Barat', 'Analisis Strategi Marketing Syariah Dalam Upaya Meningkatkan Omset Penjualan', '', NULL, NULL),
(384, '2024', '2020204054', 'Alvarizoi Sita Oemardi', '-', 5, 'Rambipuji', 'Jember', 'Jawa Timur', 'Pengaruh Persendian Barang dan Volume Penjuawalan Terhadap Laba Perusahaan (Studi Kasus UD. Vira ABC Sukorambi Jember)', '', NULL, NULL),
(385, '2024', '2020204055', 'Anti Sabariah', '-', 5, '-', 'Bangli', 'Bali', 'Analisis Swot Dalam Menghadapi Persaingan Bisnis Air Minum Dalam Kemasan Di CV. Hafas Pondok Pesantren Salafiyah Syafi\'iah Sukorejo', '', NULL, NULL),
(386, '2024', '2020204056', 'Dina Rukmana', '-', 5, 'Nunggunong', 'Sumenep', 'Jawa Timur', 'Implementasi Manajemen Sumber Daya Insani Dalam Meningkatkan Kinerja Karyawan', '', NULL, NULL),
(387, '2024', '2019204085', 'Faizatun Nikmah', '-', 5, 'Asembagus', 'Situbondo', 'Jawa Timur', 'Analisis Strategi Pemasaran Syariah Dalam Meningkatkan Omset Penjualan', 'Terverifikasi', NULL, NULL),
(388, '2024', '2020204014', 'Fanny Zainurrahman', '-', 5, '-', '-', '-', 'Implementasi Manajemen Sumber daya Insani Dalam Meningkatkan Kinerja karyawan Di UD. Sumber Rizky Situbondo', '', NULL, NULL),
(389, '2024', '2020204058', 'Faradilah Nur Sandi', '-', 5, '-', 'Jember', 'Jawa Timur', 'Implementasi Etika Bisnis Islam Terhadap Kinerja Karyawan Dalam Meningkatkan Volume Penjualan Di UD Jaya Utama Textile Kaliwates Jember', 'Terverifikasi', NULL, NULL),
(390, '2024', '2020204017', 'Habibi', '-', 5, '-', '-', '-', 'Strategi Pemasaran Syariah Dalam Meningkatkan Minat Beli Konsumen (Studi Kasus Di Gudang Ikan Sepangkor Besar Kecamatan Sapeken Kabupaten Sumenep)', '', NULL, NULL),
(391, '2024', '2020204019', 'Hafidi Mujtahid', '-', 5, 'Arjasa', 'Sumenep', 'Jawa Timur', 'Strategi Pemasaran Syariah Pada Produk Murabahah Dalam Meningkatkan Minat Nasabah (Studi Kasus di BMT UGT Nusantara Capem Angkatan Sumenep)', 'Terverifikasi', NULL, NULL),
(392, '2024', '2020204060', 'Halli Anna Rafika', '-', 5, 'Arjasa', 'Sumenep', 'Jawa Timur', 'Analisis Implementasi Pelayanan Islami Dalam Meningkatkan Kepuasan Konsumen (Studi Kasus Di Swalayan Al Ikhlas Arjasa Kecamatan Arjasa Kabupaten Sumenep)', '', NULL, NULL),
(393, '2024', '2020204061', 'Hesti Wardani', '-', 5, 'Kapongan', 'Situbondo', 'Jawa Timur', 'Implementasi Manajemen Sumber Daya Insani (MSDI) Dalam Meningkatkan Kualitas Pelayanan Tour Leader (Studi Kasus PT.Faroq Sulaiman Al-Fatah Tours & Travel Bondowoso)', 'Terverifikasi', NULL, NULL),
(394, '2024', '2020204021', 'Husin Saifudin', '-', 5, 'Denpasar Barat', 'Denpasar', 'Bali', 'Implementasi Prinsip Etika Bisnis Islam Dalam Meningkatkan Kualitas Pelayanan (Studi Kasus DI Kedai Kopi Dari Hati LYA Denpasar)', '', NULL, NULL),
(395, '2024', '2020204022', 'Ifdarus Surur', '-', 5, 'Kuta', 'Badung', 'Bali', 'Pengaruh Kepemimpinan Islami dan Motivasi Kerja Terhadap Karyawan di PT. BANK Syariah Indonesia KCP. Situbondo Basuki Rahmat', '', NULL, NULL),
(396, '2024', '2020204063', 'Kharomatul Auliya', '-', 5, '-', 'Bangkalan ', 'Jawa Timur ', 'Strategi Pemasaran Syariah Tour And Travel Haji dan Umroh Dalam Menarik Minat Calon Jama\'ah Pada PT. Tulus Hijrah Baitullah Banyuwangi', '', NULL, NULL),
(397, '2024', '2020204064', 'Khoirotun Nisa', '-', 5, 'Grujugan ', 'Bondowoso', 'Jawa Timur', 'Peran Pemerintah Dalam Menjaga Stabilitas Harga Bahan Pokok Di Pasar (Studi Kasus Dinas Koperasi, Perindustrian dan Perdagangan Kabupaten Bondowoso)', '', NULL, NULL),
(398, '2024', '2020204066', 'Latifatul Hasana', '-', 5, 'Jangkar', 'situbondo', 'Jawa Timur', 'Analisis strategi Pemasaran Syariah Dalam Mempertahankan Eksistensi Usaha Di Lva Boutique Kecamatan asembagus Kabupaten situbondo', '', NULL, NULL),
(399, '2024', '2020204067', 'Linda Ismawati', '-', 5, 'Tlogosari', 'Bondowoso', 'Jawa Timur', 'Implementasi Manajemen Produksi Syariah Dalam Upaya Meningkatkan Kualitas Produk Tas (Studi Kasus Home Industri Pabrik Tas Kiki Collection di Desa Mengok Kecamatan Pujer Kabupaten Bondowoso)', '', NULL, NULL),
(400, '2024', '2020204069', 'Mimin Putri Alifiyani', '-', 5, 'Blimbingsari', 'Banyuwangi', 'Jawa Timur', 'Efektivitas Pemberian Reward dan Punshment dalam Gaya Kepemimpinan Pada Karyawan (Studi kasus PT. Faroq Sulaiman Al Fatah Tours & Travel Bondowoso)', 'Terverifikasi', NULL, NULL),
(401, '2024', '2020204029', 'Moh. Ainul Fikri', '-', 5, 'Kalisat', 'Jember', 'Jawa Timur', 'PENGARUH ISLAMIC BRANDING DAN KUALITAS PELAYANAN ISLAMI TERHADAP KEPUASAN KONSUMEN AL MUBAROK CABANG KALISAT JEMBER', 'Terverifikasi', NULL, NULL),
(402, '2024', '2020204030', 'Moh. Jawwadur Rahman', '-', 5, 'Banyuputih', 'Situbondo', 'Jawa Timur', 'Strategi Pengembangan Usaha Terhadap Kemandirian Ekonomi Pesantren (Studi Kasus Unit Usaha Pndok Pesantren Nurul Qornain Jember)', 'Terverifikasi', NULL, NULL),
(403, '2024', '2020204070', 'Mufidatul Arsita', '-', 5, '-', 'Bondowoso', 'Jawa Timur', 'Implementasi Pelayanan Islami Dalam Meningkatkan Minat Nasabah', '', NULL, NULL),
(404, '2024', '2020204035', 'Muhammad Agung Putra', '-', 5, 'Candipuro', 'Lumajang', 'Jawa Timur', 'Analisis Strategi Promosi Syariah Melalui Digital Marketing Untuk Meningkatkan Minat Konsumen (Studi Kasus Di Kedai Kopi Dari Hati LYAA Denpasar Bali)', 'Terverifikasi', NULL, NULL),
(405, '2024', '2020204038', 'Muhammad Sulaiman Faqih', '-', 5, 'Jangkar', 'Situbondo', 'Jawa Timur', 'Analisis STrategi Promosi Syari\'ah Melalui Media Sosial Dalam Meningkatkan Daya Tarik Konsumen Di Kedai Siring Jangkar Situbondo', 'Terverifikasi', NULL, NULL),
(406, '2024', '2020204071', 'Nailul Insyiah', '-', 5, 'Balung', 'Jember', 'Jawa Timur', 'Pengaruh Marketing Strategy Of Social Media dan Service Exellent Terhadap Profitabilitas Kelompok Usaha Bersama (KUBE) Desa Tutul Kecamatan Balung Kabupaten Jember', '', NULL, NULL),
(407, '2024', '2020204039', 'Naufalul Abror', '-', 5, 'Sumbermalang', 'Situbondo', 'Jawa Timur', 'Implementasi Manajemen Produksi Syariah Dalam Meningkatkan Produktifitas Kopi Arabica Di Pokmas Walida Green Argopure Desa Tlogosari Kecamatan Sumbermalang Kabupaten Situbondo', 'Terverifikasi', NULL, NULL),
(408, '2024', '2020204072', 'Ni\'matul Beliwoh', '-', 5, 'Tanjung  Bumi', 'Bangkalan', 'Jawa Timur', 'Analisis Strategi Penetapan Harga Terhadap Eksistensi Usaha Desain dan Printing di Jh\'s Design Keputih Surabaya', 'Terverifikasi', NULL, NULL),
(409, '2024', '2020204073', 'Nur Aini', '-', 5, '-', '-', '-', 'Analisis Manajemen Risiko Terhadap Digitalisasi Bisnis Pondok Pesantren (Studi Kasus Pondok Pesantren Nurul Amanah Bangkalan)', '', NULL, NULL),
(410, '2024', '2020204074', 'Nur Faqoh Istiqomah', '-', 5, 'Kapongan', 'Situbondo', 'Jawa Timur', 'Implementasi strategi Pelayanan Islami Dalam Meningkatkan Kepuasan Konsumen Di Cafe Titik Kumpul Reborn Panji Situbondo', 'Terverifikasi', NULL, NULL),
(411, '2024', '2020204075', 'Nuraisa Irmayanti', '-', 5, 'Banyuputih', 'Situbondo', 'Jawa Timur', 'Pengaruh Strategi Promosi Online terhadap Peningkatan Jumlah Pengunjung Domestik Pada Wisata Taman Nasional Baluran Situbondo', '', NULL, NULL),
(412, '2024', '2020204041', 'Nuril Iskandar', '-', 5, 'Ra\'as', 'Sumenep', 'Jawa Timur', 'Strategi Pengembangan Pariwisata Syariah Dalam Meningkatkan Ekonomi Masyarakat (Studi Kasus Wisata Religi KHR. As\'ad Syamsul Arifin Sukorejo Situbondo)', '', NULL, NULL),
(413, '2024', '2020204076', 'Qurrotul Aini', '-', 5, 'Jangkar', 'Situbondo', 'Jawa Timur', 'Strategi Manajemen Sumber Daya Insani Dalam Meningkatkan Kinerja Karyawan (Studi Kasus di UD Roti As-Sunnah Asembagus Situbondo)', 'Terverifikasi', NULL, NULL),
(414, '2024', '2020204077', 'Raudatul Jannah', '-', 5, 'Wongsorejo', 'Banyuwangi', 'Jawa Timur', 'Analisis Manajemen Produksi Syariah Dalam Meningkatkan Penjualan Air Oembole Di Cv Al-Mubarokah Kecamatan Wongserejo Kabupaten Banyuwangi', '', NULL, NULL),
(415, '2024', '2020204078', 'Reiza Ummami', '-', 5, 'Sandubaya', 'Mataram', 'NTB', 'Pengaruh Brand Image dan Kualitas Produk Terhadap Minat Beli Konsumen di UD.Abiantubuh Sandubaya Kota Mataram', 'Terverifikasi', NULL, NULL),
(416, '2024', '2020204044', 'Riski Rahmatullah ', '-', 5, '-', '-', '-', 'Strategi Promosi Syariah dalam Meningkatkan Volume Penjualan (Studi Kasus di Toko Jaya Makmur Collection Sukorambi Jember)', '', NULL, NULL),
(417, '2024', '2020204045', 'Riyadus Sholihin Robitullah', '-', 5, 'Kalisat', 'Jember', 'Jawa Timur', 'Strategi Digital Marketing Syariah Dalam Meningkatkan omset Penjualan di PT. Natural Nusantara Stockist Nasa P. 1806 Bondowoso', 'Terverifikasi', NULL, NULL),
(418, '2024', '2020204046', 'Robet Ulil Azmi', '-', 5, '-', 'Sumenep', 'Jawa Timur', 'Analisis Strategi Pelayanan islami Dalam Meningkatkan Kepuasan Pelanggan (Studi Kasus Resto Melita Kitchen Desa Kolor Kecamatan Kota Sumenep)', '', NULL, NULL),
(419, '2024', '2020204079', 'Roikal Aulya Kirani', '-', 5, 'Sukowono', 'Jember', 'Jawa Timur', 'Strategi Pengembangan Bumdes Dalam Upaya Meningkatkan Kesejahteraan Ekonomi Masyarakat (Studi BUMDes Dawuhan Mangli Sukowono Jember)', 'Terverifikasi', NULL, NULL),
(420, '2024', '2020204080', 'Rosida', '-', 5, 'Asembagus', 'Situbondo', 'Jawa Timur', 'Implementasi Strategi Pemesaran Syariah Dalam Meningkatkan Volume Penjualan (Studi Kasus Sk-Mart Jangkar Situbondo)', 'Terverifikasi', NULL, NULL),
(421, '2024', '2020204047', 'Sahrul', '-', 5, 'Sukadana', 'kayong Utara', 'Kalimantan Barat', 'Analisis Manajemen Produksi Syariah Dalam Meningkatakan Volume Penjualan Pada Industri kayu UD. AKAR DEWA JATI di Desa Karanganyar Kecamatan Kendit, Kabupaten Situbondo', '', NULL, NULL);
INSERT INTO `mahasiswas` (`id`, `lulusan`, `nim`, `nama`, `jk`, `prodi_id`, `kecamatan`, `kabupaten`, `provinsi`, `tugas_akhir`, `verifikasi`, `created_at`, `updated_at`) VALUES
(422, '2024', '2020204082', 'Sinta Nuriyah ', '-', 5, 'Wonosari', 'Bondowoso', 'Jawa Timur', 'Strategi Pemasaran Syariah Pada Produk Tabungan Mudharabah di KSPPS BMT NU Jawa Timur Cabang Wonosari Bondowoso', 'Terverifikasi', NULL, NULL),
(423, '2024', '2019204120', 'Sirri Arifah', '-', 5, 'Banyuputih', 'Situbondo', 'Jawa Timur', 'Analisis Strategi Promosi Syari\'ah dalam Peningkatan Eksistensi Volume Penjualan Parfum (di toko MW parfum Asembagus)', 'Terverifikasi', NULL, NULL),
(424, '2024', '2020204083', 'Siti Maisaroh', '-', 5, 'Jembrana', 'Jembrana', 'Bali', 'Implementasi Prinsip Etika Bisnis Islam Dalam Meningkatkan Minat Beli Konsumen Pada Rumah Makan Lesehan Kreteg Nyirang Kecamatan Negara Kabupaten Jembrana Provinsi Bali', 'Terverifikasi', NULL, NULL),
(425, '2024', '2020204084', 'Siti Nur Khofifah ', '-', 5, '-', 'Situbondo', 'Jawa Timur', 'Strategi Manajemen Kepemimpinan Islam Dalam Meningkatkan Kualitas Pelayanan (Studi Kasus Toko Roti As-Sunnah Asembagus Situbondo)', '', NULL, NULL),
(426, '2024', '2020204085', 'Sitti Rohimah', '-', 5, 'Wonosari', 'Bondowoso', 'Jawa Timur', 'Pengaruh Kualitas Pelayanan Dan Promosi Terhadap Kepuasan Nasabah', 'Terverifikasi', NULL, NULL),
(427, '2024', '2020204048', 'Supriyandi', '-', 5, '-', '-', '-', 'Strategi Pemasaran Syariah pada Air Mineral RA. Untuk Ekspansi Pasar diluar Pulau Kangean (Studi Kasus di CV. RA. Jaya Desa Sawah Sumur, Kecamatan Arjasa, Kabupaten Arjasa, kabupaten Sumenep)', '', NULL, NULL),
(428, '2024', '2020204086', 'Susi Susanti', '-', 5, 'Karangasem', 'Karangasem', 'Bali', 'Pengaruh Kualitas Pelayanan dan Citra Merek Terhadap Loyalitas Konsumen (Studi Kasus Toko Boshy Bakery Karangasem Bali)', 'Terverifikasi', NULL, NULL),
(429, '2024', '2020204088', 'Tiana Sari', '-', 5, 'Wongsorejo', 'Banyuwangi', 'Jawa Timur', 'Analisis Strategi Multi Branding Dalam Meningkatkan Minat Beli Konsumen Perspektif Manajemen Bisnis Syariah Pada Toko Republik Osing Banyuwangi', '', NULL, NULL),
(430, '2024', '2020204090', 'Ulinasi', '-', 5, '-', 'Bondowoso', 'Jawa Timur', 'Implementasi Strategi Pemasaran Syariah Dalam Minat Beli Konsumen Di Pabrik Tas Kiki Collection Pujer Bondowoso', '', NULL, NULL),
(431, '2024', '2020204050', 'Umar Hariadi', '-', 5, 'Batukliang', 'Lombok Tenngah', 'Nusa Tenggara Barat', 'Manajement Pengelolaan Zakat Produktif dalam Meningkatkan Kesejahteraan Ekonomi Mustahiq (Studi Kasus di BAZNAZ Lombok Tengah)', 'Terverifikasi', NULL, NULL),
(432, '2024', '2020204092', 'Wildatul Aluf', '-', 5, 'Arjasa', 'Sumenep', 'Jawa Timur', 'Pengaruh Kerja Ketersediaan Barang Terhadap Loyalitas Konsumen Di Toko Alfalis Arjasa Sumenep', 'Terverifikasi', NULL, NULL),
(433, '2024', '2019204068', 'Zainul Muid', '-', 5, 'Panji', 'Situbondo', 'Jawa Timur', 'Strategi Promosi Syariah Untuk Meningkatkan Jumlah Pengunjung Pada Destinasi Wisata (Stidu Kasus wisata Beach Forest Kecamatan Kendit Kabupaten Situbondo)', '', NULL, NULL),
(434, '2024', '20200301001', 'Abdul Samsul Mu\'arif', '-', 8, 'Licin', 'Banyuwangi', 'Jawa Timur', 'Pelaksanaan Aktivitas Keagamaan dalam Membentuk Karakter Disiplin pada Siswa Kelas IX D SMPN 1 Banyuputih Situbondo', '', NULL, NULL),
(435, '2024', '20200301004', 'Adnan Faruqi', '-', 8, 'Banyuputih', 'Situbondo', 'Jawa Timur', '\"Kompetensi Profesional Guru PAI dalam Peningkatan Motivasi Belajar Siswa di SMPN 1 Banyuputih Tahun Pelajaran 2023/2024', '', NULL, NULL),
(436, '2024', '20200301006', 'Ahmad Sauki Lutfi', '-', 8, 'Jembrana', 'Jembrana', 'Bali', 'Penerapan Metode Sorogan Dalam Meningkatkan Kualitas Membaca Al-Qur\'an Santri di Asrama Ma\'hadul Qur\'an No. 10 Pondok Pesantren Salafiyah Syafi\'iyah Sukorejo Situbondo Tahun Pelajaran 2023/2024', '', NULL, NULL),
(437, '2024', '20200301065', 'Aisyah Eka Putri Dewi', '-', 8, 'Sungai Pinyu', 'Mempawa', 'Kalimantan Barat', 'Relasi Guru Dan Murid Dalam  Perspektif Kitab Ta\'limul Muta\'allim (Studi Kasus Madrasah Ta\'hiliyah Ibrahimy Pondok Pesantren Salafiyah Syafi\'iyah Sukorejo)', '', NULL, NULL),
(438, '2024', '20200301066', 'Alivia Sabila', '-', 8, 'Bebandem', 'Karang Asem', 'Bali', 'Metode Talaqqi Guru Dalam Membina Bacaan Siswa Tahfidzul Qur\'an (Ekstrakurikuler) Di MtsN Karang Asem Bali Tahun Pelajaran 2023/2024', '', NULL, NULL),
(439, '2024', '20200301067', 'Anggi Febriani', '-', 8, 'Janapriya', 'Lombok Tengah', 'NTB', 'Penerapan Digital Parenting (Pola Asuh Orang Tua Di Era Digital) Dalam Menumbuhkan Moral Untuk Mengatasi Kecanduan Gadget Pada Anak Di Sdn 2 Selebung Kec. Janapria Lombok Tengah Ntb Tahun Pelajaran 2023/2024', '', NULL, NULL),
(440, '2024', '20200301010', 'As\'adi', '-', 8, 'Nonggunong', 'Sumenep', 'Jawa Timur', 'PENERAPAN METODE COOPERATIVE LEARNING TIPE JIGSAW UNTUK MENINGKATKAN PEMAHAMAN SISWA PADA MATA PELAJARAN PAI DI KELAS VII C SMP NEGERI 1 BANYUPUTIH SITUBONDO TAHUN PELAJARAN 2023-2024', '', NULL, NULL),
(441, '2024', '20200301070', 'Aulana Sangadah', '-', 8, 'Cluring', 'Banyuwangi', 'Jawa Timur', 'Implementasi Metode Problem Based Learning Untuk Meingkatkan Keaktifan Siswa Pada Mata Pelajaran Fiqih Bab Zikir Dan Doa Kepada Allah Swt Kelas VII Madrasah Tsanawiyah Miftahl Ulum Tegaldlimo Banyuwangi Tahun Pelajaran 2023-2024', '', NULL, NULL),
(442, '2024', '20200301072', 'Ayu Tahta Aunillah', '-', 8, 'Mustika Jaya', 'Bekasi', 'Jawa Barat', 'Pengaruh Metode Student Facilitator And Explaining (Sfe) Terhadap Hasil Belajar Peserta Didik Pada Mata Pelajaran Pai Di Sma Islam Teratai Putih Global', '', NULL, NULL),
(443, '2024', '20200301073', 'Dewi Amien Anggraeni', '-', 8, 'Jelbuk', 'Jember', 'Jawa Timur', 'Penerapan Metode Muraja\'ah Dalam Proses Long Term Memory (Ltm) Hafalan Al-Qur\'an Di Madrasatul Qur\'an Pondok Pesantren Salafiyah Syafi\'iyah Sukorejo Situbondo', '', NULL, NULL),
(444, '2024', '20200301012', 'Dimas Puji Taruno', '-', 8, 'Sigi', 'Sigi Biromaru', 'Sulawesi Tengah', 'Penggunaan Media Pembelajaran Interaktif dalam Meningkatkan Pemahaman Siswa terhadap Mata Pelajaran PAI di SMPN 01 Asembagus', '', NULL, NULL),
(445, '2024', '20200301075', 'Dina Lailatus Syafaah ', '-', 8, 'Majayan', 'Madiun', 'Jawa Timur', 'Penerapan Model Pembelajaran Sosiodrama Dalam Meningkatkan Daya Ingat Siswa Pada Materi Sejarah Kebudayaan Islam Di Mts Ypip Panjeng Ponorogo Tahun Pelajaran 2023/2024', '', NULL, NULL),
(446, '2024', '20200301077', 'Dwi Sastika Wulandari', '-', 8, 'Rambipuji', 'Jember', 'Jawa Timur', 'IMPLEMENTASI METODE PEER TEACHING PADA MATA PELAJARAN FIKIH DI KELAS IV MADRASAH DINIYAH AN-NUR RAMBIPUJI-JEMBER', '', NULL, NULL),
(447, '2024', '20200301146', 'Eka Elvina Nadzirotul Mahiroh', '-', 8, 'Asembagus', 'Situbondo', 'Jawa Timur', 'Pembentukan Karakter Religius Siswa melalui Kegiatan Pembiasaan Keagamaan di SMA Negeri 1 Panji Situbondo Tahun Pelajaran 2023-2024', '', NULL, NULL),
(448, '2024', '2022301193', 'Elmy Ayu Hartono', '-', 8, 'Banyuputih', 'Situbondo', 'Jawa Timur ', '\"Implementasi Model Kooperatif Learning Tipe Listening Team Dalam Mengatasi Kesulitan Belajar Di Kelas VII Pada Mata Pelajaran PAI Di SMPN 1 Banyuputih  Situbondo Tahun Pelajaran 2023/2024', '', NULL, NULL),
(449, '2024', '20200301079', 'Elok Kamilatul Aida', '-', 8, 'Glagah', 'Banyuwangi', 'JawaTimur', 'Pola Asuh Orang Tua Dalam Mencegah Kecanduan Gadget Dengan Meningkatkan Moral Pada Anak Usia  Sekolah Dasar Di Desa Paspan Kecamatan Glagah Kabupaten Banyuwangi Tahun 2024', '', NULL, NULL),
(450, '2024', '20200301080', 'Evi Novita Sari', '-', 8, 'Tegaldelimo', 'Banyuwangi', 'Jawa Timur', 'Meningkatkan Hasil Belajar Siswa Pada Mata Pelajaran Fiqih Kelas IX Melalui Penerapan Media Audio Visual Di Mts Miftahul Ulum Tegaldelimo Kabupaten Banyuwangi Tahun Pelajaran 2023/2024', '', NULL, NULL),
(451, '2024', '20200301081', 'Faidhatul Ula', '-', 8, 'Banyuputih', 'Situbondo', 'Jawa Timur', 'Implementasi Metode Giving Question And Getting Answer Pada Mata Pelajaran Pai Untuk Meningkatkan Minat Dan Hasil Belajar Siswa Kelas Vii C Di Smp Negeri 1 Arjasa Tahun Pelajaran 2023/2024', '', NULL, NULL),
(452, '2024', '20200301082', 'Feronika Anwar', '-', 8, 'Prajekan', 'Bondowoso', 'Jawa Timur', 'Kompetensi Kepesantrenan Dalam Membentuk Santri Generasi Muslim Khaira Ummah Di Ma\'hadul Qur\'an Putri Pondok Pesantren Salafiyah Syafi\'iyah Sukorejo', '', NULL, NULL),
(453, '2024', '20200301018', 'Ganial Akbar', '-', 8, 'Pagaden', 'Subang', 'Jawa Barat', 'Implementasi Metode Gerak Cantol dalam Pembelajaran Kaifa Tushalli pada Ekstrakurikuler SMP Plus Fityani Pujon Malang Tahun Pelajaran 2023/2024', '', NULL, NULL),
(454, '2024', '20200301034', 'Hainur Rahma', '-', 8, 'Asembagus', 'Situbondo', 'Jawa Timur', 'Meningkatkan Keaktifan Belajar Siswa Melalui Metode Snowball Throwing Pada Mata Pelajaran PAI Materi Menghindari Gibah Dan Melaksanakan Tabayun Kelas VIIA Di SMP Negeri 1 Arjasa Situbondo Tahun Pelajaran 2023/2024', '', NULL, NULL),
(455, '2024', '20200301085', 'Hikmatul Hasanah', '-', 8, 'Tamanan', 'Bondowoso', 'Jawa Timur', 'Metode Odon (One Day One Nadhom) Dalam Meningkatkan Hafalan Nadhom \'Imrithi Madrasah Ta\'hiliyah Ibrahimy Sukorejo Situbondo Tahun Pelajaran 2023-2024', '', NULL, NULL),
(456, '2024', '20200301086', 'Huril Ainiyah', '-', 8, 'Jangkar', 'Situbondo', 'Jawa Timur', 'Meningkatkan Hasil Belajar Siswa Melalui Model Cooperative Learning Tipe Think Pair Share Pada Mata Pelajaran PAI Kelas VIIC Di SMP Negeri 1 Arjasa Situbondo', '', NULL, NULL),
(457, '2024', '20200301088', 'Jannatin Aliyah', '-', 8, 'Banyuputih', 'Situbondo', 'Jawa Timur', 'Korelasi Antara Prestasi Belajar Dan Sosial Attitude Siswa Di Sma Negeri 1 Situbondo Tahun 2023 - 2024', '', NULL, NULL),
(458, '2024', '2021301166', 'Laily Musyarrofah', '-', 8, 'Sumber Malang', 'Situbondo', 'Jawa Timur', 'Dampak Program Pengembangan Kecerdasan Spiritual Terhadap Perilaku Siswa SMAN 1 Panji', '', NULL, NULL),
(459, '2024', '20200301089', 'Lika Lailiyah', '-', 8, 'Kalipuro', 'Banyuwangi', 'Jawa Timur', 'Dukungan Orang Tua Terhadap Hafalan Juz Amma Pada Sekolah Dasar (Sd) Ibrahimy Sukorejo', '', NULL, NULL),
(460, '2024', '20200301090', 'Lina Azmiyatul Wahidah', '-', 8, 'Arjasa', 'Sumenep', 'Jawa Timur', 'Penerapan Metode Talking Stick daklam meningkatkan Keaktifan Belajar Siswa Kelas VII Pada Mata Pelajaran Fiqih di Mts Al-Wathaniyah Kolo-Kolo', '', NULL, NULL),
(461, '2024', '20200301091', 'Lusiana Safara', '-', 8, 'Arjasa', 'Situbondo', 'Jawa Timur', 'Implementasi Model Pembelajaran Tipe Jigsaw Dalam Meningkatkan Hasil Belajar Koknitif Siswa Mata Pelajaran Pai Kelas Vii A Di Smpn 2 Arjasa Kangean Tahun Pelajaran 2023/2024', '', NULL, NULL),
(462, '2024', '20200301027', 'M. Asil', '-', 8, '-', '-', '-', 'Implementasi Model Pembelajaran Cooperative Learning Tipe Stad (Student Teams Achievement Divisions) Dalam Peningkatan Minat Belajar Siswa Pada Mata Pelajaran PAI Di SMP Ummah Kecamatan Sangkapura Kabupaten Gresik', '', NULL, NULL),
(463, '2024', '20200301093', 'Mailaturriskiyah', '-', 8, 'Gerokgak', 'Buleleng', 'Bali', 'Penerapan Metode Student Facilitator And Explainng Dalam Meningkatkan Keaktifan Belajar Siswa Pada Kelas Viii Mata Pelajaran Sejarah Kebudayaan Islam ( Studi Kasus Di Mts Sunan Ampel Sumberkima Bali Tahun Pelajaran 2023/2024)', '', NULL, NULL),
(464, '2024', '20200301094', 'Maulidatur Rohmaniah', '-', 8, 'Sumbermalang', 'Situbondo', 'Jawa Timur', 'Integrasi Nilai-nilai Moderasi Beragama dalam Kurikulum Merdeka (study kasus di MA. Miftahul Ulum Besuki Situbondo', '', NULL, NULL),
(465, '2024', '20200301095', 'Milfia Manzilatul Aula', '-', 8, 'Karang Tengah', 'Demak', 'Jawa Tengah', 'Implementasi Pendidikan Multikultural Dalam Menumbuhkan Kerukunan Antar Siswa Muslim-Kristen Pada Pelajaran Pai Di Sma Negeri 1 Guntur Demak Jawa Tengah Tahun Pelajaran 2023/2024', '', NULL, NULL),
(466, '2024', '20190301035', 'Mohammad Alfin Kurniansyah', '-', 8, 'Banyuwangi', 'Banyuwangi', 'Jawa Timur', 'Implementasi Kelas Akselerasi Kelompok Belajar Cepat (KBC) di Madrasah Tsanawiyah Negeri 1 Banyuwangi Tahun Pelajaran 2023/2024 ', '', NULL, NULL),
(467, '2024', '20200301037', 'Muhamad Nabila Irfan', '-', 8, 'Praya', 'Lombok Tengah', 'Nusa Tenggara Barat', 'Pelaksanaan Menghafal Al-Qur\'an dengan Metode Bin-Nadzor di Asrama Tahfidzul Qur\'an Pondok Pesantren Salafiyah Syafi\'iyah Sukorejo Situbondo Jawa Timur 2024', '', NULL, NULL),
(468, '2024', '20200301042', 'Muhammad Rizal Bachtiar', '-', 8, 'Bojong', 'Tegal', 'Jawa Tengah', 'Implementasi Pendidikan Anti Bulying Melalui Pembelajaran Pendidikan Agama Islam dan Budi Pekerti di Kelas VII B SMP Islam Belik Pemalang Jawa Tengah', '', NULL, NULL),
(469, '2024', '20200301097', 'Nadratul Barizah', '-', 8, 'Banyuputih', 'Situbondo', 'Jawa Timur', 'Pendidikan anti Bullying Perspektif Al-quran dan Hadist', '', NULL, NULL),
(470, '2024', '20200301098', 'Nafisatul Magfiroh Al Khafidzoh', '-', 8, 'Aimas', 'Sorong', 'Papua Barat Daya', 'Upaya Guru Tahfidz Dalam Meningkatkan Kualitas Hafalan Santri Di Asrama Tahfidzul Qur\'an Putri Pondok Pesantren Salafiyah Syafi\'iyah Sukorejo', '', NULL, NULL),
(471, '2024', '20200301099', 'Nahjul Istiqomah', '-', 8, 'Gerung', 'Lombok Barat', 'NTB', 'Implementasi Metode Syafa\'ati Dalam Meningkatkan Kualitas Hafalan Al-Qur\'an Santri  Pondok Pesantren Selaparang Kediri Lombok Barat', '', NULL, NULL),
(472, '2024', '20200301045', 'Naufal Faidur Rohman', '-', 8, 'Balung', 'Jember', 'Jawa Timur', 'Pembinaan Tilawah Al-Qur\'an Siswa di Madrasah Ibtida\'iyah Salafiyah Syafi\'iyah Tanjung Glugur Mangaran Situbondo Tahun Pelajaran 2023/2024', '', NULL, NULL),
(473, '2024', '20200301100', 'Nur Hafidatul Mutamimah', '-', 8, 'Licin', 'Banyuwangi', 'Jawa Timur', 'Penerapan Metode Time Quiz Dalam Meningkatkan Hasil Belajar Siswa Pada Mata Pelajaran Fiqih Kelas VIII A Di Mts Nahdlatuth Thullab Segobang Licin', '', NULL, NULL),
(474, '2024', '20200301101', 'Nur Hasanah', '-', 8, 'Asembagus', 'Situbondo', 'Jawa Timur', 'Penanaman Karakter Pada Peserta Didik Kelas Xi 3 Di Sma Negeri 1 Panji Situbondo Tahun Pelajaran 2023/2024', '', NULL, NULL),
(475, '2024', '20200301102', 'Nur Kamila', '-', 8, 'Banyuputih', 'Situbondo', 'Jawa Timur', 'Implementasi Pembelajaran Berdiferensiasi Dalam Peningkatan Hasil Belajar Mata Pelajaran Pai Dan Budi Pekerti Di Kelas Xi 9 Sman 1 Panji Situbondo', '', NULL, NULL),
(476, '2024', '20200301149', 'Nur Winda Sinta Wati Dewi', '-', 8, 'Banyuputih', 'Situbondo', 'Jawa Timur', 'Internalisasi Nilai-Nilai Agama Islam Dalam Membentuk Karakter Bersahabat Anti Bullying Di SMPN 1 Banyuputih', '', NULL, NULL),
(477, '2024', '20200301103', 'Nurhidayati', '-', 8, 'Aikmel', 'Lombok Timur', 'NTB', 'Pengaruh Pendidikan Agama Islam Terhadap Kepedulian Lingkungan Siswa Di Smp Islam Al-Mannan Bagik Nyaka Santri Kecamatan Aikmel Kabupaten Lombok Timur Ntb Tahun Pelajaran 2023/2024', '', NULL, NULL),
(478, '2024', '20200301105', 'Nurul Islamiya', '-', 8, 'Botolinggo', 'Bondowoso', 'Jawa Timur', 'Strategi Guru Fikih Dalam Peningkatan Kedisiplinan Belajar Siswa Di Kelas Vi O Madrasah Ibtida\'iyah Salafiyah Syafi\'iyah Putri Sukorejo Situbondo', '', NULL, NULL),
(479, '2024', '20200301106', 'Qurrotul Uyun', '-', 8, 'Cilincing', 'Jakarta Utara', 'DKI Jakarta', 'Menumbuhkan kecerdasan Spiritual Siswa Melalui Kegiatan Ekstrakurikuler Rohani Islam (ROHIS) di SMP Negeri 244 Jakarta', '', NULL, NULL),
(480, '2024', '20200301107', 'Regita Pramesty Nuriyah Siddik', '-', 8, 'Maesan', 'Bondowoso', 'Jawa Timur', 'Konstruksi Berpikir Kritis Pada Mata Pelajaran Pendidikan  Agama Islam Di Sma Ibrahimy 2 Sukorejo 2023-2024', '', NULL, NULL),
(481, '2024', '20200301108', 'Rida Afdhalia', '-', 8, 'Praya Barat Daya', 'Lombok Tengah', 'NTB', 'Strategi Pembelajaran Langsung Guru Pai Dalam Meningkatkan Keterampilan Bertanya Siswa Mts Al- Ma\'arif Manba\'ul Ulum Kabul Tahun Pelajaran 2023/2024', '', NULL, NULL),
(482, '2024', '20200301109', 'Rizky Khoirunnisa', '-', 8, 'Jati Roto', 'Lumajang', 'Jawa Timur', 'Pembiasaan Menghafal Juz Amma Dalam Penguatan Kualitas Bacaan Siswa Kelas V Di MI Bustanul Ulum Jati Roto Lumajang Tahun Pelajaran 2023 - 2024', '', NULL, NULL),
(483, '2024', '20200301110', 'Rizqiyah  Wafiroh', '-', 8, 'Blimbingsari', 'Banyuwangi', 'Jawa Timur', 'Pembentukan Akhlakul Karimah Siswa Di Mts Nurul  Huda Badean Banyuwangi Tahun Pelajaran 2023-2024', '', NULL, NULL),
(484, '2024', '20200301111', 'Rohmatul Maula', '-', 8, 'Banyuputih', 'Situbondo', 'Jawa Timur', 'Meningkatkan Minat Belajar Siswa Dengan Metode Student Team Achievement Division Di Smp Negeri 1 Arjasa Tahun Pelajaran 2023/ 2024', '', NULL, NULL),
(485, '2024', '20200301112', 'Sabrina Qotrun Naja', '-', 8, 'Semampir', 'Surabaya', 'Jawa Timur', 'Penerapan Metode Praktik Dalam Upaya Meningkatkan Kemampuan Berwudhu Siswa Kelas Ii Pada Tpq Arraudhah Surabaya Berdasarkan Kitab Mabadi\'ul Fikh ', '', NULL, NULL),
(486, '2024', '20200301113', 'Sa\'diah', '-', 8, 'Pamukan Selatan', 'Kota Baru', 'Kalimantan Selatan', 'Implementasi Pendidikan Karakter Relegius Dalam Pendidikan Agama Islam Di SMP Bebunga Estate Kabupaten Kota Baru Provinsi Kalimantan Selatan Tahun 2023-2024', '', NULL, NULL),
(487, '2024', '20200301048', 'Salimudin', '-', 8, 'Praya', 'Lombok Tengah', 'Nusa Tenggara Barat', 'Penerapan Hafalan Al-Qur\'an dengan Metode 3T+1M (Talqin, Takrir, Tasmi\', Muroja\'ah) di Madrasah Tsanawiyah Nurul Yaqin Praya Lombok Tengah Nusa Tenggara Barat Tahun Pelajaran 2023-2024', '', NULL, NULL),
(488, '2024', '20200301049', 'Salman Alfarisi', '-', 8, 'Praya', 'Lombok Tengah', 'Nusa Tenggara Barat', 'Upaya Guru Pendidikan Agama Islam dalam Pembentukan Karakter Disiplin Siswa Kelas IX F SMP Negeri 1 Banyuputih Tahun Pelajaran 2023/2024', '', NULL, NULL),
(489, '2024', '20200301114', 'Sania Umul Khasanah', '-', 8, 'Kaligondang', 'Purbalingga', 'Jawa Tengah', 'METODE HAFALAN MUFRODAT DALAM MENINGKATKAN PEMAHAMAN AL-QUR\'AN SANTRI PPNQ TH AJARAN 2023-2024', '', NULL, NULL),
(490, '2024', '20200301115', 'Siti Ahyani', '-', 8, 'Mangaran', 'Situbondo', 'Jawa Timur', 'Penerapan Pembelajaran Tipe Student Team Untuk Meningkatkan Minat Belajar Siswa Pada Mata Pelajaran Pai Kelas X.1 Di Sman 1 Situbondo', '', NULL, NULL),
(491, '2024', '20200301116', 'Siti Aisyah', '-', 8, 'Bebandem', 'Karangasem', 'Bali', 'Meningkatkan Hots Menggunakan Metode Mindmapping Pada Mata Pelajaran SKI Dikelas VII E MtsN Karangasem Bali Tahun Pelajaran 2023/2024', '', NULL, NULL),
(492, '2024', '20200301117', 'Siti Amiliya', '-', 8, 'Jangkar', 'Situbondo', 'Jawa Timur', 'Pelaksanaan Budaya Islami Di Sman 1 Situbondo Tahun Pelajaran 2023-2024', '', NULL, NULL),
(493, '2024', '20200301118', 'Siti Fatimah', '-', 8, 'Kenjeran', 'Surabaya', 'Jawa Timur', 'Pembelajaran Berorientasi Higher Order Thigking Skills (Hots) Pada Mata Pelajaran Sejarah Kebudayaan Islam (Ski) Di Mts Uswatun Hasanah Kenjeran Surabaya Tahun Pelajaran 2023-2024', '', NULL, NULL),
(494, '2024', '20200301119', 'Siti Fatimah', '-', 8, 'Gianyar', 'Gianyar', 'Bali', 'Implementasi PBL (Problem Based Learning) Pada Mata Pelajaran Pendidikan Agama Islam Di SMA Negeri 2 Situbondo Tahun Pelajaran 2023/2024', '', NULL, NULL),
(495, '2024', '20200301121', 'Siti Qurrotul Fuadi Aluf', '-', 8, 'Muncar', 'Banyuwangi', 'Jawa Timur', 'Strategi Pondok Pesantren Dalam Membentuk Karakter Religius Melalui Adaptasi Santri Baru Tahun Pelajaran 2023 (Studi Kasus Pondok Pesantren Salafiyah Syafiiyah Sukorejo)', '', NULL, NULL),
(496, '2024', '20190301121', 'Siti Rohmatul Ummah', '-', 8, 'Arjasa', 'Situbondo', 'Jawa Timur', 'Penerapan Metode Make a Match Dalam Meningkatkan Minat Belajar Siswi Qiro\'atuna Kelas IV A di Asrama Al-Khuzaimah Pondok Pesantren Salafiyah Syafi\'iyah Sukorejo Tahun 2024', '', NULL, NULL),
(497, '2024', '20200301123', 'Sofiatur Rizkiyah', '-', 8, 'Jangkar', 'Situbondo', 'Jawa Timur', 'Strategi Penguatan Pemahaman Fiqih Ibadah Melalui Program Pondok Ramadhan Di SMAN 2 Situbondo Tahun Pelajaran 2023-2024', '', NULL, NULL),
(498, '2024', '20200301053', 'Sulton', '-', 8, 'Labuapi', 'Lombok Barat', 'Nusa Tenggara Barat', 'Implementasi Model Pembelajaran Discovery Learning untuk Peningkatan Minat Belajar Siswa pada Mata Pelajaran Fiqih di MTS Nurul Iman Kelas IX A Praya Lombok Tengah Nusa Tenggara Barat Tahun Ajaran 2023/2024', '', NULL, NULL),
(499, '2024', '20190301061', 'Taufikul Qoyyum', '-', 8, 'Situbondo', 'Situbondo', 'JAwa TImur', 'Strategi Pesantren dalam Menghadapi Tantangan di Era Globalisasi (Studi Kasus di Pondok Pesantren Tahsinul Akhlaq Kalibagor Situbondo) Tahun Pelajaran 2023/2024', '', NULL, NULL),
(500, '2024', '20200301126', 'Ud Uni Jannati', '-', 8, 'Grujugan', 'Bondowoso', 'Jawa Timur', 'Implementasi Budaya Literasi Praktik Baik Di SMAN 2 Situbondo', '', NULL, NULL),
(501, '2024', '20200301127', 'Ulfa Mazida', '-', 8, 'Nonggunong', 'Sumenep', 'Jawa Timur', 'Pelaksanaan Kegiatan Ekstrakurikuler Dalam Penguatan Motivasi Belajar Siswi Di Madrasah I\'dadiyah Salafiyah Syafi\'iyah Sukorejo Situbondo Tahun Pelajaran 2023/2024', '', NULL, NULL),
(502, '2024', '20200301128', 'Ulfi Lailatul Fajriyah', '-', 8, 'Bungatan', 'Situbondo', 'Jawa Timur', 'Optimalisasi Peran Guru PAI dalam Mengatasi Kasus Bullying di SMP Ibrahimy 3 Sukorejo', '', NULL, NULL),
(503, '2024', '20200301129', 'Uzlatun Nikmah', '-', 8, 'Paiton', 'Probolinggo', 'Jawa Timur', 'Implementasi Metode Talaqqi Dalam Peningkatan Kemampuan Membaca Al-Qur\'an (Studi Kasus TPQ As\'adiyah Pandean Paiton Probolinggo', '', NULL, NULL),
(504, '2024', '20200301059', 'Whildan Zulfi H.', '-', 8, 'Songgon', 'Banyuwangi', 'Jawa Timur', 'Penanaman Nilai-nilai Pendidikan Agama Islam dalam Mewujudkan Sikap Toleran pada Siswa Multi Agama di SMP Negeri 01 Songgon Tahun Pelajaran 2023-2024', '', NULL, NULL),
(505, '2024', '20200301131', 'Wilda Al-Aluf B. W. Al-Farroh', '-', 8, 'Batang Batang', 'Sumenep', 'Jawa Timur', 'Penerapan Kurikulum Merdeka Pada Mata Pelajaran Sejarang Kebudayaan Islan (SKI) Di Mts Darul Ulum Batuputih Kenek Batuputih Sumenep Madura', '', NULL, NULL),
(506, '2024', '20200301133', 'Yuli Yatus Holehah', '-', 8, 'Sukowono', 'Jember', 'Jawa Timur', 'Peningkatan Minat Siswa Dengan Islamic Action Movie Mata Pelajaran SKI Di MTs Raudlatus Syabab Sumberwringin Sukowono Jember Tahun 2023-2024', 'Terverifikasi', NULL, NULL),
(507, '2024', '20200301152', 'Zahrotul Aluf Nurlaili', '-', 8, 'Prajekan', 'Bondowoso', 'Jawa Timur', 'Implementasi Metode Pembelajaran Numbered Heads Together Dalam Pembelajaran Al-Qur\'an Hadis Untuk Meningkatkan Hasil Belajar Siswa Kelas Vii  Di Mts Nurul Jadid Bondowoso', '', NULL, NULL),
(508, '2024', '20200301063', 'Zulpikar', '-', 8, 'Bathin III Ulu', 'Bungo', 'Jambi', 'Multi Metode Menghafal Al Qur\'an di Asrama Tahfidzul Qur\'an Pondok Pesantren Salafiyah Syafi\'iyah Sukorejo Situbondo Tahun Pelajaran 2023/2024', '', NULL, NULL),
(509, '2024', '2020302001', 'Abdul Aziz', '-', 9, 'Balung ', 'Jember', 'Jawa Timur', 'Pengembengan Media Visual Animasi Dalam Kemampuan Kognitif Berbicara Bahasa Arab Pada Santri Putri PP. Salafiyah Syafi\'iyah Asyhariah Jember', 'Terverifikasi', NULL, NULL),
(510, '2024', '2020302025', 'Ainirrahmah', '-', 9, 'Melaya', 'Jembrana', 'Bali', 'تطبيق نموذج التعليم التعاوني Make A Match لترقية اتقان المفردات العربية الدراسية  ٢.٢ٔ٤/٢٢٣ م', '', NULL, NULL),
(511, '2024', '2020302026', 'Aisah Putri Rahayu', '-', 9, 'Kuta', 'Badung', 'Bali', 'Pengembangan Media Pembelajaran Bahasa Arab Menggunakan Kartu Talk Or Dare Pada Pembagian Fi\'il Dalam Peningkatan Maharah Kalam Pada Kelas Shifir Di Asrama Bahasa Syu\'batul Lughah Al-Khairiyyah Mq Pi Tahun Pelajaran 2024', '', NULL, NULL),
(512, '2024', '2020302028', 'Atikah Khoirun Nisa', '-', 9, 'Sukowono', 'Jember', 'Jawa Timur', 'Pembuatan Buku Ajar Ayo Berbicara Bahasa Arab Untuk Meningkatkan Maharah Kalam Santri Di Tpq Pondok Pesantren Baitul Azhar Sumber Pakem Sumber Jambe Jember Tahun Ajaran 2023-2024', '', NULL, NULL),
(513, '2024', '2018030232', 'Ayu Agustina', '-', 9, 'Kalipuro', 'Banyuwangi', 'Jawa Timur', 'Implementasi Metode Pembelajaran Amstilati Dalam Meningkatkan Kemampuan Membaca Kitab Kuning Santri Putri Di Lembaga Amstilati Salafiyah Syafi\'iyah Sukorejo Tahun Pelajaran 2022/2023', '', NULL, NULL),
(514, '2024', '2020302030', 'Fitri Ardianti', '-', 9, 'Negara', 'Jembrana', 'Bali', 'Pengembangan Pembelajaran Qowaid Berbasis Media Flash Card Untuk Meningkatkan Pemahaman Ilmu Nahwu Siswa Kelas Wustho Madrasah Diniyah Pondok Pesantren Nurul Ikhlas Jembrana Bali Tahun Ajaran 2023/2024', '', NULL, NULL),
(515, '2024', '2020302008', 'Haqaiq Nurul Kafi', '-', 9, 'Raas', 'Sumenep', 'Jawa Timur', 'Penyusunan Kamus Bahasa Arab Kitab Safinah an-Najah dalam Peningkatanan Maharah Qira\'ah Santri Asrama I\'dadiyah no.07 di Pondok Pesantren Salafiyah Syafi\'iyah Sukorejo Situbondo', '', NULL, NULL),
(516, '2024', '2020302034', 'Indah Rahmawati', '-', 9, 'Praya Barat', 'Lombok Tengah', 'NTB', 'Pembuatan Media Pembelajaran Papan Tali  Untuk Meningkatkan Kemampuan Mufrodat Siswa Kelas Vii Mts Al Ma\'arif Manba\'ul Ulum  Kabul  Lombok  Tengah ', '', NULL, NULL),
(517, '2024', '2020302010', 'Jofan Herbiyanto', '-', 9, 'Kalipuro', 'Banyuwangi', 'Jawa Timur', 'Penggunaan Permainan Ular Tangga Untuk Meningkatkan Kemampuan Mufradat B. Arab Di MI Darussalam 1 Kalipuro Banyuwangi', '', NULL, NULL),
(518, '2024', '2020302035', 'Luluk Nurhidayati', '-', 9, 'Praya Timur', 'Lombok Tengah', 'NTB', 'Pengembangan Buku Ajar Bahasa Arab Berbasis Percakapan Untuk Meningkatkan Keterampilan Berbicara Siswa Kelas Viii Mts Al-Ma\'arif Mirqotussa\'adah Lombok Tengah Tahun Pelajaran 2023/2024', '', NULL, NULL),
(519, '2024', '2020302036', 'Mei Safira ', '-', 9, 'Praya Timur', 'Lombok Tengah', 'NTB', 'Penyusunan Bahan Ajar القواعد اللغوية Untuk Meningkatkan Kemampuan Siswa Dalam Menyusun Kalimat Bahasa Arab Pada Kelas Ula Asrama Bahasa Syu\'batul Lughah Al-Khairiyah Ma\'hadul Qur\'an Putri Pondok Pesantren Salafiyah Syafi\'iyah Sukorejo Situbondo Tahun Pel', '', NULL, NULL),
(520, '2024', '2020302017', 'Muh. Ari Akbar', '-', 9, 'Wanasaba', 'Lombok Timur', 'NTB', 'Pengembangan Media Pembelajaran Bahasa Arab Bebasis Teka-Teki Silang Untuk Meningkatkan Hafalan Mufrodat Sista Kelas VIII MTs Baiturrahman Dusun Imba Pondok Pesantren Baiturrahman Bagik Papan Lombok Timur NTB Tahun Pembelajaran 2023/2024', '', NULL, NULL),
(521, '2024', '2020302037', 'Nabila Attaqiyah', '-', 9, 'Toapaya', 'Bintan', 'Kepulauan Riau', 'Pengembangan Bahan Ajar Dengan Media Buku Bergambar Bahasa Arab Tema Profesi Untuk Anak Usia Dini Di Taman Kanak-Kanak Muslimat Nu 01 Panji Situbondo T', '', NULL, NULL),
(522, '2024', '2020302038', 'Nadia Indah Andriani', '-', 9, 'Denpasar Barat', 'Denpasar', 'Bali', 'Penyusunan Komik Arabic Untuk Meningkatkan Maharah Qira\'ah Siswi Kelas Mubtadi\' Asrama Bahasa Arab Pusat Putri Pondok Pesantren Salafiyah Syafi\'iyah Sukorejo Situbondo Tahun Pelajaran 2024-2025', '', NULL, NULL),
(523, '2024', '2020302039', 'Nadiva Rizqi Maulina ', '-', 9, 'Kalipuro ', 'Banyuwangi', 'Jawa Timur', 'Pengembangan Bahan Ajar اللغة العربية للمبتدئين Dengan Media Audio Visual Pada Maharah Istima\' Di Asrama Bahasa Pusat Putri Pondok Pesantren Salafiyah Syafi\'iyah Sukorejo Situbondo Tahun Ajaran 2024', '', NULL, NULL),
(524, '2024', '2020302040', 'Nazilil Umami', '-', 9, 'Prajekan', 'Bondowoso', 'Jawa Timur', 'Pembuatan Media Puzzle Mufrodat Dalam Meningkatkan Penguasaan Kosakata Bahasa Arab Siswa Kelas Iii Mi Nurul Huda Paowan Situbondo Tahun Pelajaran 2023-2024', '', NULL, NULL),
(525, '2024', '2020302042', 'Nur Azizah', '-', 9, 'Negara', 'Jembrana', 'Bali', 'Pengembangan Media Pembelajaran Berbasis Miniature Wisata Pantai Untuk Meningkatkan Maharah Kalam Santri Dikelas Wustho Hujrah El-Marwah Asrama Ma\'had Aly Putri Pondok Pesantren Salafiyah', '', NULL, NULL),
(526, '2024', '2020302043', 'Nurlailatul Qomariyah', '-', 9, 'Asembagus', 'Situbondo', 'Jawa Timur', 'Pengembangan Silabus Bahasa Arab Berorientasi Proses di LPIBA Periode Mei-Juni 2024', '', NULL, NULL),
(527, '2024', '2020302044', 'Nurul Fauzah', '-', 9, 'Rubaru', 'Sumenep', 'Jawa Timur', 'Pengembangan Media Pembelajaran Flashcard Untuk Meningkatkan Penguasaan Mufradat Siswa Kelas Vii Mts Nurul Huda Ii Tambaksari Rubaru Sumenep Tahun Pelajaran 20232024', '', NULL, NULL),
(528, '2024', '2019302055', 'Nurul Iftitah', '-', 9, '-', '-', '-', 'Pengaruh Metode Pembelajaran Tebak Kata Terhadap Kemampuan Menghafal Mufradat Siswi Kelas XI Bahasa 2 SMA Ibrahimy 2 Sukorejo Situbondo Tahun 2022-2023', '', NULL, NULL),
(529, '2024', '2020302018', 'Ogi Wijaya', '-', 9, 'Wanasaba', 'Lombok Timur', 'Nusa Tenggara Barat', 'Pengembangan Media Pembelajaran Bahasa Arab Dengan Permainan Monopoli Untuk Meningkatkan Hafalan Mufrodat Bahasa Arab Siswa Kelas VIII MTs Baiturrahman Dusun Imba Pondok Pesantren Baiturrahman Bagik Papan Lombok Timur NTB Tahun Pelajaran 2023/2024', '', NULL, NULL),
(530, '2024', '2020302046', 'Tolak Eli', '-', 9, 'Nonggunong', 'Suemenep', 'Jawa Timur', 'Pengembangan Bahan Ajar اللغة العربية للمبتدئين Pada Ilmu Ashwat Dengan Media Audio Visual Di Asrama Bahasa Arab Pusat Putri Salafiyah Syafiiyah Sukorejo Situbondo Tahun Ajaran 2023-2024', '', NULL, NULL),
(531, '2024', '2020302047', 'Tsri Hardiyanti Ruhiyatna', '-', 9, 'Janapriya', 'Lombok Tengah', 'NTB', 'تطبيق وسائل الرسم البياني فى ترقيقة فهم علم الصرف لدى الطلاب الفصل الأول بمدرسة الثانوية دار جانابريا لمبوك الوسطى عام الدراسى ٢.٢٤-٢.٢٥ م.', '', NULL, NULL),
(532, '2024', '2020302048', 'Ulfi Samaratul Jinan', '-', 9, 'Gerung', 'Lombok barat', 'NTB', 'تطبيق أيام القواعد في ترقيةفهم القواعد اللغوية لدى طالبات في فصل المتقدم بالسكن اللغوي المركزي للبنات في معهد سلفية شافعية سوكرجو سيتوبندو عام ٢.٢٣ م.', '', NULL, NULL),
(533, '2024', '2020302024', 'Yasin Akbar', '-', 9, 'Seririt', 'Buleleng', 'Bali', 'Pengembangan Media Pembelajaran Bahasa Arab Berbasis Lagu Untuk Meningkatkan Hafalan Mufrodat Bagi siswa Kelas Vlll Mts Negeri 2 Buleleng Bali', '', NULL, NULL),
(534, '2024', '2020303027', 'Alfiatul Lailiyah ', '-', 10, 'Jatibanteng', 'Situbondo', 'Jawa Timur', 'Upaya Meningkatan Penguasaan Kosa Kata  Bahasa Arab Anak Melalui Media Puzzle Di Kelompok B Ra Al Hidayah Semambung Jatibanteng Situbondo Tahun Pelajaran 2023-2024', '', NULL, NULL),
(535, '2024', '2020303004', 'Anis Nikmatul Firdaus', '-', 10, 'Kalibaru', 'Banyuwangi', 'Jawa Timur', 'Meningkatkan Kemampuan Mengenal Huruf Hijaiyah Melalui Permainan Peta Harta Karun Kelompok B TK Aneka Remaja', '', NULL, NULL),
(536, '2024', '2020303005', 'Arinatul Fadila', '-', 10, 'Arjasa', 'Sumenep', 'Jawa Timur', 'pengembangan game edukasi dunia kata terhadap penenalan kosa kata pada anak kelompok A di TK Al Hidayah Arjasa Kangean', '', NULL, NULL),
(537, '2024', '2020303006', 'Atik Faura', '-', 10, 'Sangkapura', 'Gresik', 'Jawa Timur', '\"Meningkatkan Kreativitas Anak Usia Dini Melalui Kegiatan Melukis Bebas Pada Anak Kelompok B Di Ra Al-Amin Kebon Teluk Dalam Sangkapura Gresik Tahun Pelajaran 2023/2024', '', NULL, NULL),
(538, '2024', '2020303028', 'Dini Agustini', '-', 10, 'Cermee', 'Bondowoso', 'Jawa Timur', 'Meningkatkan Perkembangan Sosial Emosional Anak Melalui Metode Mendongeng Menggunakan Boneka Tangan Pada Kelompok B Di Tk As Syafi\'iyah Al-Haromain Bondowoso Tahun Pelajaran 2023/2024\'\'', '', NULL, NULL),
(539, '2024', '2020303029', 'Emas Ajeng Syarifah Wardani', '-', 10, 'Besuki', 'Situbondo', 'Jawa Timur', 'Meningkatkan Kreatifitas Anak Melalui Bermain Dan Berkarya Melalui Bentuk Geometri Kelompok B TK Ma\'ul Jadid Desa Widoropayung Kecamatan Besuki Kabupaten Situbondo Tahun Pelajaran 2023/2024', '', NULL, NULL),
(540, '2024', '2020303030', 'Faidatul Mu\'alimah ', '-', 10, 'Jangkar', 'Situbondo', 'Jawa Timur', 'Meningkatkan Keterampilan Motorik Halus Melalui  Kreasi Origami Pada Anak Kelompok B Di Kb Al-Hidayah Curah Kalak', '', NULL, NULL),
(541, '2024', '2020303007', 'Faridhatun Nafilah', '-', 10, 'Dungkek', 'Sumenep', 'Jawa Timur', 'Meningkatkan Perkembangan Kognitif Anak Melalui Media Alphabet Match Pada kelompok A di TK Al-kiram Candi Dungkek Sumenep', '', NULL, NULL),
(542, '2024', '2020303008', 'Fitrotul Azmi', '-', 10, 'Baturiti', 'Tabanan', 'Bali', 'Pengembangan Alat Permainan Edukatif Maze 3D Tema Ramadhan Dalam Mengembangkan Kognitif Anak Kelompok B RA Al Hidayah Candi Kuning II Tahun 2023/2024', 'Terverifikasi', NULL, NULL),
(543, '2024', '2020303009', 'Halimatus Sa\'diyah', '-', 10, 'Jati Banteng', 'Situbondo', 'Jawa Timur', 'Penerapan Pembelajaran Kontekstual Untuk Meningkatkan Perkembangan Kognitif Anak Kelompok B Miftahurrahman Kembangsari Jatibanteng Situbondo Tahun Pelajaran 2023/2024', '', NULL, NULL),
(544, '2024', '2020303010', 'Heni Husnita Dewi', '-', 10, 'Pujut', 'Lombok Tengah', 'NTB', 'Pengenalan etnomatematika tentang jajanan tradisional suku sasak untuk mengenalkan konsep bilangan pada anak kelompok B', '', NULL, NULL),
(545, '2024', '2020303011', 'Himmatul Ulya', '-', 10, 'Balung', 'Jember', 'Jawa Timur', '\"Meningkatkan Kemampuan Menyimak Pada Anak Usia Dini Melalui Metode Simak Terka Kelompok B Di Ra Ibrahimy Sukorejo  Situbondo', '', NULL, NULL),
(546, '2024', '2020303048', 'Humairah Alifia Agustina', '-', 10, 'Grokgak', 'Buleleng', 'Bali', 'Pelaksanaan Kegiatan Finger Painting Dalam Meningkatkan Perkembangan Motorik Halus Anak Kelompok A Di Tk Negeri Desa Tinga-Tinga Buleleng Bali Tahunpelajaran 2023/2024', '', NULL, NULL),
(547, '2024', '2020303031', 'Ismawati', '-', 10, 'Wonosari', 'Bondowoso', 'Jawa Timur', 'Meningkatkan Kaakter Peduli Lingkungan Melalui Field Trip Di Kelompok B SPS Mawar Bandilan Prajekan Bondowoso Tahun Pelajaran 2023-2024', '', NULL, NULL),
(548, '2024', '2020303032', 'Istiqomah', '-', 10, 'Panji', 'Situbondo', 'Jawa Timur', 'Meningkatkan Motorik Kasar Melalui Gerak Tari Saman Pada Anak Kelompok B Ra Al Mukhtar Mimbaan Panji Situbondo Tahun Pelajaran 2023/2024', '', NULL, NULL),
(549, '2024', '2019303010', 'Karimatul Islamiah ', '-', 10, 'Jangkar', 'Situbondo', 'Jawa Timur', 'Meningkatkan Pengenalan Lambang Bilangan Melalui Kartu Bergambar Pada Anak  Kelompok A Di Kb Garuda Jaya Jangkar Situbondo Tahun Pelajaran 2023/2024', '', NULL, NULL),
(550, '2024', '2020303035', 'Kholifatul Nurrizqiyah', '-', 10, 'Arjasa', 'Situbondo', 'Jawa Timur', 'Meningkatkan Kemampuan Berbahasa Pada Anak Melalui Metode Menggambar Bebas Kelompok A Di Tk Pgri 6 Arjasa Pada Tahun Pelajaran 2023 2024', '', NULL, NULL),
(551, '2024', '2020303013', 'Lia Dama Yanti', '-', 10, 'Asembagus', 'Situbondo', 'Jawa Timur', 'Meningkatkan Perkembangan  Motorik Halus Anak Melalui Kegiatan Kolase Kain Perca Di Ra Ibrahimy Sukorejo Desa Sumberejo Kecamatan Banyuputih Kabupaten Situbondo Tahun Pelajaran 2023/2024', '', NULL, NULL),
(552, '2024', '2020303033', 'Lubsul Firdausiyah', '-', 10, 'Banyuputih', 'Situbondo', 'Jawa Timur', 'Meningkatkan Kemampuan Motorik Kasar Anak Melalui Media Motion Foot Pada Kelompok B Di Ra Baiturrahman Sidodadi Sumberwaru Banyuputih Situbondo Tahun Ajaran 2023/2024', '', NULL, NULL),
(553, '2024', '2020303014', 'Masudhatul Hasanah', '-', 10, 'Panarukan', 'Situbondo', 'Jawa Timur', 'Upaya Meningkatkan Kemampuan Mengenal Angka Melalui Media Roda Angka Berputar Pada Anak Kelompok B RA Zainul Fauzi Kendit Situbondo', '', NULL, NULL),
(554, '2024', '2020303047', 'Nilatuz Zuhra', '-', 10, 'Sangkapura', 'Gresik', 'Jawa Timur', 'Metode demonstrasi untuk meningatkan kemampuan berwudhu pada anak kelompok A TK Muslimat NU sidogedungbatu II sangkapura gresik', '', NULL, NULL),
(555, '2024', '2020303015', 'Nita Dwisafitri', '-', 10, 'Pangale', 'Mamuju Tengah', 'Sulawesi Barat', 'Pengembangan Dan Penggunaan Creativity Book Dalam Mengenalkan Literasi Agama Pada Anak Usia 5-6 Tahun Di Ra Miftahul Ulum Melaya Bali Tahun Pelajaran 2023/2024', '', NULL, NULL),
(556, '2024', '2020303018', 'Nur Halimah Z.A Ansori', '-', 10, 'Panji', 'Situbondo', 'Jawa Timur', 'Proses Pembelajaran Pada Anak Tunagrahita Kelas 1c Sdlb Bina Wiyata Putra Kota Situbondo Tahun Pelajaran 2023-2024', '', NULL, NULL),
(557, '2024', '2020303017', 'Nuraeni', '-', 10, 'Jatiroto', 'Lumajang', 'Jawa Timur', 'Penerapan Metode Tahsin Untuk Meningkatkan Kemampuan Membaca Surat-Surat Pendek Pada Anak Kelompok B Di Ra Muslimat Nu 54 Di Jatiroto Lumajang Tahun Pelajaran 2023-2024', '', NULL, NULL),
(558, '2024', '2020303036', 'Papi Zahita', '-', 10, 'Arjasa', 'Situbondo', 'JAwa Timur', 'Meningkatkan Kosa Kata Bahasa Inggris Melalui Media Flash Card Pada Anak Kelompok B Di Tk Pgri 6 Arjasa Tahun Pelajaran 2023/2024', '', NULL, NULL),
(559, '2024', '2020303020', 'Putri Dwi Oktafia', '-', 10, 'Sumber Gempol', 'Tulungagung', 'Jawa Timur', 'Pengenalan Kesenian Tradisional Reog Kendang Dalam Menumbuhkan Kecintaan Budaya Lokal Pada Anak Kelompok B Di TK Al Khodijah Wonorejo Sumber Gempol Tulungagung Tahun Pelajaran 2023/2024', '', NULL, NULL),
(560, '2024', '2020303037', 'Reni Indriyati', '-', 10, 'Jangkar', 'Situbondo', 'Jawa Timur', 'Meningkatkan Perkembangan Motorik Halus Anak Melalui Kegiatan Montase Pada Anak Usia 5-6 Tahun Di Ra Al-Hidayah Curah Kalak Jangkar Tahun Pelajaran 2023/2024', '', NULL, NULL),
(561, '2024', '2020303021', 'Rif\'atun', '-', 10, 'Ra\'as', 'Sumenep', 'Jawa Timur', 'Meningkatkan Kemampuan Mengenal Angka Anak Usia Dini Pada Kelompok B Dengan Media Flashcard Di RA Ibrahimy Sukorejo Situbondo Tahun Pelajaran 2023/2024', 'Terverifikasi', NULL, NULL),
(562, '2024', '2022303027', 'Risqotim Mubarokah', '-', 10, 'Asembagus', 'Situbondo', 'Jawa Timur', 'Pengembangan Alat Permainan Edukatif Mystery Box Untuk Meningkatkan Capaian Pembelajaran Elemen Jati Diri Anak Usia 5-6 Tahun Di Ra Al Hidayah Iii Kertosari Tahun Pelajaran  2023/2024', '', NULL, NULL),
(563, '2024', '2020303039', 'Robi Ika', '-', 10, 'Mlandingan', 'Situbondo', 'Jawa Timur', 'Meningkatkan Motorik Halus Anak Melalui Kegiatan Bermain Kolase Bahan Alam Pada Kelompok B Di Tk Kartini Campoan Mlandingan Situbondo Tahun Pelajaran 2023-2024', '', NULL, NULL),
(564, '2024', '2020303040', 'Ruhil Imani Ramadlani', '-', 10, 'Situbondo', 'Situbondo', 'Jawa Timur', 'Meningkatkan Kemampuan Literasi Dan Numerasi Melalui Loose Parts Di Kelompok A Tk Nurur Rofi\' Situbondo Tahun Pelajaran 2023/2024', '', NULL, NULL),
(565, '2024', '2020303022', 'Salwiyani', '-', 10, 'Batukliang Utara', 'Lombok Tengah', 'NTB', 'Penerapan Permainan Tradisional Gobak Sodor Untuk Meningkatkan Kemampuan Motorik Kasar Anak Kelompok B Di RA Arroyan Gunung Borok Lombok Tengah Pelajaran 2023-2024', '', NULL, NULL),
(566, '2024', '2020303043', 'Siti Nur Jannah', '-', 10, 'Banyuputih', 'Situbondo', 'Jawa Timur', 'Pengembangan Media Busybook Sebagai Ape (Alat Permainan Edukatif) Dalam Meningkatkan Kecerdasan Linguistic Pada Anak Usia 5-6 Tahun Di Ra Baiturrahman 2023-2024', '', NULL, NULL),
(567, '2024', '2020303044', 'Sugiarsih', '-', 10, 'Arjasa', 'Situbondo', 'Jawa Timur', 'Meningkatkan Sosial Emosional Anak Melalui Metode Bermain Peran Pada Anak Usia Dini Kelompok B Di Tk Pgri 6 Arjasa Pada Tahun Pelajaran 2023-2024', '', NULL, NULL),
(568, '2024', '2020303046', 'Tina Amelia Febriyatik', '-', 10, 'Jangkar', 'Situbondo', 'Jawa Timur', 'Meningkatkan Perkembangan Sosial Emosional Melalui Metode Bercerita Pada Anak Usia 5-6 Tahun Di Tk Pgri Jangkar Tahun Pelajaran 2023/2024', '', NULL, NULL),
(569, '2024', '2020303024', 'Umiyatul Hasanah', '-', 10, 'Grokgak', 'Buleleng', 'Bali', 'Pelaksanaan Kegiatan Paper Quilling Untuk Meningkatkan Kemampuan Motorik Halus Anak Usia Dini Di Kelas B RA Yambaul Ulum', '', NULL, NULL),
(570, '2024', '2020303025', 'Uzlifatil Jannah', '-', 10, 'Nunggunung', 'Sumenep', 'Jawa Timur', 'Penerapan Kegiatan Meronce Pola Geometri Dalam Meingkatkan Perkembangan Motorik Halus Anak Kelompok B Di TK Ibnu Alwan Talagah Nunggunung Sumenep', '', NULL, NULL),
(571, '2024', '2020303045', 'Wiwik S.', '-', 10, 'Mlandingan', 'Situbondo', 'Jawa Timur', 'Meningkatkan Motorik Halus Anak Dengan Kreasi Media Barang Bekas Pada Kelompok A Di Tk Kartini Mlandingan Situbondo Tahun Pelajaran 2023-2024', '', NULL, NULL),
(572, '2024', '2020303026', 'Yulmiani', '-', 10, 'Batukliang', 'Lombok Tengah', 'NTB', 'Meningkatkan Kemampuan Motorik Halus Anak Usia Dini Melalui Kegiatan Bermain Plastisin Dan Membentuk Geometri Pada Kelompok A Di RA Arroyan Gunung Borok Desa Setiling Lombok Tengah Tahun Pelajaran 2023 - 2024', '', NULL, NULL),
(573, '2024', '2020304010', 'Amelia', '-', 11, 'Silo', 'Jember', 'Jawa Timur', 'Upaya meningkatkan hasil belajar siswa melalui model Index Card Match pada persamaan linear dua variabel di MTs sayyidul Quro Jember', '', NULL, NULL),
(574, '2024', '2020304012', 'Anni Kustantina', '-', 11, 'Ra\'as', 'Sumenep', 'Jawa Timur', 'Pemahaman Peserta Didik Dalam Pembagian Warisan Secara Matematis Dan Penggunaan Aplikasi I-Waris', '', NULL, NULL),
(575, '2024', '2020304013', 'Ayu Ita Muhnifah', '-', 11, 'Negara', 'Jembrana', 'Bali', 'Eksplorasi Etnomatematika Rumah Panggung Peninggalan Kampung Loloan Barat Dan Relevansinya Terhadap Materi Geometri', '', NULL, NULL),
(576, '2024', '2020304014', 'Dina Haqiqiyah', '-', 11, 'Kwanyar', 'Bangkalan', 'Jawa Timur', 'Analisis Respon Peserta Didik Dan Guru Terhadap Kurikulum Merdeka Dalam Pembelajaran Matematika', '', NULL, NULL),
(577, '2024', '2020304005', 'Fahrurrozi', '-', 11, 'Banjardinas Kampung Anyar', 'Karangasem', 'Bali', 'Analisis Minat Belajar Santri Berbasis Lesson Study for Learning Community (LSLC) dengan Menggunakan Metode Kelipatan Persekutuan Terkecil  (KPK) pada Materi Matematika Faraidh.', '', NULL, NULL),
(578, '2024', '2020304015', 'Fifi Alfi Laili', '-', 11, 'Dungkek', 'Sumenep', 'Jawa Timur', 'Eksplorasi Konsep Matematika Dalam Sholat Dan Zakat', '', NULL, NULL),
(579, '2024', '2020304016', 'Fitria Hindun', '-', 11, 'Kalipuro', 'Banyuwangi', 'Jawa Timur', 'Pengaruh Model Pembelajaran Kooperatif Tipe Student Facilitator And Explaining (Sfae) Terhadap Minat Dan Pemahaman Siswa Dalam Pembelajaran Matematika', '', NULL, NULL),
(580, '2024', '20180304018', 'Ilmi Atika Waridatul Usfi ', '-', 11, 'Arjasa', 'Sumenep', 'Jawa Timur', 'Pengaruh Model Pembelajaran Cooperative Tipe Numbered Heads Together Untuk Meningkatkan Hasil Belajar Siswa Pada Mata Pelajaran Matematika Di Sman 1 Arjasa Kangean Tahun Ajaran 2022/2023', '', NULL, NULL),
(581, '2024', '2020304017', 'Ilmi Jazilah', '-', 11, 'Wongsorejo', 'Banyuwangi', 'Jawa Timur', 'Eksplorasi Etnomatematika Pada Alat Musik Tradisional Gamelan Dan Relevansinya Terhadap Pembelajaran Matematika', '', NULL, NULL),
(582, '2024', '2019304012', 'Indri Cahyaning Pitaloka', '-', 11, 'Kaliwang', 'Sumbawa Barat', 'NTB', 'Penerapan Model Pembelajaran Murder (Mood, Understand, Recall, Digest, Expland, Review) Untuk Meningkatkan Berpikir Kritis Matematis Siswa Smp', '', NULL, NULL),
(583, '2024', '2020304018', 'Indy Zulfa Rahmawati ', '-', 11, 'Songgon', 'Banyuwangi', 'Jawa Timur', 'Eksplorasi Etnomatematika Wana Wisata Rowo Bayu Dan Relevansinya Terhadap Pembelajaran Matematika Geometri Di Sekolah ', '', NULL, NULL),
(584, '2024', '2020304003', 'M. Arif Rohman Al Qodiri', '-', 11, 'Banyuputih', 'Situbondo', 'Jawa Timur', 'Eksplorasi Konsep Matematika Bilangan dalam Al-Qur\'an ', '', NULL, NULL),
(585, '2024', '2020304020', 'Malihatur Rifda', '-', 11, 'Banyuwangi', 'Banyuwangi', 'Jawa Timur', 'Penerapan Model Realistik Matemathic Education Berbasis Caring Comunity Untuk Meningkatkan Hasil Belajar Siswa Di Madrasah Aliyah Unggulan Al Anwari', '', NULL, NULL),
(586, '2024', '2020304007', 'Mukhammad Alfan Syarifuddin', '-', 11, 'Randudongkal', 'Pemalang', 'Jawa Tengah', 'Eksplorasi Konsep Geometri dalam Al-Qur\'an', '', NULL, NULL),
(587, '2024', '2020304022', 'Nur Azizah', '-', 11, 'Banyuputih', 'Situbondo', 'Jawa Timur', 'Kontribusi Konsep Matematika Dalam Perhitungan Zakat Berdasarkan Syari\'at Islam', '', NULL, NULL),
(588, '2024', '2020304023', 'Nur Maulina Muyassarah', '-', 11, 'Subo', 'Situbondo', 'Jawa Timur', 'Pengembangan Bahan Ajar Komat Untuk Meningkatkan Berpikir Kritis Dan Berpikir Kreatif Siswa Dengan Model CIRC Di SMP', '', NULL, NULL),
(589, '2024', '2020304024', 'Nurul Qomariyah', '-', 11, 'Asembagus', 'Situbondo', 'Jawa Timur', 'Pengaruh Model Pembelajaran Group Investigation (Gi) Berbantuan Media Manipulatif Terhadap Respon Dan Hasil Belajar Siswa', '', NULL, NULL),
(590, '2024', '2020304025', 'Nurzanul Hatimah', '-', 11, 'Wanasaba', 'Lombok Timur', 'NTB', 'Analisis Problem Solving Siswa Menggunakan Strategi Genius Learning', '', NULL, NULL),
(591, '2024', '2020304026', 'Saofi Hafifah', '-', 11, '-', '-', '-', 'Efektivitas Model Pembelajaran TTW (Think, Talk, And Write) Untuk Meningkatkan Kemampuan Matematis Siswa Dalam Menyelesaikan Masalah Kelas X MA Al-Mannan Bagek Nyaka Santri Lombok Timur Tahun 2023-2024', '', NULL, NULL),
(592, '2024', '2020304028', 'Siti Fatimatuz Zahro', '-', 11, 'Asembagus', 'Situbondo', 'Jawa Timur', 'Analisis Kesulitan Siswa Dalam Menyelesaikan Masalah Matematika Pada Pokok Bahasan Persamaan Kuadrat Ditinjau Dari Teori Watson', '', NULL, NULL),
(593, '2024', '2020304029', 'Siti Habiba', '-', 11, 'Rubaru', 'Sumenep', 'Jawa Timur', 'Pengaruh Model Pembelajaran Logan Avenue Problem Solving (Laps) Heuristik Terhadap Self Efficacy Dan Kemampuan Pemecahan Masalah Matematika', '', NULL, NULL),
(594, '2024', '201825034', 'Sri Mulyana', '-', 11, 'Ra\'as', 'Sumenep', 'Jawa Timur', 'Pengaruh Model Pembelajaran Kooperatif Melalui Tipe Tgt Terhadap Minat Dan Motivasi Belajar Pada Siswa Di Smp', '', NULL, NULL),
(595, '2024', '2020304008', 'Sugiarto', '-', 11, 'Sapeken', 'Sumenep', 'Jawa Timur', 'Implementasi Model Pembelajaran High Order Thinking Skill (HOT) Terhadap Kemampuan Berpikir Matematis Siswa SMA Nurul Islam Sepangkur Besar', '', NULL, NULL),
(596, '2024', '2020202004', 'Ahmad Fahimul Ghorib', '-', 4, 'Kabat', 'Banyuwangi', 'Jawa Timur', 'Prespektif Hukum Islam Terhadap Penetapan Asal Usul Anak Hasil Pernikahan Sirri (Studi Analisis Putusan Hakim No.63/PDT.P/2023/PA.SIT)', '', NULL, NULL),
(597, '2024', '2022503126', 'Irma Yunita', '-', 17, 'Rogojampi', 'Banyuwangi', 'Jawa Timur', 'Penerapan Data Mining Dalam Mengelompokkan Jumlah Penyelamatan Kebakaran di Kabupaten Situbondo', '', NULL, NULL),
(598, '2024', '2020505012', 'Sri Hidayanti', '-', 14, 'Sapekan', 'Sumenep', 'Jawa Timur', 'Karakteristik Organoleptik dan FIsikokimia Stik Ikan Dengan Perbedaan Konsentrasi Daging Ikan Cakalan', '', NULL, NULL),
(599, '2024', '202250315', 'Faridatul Azizah', '-', 17, 'Asembagus', 'Situbondo', 'Jawa Timur', 'Klasifikasi Kesiapan Anak Raudhotul Athfal Masuk Sekolah Dasar Menggunakan  Metode Naive Bayes', '', NULL, NULL),
(600, '2024', '2022503128', 'Shofiatul Mahmudah', '-', 17, 'Wongsorejo', 'Banyuwangi', 'Jawa Timur', 'Sistem Informasi Persuratan Di SMK Ibrahimy Miftahul Ulum Bengkak Menggunakan PHP dan MySQL', '', NULL, NULL),
(601, '2024', '2020202025', 'Qutbur Rabbani', '-', 4, 'Arjasa', 'Sumenep', 'Jawa Timur', 'Tinjauan Hukum Islam Terhadap Nikah Paksa Stadi kasus Desa Kolo Kolo Kecamatan Arjasa Kabupaten Sumenep', '', NULL, NULL),
(602, '2024', '2020505013', 'Ana Mutmainnah', '-', 14, 'Asembagus', 'Situbondo', 'Jawa Timur', 'Analisi Kimia dan sifat organoletrik produk roll cake dengan penambahan tepung buah mangrove', '', NULL, NULL),
(603, '2024', '2019505005', 'Anisa Luckyta Kurniawan', '-', 14, 'Panarukan', 'Situbondo', 'Jawa Timur', 'Analisi Karakteristik Kimia dan Organoleptik Teh Kombucha Rumput Laut (Eucheuma cottonii) dengan Waktu Fermentasi yang berbeda', '', NULL, NULL),
(604, '2024', '2020505006', 'Arikatun Nisak', '-', 14, 'Asembagus', 'Situbondo', 'Jawa Timur', 'Analisis Strategi Pemasaran Rumah makan Seafood Situbondo', '', NULL, NULL),
(605, '2024', '2020203018', 'Kholilurrahman', '-', 3, 'Nonggunong', 'Sumenep', 'Jawa Timur', 'Implementasi Strategi Pelayanan dalam Meningkatkan Kepuasan Pelanggan Pada PLDT di Pulau Manok Desa Sonok Kecamatan Nonggunong Kabupaten Sumenep Dalam Perspektif Ekonomi Islam', '', NULL, NULL),
(606, '2024', '2020203021', 'Moh. Haidir Ali', '-', 3, 'Ra\'as', 'Sumenep', 'Jawa Timur', 'Implementasi Etos Kerja Islam terhadap Kinerja karyawan kerambak apung sidomampir di desa Guwa-Guwa kecamatan Ra\'as Kabupaten sumenep', '', NULL, NULL),
(607, '2024', '2020702038', 'Indana Zulfa', '-', 19, 'Nonggunong', 'Sumenep', 'Jawa Timur', 'Analisis Yuridis Pemenuhan Hak Anak Sebagai Korban Kekerasan Seksual Dalam Penegakan Hukum (Studi Putusan Nomor: 48/Pid.Sus/2023/Pn Mar)', '', NULL, NULL),
(608, '2024', '2020503034', 'Uti Rama Wildan', '-', 17, 'Benua Kayong', 'Ketapang', 'Kalimantan Barat', 'Sistem Informasi Geografis Penyebaran Pondok Pesantren kota Situbondo berbasis Web', '', NULL, NULL),
(609, '2024', '20200301076', 'Dita Fitriyatul Carissa', '-', 8, 'Gerokgak', 'Buleleng', 'Bali', 'Implementasi Metode Index Card Match Untuk Meningkatkan Hasil Belajar Siswa Pada Mata Pelajaran Sejarah Kebudayaan Islam Kelas VIII di MTs Ampel Buleleng Bali', '', NULL, NULL),
(610, '2024', '20200301009', 'Ardianto', '-', 8, 'Pujut', 'Lombok Tengah', 'Nusa Tenggara Barat', 'Metode Menghafal Al-qur\'an One Day One Page Di Asrama Tahfidzul Qur\'an Putra Pondok Pesantren Salafiyah Syafi\'iyah Sukorejo Situbondo Tahun Pelajaran 2023-2024', '', NULL, NULL),
(611, '2024', '2020501038', 'Latifatus Syifah', '-', 15, 'Jangkar', 'Situbondo', 'Jawa Timur', 'Prototype Alat Transportasi Vertikal Berbasis Mikrokontroler Arduino Uno Atmega328 Dan Radio Frequency Identification (RFID) Di Perpustakaan Ibrahimy', '', NULL, NULL),
(612, '2024', '2020501042', 'REZA AULIA SILMI', '-', 15, 'Banyuputih', 'Situbondo', 'Jawa Timur', 'Rancang Bangun Doorlock Sistem Perpustakaan Ibrahimy Menggunakan Teknologi RFID Dengan Visitor Counting Berbasis Arduino Uno', '', NULL, NULL),
(613, '2024', '2020701008', 'Muhamad Fahmi Fahriadi', '-', 20, 'Janapria', 'Lombok Tengah', 'Nusa Tenggara Barat', 'Hubungan Antara Interpersonal Trust dan Kohefitas Kelompok Dengan Komitmen Berorganisasi Pengurus IKSASS Nusa Tenggara Barat', '', NULL, NULL),
(614, '2024', '2020503113', 'Rosalina Oktavia', '-', 17, 'Tlogosari', 'Bondowoso', 'Jawa Timur', 'Implementasi Sistem Informasi Manajemen Kepegawaian Berbasis Website Untuk Optimalisasi Pengelolaan Data Pegawai di Balai Desa Tlogosari', '', NULL, NULL),
(615, '2024', '2020503116', 'Ummil Mahfudoh', '-', 17, 'Banyuputih', 'Situbondo', 'Jawa Timur', 'Sistem Informasi Absensi dan Penggajian Karyawan Berbasis Website Pada SJ Group', '', NULL, NULL);
INSERT INTO `mahasiswas` (`id`, `lulusan`, `nim`, `nama`, `jk`, `prodi_id`, `kecamatan`, `kabupaten`, `provinsi`, `tugas_akhir`, `verifikasi`, `created_at`, `updated_at`) VALUES
(616, '2024', '2022701010', 'Muhammad Ghiyats Rasyid', '-', 20, 'Kabat', 'Banyuwangi', 'Jawa Timur', 'Hubungan Antara Regulasi Diri dengan Stres Akademik Siswa Ma\'hadul Qur\'an PP. Salafiyah Syafi\'iyah Sukorejo', '', NULL, NULL),
(617, '2024', '20200301026', 'M. Ariel Iqbal Maulana', '-', 8, 'Kaliwates', 'Jember', 'Jawa Timur', 'Internalisasi Nilai-Nilai Ahl Al-Sunnah Wa Al-Jama\'ah Al-Nahdhliyah Sebagai Upaya Pencegahan Pengaruh Islam Radikal Di MTs Al-Azhar Kaliwates Jember Tahun Pelajaran 2023/2024', '', NULL, NULL),
(618, '2024', '2020301028', 'M. Faozan Saputra', '-', 8, 'Praya Timur', 'Lombok Tengah', 'Nusa Tenggara Barat', 'Motivasi Santri Dalam Menghafal Al-Qur\'an di Pondok Pesantren (Studi Kasus Asrama Riyadul Huffadz Pondok Pesantren Al-Aziziyah Program Takhassus Lombok Barat)', '', NULL, NULL),
(619, '2024', '2020501039', 'Linda Sofiana', '-', 15, 'Kangean', 'Sumenep', 'Jawa Timur', 'Perancangan Pemrograman Adaptif Pada Robot Pengantar Barang', '', NULL, NULL),
(620, '2024', '2020301060', 'Yogi Bahtiar', '-', 8, 'Praya Barat', 'Lombok Tengah', 'Nusa Tenggara Barat', 'Implementasi Program Pembelajaran Al-Qur\'an di SMP Islam Al-Ma\'arif Tanak Rarang', '', NULL, NULL),
(621, '2024', '20200301003', 'Ade Indradi', '-', 8, 'Masbagik', 'Lombok Timur', 'Nusa Tenggara Barat', 'Peran Guru Pendidikan Agama Islam Dalam Meningkatkan Kemampuan Berpikir Kritis Siswa Kelas VII Di SMPN 1 Masbagik Lotim NTB', '', NULL, NULL),
(622, '2024', '2018304010', 'Muhamad Sohibul Umam', '-', 12, 'Praya Barat', 'Lombok Tengah', 'Nusa Tenggara Barat', 'Perancangan Gedung Aula Ponpes NU Al-Mansyuriah Taklimusshibyan Bonder Dengan Konsep Arsitektur Neo-Vernacular', 'Terverifikasi', NULL, NULL),
(623, '2024', '2020503009', 'Ahmad Zeinuri', 'L', 23, 'Cermee', 'Bondowoso', 'Jawa Timur', 'Sistem Pendukung Keputusan Penentuan Kelayakan Santri Penerima Kartu Aktif Berasrama Menggunakan Metode Profile Matching', 'Terverifikasi', NULL, '2026-04-14 13:43:52'),
(624, '2024', '20200301151', 'Syarifatul Khuluqiyah', '-', 8, 'Jangkar', 'Situbondo', 'Jawa Timur', 'Urgensi Aassesment Of Learning Dalam Proses Pembelajaran Pendidikan Agama Islam Pada Kurikulum Merdeka Di SMPN 1 Jangkar Situbondo', 'Terverifikasi', NULL, NULL),
(625, '2024', '2020701022', 'Lely Purnamawati', '-', 20, 'Socah', 'Bangkalan', 'Jawa Timur', 'Hubungan Pola Asuh Orang Tua Dengan Perilaku Agresif Remaja Siswa Kelas Xi Sma Asshomadiyah Burneh Bangkalan', 'Terverifikasi', NULL, NULL),
(626, '2024', '2020402031', 'Mita Ayu Hidayatullah', '-', 7, 'Rogojampi', 'Banyuwangi', 'Jawa Timur', 'Dampak Framing Pemberitaan Kasus Kekerasan Dikalangan Remaja Santri Pada Masyarakat Rogojampi Kabupaten Banyuwangi', 'Terverifikasi', NULL, NULL),
(627, '2024', '20200301011', 'Aswan', '-', 8, 'Bathin III Ulu', 'Muara Bungo', 'Jambi', 'Implementasi Metode Jibril Terhadap Kemampuan Membaca Al-Qur\'an Santri Qiro\'atuna Asrama Nurul Qoni\' Putra Pondok Pesantren Salafiyah  Syafi\'iyah Sukorejo Situbondo Tahun Pembelajaran 2023-2024', 'Terverifikasi', NULL, NULL),
(628, '2024', '20200301052', 'Sirojus Shobirin', '-', 8, 'Jangkar', 'Situbondo', 'Jawa Timur', 'Implementasi Budaya 55 Dalam Pembertukan  Karakter bersahabat Siswa Kellas X IPA 1 Di SMA Islam Sunan Bonang Arjasa Situbondo Tahun Pelajaran 2023-2024', 'Terverifikasi', NULL, NULL),
(629, '2024', '2020502019', 'Miftahul Arifin', '-', 16, 'Asembagus', 'Situbondo', 'Jawa Timur', 'Rancang Bangun Buku Induk Dan Sistem Pendukung Keputusan Siswa Berprestasi Berbasis Web Di MA Miftahul Arifin Menggunakan Metode Moora', 'Terverifikasi', NULL, NULL),
(630, '2024', '2020203025', 'Muhammad Ariadi', '-', 2, 'Praya', 'Lombok Tengah', 'Nusa Tenggara Barat', 'Implementasi Pembiayaan Pada Usaha Masyarakat Sekitar Pesantren Pada Bank Waqof Mikro Ahmad Taqiyudin Mansur Lombok', 'Terverifikasi', NULL, NULL),
(631, '2024', '2020204090', 'Ulinasi', '-', 1, 'Ijen', 'Bondowoso', 'Jawa Timur', 'Implementasi Strategi Pemasaran Syariah Dalam Meningkatkan Minat Beli Konsumen Di Pabrik Tak Kiki Collection Pujer Bondowoso', 'Terverifikasi', NULL, NULL),
(632, '2024', '20190310180', 'Itsna Istiqomatil Imaniyah', '-', 8, 'Cermee', 'Bondowoso', 'Jawa Timur', 'Penerapan Metode Demonstrasi Untuk Meningkatkan Hasil Belajar Siswa Pada Mata Pelajaran PAI di SDN Palalangan 1 Cermee Bondowoso Tahun Pelajaran 2022/2023', 'Terverifikasi', NULL, NULL),
(633, '2024', '2022503115', 'Firmansyah Widiarto Prabowo', '-', 17, 'Panarukan', 'Situbondo', 'Jawa Timur', 'Deteksi Warna Kulit Menggunakan Metode Deep Learning Dengan CNN (Convolutational Neutral Network) Untuk Menentukan Kecocokan Warna Kulit dan Warna Busana', 'Terverifikasi', NULL, NULL),
(634, '2024', '2020703046', 'Sofwatul Aqliyah', '-', 18, 'Gapura', 'Sumenep', 'Jawa Timur', 'Analisis Harga Pokok Produksi Untuk Penentuan Harga Jual Produk Besi Dengan Menggunakan Metode Full Costing(Studi Kasus Pada  Pandai Besi Joko Tole Desas Kolpo Kecamatan Batang-Batang Kabupaten Sumenep)', 'Terverifikasi', NULL, NULL),
(635, '2024', '2020302049', 'Wildatul Aluf', '-', 9, 'Pujer', 'Bondowoso', 'Jawa Timur', 'Pengembangan Buku Saku Mufrodat Al-Yaumiyyah Berdaasarkan Pendekatan Komunikatif Dalam Pemberlajaran Bahasa Arab Di Asrama Bahasa Nurul Qoni\' Putri pada Tahun Pembelajaran 2024-2025', 'Terverifikasi', NULL, NULL),
(636, '2024', '2020505011', 'Riza Naswatul Taulina', '-', 14, 'Penebel', 'Tabanan', 'Bali', 'Pengaruh Penambahan Rumput Laut (Eucheuna Cottoni) Terhadap Karakteristik Kimia Organoleptik Yoghurt', 'Terverifikasi', NULL, NULL),
(637, '2024', '2020304011', 'Anisa Bella', '-', 11, 'Kalibaru', 'Banyuwangi', 'Jawa Timur', 'Etnomatematika Pada Pembahasan Geometri Dalam Perspektif Al-Qur’an', 'Terverifikasi', NULL, NULL),
(638, '2024', '2020502025', 'Muhammad Jundanuddin', '-', 16, 'Silo', 'Jember', 'Jawa Timur', 'Implementasi Data Mining Pada Penilaian Kinerja Guru Menggunakan Metode K-Means Neighbor(KNN) Studi Kasus Pada MI Al-Ghifari Silo Jember', 'Terverifikasi', NULL, NULL),
(639, '2024', '2020204036', 'Muhammad Iroqi Bahtiar Ilmi', '-', 5, 'Silo', 'Jember', 'Jawa Timur', 'Implementasi Manajemen Promosi Syariah Dalam Meningkatkan Minat Konsumen di Home Industry Annisa Cake & Bakery Kec. Silo Jember', 'Terverifikasi', NULL, NULL),
(640, '2024', '2020702044', 'Noviatul Hasanah', '-', 19, 'Tenggarang', 'Bondowoso', 'Jawa Timur', 'Penerapan Pasal 55 KUHP Tindak Pidana Seksual (Studi Putusan NO.7/Pid.Sus.A/Pn Byw)', 'Terverifikasi', NULL, NULL),
(641, '2024', '20200301078', 'Istiqomah', '-', 8, 'Pujer', 'Bondowoso', 'Jawa Timur', 'Implementasi Metode Number Head Together Dalam Meningkatkan Hasil Belajar Siswa Kelas VIII B di SMPN 1 Arjasa Tahun Pelajaran 2023-2024', 'Terverifikasi', NULL, NULL),
(642, '2025', '202140127', 'M. Ahsanul Faiz', 'L', 7, 'Cakung', 'Jakarta Timur', 'Jakarta', 'Makna Komunikasi Simbolik Tarian Sufi di Pondok Pesantren Salafiyah Syafi’iyah Sukorejo Situbondo', 'Terverifikasi', NULL, NULL),
(643, '2024', '2020302002', 'Ahmad Faisal Rafli', '-', 9, 'Negara', 'Jembrana', 'Bali', 'Pengembangan Bahan Ajar Kitab Kuning Unwan Ad-dzorfi Berbasis Skema Dalam Meningkatkan Pemahaman Ilmu Shorof Santri Kelas 4 Marhalah Ula Madrasah Diniyah i\'dadiyah Pondok Pesantren Salafiyah Syafi\'iyah Sukorejo Situbondo', 'Terverifikasi', NULL, NULL),
(645, '2025', '202140220', 'SOFYAN SETIAWAN', 'L', 6, 'UJUNGLOE', 'KAB. BULUKUMBA', 'Sulawesi Selatan', 'Korelasi Regulasi Diri Dengan Motivasi Penyelesaian Hafalan Al-Qur\'an Santri Tahfidz Di Pondok Pesantren Salafiyah Syafi\'iyah Sukorejo', 'Terverifikasi', NULL, NULL),
(646, '2025', '2021301045', 'Moh. Helman', 'L', 8, 'Pragaan', 'Sumenep', 'Jawa Timur', 'Implementasi Metode At-tanzil Dalam Pembelajaran Al-Qur\'an di Madrasah Diniyah Takmiliyah Ulil Albab Pondok Pesantren Misbahul Munir Sentol Daya Pragaan Sumenep', 'Terverifikasi', NULL, NULL),
(647, '2025', '2021301025', 'HASAN AFANDI', 'L', 8, 'ARJASA', 'KAB. SITUBONDO', 'JAWA TIMUR', 'Implementasi Assessment For Learning (AFL) dalam Pembelajaran Pendidikan Agama Islam Untuk Peningkatan Keaktifan Siswa di SMP Ibrahimy 1 Sukorejo Situbondo Tahun Pelajaran 2024/2025', 'Terverifikasi', NULL, NULL),
(648, '2025', '2021203037', 'HILMINAVIA', 'P', 3, 'Jangkar', 'Situbondo', 'Jawa Timur', 'Pengaruh Harga, Kualitas Makanan Dan Lingkungan Fisik Terhadap Keputusan Pembelian Konsumen Di Kedai Siring Pelabuhan Jangkar Situbondo', 'Terverifikasi', NULL, NULL),
(649, '2025', '2021205020', 'QURROTUL AINIYAH', 'P', 1, 'Arjasa', 'Situbondo', 'Jawa Timur', 'Pengaruh Literasi Keuangan, Tingkat Pendapatan, Dan Status Sosial Ekonomi Terhadap Perencanaan Keuangan Keluarga Muslim Di Desa Arjasa', 'Terverifikasi', NULL, NULL),
(650, '2025', '2021203057', 'YUNI AYUNDA', 'P', 3, 'Tlogosari', 'Bondowoso', '', 'Pengaruh Persepsi Manfaat, Kemudahan Penggunaan, Dan Risiko Digital Payment Terhadap Keputusan Menggunakan El-Santri Di Pertokoan Pondok Pesantren Salafiyah Syafi’iyah Sukorejo Situbondo', 'Terverifikasi', NULL, NULL),
(651, '2025', '2021204071', 'IRMANIATUN ASTINA', 'P', 5, 'Jangkar', 'Situbondo', 'Jawa Timur', 'Pengaruh Personal Branding Dan Konten Kreatif Media Sosial Tiktok Terhadap Customer Engagement Di Cv. Adeeva Group Jember', 'Terverifikasi', NULL, NULL),
(652, '2025', '2021205014', 'NABILA AYU MAZIDAH', 'P', 1, 'Jangkar', 'Situbondo', 'Jawa Timur', 'Pengaruh Kebijakan Dividen Dan Struktur Modal Terhadap Kinerja Keuangan Perusahaan Yang Tercatat Di Jakarta Islamic Index 70 (Jii70) Bursa Efek Indonesia (Bei) Tahun 2023', 'Terverifikasi', NULL, NULL),
(654, '2025', '2021202017', 'MEDI KANDI SWARA', 'L', 4, 'PRAYA TENGAH', 'LOMBOK TENGAH', 'NTB', 'PERSPEKTIF HUKUM ISLAM TERHADAP TRADISI NGELENGKAK (Studi Kasus di Desa Pengembur Kecamatan Pujut Kabupaten Lombok Tengah)', 'Terverifikasi', NULL, NULL),
(655, '2025', '202140228', 'FINA ALFIATUL MASRUROH', 'P', 6, 'Gumukmas', 'Jember', 'Jawa Timur', 'Konseling Realita Dalam Mengatasi Kecanduan Judi Online Pada Warga Binaan Di Lembaga Pemasyarakatan Kelas II B Bondowoso', 'Terverifikasi', NULL, NULL),
(656, '2025', '2021204087', 'MAULANA HAMID', 'L', 5, 'JEMBRANA', 'JEMBRANA', 'Bali', 'IMPLEMENTASI ETIKA BISNIS ISLAM DALAM MENINGKATKAN LOYALITAS KONSUMEN DI RUMAH MAKAN LESEHAN KRETEG NYIRANG DESA BALUK KECAMATAN NEGARA KABUPATEN JEMBRANA PROVINSI BALI', 'Terverifikasi', NULL, NULL),
(657, '2025', '2021204028', 'Mohammad Nurul Robit', 'L', 5, 'Bondowoso', 'Bondowoso', 'Jawa Timur', 'PENGARUH STORE ATMOSPHERE DAN KUALITAS PELAYANAN TERHADAP KEPUASAN KONSUMEN DI KPM SWALAYAN SALAFIYAH SYAFI’IYAH SUKOREJO', 'Terverifikasi', NULL, NULL),
(658, '2025', '2021113064', 'MUHAMMAD MUHARRIR', 'L', 8, 'PANARUKAN', 'KAB. SITUBONDO', 'Jawa Timur', 'IMPLEMENTASI PEMBELAJARAN PROJECT BASED LEARNING DALAM MEMOTIVASI KREATIVITAS SISWA PADA MATA PELAJARAN PENDIDIKAN AGAMA ISLAM DI SMAN 1 ASEMBAGUS SITUBONDO TAHUN PELAJARAN 2024/2025', 'Terverifikasi', NULL, NULL),
(659, '2025', '202140252', 'AININ AINURROHMAH', 'P', 6, 'Cikarang Utara', 'Bekasi', 'Jawa Barat', 'Bimbingan Pranikah Dalam Menumbuhkan Kesiapan Mental Calon Pengantin Di KUA Kecamatan Cikarang Barat Kabupaten Bekasi', 'Terverifikasi', NULL, NULL),
(660, '2025', '20200301015', 'FAWAIZ', 'L', 8, 'Bebandem', 'Karangasem', 'Bali', 'Impelementasi Model Pembelajaran Pbl (Problem Based Learning) Pada Mata Pelajaran Fiqih Untuk Meningkatan Kemampuan Berfikir Kritis Siswa Kelas VIII Di MTS Ma’arif Provinsi Bali Tahun Pelajaran 2024-2025', 'Terverifikasi', NULL, NULL),
(661, '2025', '2021301069', 'YASIRWAN AGIS SABRI', 'L', 8, 'PRAYA', 'KAB. LOMBOK TENGAH', 'Nusa Tenggara Barat', 'PENGARUH LITERASI DIGITAL TERHADAP PEMBENTUKAN KARAKTER SOSIAL SISWA DALAM PEMBELAJARAN PENDIDIKAN AGAMA ISLAM KELAS XI SMAN 1 JONGGAT LOMBOK TENGAH NTB TAHUN PELAJARAN 2024/2025', 'Terverifikasi', NULL, NULL),
(662, '2025', '2021603035', 'YUSAIDAH', 'P', 22, 'AMBUNTEN', 'SUMENEP', '', 'UPAYA PENINGKATAN PENGETAHUAN DAN SIKAP TERHADAP KEPUTIHAN MELALUI MEDIA BUKU SAKU DIGITAL BERBASIS FLIPBOOK  PADA REMAJA PUTRI KELAS IX DI SMPN 1 BANYUPUTIH TAHUN 2025', '', NULL, NULL),
(663, '2025', '2021203033', 'ANISA AMALIA', 'P', 3, 'Jangkar', 'Situbondo', 'Jawa Timur', '\"Implementasi Etika Bisnis Islam Dalam Meningkatkan Pelayanan Konsumen', NULL, NULL, NULL),
(664, '2025', '2021204026', 'Mohammad Anis Baihaqi', 'L', 5, 'Cerme', 'Bondowoso', 'Jawa Timur', 'ANALISIS STRATEGI MENEJEMEN SUMBER DAYA INSANI DALAM MENINGKATKAN KINERJA KARYAWAN', 'Terverifikasi', NULL, NULL),
(665, '2025', '2021301033', 'LALU DIMAS PANJI PANGKUYUDA', 'L', 8, 'PUJUT', 'KAB. LOMBOK TENGAH', 'Nusa Tenggara Barat', 'IMPLEMENTASI METODE TASMI` SEBAGAI UJI PUBLIK DALAM PENINGKATAN KUALITAS HAFALAN AL-QUR`AN SANTRI DI ASRAMA TAHFIDZUL QUR’AN PONDOK PESANTREN SALAFIYAH SYAFI’IYAH SUKOREJO SITUBONDO JAWA TIMUR', 'Terverifikasi', NULL, NULL),
(666, '2025', '2021302024', 'M. Kurnia Hidayatullah', 'L', 9, 'Praya Timur', 'Lombok Tengah', 'NTB', 'PENGEMBANGAN BUKU AJAR BERBASIS MUHAWARAH UNTUK MENINGKATKAN MAHARATUL KALAM SISWA KELAS VII MTS AL- MA’ARIF MUJUR PRAYA TIMUR LOMBOK TENGAH TAHUN PELAJARAN 2024/2025', 'Terverifikasi', NULL, NULL),
(667, '2025', '2021204075', 'LATIFATUL KHOFIFAH', 'P', 5, 'Arjasa', 'Situbondo', 'Jawa Timur', 'Strategi Pemasaran Syari\'ah Dalam Meningkatkan Minat Beli Konsumen (Studi Kasus Pada Toko Mia Collection Ketowan Arjasa Situbondo)', 'Terverifikasi', NULL, NULL),
(668, '2025', '2021204024', 'MOH. FAJRUL FALAH', 'L', 5, 'KALIPURO', 'Banyuwangi', 'Jawa Timur', 'Pengaruh Promosi dan Kualitas Pelayanan terhadap Minat Beli Konsumen di CV. Republik Using', 'Terverifikasi', NULL, NULL),
(669, '2025', '202140129', 'MUHAMMAD KHOZAINULLAH', 'L', 7, 'BANYUPUTIH', 'KAB. SITUBONDO', 'Jawa Timur', 'DAKWAH RAHMATAN LIL ‘ALAMIN KHR. AHMAD AZAIM IBRAHIMY MELALUI  MEDIA DIGITAL', 'Terverifikasi', NULL, NULL),
(670, '2025', '2021302045', 'NALIATUL HASANAH', 'P', 9, 'Kalisat', 'Jember', 'Jawa Timur', 'Pembuatan Media Windmill Untuk Meningkatkan Minat Belajar Bahasa Arab Siswa Kelas Vii Madrasah Tsanawiyah Darut Tarbiyah Banjarwaru Kelir Kalipuro Banyuwangi Tahun Pelajaran 2024/2025', 'Terverifikasi', NULL, NULL),
(671, '2025', '2021301053', 'M. Fijay Ma\'ruf', 'L', 8, 'Sukawati', 'Gianyar', 'Bali', 'IMPLEMENTASI MODEL PEMBEAJARAN CONTEXTUAL TEACHING AND LEARNING DALAM PENINGKATAN PARTISIPASI BELAJAR SISWA KELAS VII B PADA MATA PELAJARAN AL-QUR’AN HADIST DI MTS NU ISLAMIYAH ASEMBAGUS', 'Terverifikasi', NULL, NULL),
(672, '2025', '2021702061', 'FIKRI ROHMAN', 'L', 19, 'GEROKGAK', 'KAB. BULELENG', 'Bali', 'ANALISIS YURIDIS KEKUATAN HUKUM PONDOK PESANTREN DALAM MENYELESAIKAN PERKARA PIDANA UNTUK MENCAPAI KEADILAN RESTORATIF TERHADAP ANAK YANG BERHADAPAN DENGAN HUKUM', 'Terverifikasi', NULL, NULL),
(673, '2025', '2021704020', 'NAILLAH ZAHRA CAHYANTI', 'P', 21, 'Rumpin', 'Bogor', 'Jawa Barat', 'Vocabulary Learning Through Memrise Application : An Experimental Study', 'Terverifikasi', NULL, NULL),
(674, '2025', '2021502083', 'KHAIRUL ANAM', 'L', 16, 'NONGGUNONG', 'KAB. SUMENEP', 'Jawa Timur', 'E-RECRUTMENT SISTEM PENDUKUNG KEPUTUSAN PENERIMAAN PEGAWAI BMT NU CABANG GAYAM MENGGUNAKAN  METODE SIMPLE ADDITIVE WEIGHTING (SAW) BERBASIS WEB', '', NULL, NULL),
(675, '2025', '2021203026', 'NASUPIAN SAURI', 'L', 3, 'BEBANDEM', 'KAB. KARANGASEM', 'Bali', 'STRATEGI PENDISTRIBUSIAN ZAKAT PROFESI DALAM MENINGKATKAN KESEJAHTERAAN MASYARAKAT DI BADAN AMIL ZAKAT NASIONAL (BAZNAS) KABUPATEN KARANGASEM BALI', 'Terverifikasi', NULL, NULL),
(676, '2025', '2021204104', 'SUSANTI KHAIRILLAH', 'P', 5, 'Batang-Batang', 'Sumenep', 'Jawa Timur', 'Pengaruh Kualitas Pelayanan Dan Fasilitas Terhadap Kepuasan Konsumen Di Kantin 2 Ud. Assyarif Pondok Pesantren Salafiyah Syafi’iyah Sukorejo Situbondo', 'Terverifikasi', NULL, NULL),
(677, '2025', '202140232', 'INAYATUL FAJRIYAH', 'P', 6, 'Teluk Batang', 'Kayong Utara', 'Kal-Bar', 'Peran Penyuluh Agama Islam Dalam Mencegah Kasus Pernikahan Siri Di Kantor Urusan Agama Teluk Batang Kayong Utara Kalimantan Barat', 'Terverifikasi', NULL, NULL),
(678, '2025', '2020204087', 'TA\'TIKA NAILUL KHOIR', 'P', 5, 'Sumberejo', 'Banyuwangi', 'Jawa Timur', 'Implementasi Manajemen Produksi Syari’ah Dalam Meningkatkan Produktivitas Produksi Air Minum Dalam Kemasan (AMDK) P2s2 CV. Hafas Situbondo', 'Terverifikasi', NULL, NULL),
(679, '2025', '2021301046', 'MUAJRUL ABUBAKAR', 'L', 8, 'KOTA TAMBOLAKA', 'KAB. SUMBA BARAT DAYA', 'NTT', 'Model Pembelajaran Direct Intruction Untuk Meningkatkan Pemahaman Peserta Didik Pada Pelajaran PAI DI SMP Negeri 1 Banyuputih Situbondo Tahun Pelajaran 2024/2025', 'Terverifikasi', NULL, NULL),
(680, '2025', '2021301068', 'WA\'YUL MUNIBIN', 'L', 8, 'GAYAM', 'KAB. SUMENEP', 'JAWA TIMUR', 'PENERAPAN VARIASI MENGAJAR DALAM PENINGKATAN MOTIVASI BELAJAR SISWA PADA MATA PELAJARAN PENDIDIKAN AGAMA ISLAM DI SMAN 1 GAYAM SUMENEP TAHUN PELAJARAN 2024/2025', 'Terverifikasi', NULL, NULL),
(681, '2025', '202140218', 'RIYAN HIDAYAT', 'L', 6, 'GAYAM', 'KAB. SUMENEP', 'JAWA TIMUR', 'PROSES PELAKSANAAN KONSELING PRANIKAH BAGI CALON PENGANTIN DI KANTOR URUSAN AGAMA KECAMATAN GAYAM KABUPATEN SUMENEP', 'Terverifikasi', NULL, NULL),
(682, '2025', '2021401038', 'ROFITA MADE ARI ANTIKA', 'P', 6, 'Mangaran', 'Situbondo', 'Jawa Timur', 'Bimbingan Karier Pada Warga Binaan Melalui Program Pengembangan Keterampilan Kerja Lembaga Pemasyarakatan Kelas Iib Bondowoso', 'Terverifikasi', NULL, NULL),
(683, '2025', '2021202034', 'ZAINUDDIN', 'L', 4, 'TERANGUN', 'GAYU LUES', 'ACEH', 'PERSPEKTIF HUKUM ISLAM DAN HUKUM ADAT TERHADAP PERNIKAHAN NAIK (STUDI KASUS DI DESA PERSADA TONGRA KECAMATAN TERANGUN KABUPATEN GAYO-LUES)', 'Terverifikasi', NULL, NULL),
(684, '2025', '2021202045', 'KRISMA PUTRI', 'P', 4, 'Rogojampi', 'Banyuwangi', 'Jawa Timur', 'Tinjauan Hukum Islam Terhadap Penolakan Itsbat Nikah (Studi Kasus Di Pengadilan Agama Jember Perkara Nomor 1124/Pdt.P/2024/Pa.Jr)', 'Terverifikasi', NULL, NULL),
(685, '2025', '202140222', 'AMELIA HIDAYAH', 'P', 6, 'Gerokgak', 'Buleleng', 'Bali', 'Peran Konselor Dalam Mengatasi Kekerasan Dalam Rumah Tangga Di Kua Kecamatan Seririt Kabupaten Buleleng', 'Terverifikasi', NULL, NULL),
(686, '2025', '2020204037', 'MUHAMMAD LUTFI', 'L', 5, 'Seririt', 'Buleleng', 'Bali', 'ANALISIS IMPLEMENTASI MANAJEMEN RESIKO PRODUK PEMBIAYAAN SYARIAH TERHADAP PENINGKATAN PROFITABILITAS DI BMT UGT NUSANTARA SERIRIT BULELENG BALI', 'Terverifikasi', NULL, NULL),
(687, '2025', '2021704015', 'HASBIYATI', 'P', 21, 'Mumbulsari', 'Jember', 'Jawa Timur', 'Assessing Self Confidence Levels Among Students Engaged In Dubbing Video Activities : Pre Experimental Research At The Nineth Grade Students Of Smpn 1 Mumbulsari', 'Terverifikasi', NULL, NULL),
(688, '2025', '2021201040', 'QURROTUL FAIZAH', 'P', 2, 'Jangkar', 'Situbondo', 'Jawa Timur', 'Perspektif Hukum Ekonomi Syari’ah Terhadap Jual Beli Bibit Cabe Dengan Sistem Panjher (Studi Kasus Di Desa Agel Kecamatan Jangkar Kabupaten Situbondo)', 'Terverifikasi', NULL, NULL),
(689, '2025', '2021703059', 'SITI MAISYAROH', 'P', 18, 'Ledokombo', 'Jember', 'Jawa Timur', 'Implementasi Standar Akuntansi Keuangan Entitas Mikro, Kecil Dan Menengah (Sak Emkm) Dalam Penyususnan Laporan Keuangan Pada Umkm Batik Tulis Labaku Kecamatan Sumberjambe Jember', 'Terverifikasi', NULL, NULL),
(690, '2025', '2021201019', 'NOR HAMDI', 'L', 2, 'SAPEKEN', 'SUMENEP', 'Jawa Timur', 'PERSPEKTIF HUKUM EKONOMI SYARIAH TERHADAP JUAL BELI BUAH ASAM DARI HASIL NYANDEK', 'Terverifikasi', NULL, NULL),
(691, '2025', '2021201014', 'MOH. FAMI BISYAUQIN SAFRIJALLA', 'L', 2, 'ARJASA', 'SITUBONDO', 'Jawa Timur', 'Tinjauan Hukum Ekonomi Syariah terhadap Praktik Titipan Uang Sisa Arisan di Desa Ketowan Kecamatan Arjasa Kabupaten Situbondo', 'Terverifikasi', NULL, NULL),
(692, '2025', '2021202059', 'PRUDENT DWI OKTAVIANY', 'P', 4, 'Sangkapura', 'Gresik', 'Jawa Timur', 'Tinjauan Hukum Islam Terhadap Penetapan Perkara Tentang  Perwalian Ibu Dalam Mengurus Balik Nama Akta Pembagian Harta Bersama (Studi Kasus Perkara Nomor 1163/Pdt.P/2024/Pa.Jr Di Pengadilan Agama Jember)', 'Terverifikasi', NULL, NULL),
(693, '2025', '2021204033', 'MUHAMMAD INDRA MAULANA', 'L', 5, 'Simpang Empat', 'Tanah Bumbu', 'Kalimantan Selatan', 'STRATEGI PELAYANAN ISLAMI DALAM MENINGKATKAN KEPUASAN KONSUMEN', 'Terverifikasi', NULL, NULL),
(694, '2025', '2021202057', 'NURUL AINI', 'P', 4, 'Bahar Selatan', 'Muaro Jambi', 'Jambi', 'Analisis Hukum Islam Terhadap Larangan Pernikahan Semarga Suku Batak (Studi Kasus Di Desa Tanjung Mulia Kecamatan Bahar Selatan Kabupaten Muaro Jambi Provinsi Jambi)', 'Terverifikasi', NULL, NULL),
(695, '2025', '2021703043', 'NUR AISAH', 'P', 18, 'Jangkar', 'Situbondo', 'Jawa Timur', 'Pengaruh Penerapan Aplikasi Simantap Dan Aplikasi El-Santri Terhadap Kepuasan Wali Santri Di Pondok Pesantren Salafiyah Syafi’iyah Sukorejo Situbondo', 'Terverifikasi', NULL, NULL),
(696, '2025', '2021203034', 'AZIZAH AYU APRILIA', 'P', 3, 'Sukosari', 'Bondowoso', 'Jawa Timur', 'Implementasi Pembiayaan Multiguna Berkah Dengan Akad Rahn Dalam Peningkatan Ekonomi Nasabah Di Kspp Syraiah Bmt Nu Cabang Klabang Bondowoso', 'Terverifikasi', NULL, NULL),
(697, '2025', '2021704001', 'FATHUR QORIF', 'L', 21, 'BANYUPUTIH', 'KAB. SITUBONDO', 'Jawa Timur', 'THE IMPLEMENTATION OF WEBTOON MEDIA ON STUDENTS\' VOCABULARY ACQUISITION AT SECOND GRADE OF SMPN 1 AROSBAYA', 'Terverifikasi', NULL, NULL),
(698, '2025', '2021205025', 'UKHTUL IFFAH NAFISAH ZAIN', 'P', 1, 'Sidodadi', 'Situbondo', 'Jawa Timur', 'Analisis Sistem Informasi Akuntansi Penjualan Untuk Menunjang Efektifitas Pengendalian Intern Penjualan Pada Klinik Pertanian Al-Barokah Sidodadi Wongsorejo Banyuwangi', 'Terverifikasi', NULL, NULL),
(699, '2025', '2021304012', 'NABILATUS SA\'ADAH', 'P', 11, 'Batang-Batang', 'Sumenep', 'Jawa Timur', 'Eksplorasi Etnomatematika Pada Tarian Muang Sangkal Sumenep Madura', 'Terverifikasi', NULL, NULL),
(700, '2025', '2021201032', 'MAR\'ATUS SHOLEHAH', 'P', 2, 'Sumber Wringin', 'Bondowoso', 'Jawa Timur', 'Analisis Fluktuasi Harga Komoditi Kopi Dalam Perspektif Tas’ir Al-Jabari (Studi Kasus Di Desa Rejoagung Kecamatan Sumber Wringin Kabupaten Bondowoso)', 'Terverifikasi', NULL, NULL),
(701, '2025', '2021205013', 'MAMLU\'ATUL HASANAH', 'P', 1, 'Guluk-Guluk', 'Sumenep', 'Jawa Timur', 'Analisis Kinerja Keuangan Perusahaan Menggunakn Metode Economic Value Added (Eva) (Studi Pada Perusahaan Kemasan Dan Plastik Yang Terdaftar Di Bei Pada Tahun 2023)', 'Terverifikasi', NULL, NULL),
(702, '2025', '2020202142', 'INSYIRATUL MUFIDAH', 'P', 4, 'Arjasa', 'Sumenep', 'Jawa Timur', 'Perspektif Hukum Islam Terhadap Kasus Istri Menolak Rujuk Dalam Masa Iddah Talak Raj’i (Studi Kasus Desa Kalinganyar Kecamatan Arjasa Kabupaten Sumenep)', 'Terverifikasi', NULL, NULL),
(703, '2025', '2021701064', 'YULI FAJRIATUS S.', 'P', 20, 'Sumberjambe', 'Jember', 'Jawa Timur', 'Hubungan Stres Dengan Premenstrual Syndrome Mahasiswi Psikologi Universitas Ibrahimy', 'Terverifikasi', NULL, NULL),
(704, '2025', '2021503021', 'M. FAZLUR RAHMAN ASSAUQI', 'L', 17, 'MAYANGAN', 'KOTA PROBOLINGGO', 'Jawa Timur', 'RANCANG BANGUN VERIFIKASI KEHADIRAN GURU MENGGUNAKAN FACE RECOGNITION  DAN GEO-LOCATION DI SDN WIROBORANG 1', '', NULL, NULL),
(705, '2025', '2021203025', 'NASTIAR', 'L', 3, 'DENPASAR BARAT', 'KOTA DENPASAR', 'Bali', 'STRATEGI PEMASARAN SYARI’AH WISATA TAMAN UJUNG SOEKASADA MELALUI MEDIA SOSIAL DALAM MENINGKATKAN PEREKONOMIAN DAERAH', 'Terverifikasi', NULL, NULL),
(706, '2025', '2021501020', 'MOH. WALID', 'L', 15, 'KADUR', 'KAB. PAMEKASAN', 'JAWA TIMUR', 'SISTEM SMART PLAN CARE PADA TANAMAN PADI BERBASIS INTERNER OF THINGS (IoT) MENGUNAKAN MIKROKONTROLER ESP32', 'Terverifikasi', NULL, NULL),
(707, '2025', '2021202006', 'ARI APRILIYANTO', 'L', 4, 'ASEMBAGUS', 'SITUBONDO', 'JAWA TIMUR', 'ANALISIS PUTUSAN HAKIM DALAM GUGATAN CERAI Nomor 4327/Pdt.G/2024/PA.Bwi (STUDI KASUS DI PENGADILAN AGAMA BANYUWANGI)', 'Terverifikasi', NULL, NULL),
(708, '2025', '2021201022', 'SELFIATUL HASANAH', 'P', 2, 'Tenggarang', 'Bondowoso', 'Jawa Timur', 'Tinjauan Hukum Islam Terhadap Perbedaan Harga Tiket Hari Biasa Dengan Hari Libur Pada Wisata Kolam Renang Navara Bondowoso', 'Terverifikasi', NULL, NULL),
(709, '2025', '2021703057', 'YUNITA AMILYA SARI', 'P', 18, 'Ijen', 'Bondowoso', 'Jawa Timur', 'Transparansi dan Akuntabilitas Dana Bantuan Operasional Sekolah ( BOS ) Studi Kasus pada UPTD SPF SMP Negeri 1 Ijen Bondowoso', 'Terverifikasi', NULL, NULL),
(710, '2025', '2021205015', 'PUTRI SALSABILA FIRDAUSY', 'P', 1, 'Tlogosari', 'Bondowoso', 'Jawa Timur', 'Analisis Perlakuan Akuntansi Murabahah Berdasarkan Psak 102 Pada Produk Cicil Emas (Studi Kasus Pada Bsi Kcp Situbondo Basuki Rahmat)', 'Terverifikasi', NULL, NULL),
(711, '2025', '2021304017', 'SITI NUR HASANAH', 'P', 11, 'Arjasa', 'Sumenep', 'Jawa Timur', 'Penerapan Geogebra Dalam Meningkatkan Kemampuan Pemahaman Konsep Geometri', 'Terverifikasi', NULL, NULL),
(712, '2025', '2021304010', 'MAMLUATUL KARIMAH', 'P', 11, 'Bluto', 'Sumenep', 'Jawa Timur', 'Upaya Meningkatkan Literasi Numerasi Siswa Melalui Model Problem Based Learning (Pbl) Di Smp Ibrahimy 3 Pada Mata Pelajaran Matematika', 'Terverifikasi', NULL, NULL),
(713, '2025', '2021304007', 'ATHI\'INDA MALIKAH', 'P', 11, 'Batuan', 'Sumenep', 'Jawa Timur', 'Implementasi Metode Rumus Barisan Aritmatika ( RUBARI ) Dalam Membantu Menemukan Halaman Al- Qur\'an', 'Terverifikasi', NULL, NULL),
(714, '2025', '2021301026', 'HENDRA SETIAWAN', 'L', 8, 'BANYUPUTIH', 'KAB. SITUBONDO', 'Jawa Timur', 'IMPLEMENTASI PEMBELAJARAN PENDIDIKAN AGAMA ISLAM DALAM PENINGKATAN MORAL SISWA DI SMPN 2 ASEMBAGUS KABUPATEN SITUBONDO TAHUN PELAJARAN 2024/2025', 'Terverifikasi', NULL, NULL),
(715, '2025', '2021203054', 'UMMUL FARIKA', 'P', 3, 'Dungkek', 'Sumenep', 'Jawa Timur', 'Analisis Strategi Pemasaran Syariah Dalam Peningkatan  Minat Nasabah Pada Tabungan Mudharabah (Tabah) Di Kspps Bmt Nu Cabang Dungkek Sumenep', 'Terverifikasi', NULL, NULL),
(716, '2025', '2021201007', 'HOLID UBAIDILAH', 'L', 2, 'WONOSARI', 'KAB. BONDOWOSO', 'Jawa Timur', 'TINJAUAN HUKUM ISLAM TENTANG PRAKTIK AKAD QORDHUL HASAN PADA PRODUK PEMBIAYAAN PINJAMAN DI KSPPS BMT NU WONOSARI BONDOWOSO', 'Terverifikasi', NULL, NULL),
(717, '2025', '2021204068', 'HANIFATIL FAUZIYAH', 'P', 5, 'Besuki', 'Situbondo', 'Jawa Timur', 'Implementasi Menejemen Kepemimpinan Islami Dalam Meningkatkan Etos Kerja Islam Karyawan  Di Kspps Nuri Besuki-Situbondo', 'Terverifikasi', NULL, NULL),
(718, '2025', '2021304020', 'WIWIN WAHYUNI', 'P', 11, 'Kuta', 'Badung', 'Bali', 'Etnomatematika: Eksplorasi Kerajinan Tangan Jaring Laba-Laba Di Kabupaten Badung, Bali', 'Terverifikasi', NULL, NULL),
(719, '2025', '2021204081', 'MILLATUL HASANAH', 'P', 5, 'Arjasa', 'Sumenep', 'Jawa Timur', 'Pengaruh Kualitas Pelayanan Dan Display Layout Terhadap Kepuasan Konsumen Di Toko Tiga Putri Kangean Sumenep', 'Terverifikasi', NULL, NULL),
(720, '2025', '2021702019', 'Muhammad', 'L', 19, 'Kenjeran', 'Surabaya', 'Jawa Timur', 'Pengelolaan Alih Fungsi Tanah Aset Desa Berdasarkan Undang-Undang Nomor 3 Tahun 2024 tentang Perubahan Kedua Atas Undang-Undang Nomor 6 Tahun 2014 tentang Desa', '', NULL, NULL),
(721, '2025', '2021503049', 'NAILA ADIBA', 'P', 17, 'Arjasa', 'Sumenep', 'Jawa Timur', 'Sistem Pendukung Keputusan Sanksi Pelanggaran Siswa Menggunakan Metode Smart Berbasis Web (Studi Kasus: Mts Al-Hidayah Kangean)', 'Terverifikasi', NULL, NULL),
(722, '2025', '2021503039', 'DILA PUSPITA DEWI', 'P', 17, 'Banyuputih', 'Situbondo', 'Jawa Timur', 'Rancang Bangun Sistem Informasi Rawat Jalan Berbasis Website Pada Praktik Mandiri Medika Asembagus', 'Terverifikasi', NULL, NULL),
(723, '2025', '2021201003', 'Ahmad Khofirul Kamal', 'L', 2, 'Wonopringgo', 'Pekalongan', 'Jawa Tengah', 'TINJAUAN FIKIH MUAMALAH TERHADAP PRAKTIK DROPSHIPPING BERBASIS AKAD SALAM PADA SUPPLIER MBU STORE DI MARKETPLACE SHOPEE DI DESA GALANGPENGAMPON KECAMATAN WONOPRINGGO KABUPATEN PEKALONGAN', 'Terverifikasi', NULL, NULL),
(724, '2025', '2021301005', 'ASEP IRAMA', 'L', 8, 'BANYUPUTIH', 'KAB. SITUBONDO', 'Jawa Timur', 'PELAKSANAAN PEMBELAJARAN BERDIFERENSIASI PADA MATA PELAJARAN PENDIDIKAN AGAMA ISLAM DI SMP NEGERI 2 ASEMBAGUS TAHUN PELAJARAN 2024/2025', 'Terverifikasi', NULL, NULL),
(725, '2025', '2021203029', 'TAUFIKUR RAHMAN', 'L', 3, 'BUNGATAN', 'KAB. SITUBONDO', 'Jawa Timur', 'STRATEGI PENYELESAIN PEMBIAYAAN PERSONAL BERMASALAH PADA PETANI GAGAL PANEN OLEH KSPPS BMT NU CABANG WONGSOREJO 2 BANYUWANGI', 'Terverifikasi', NULL, NULL),
(726, '2025', '2021204027', 'MOHAMMAD ELVIN EFFENDY', 'L', 5, 'Cermee', 'Bondowoso', 'Jawa Timur', 'PENGARUH PEMBERIAN INSENTIF DAN PELATIHAN KERJA TERHADAP PRODUKTIVITAS KERJA KARYAWAN', 'Terverifikasi', NULL, NULL),
(727, '2025', '2021304016', 'SHINTA NURIYAH', 'P', 11, 'Banyuputih', 'Situbondo', 'Jawa Timur', 'Penerapan Project Based Learning (Pjbl) Untuk Meningkatkan Keterampilan Siswa Berbasis Lesson Study Learning Community (Lslc)', 'Terverifikasi', NULL, NULL),
(728, '2025', '2021203018', 'MOH SHOFI NIFAL FAUZI', 'L', 3, 'GAJAH', 'KAB. DEMAK', 'Jawa Tengah', 'STRATEGI UD. PANCA USAHA DALAM MEMBERDAYAKAN EKONOMI PONDOK PESANTREN SALAFIYAH SYAFI’IYAH JATISONO GAJAH DEMAK', 'Terverifikasi', NULL, NULL),
(729, '2025', '2021304006', 'ASWIRATUN NASILAH', 'P', 11, 'Arjasa', 'Sumenep', 'Jawa Timur', 'Penerapan Model Pembelajaran Direct Instruction Untuk Meningkatkan Representasi Matematis Siswa Berbasis Lesson Study For Learning Community (Lslc)', 'Terverifikasi', NULL, NULL),
(730, '2025', '2021202032', 'M. RIDHO ABDILLAH', 'L', 4, 'JELUTUNG', 'KOTA JAMBI', 'JAMBI', 'Analisis Hukum Islam terhadap Putusan Hakim Nomor 610/PDT.G/2024/PA.JMB tentang Cerai Gugat', 'Terverifikasi', NULL, NULL),
(731, '2025', '2021203003', 'Ahmad Samsul Arifin', 'L', 3, 'Banyuputih', 'Situbondo', 'Jawa Timur', 'Tinjauan Ekonomi Islam terhadap Praktik Bagi Hasil Pemeliharaan Sapi dengan Sistem Uanan', 'Terverifikasi', NULL, NULL),
(732, '2025', '2021702035', 'FAJROTUL LAILIYAH', 'P', 19, 'Banyuputih', 'Situbondo', 'Jawa Timur', 'Analisis Pengaturan Hukum Tindak Pidana Cyber Crime Phising Di Indonesia', 'Terverifikasi', NULL, NULL),
(733, '2025', '202140219', 'RUDI EFENDI', 'L', 6, 'RA', 'KAB. SUMENEP', 'Jawa Timur', 'MODEL BIMBINGAN KLASIKAL DALAM MENGOPTIMALKAN BAKAT SISWA SMA ISLAM AL FANISA BRAKAS RAAS SUMENEP', '', NULL, NULL),
(734, '2025', '202140144', 'LAILATUL AINI', 'P', 7, 'Sumay', 'Tebo', 'Jambi', 'Metode Dakwah Bil-Hikmah Kiai Haji Hasyim As’ary Dalam Film Sang Kiai', 'Terverifikasi', NULL, NULL),
(735, '2025', '2021704004', 'QURRATUL AINI', 'P', 21, 'Arjasa', 'Sumenep', 'Jawa Timur', 'The Effect Of Kahoot In Extensive Reading On Students’ Reading Comprehension At The Tenth Grade Students Of Sman 1 Arjasa', 'Terverifikasi', NULL, NULL),
(736, '2025', '2021704008', 'ALVIATUS SHOLEHAH', 'P', 21, 'Gunung Maddah', 'Sampang', 'Jawa Timur', 'The Effect Of Analyzing English Songs On Students’ Grammar Mastery At The Second Semester Of Psychology Department, Social Science And Humanities Faculty, Ibrahimy University Situbondo', 'Terverifikasi', NULL, NULL),
(737, '2025', '2021704016', 'HIKMATUL MAULIDA', 'P', 21, 'Wongsorejo', 'Banyuwangi', 'Jawa Timur', 'The Implementation Of Project Based Learning In Students Motivation In English Foreign Language Learning At Senior High School Vocational Nurul Abror Al-Rabbaniyyin Wongsorejo Banyuwangi', 'Terverifikasi', NULL, NULL),
(738, '2025', '2021401042', 'FAJRIN KAMILA', 'P', 6, 'Banyuputih', 'Situbondo', 'Jawa Timur', 'Bimbingan Pranikah Bagi Calon pengantin Dalam Pencegahan Perceraian Di Kua Kecamatan Banyuputih', 'Terverifikasi', NULL, NULL),
(739, '2025', '2021301120', 'NUR FAIDATUR ROHMA', 'P', 8, 'Wongsorejo', 'Banyuwangi', 'Jawa Timur', 'Pengaruh Strategi Mengajar Guru Amtsilati Terhadap Hasil Belajar Siswa Di Lembaga Amtsilatuna Asrama Al-Khuzaimah Pondok Pesantren Salafiyah Syafi’iyah Sukorejo Situbondo', 'Terverifikasi', NULL, NULL),
(740, '2025', '2021304005', 'ARLAILIATUL JANNAH', 'P', 11, 'Asembagus', 'Situbondo', 'Jawa Timur', 'Pengaruh Penerapan Metode Mind Mapping Untuk Meningkatkan Pemahaman Konseptual Dan Prosedural Matematis Siswa Pada Pokok Bahasan Barisan Dan Deret Aritmatika Kelas X Smk Ibrahimy 1 Sukorejo', 'Terverifikasi', NULL, NULL),
(741, '2025', '2021702007', 'DIKI ABDUL HAMID', 'L', 19, 'WONGSOREJO', 'KAB. BANYUWANGI', 'Jawa Timur', 'UPAYA PERLINDUNGAN HUKUM TERHADAP ANAK SEBAGAI KORBAN KEKERASAN SEKSUAL BERDASARKAN UU No.35 TAHUN 2014 TENTANG PERLINDUNGAN ANAK', 'Terverifikasi', NULL, NULL),
(742, '2025', '2021202011', 'FRAN FEBRIAN', 'L', 2, 'PULAU LAUT KEPULAUAN', 'KOTA BARU', 'KALSEL', 'Analisis Yurisprudensi Mahkamah Agung Nomor 1/YUR/AG/2018 tentang Hak Waris Beda Agama Perspektif Hukum Islam dan Hukum Positif', 'Terverifikasi', NULL, NULL),
(743, '2025', '2021703005', 'Afan Ajemali', 'L', 18, 'Paiton', 'Probolinggo', 'Jawa Timur', 'Analisis Implementasi Sistem Informasi Akuntansi pada UMKM UD. Tok Seewuu Sumenep', 'Terverifikasi', NULL, NULL),
(744, '2025', '2021702002', 'Ade Wahyu Permana', 'L', 19, 'Buleleng', 'Buleleng', 'Bali', 'Pertanggung Jawaban Pidana Pelaku Judi Sabung Ayam (Tajen) dalam Upacara Adat Tabuh Rah di Bali', 'Terverifikasi', NULL, NULL),
(745, '2025', '2021201033', 'MENTARI TIA UTAMI', 'P', 2, 'Banyuputih', 'Situbondo', 'Jawa Timur', 'Perspektif Hukum Islam Terhadap Penentuan Upah Buruh Panen Getah Pinus ( Studi Kasus Perum Perhutani Curahdami Bondowoso)', 'Terverifikasi', NULL, NULL),
(746, '2025', '2021301034', 'ANZIL RIZQYI AULIYA', 'P', 8, 'Sobo', 'Banyuwangi', 'Jawa Timur', 'Strategi Guru Dalam Meningkatkan Kemampuan Menghafal Alqur’an Siswa (Studi Kasus : Madrasah Aliyah Negeri 2 Situbondo Tahun Ajaran 2024/2025)', '', NULL, NULL),
(747, '2025', '2021704028', 'SITI FAJRIATU RAMDIAH', 'P', 21, 'Kelapa Dua', 'Tangerang', 'Banten', 'the effect of kahoot on students’ grammar mastery at the eighth grade of smp gandasari tangerang', 'Terverifikasi', NULL, NULL),
(748, '2025', '2021702059', 'TORIKATUL MAQDANIYAH', 'P', 19, 'Grujugan', 'Bondowoso', 'Jawa Timur', 'Argumentasi Hukum Penerapan Asas Fiksi Hukum Dalam Sistem Penegakan Hukum', 'Terverifikasi', NULL, NULL),
(749, '2025', '2021301002', 'ACH HAFIDZI', 'L', 8, 'Banyuputih', 'Situbondo', 'Jawa Timur', 'Penerapan Model Pembelajaran Kooperatif Jigsaw dalam Peningkatan Berpikir Kritis Siswa pada Mata Pelajaran PAI di SMP Negeri 2 Asembagus', 'Terverifikasi', NULL, NULL),
(750, '2025', '2020202008', 'Arifani Irsyadul Ibad', 'L', 4, 'Wongsorejo', 'Banyuwangi', 'Jawa Timur', '\"ANALISIS MAQASHID AL-SYARI’AH TERHADAP PRAKTIK PENCATATAN PERKAWINAN', NULL, NULL, NULL),
(751, '2025', '2021301089', 'BAIQ NILA RAHMA PUTRI', 'P', 8, 'Praya', 'Lombok Tengah', 'NTB', 'Peningkatan Partispasi Siswa Dalam Pembelajaran Berdifrensiasi Pada Mata Pelajaran Fiqih Kelas Viii Siswa Madrasah Tsanawiyah Negeri 2 Lombok Tengah Tahun Ajaran 2024/2025', 'Terverifikasi', NULL, NULL),
(752, '2025', '2020303003', 'AISYATUN NUR AIDA', 'P', 10, 'Gerokgak', 'Buleleng', 'Bali', 'Upaya Meningkatkan Keterampilan Motorik Halus Anak Usia Dini Melalui Kegiatan Membatik Menggunakan Kentang Di Kelompok B Ra Yambaul Ulum Sumberkima Tahun Pelajaran 2024/2025', 'Terverifikasi', NULL, NULL),
(753, '2025', '2021301143', 'ZEMMILA TUSLEHA', 'P', 8, 'Botolinggo', 'Bondowoso', 'Jawa Timur', 'Meningkatkan Keaktifan Belajar Siswa Melalui Metode Snowball Drilling Pada Materi Fiqih Kelas Viii C Di Mts. Nurul Jadid Lumutan Kecamatan Botolinggo Kabupaten Bondowoso Tahun Pelajaran 2024/2025', 'Terverifikasi', NULL, NULL),
(754, '2025', '2021302058', 'UMI SAFITRI DWI A.', 'P', 9, 'Sempol', 'Bondowoso', 'Jawa Timur', 'Pembuatan Media Monopoli Bahasa Arab Untuk Meningkatkan Penguasaan Kosa Kata Bahasa Arab Siswa Kelas V Mi Darut Tarbiyah Kalipuro Banyuwangi Tahun Ajaran 2024/2025', 'Terverifikasi', NULL, NULL),
(755, '2025', '2021302059', 'VITRA ROHMATUL H.', 'P', 9, 'Tanah Grogot', 'Paser', 'Kalimantan Timur', 'PEMBUATAN MEDIA BROKEN SQUARE UNTUK MENINGKATKAN KEMAMPUAN SISWA DALAM MENYUSUN KALIMAT BAHASA ARAB DI KELAS V MI RAUDLATUT THALIBIN KELAMPOKAN TAHUN PELAJARAN 2024/2025', 'Terverifikasi', NULL, NULL),
(756, '2025', '2020704022', 'MIFTAHUL ZANNAH', 'P', 21, 'Bener Kelipah', '', 'Aceh', 'An Analysis Cohesive Device In Writing Analytical Exposition Text At The Second Grade Students Of Sman 1 Situbondo', 'Terverifikasi', NULL, NULL),
(757, '2025', '2021301087', 'ANISA FITRI', 'P', 8, 'Giri', 'Banyuwangi', 'Jawa Timur', 'Penerapan Metode Mind Mapping Untuk Meningkatkan Berfikir Kreatif Siswa Pada Mata Pelajaran Pai Kelas Xi6 Di Sma Negeri 2 Situbondo Tahun Pelajaran 2024/2025', 'Terverifikasi', NULL, NULL),
(758, '2025', '202140251', 'WILDATUL MUHARROMAH', 'P', 6, 'Kadur', 'Pamekasan', 'Jawa Timur', 'Implementasi Konseling Qur’ani Dalam Mengurangi Perilaku Membolos Siswa Di Pondok Pesantren Assalafiyah Addurriyyah Kadur Pamekasan', 'Terverifikasi', NULL, NULL),
(759, '2025', '202140249', 'VENI KHOLISAH M.', 'P', 6, 'Rio Pakava', 'Donggala', 'Sulawesi Tengah', 'Implementasi Konseling Sufistik Melalui Teknik Tazkiyah An-Nafs Dalam Menanggulangi Perilaku Ghasab Di Pondok Pesantren Salafiyah Syafi’iyah Sukorejo Situbondo', 'Terverifikasi', NULL, NULL),
(760, '2025', '2021203032', 'ALIYATUN NASAROH', 'P', 3, 'Kalipuro', 'Banyuwangi', 'Jawa Timur', 'Implementasi Etika Bisnis Islam Dalam Peningkatan Minat Beli Konsumen Di Home Industry Roti Nurdia Bakery Desa Kelir Kecamatan Kalipuro Banyuwangi', 'Terverifikasi', NULL, NULL),
(761, '2025', '2021201027', 'IMROATUN NAWARO', 'P', 2, 'Gayam', 'Sumenep', 'Jawa Timur', 'Perspektif Hukum Ekonomi Syari’ah Terhadap Sisitem Jual Beli Ikan Secara Jizaf (Studi Kasus Gudang Ud. Sapudi Mandiri Jaya)', 'Terverifikasi', NULL, NULL),
(762, '2025', '2021204045', 'SHAHIBUL MIGHFAR', 'L', 5, 'GAYAM', 'SUMENEP', 'Jawa Timur', '\"STRATEGI PENGEMBANGAN USAHA MIKRO KECIL MENENGAH (UMKM) DALAM MENINGKATKAN PROFITABILITAS WARUNG MADURA ', NULL, NULL, NULL),
(763, '2025', '2021204017', 'M. SYAIFUL FUAD AL H.', 'L', 5, 'GAYAM', 'SUMENEP', 'JAWA TIMUR', 'STRATEGI PEMASARAN SYARI’AH DALAM MENINGKATKAN LOYALITAS NASABAH (Studi Kasus di Bank Muamalat Indonesia (BMI) Cabang Situbondo)', 'Terverifikasi', NULL, NULL),
(764, '2025', '2021140135', 'DEWI ROBIATUL ADAWIA', 'P', 7, 'Sungai Raya', 'Kubu Raya', 'Kal-Bar', 'Kegiatan Khitobah Sebagai Pengembanagn Public Speaking  Remaja Pada Santri Pondok Pesantren Miftahul Khairat  Pontianak Kalimantan Barat', 'Terverifikasi', NULL, NULL),
(765, '2025', '2021503054', 'SYARIFUL ABRORI', 'L', 17, 'KLABANG', 'KAB. BONDOWOSO', 'JAWA TIMUR', 'ANALISIS SENTIMEN PRESIDEN TERPILIH PRABOWO GIBRAN MENGGUNAKAN METODE SVM DI MEDIA TWITTER/X', 'Terverifikasi', NULL, NULL),
(766, '2025', '2021503036', 'M. MUHAJIR SADDAMI', 'L', 17, 'GERUNG', 'KAB. LOMBOK BARAT', 'Nusa Tenggara Barat', 'RANCANG BANGUN SISTEM INFORMASI STOK DAN DISTRIBUSI LPG BERBASIS WEB PADA PANGKALAN MUJITAHID', 'Terverifikasi', NULL, NULL),
(767, '2025', '2021503046', 'Supandi', 'L', 17, 'Ra\'as', 'Sumenep', 'Jawa Timur', 'DETEKSI KUALITAS RUMPUT LAUT MENGGUNAKAN METODE CONVELUTION NEURAL NETWORK (CNN) BERDASARKAN CITRA DIGITAL', 'Terverifikasi', NULL, NULL),
(768, '2025', '2021503062', 'SITI KHOIRIYAH', 'P', 17, 'Suboh', 'Situbondo', 'Jawa Timur', 'Pengembangan Sistem Informasi Layanan Perpustakaan Berbasis Web Dengan Metode Rapid Application Development (Rad)', 'Terverifikasi', NULL, NULL),
(769, '2025', '2021202027', 'M. Wildan Kaila L. A. F.', 'L', 4, 'Gajah', 'Demak', 'Jawa Tengah', '\"TINJAUAN HUKUM ISLAM TERHADAP TRADISI NJUNDANG', NULL, NULL, NULL),
(770, '2025', '2021301128', 'RIFA QORIATIN FITRI', 'P', 8, 'Maesan', 'Bondowoso', 'Jawa Timur', 'KURIKULUM PESANTREN DALAM MENINGKATKAN KARAKTER MANDIRI SANTRI (STUDI KASUS PESANTREN PELAJAR ISLAM NURUL BURHAN BADEAN - BONDOWOSO) TAHUN PELAJARAN 2024-2025', 'Terverifikasi', NULL, NULL),
(771, '2025', '2021301125', 'NURUL MUSTAGHFIROH', 'P', 8, 'Banyuputih', 'Situbondo', 'Jawa Timur', 'IMPLEMENTASI PEMBELAJARAN BERDIFERENSIASI UNTUK MENGATASI PERBEDAAN KEBUTUHAN BELAJAR PAI DI SMP NEGERI 1 ARJASA SITUBONDO TAHUN PELAJARAN 2024/2025', 'Terverifikasi', NULL, NULL),
(772, '2025', '2021204073', 'LAYLATUZ ZAHRO N.J.', 'P', 5, 'Tempurejo', 'Jember', 'Jawa Timur', 'IMPLEMENTASI NILAI NILAI SPIRITUALITAS DALAM UPAYA MENINGKATKAN KINERJA KARYAWAN (STUDY KASUS DI PT. BINTANG CITRA ASIA JEMBER)', 'Terverifikasi', NULL, NULL),
(773, '2025', '2021503045', 'LUTFIYATUS ZAHRA', 'P', 17, 'Wringin', 'Bondowoso', 'Jawa Timur', 'IMPLEMENTASI METODE SAW DAN METODE AHP PADA PEMILIHAN KARYAWAN DI KECAMATAN WRINGIN DENGAN KONFIGURASI WHATSAPP GATEWAY', 'Terverifikasi', NULL, NULL),
(774, '2025', '202170418', 'LAILIA RIFKI ROMADANI', 'P', 21, 'Rubaru', 'Sumenep', 'Jawa Timur', 'THE USE OF TED TALK ON GROUP DISCUSSION IN STUDENTS’ LISTENING COMPREHENSION IN TENTH GRADE OF SMAS PLUS MIFTAHUL ULUM SUMENEP', 'Terverifikasi', NULL, NULL),
(775, '2025', '2021402047', 'AHMAD IHYA\'', 'L', 7, 'SIMOKERTO', 'KOTA SURABAYA', 'Jawa Timur', 'KOMUNIKASI DAKWAH KIAI FAWAID AS’AD PADA MASYARAKAT SITUBONDO', 'Terverifikasi', NULL, NULL),
(776, '2025', '2021701040', 'FANIYATUL ADILAH', 'P', 20, 'Asembagus', 'Situbondo', 'Jawa Timur', 'HUBUNGAN SELF EFFICACY DENGAN PRESTASI AKADEMIK SISWA MA. MIFTAHUL ULUM BANTAL', 'Terverifikasi', NULL, NULL),
(777, '2025', '2020503070', 'YULI MARIYANI', 'P', 17, 'Gelagah', 'Banyuwangi', 'Jawa Timur', 'RANCANG BANGUN APLIKASI PEMBAYARAN UANG TAHUNAN SISWA BERBASIS WEBSITE DI MTS DARUL FALAH BULUSARI KALIPURO BANYUWANGI', 'Terverifikasi', NULL, NULL),
(778, '2025', '2021303009', 'LAILY NURHAYATI', 'P', 10, 'Dampit', 'Malang', 'Jawa Timur', 'PENGEMBANGAN CREATIVITY BOOK UNTUK MENINGKATKAN KEMAMPUAN BERPIKIR DIVERGEN ANAK USIA DINI KELOMPOK B DI RA NURUL WATHAN BULELENG BALI TAHUN PELAJARAN 2024/2025', 'Terverifikasi', NULL, NULL),
(779, '2025', '2021303018', 'NURFADILAH', 'P', 10, 'Waru', 'Sidoarjo', 'Jawa Timur', 'Penggunaan Pairing Flashcard Untuk Meningkatkan Pengenalan Huruf Hijaiyah Pada Anak Kelompok B Di Ra Az-Zainiyah Situbondo Tahun Pelajaran 2024/2025', 'Terverifikasi', NULL, NULL),
(780, '2025', '2021303017', 'NIKMATUL MABRUROH', 'P', 10, 'Pamekasan', 'Pamekasan', 'Jawa Timur', 'Penggunaan Media Sensory Touch Board Untuk Meningkatkan Kemampuan Motorik Halus Anak Kelompok A Di Tk Muslimat Nu 57 Pamekasan  Tahun Pelajaran 2024/2025', 'Terverifikasi', NULL, NULL),
(781, '2025', '2021501027', 'Nuril Fajril Huda', 'L', 15, 'Situbondo', 'Situbondo', 'Jawa Timur', 'RANCANG BANGUN MONITORING KUALITAS UDARA DAN PENANGANAN UDARA KOTOR BERBASIS IoT (Internet of Things)', 'Terverifikasi', NULL, NULL),
(782, '2025', '2021703033', 'MAGHFIROTUL HASANAH', 'P', 18, 'Panji', 'Situbondo', 'Jawa Timur', 'ANALISIS KINERJA KEUANGAN MENGGUNAKAN METODE ECONOMIC VALUE ADDED (EVA) PADA PT. BANK RAKYAT INDONESIA (PERSERO) TBK PERIODE 2019-2023.', 'Terverifikasi', NULL, NULL),
(783, '2025', '2021303040', 'NAIFATUL HAKIMAH', 'P', 10, 'Bungatan', 'Situbondo', 'Jawa Timur', 'MENINGKATKAN PERKEMBANGAN SOSIAL EMOSIONAL ANAK MELALUI KEGIATAN BERBASIS PROYEK (PROJECT BASED LEARNING) MENGGUNAKAN MEDIA LOOSE PARTS PADA KELOMPOK B DI RA AZ-ZAINIYAH TAHUN PELAJARAN 2024-2025', 'Terverifikasi', NULL, NULL),
(784, '2025', '2021203004', 'Ainur Ridha', 'L', 3, 'Arjasa', 'Sumenep', 'Jawa Timur', 'IMPLEMINTASI ETIKA BISNIS ISLAM DALAM MENINGKATKAN LOYALITAS PELANGGAN DI JASA EKSPEDISI SI EXPRESS', 'Terverifikasi', NULL, NULL),
(785, '2025', '2021201058', 'ZAINUR RIDO', 'L', 2, 'KURIPAN', 'KAB. LOMBOK BARAT', 'Nusa Tenggara Barat', '\"TINJAUAN HUKUM EKONOMI SYARIAH TERHADAP IMPLEMENTASI HAK KHIYAR DALAM JUAL BELI GAMIS ONLINE DENGAN SISTEM CASH ON DELIVERY (COD)', NULL, NULL, NULL),
(786, '2025', '2021703051', 'RAFIKATUS SALIHAH', 'P', 18, 'Gayam', 'Sumenep', 'Jawa Timur', 'Penerapan Sistem Informasi Akuntansi (SIA) Pada Laporan Keuangan Menggunakan Aplikasi Microsoft Excel (Studi Kasus UMKM Alfa Barokah dan Mery Madura)', 'Terverifikasi', NULL, NULL),
(787, '2025', '2021703030', 'JAMILATUL JANNAH', 'P', 18, 'Banyuputih', 'Situbondo', 'Jawa Timur', 'ANALISIS PERHITUNGAN DAN PEMBAGIAN KOMISI LIVE TIKTOK PADA TOKO DIVA COLLECTION DESA SUMBEREJO SITUBONDO', 'Terverifikasi', NULL, NULL),
(788, '2025', '2021701025', 'HAFIZAH', 'P', 20, 'Jonggat', 'Lombok Tengah', 'NTB', 'Stress Psikososial Pada Pasien Rehabilitasi Ketergantungan Narkoba Di Rumah Sakit Jiwa Mutiara Sukma NTB', 'Terverifikasi', NULL, NULL),
(789, '2025', '2021301073', 'AHMAD JAMILUD DZIKRI', 'L', 8, 'BANYUPUTIH', 'KAB. SITUBONDO', 'Jawa Timur', 'STRATEGI GURU PENDIDIKAN AGAMA ISLAM DALAM PENINGKATAN NILAI-NILAI RELIGIUS SISWA DI SMPN 2 ASEMBAGUS SITUBONDO TAHUN PELAJARAN 2024-2025', 'Terverifikasi', NULL, NULL),
(790, '2025', '2020503068', 'SRI RAHMAH', 'P', 17, 'Nonggunong', 'Sumenep', 'Jawa Timur', 'SISTEM INFORMASI PENGGAJIAN GURU DENGAN KONSEP AGILE SOFTWARE DEVELOPMENT DENGAN METODE EXTREME PROGRAMMING (XP) DI MTS AL- FALAH PESANGGRAHAN', 'Terverifikasi', NULL, NULL),
(791, '2025', '2020201031', 'GHAZY FAIRUS JOANA DAFFA', 'P', 2, 'Curah Jeru', 'Situbondo', 'Jawa Timur', 'TINJAUAN HUKUM EKONOMI ISLAM TERHADAP PRAKTIK MUZARA’AH (STUDI KASUS DI DUSUN BARAT  DESA CURAH JERU, KECAMATAN PANJI KABUPATEN SITUBONDO)', 'Terverifikasi', NULL, NULL),
(792, '2025', '202140103', 'Achmad Syahril Hamdani', 'L', 7, 'Praya Barat', 'Lombok Tengah', 'NTB', 'MODERASI BERAGAMA SEBAGAI KOMUNIKASI DAKWAH  KUA KECAMATAN SANDUBAYA KOTA MATARAM NTB', 'Terverifikasi', NULL, NULL),
(793, '2025', '2021303015', 'WILDA MAKRIFATUL LAILI', 'P', 10, 'Arjasa', 'Sumenep', 'Jawa Timur', 'PENGEMBANGAN GAME EDUKATIF BERBASIS BAHAN AJAR UNTUK MENINGKATKAN KEMAMPUAN BAHASA INGGRIS ANAK USIA DINI KELOMPOK B DI RA NURUL HUDA DUKO ARJASA TAHUN PELAJARAN 2024/2025', 'Terverifikasi', NULL, NULL),
(794, '2025', '2021201010', 'KHOIRIL ANAM', 'L', 2, 'WONOSARI', 'KAB. BONDOWOSO', 'Jawa Timur', 'TINJAUAN HUKUM ISLAM TERHADAP PRAKTIK NGASAK KOPI DI DESA SEMPOL KECAMATAN IJEN KABUPATEN BONDOWOSO', 'Terverifikasi', NULL, NULL),
(795, '2025', '2021202051', 'NABILA GHALBAH QUDSIYAH', 'P', 4, 'Bengkong', 'Kota Batam', 'Riau', 'PERSPEKTIF HUKUM ISLAM TENTANG NUSYUZ ISTRI YANG DI SEBABKAN SUAMI TIDAK MEMBERI NAFKAH (Studi Kasus Putusan PA Kraksaan No 443/Pdt/G/2025/PA.Krs.)', 'Terverifikasi', NULL, NULL),
(796, '2025', '2020301033', 'Mohammad Ayyul Fari', 'L', 8, 'Kendit', 'Situbondo', 'Jawa Timur', '\"PENGARUH MEDIA SLIDE PRESENTATION TERHADAP HASIL', NULL, NULL, NULL),
(797, '2025', '2021701023', 'FITRIYAH DAMAYANTI W.', 'P', 20, 'Tegalampel', 'Bondowoso', 'Jawa Timur', 'Kematangan Emosi Remaja Korban Broken Home', 'Terverifikasi', NULL, NULL),
(798, '2025', '2021701055', 'DEWI SARTIKA', 'P', 20, 'Jangkar', 'Situbondo', 'Jawa Timur', 'Hubungan Coping Stress Dengan Kesehatan Mental Siswa Mts Salafiyah Syafi’iyah Sukorejo Situbondo', 'Terverifikasi', NULL, NULL),
(799, '2025', '2021701020', 'FARA ADILAH AL-ALUF', 'P', 20, 'Banyuputih', 'Situbondo', 'Jawa Timur', 'HUBUNGAN ANTARA SELF ESTEEM DENGAN KECENDERUNGAN BODY DISMORPHIC DISORDER (BDD) PADA REMAJA AKHIR DI SMA. IBRAHIMY 2 SUKOREJO', 'Terverifikasi', NULL, NULL),
(800, '2025', '2021201048', 'RAHMITA ISTIQOMAH', 'P', 2, 'Gerokgak', 'Buleleng', 'Bali', 'TINJAUAN HUKUM EKONOMI SYARI’AH TERHADAP IMPLEMENTASI AKAD WADI’AH YADDHAMANAH DALAM PENDANAAN HAJI DI BANK BSI KCP BULELENG BALI', 'Terverifikasi', NULL, NULL),
(801, '2025', '202140213', 'MASHAB HENDRI HIDAYATULLAH', 'L', 6, 'JANAPRIA', 'KAB. LOMBOK TENGAH', 'Nusa Tenggara Barat', 'MAKNA EKSISTENSI KONSELOR SEBAYA BAGI SANTRI TAHFIDZUL QUR’AN DI PONDOK PESANTREN SALAFIYAH SYAFI’IYAH SUKOREJO', 'Terverifikasi', NULL, NULL),
(802, '2025', '2021704019', 'LUPITA FEBRIANTI', 'P', 21, 'Kabat', 'Banyuwangi', 'Jawa Timur', 'ANALYSING THE SECOND-YEAR STUDENTS’ DIFFICULTIES IN WRITING ANALYTICAL EXPOSITION TEXT AT SMA NEGERI 1 SITUBONDO', 'Terverifikasi', NULL, NULL),
(803, '2025', '2021301144', 'ZUHRATUL YASIN', 'P', 8, 'Sapeken', 'Sumenep', 'Jawa Timur', 'PENERAPAN CONTEXTUAL TEACHING AND LEARNING (CTL) DALAM MENINGKATKAN NALAR KRITIS PESERTA DIDIK PADA MATA PELAJARAN FIQIH KELAS IX  DI MTS DARUL  MUSYAWIRIEN PAGERUNGAN SAPEKEN SUMENEP TAHUN PELAJARAN 2024/2025', 'Terverifikasi', NULL, NULL),
(804, '2025', '2021302014', 'LALU IRFAN RIDWAN', 'L', 9, 'WANASABA', 'KAB. LOMBOK TIMUR', 'Nusa Tenggara Barat', 'استخدام كتاب المحاورة الحديثة الجزء الثاني في تحسين مهارة الكلام لطلاب دار اللغة العربية في معهد سلفية شافعية الإسلامي سوكورجو سيتوبوندو للعام الدراسي 2024/2025', 'Terverifikasi', NULL, NULL),
(805, '2025', '2021701028', 'HUSNUN NAJMIYATUDDINA HASMUIN', 'P', 20, 'LABUAPI', 'LOMBOK BARAT', 'NTB', 'perilaku interaksi sosial remaja retrdasi mental', 'Terverifikasi', NULL, NULL),
(806, '2025', '2021401046', 'HINDATUL MUFIDAH', 'P', 6, 'Tegalrejo', 'Magelang', 'Jawa Tengah', 'NILAI-NILAI KONSELING PADA LIMA WASIAT KIAI AS’AD (STUDI EKSPLORASI)', 'Terverifikasi', NULL, NULL),
(807, '2025', '202140132', 'RIZAL RIFANSYAH', 'L', 7, 'Sapeken', 'Sumenep', 'Jawa Timur', 'STRATEGI KOMUNIKASI ORGANISASI UBUDIYAH PESANTREN DALAM MENGAWAL KEDISIPLINAN SHALAT BERJAMAAH SANTRI DI PONDOK PESANTREN SALAFIYAH SYAFI’IYAH SUKOREJO SITUBONDO', 'Terverifikasi', NULL, NULL),
(808, '2025', '2021704011', 'DIAN KAMILATULAIL', 'P', 21, 'Sukowono', 'Jember', 'Jawa Timur', 'PEDAGOGICAL AND PSYCHOLOGICAL IMPACT OF USING HAND PUPPET IN ROLE-PLAY METHOD OF SPEAKING SKILL AT MTsN 06 JEMBER', 'Terverifikasi', NULL, NULL),
(809, '2025', '202140209', 'Faizul Fannani', 'L', 6, 'Pragaan', 'Sumenep', 'Jawa Timur', 'BIMBINGAN KARIER DALAM PEMILIHAN STUDI LANJUT BAGI SISWA KELAS AKHIR DI MA AL-IHSAN JADDUNG PRAGAAN SUMENEP', 'Terverifikasi', NULL, NULL),
(810, '2025', '20213011140', 'WILDATUL ALUF', 'P', 8, 'Bangsalsari', 'Jember', 'Jawa Timur', 'IMPLEMENTASI TAHFIDZUL QUR\'AN DI ASRAMA TAKHASSUS DI PONDOK PESANTREN TAHFIDZUL QUR\'AN YASINAT JEMBER', 'Terverifikasi', NULL, NULL),
(811, '2025', '2021303012', 'NADIA SEPTIANA', 'P', 10, 'Praya', 'Lombok Tengah', 'NTB', 'PENGEMBANGAN MEDIA POP UP BOOK UNTUK PENGENALAN BUDAYA TRADISIONAL SASAMBO PADA ANAK KELOMPOK B DI TKN 1 KOPANG', 'Terverifikasi', NULL, NULL),
(812, '2025', '2021303020', 'RIZA UMAMI KURNIA ULFA', 'P', 10, 'Wongsorejo', 'Banyuwangi', 'Jawa Timur', 'MENINGKATKAN PENGETAHUAN TENTANG HEWAN LAUT KELOMPOK B MELALUI MEDIA TEKA-TEKI SILANG BERGAMBAR DI TK NUR RAHMAN WONGSOREJO BANYUWANGI', 'Terverifikasi', NULL, NULL);
INSERT INTO `mahasiswas` (`id`, `lulusan`, `nim`, `nama`, `jk`, `prodi_id`, `kecamatan`, `kabupaten`, `provinsi`, `tugas_akhir`, `verifikasi`, `created_at`, `updated_at`) VALUES
(813, '2025', '2021301126', 'REALITA CAHYANI', 'P', 8, 'Banyuputih', 'Situbondo', 'Jawa Timur', '\"PENERAPAN METODE ROLE PLAY DALAM MENINGKATKAN KEAKTIFAN PEMBELAJARAN SISWA KELAS VIII B PADA MATA PELAJARAN AQIDAH AKHLAQ DI MTs Negeri 3 SITUBONDO ', NULL, NULL, NULL),
(814, '2025', '2021205064', 'SHOFIDATUS SHOLIHAH', 'P', 1, 'Kalipuro', 'Banyuwangi', 'Jawa Timur', 'PENGARUH KECUKUPAN MODAL DAN UKURAN PERUSAHAAN TERHADAP PROFITABILITAS PADA PERUSAHAAN INDUSTRI MANUFAKTUR YANG TERDAFTAR DI BURSA EFEK INDONESIA TAHUN 2021-2023', 'Terverifikasi', NULL, NULL),
(815, '2025', '2021301136', 'SULISTIYOWATI', 'P', 8, 'Asembagus', 'Situbondo', 'Jawa Timur', 'implementasi metode takrir dan tasmi’ dalam kemampuan menghafal al-qur’an di min 2 situbondo 2024-2025', 'Terverifikasi', NULL, NULL),
(816, '2025', '2021201029', 'INNI YULIANA', 'P', 2, 'Arjasa', 'Sumenep', 'Jawa Timur', '\"tinjaun hukum ekonomi syariah terhadap jual beli sapi dengan sistem perantara', NULL, NULL, NULL),
(817, '2025', '2021704031', 'VINA MALIKHATULAENI', 'P', 21, 'Tegalrejo', 'Magelang', 'Jawa Tengah', 'The Effect of Realia Media on Students’ Writing Skill at SMP Ibrahimy 3 Sukorejo', 'Terverifikasi', NULL, NULL),
(818, '2025', '2021201044', 'SELVI', 'P', 2, 'Arjasa', 'Situbondo', 'Jawa Timur', '\"Tinjauan Hukum Ekonomi Syariah Terhadap Sistem Bagi Hasil Antara Petani Tebu Dan Pemilik Tanah', NULL, NULL, NULL),
(819, '2025', '2021503061', 'CARISSA KOMALA SARI', 'P', 17, 'Burneh', 'Bangkalan', 'Jawa Timur', 'Sistem informasi pengelolaan rawat inap pada klinik bpm (bidan praktik mandiri) berbasis web', 'Terverifikasi', NULL, NULL),
(820, '2025', '2021301159', 'HASANATUN AISYAH', 'P', 8, 'ASEMBAGUS', 'SITUBONDO', 'Jawa Timur', '\"SCHOOL RELIGIOUS CULTURE (SRC) DALAM MEMBENTUK', NULL, NULL, NULL),
(821, '2025', '2021503076', 'NAQIBUZZAHIDIN', 'L', 17, 'MANGARAN', 'KAB. SITUBONDO', 'Jawa Timur', 'PENERAPAN ALGORITMA DECISION TREE UNTUK MENENTUKAN FAKTOR-FAKTOR YANG MEMPENGARUHI KELULUSAN SISWA DI MTS MISYKATUL ULUM', 'Terverifikasi', NULL, NULL),
(822, '2025', '2021301171', 'Nila Fitriyah', 'P', 8, 'Jangkar', 'Situbondo', 'Jawa Timur', 'PEMBENTUKAN KARAKTER PEDULI SOSIAL SISWA DI SMP NEGERI 5 SITUBONDO', 'Terverifikasi', NULL, NULL),
(823, '2025', '2021701024', 'GIVA AYU WINTIYANI', 'P', 20, 'Narmada', 'Lombok Barat', 'NTB', 'HUBUNGAN BODY IMAGE DENGAN KEPERCAYAAN DIRI SISWA SMK AL-MAARIF RANTOQ QOMARUL HUDA BAGU LOMBOK BARAT NUSA TENGGARA BARAT', 'Terverifikasi', NULL, NULL),
(824, '2025', '20200301019', 'HAFIZH HUSAINI', 'L', 8, 'Pujer', 'Bondowoso', 'Jawa Timur', 'PELAKSANAAN AKTIVITAS KEAGAMAAN DALAM MEMBENTUK KARAKTER PEDULI SOSIAL PADA SISWA SMPN 2 SATU ATAP PUJER BONDOWOSO TAHUN PELAJARAN 2025', '', NULL, NULL),
(825, '2025', '2021201012', 'MOCHAMMAD ILYAS', 'L', 2, 'Tamanan', 'Bondowoso', 'Jawa Timur', 'TINJAUAN HUKUM ISLAM  TERHADAP SISTEM UPAH BURUH  PANEN TEMBAKAU DI DESA KARANGMELOK KECAMATAN TAMANAN KABUPATEN BONDOWOSO', 'Terverifikasi', NULL, NULL),
(826, '2025', '2021202049', 'MELY ASHARI', 'P', 4, 'Sangkapura', 'Gresik', 'Jawa Timur', 'Tinjauan Hukum Islam Terhadap Putusan Nomor: 53/Pdt.G/ 2024/ Pa.Bwn. Tentang Gugat Cerai Istri Pada Suami Yang Menjadi Tki (Studi Kasus di Pengadilan Agama Bawean)', 'Terverifikasi', NULL, NULL),
(827, '2025', '202140229', 'HIKMATUL FITRIANI', 'P', 6, 'Kangayan', 'Sumenep', 'Jawa Timur', 'Nilai konseling Pada slogan mondhuk entar ngabdhi ben ngajhi bagi santri di pondok pesantren salafiyah syafi’iyah sukorejo situbondo', 'Terverifikasi', NULL, NULL),
(828, '2025', '2021301147', 'ACH NASRULLAH', 'L', 8, 'BUNGATAN', 'KAB. SITUBONDO', 'Jawa Timur', 'IMPLEMENTASI METODE PEMBELAJARAN PROBLEM BASED LEbARNING UNTUK MENINGKATKAN HASIL BELAJAR SISWA PADA MATA PELAJARAN FIQIH MATERI ZAKAT KELAS VII DI MTS AL IZZA BUNGATAN SITUBONDO TAHUN PELAJARAN 2024/2025', 'Terverifikasi', NULL, NULL),
(829, '2025', '2021301146', 'A. KHAIRUL UMAM', 'L', 8, 'KADUR', 'KAB. PAMEKASAN', 'Jawa Timur', '\"PENGEMBANGAN MEDIA PEMBELAJARAN BUKU BERGAMBAR', NULL, NULL, NULL),
(830, '2025', '2021301108', 'ARIFATIL JANNAH', 'P', 8, 'PANARUKAN', 'SITUBONDO', 'Jawa Timur', '\"PROGRAM TADARUS AL-QUR’AN UNTUK MENINGKATKAN KUALITAS BACAAN AL-QUR’AN DALAM PEMBELAJARAN PAI DI SMP NEGERI 3 PANARUKAN KABUPATEN SITUBONDO', NULL, NULL, NULL),
(831, '2025', '2021704007', 'RIFKI NURIRAWAN', 'L', 21, 'KALIPURO', 'KAB. BANYUWANGI', 'JAWA TIMUR', 'THE RESPONSE OF IMPLEMENTATION OF ROLE PLAY TO ENHANCE STUDENTS\' SELF-CONFIDENCE IN SPEAKING COMPREHENSION AT SALAFIYAH SYAFI\'IYAH FOREIGN LANGUAGE DORMITORY', 'Terverifikasi', NULL, NULL),
(832, '2025', '2021302061', 'YUSFA AIDA MABRUROH', 'P', 9, 'Purwosari', 'Pasuruan', 'Jawa Timur', 'PENGEMBANGAN BAHAN AJAR ميسّر فى علم الفقة  MODEL KOLOM DALAM MENGEMBANGKAN MAHAROH QIROAH DI KEALAS PASCA AMTSILATI ASRAMA E PONDOK PESANTREN NGALAH TAHUN AJARAN 2024 / 2025', 'Terverifikasi', NULL, NULL),
(833, '2025', '2021302005', 'ASHABUL KAHFI', 'L', 9, 'Arjasa', 'Sumenep', 'Jawa Timur', 'استخدام طريقة التكرار في ترقية المفردة الطلاب دار اللغة العربية في معهد سلفية شافعية الإسلامي سوكورجو سيتوبوندو', 'Terverifikasi', NULL, NULL),
(834, '2025', '2021302060', 'WULIDATUL MUSYAROFAH', 'P', 9, 'Tempeh', 'Lumajang', 'Jawa Timur', 'تطبيق طريقة المفتاح للعلوم لتحسين القدرة على قراءة كتب التراث لطلاب معهد مفتاح العلوم باندانوانجي– لوماجانج عام 2025 م.', 'Terverifikasi', NULL, NULL),
(835, '2025', '2021704021', 'NISA RISQI ANANDA', 'P', 21, 'genteng', 'Banyuwangi', 'Jawa Timur', 'ANALYZING STUDENTS’ PERCEPTION ON SWITCHING AND MIXING CODE IN LEARNING VOCABULARY IN THE ELEVENTH GRADE AT SMK IBNU SINA GENTENG', 'Terverifikasi', NULL, NULL),
(836, '2025', '2021701060', 'WILDA MAULIDIAH', 'P', 20, 'Sukowono', 'Jember', 'Jawa Timur', 'HUBUNGAN POLA ASUH DEMOKRATIS DENGAN KEMATANGAN EMOSIONAL PADA REMAJA DI SMA NEGERI PLUS SUKOWONO JEMBER', 'Terverifikasi', NULL, NULL),
(837, '2025', '2021701049', 'SITI NURJANNAH', 'P', 20, 'Panji', 'Situbondo', 'Jawa Timur', 'HUBUNGAN POLA ASUH ORANG TUA OTORITER DAN PERMISIF DENGAN KENAKALAN REMAJA DI SMP NEGERI 3 PANJI SITUBONDO', 'Terverifikasi', NULL, NULL),
(838, '2025', '2021204082', 'SOFIATUL HASANAH', 'P', 5, 'Kalisat', 'Jember', 'Jawa Timur', 'Analisis strategi sumber daya insani dalam meningkatkan kinerja karyawan di adeeva group jember', 'Terverifikasi', NULL, NULL),
(839, '2025', '2021702032', 'BAIQ. SYAYYIDA OKTARIA', 'P', 19, 'Praya Batat Daya', 'Lombok Tengah', 'NTB', 'perlindungan tindak pidana pelaku anak dalam kekerasan seksual berdasarkan undang-undang nomor 35 tahun 2014', 'Terverifikasi', NULL, NULL),
(840, '2025', '2021702030', 'AYU FIRNANDA', 'P', 19, 'Asembagus', 'Situbondo', 'Jawa Timur', '\"Analisis Dakwaan Terhadap Tindak Pidana Persetubuhan Terhadap Penyandang Disabilitas', NULL, NULL, NULL),
(841, '2025', '2021703027', 'FITROTUL FAIZAH', 'P', 18, 'Banyuputih', 'Situbondo', 'Jawa Timur', '\"analisis penyajian laporan keuangan berdasarkan', NULL, NULL, NULL),
(842, '2025', '2021301098', 'ROSALIA', 'P', 8, 'Kalipuro', 'Banyuwangi', 'Jawa Timur', 'INOVASI PEMBELAJARAN  DALAM PENINGKATKAN KARAKTER RELIGIUS SISWA (Studi Kasus:  MTsN 1 BANYUWANGI)', 'Terverifikasi', NULL, NULL),
(843, '2025', '2021302022', 'M. H. KHAIRUL AKBAR M.', 'L', 9, 'SERAM UTARA TIMUR SETI', 'KAB. MALUKU TENGAH', 'MALUKU', 'Pengembangan Media Pembelajaran Bahasa Arab berbasis Booklet Muhadatsah Al-Arobiyah dalam Meningkatkan Maharatul Kalam Siswa Kelas VIII MTS Negeri 3 Situbondo', 'Terverifikasi', NULL, NULL),
(844, '2025', '2021704026', 'ROS DIYANA HOLIFAH', 'P', 21, 'Ra\'as', 'Sumenep', 'Jawa Timur', 'the impact of fly swatter game on students’ vocabulary mastery of pre class at language boarding house (lbh)', 'Terverifikasi', NULL, NULL),
(845, '2025', '2021701048', 'SITI NUR HOLILAH', 'P', 20, 'Kalipuro', 'Banyuwangi', 'Jawa Timur', 'hubungan self-forgiveness dengan pemaknaan hidup mahasiswa tahun pertama di universitas ibrahimy', 'Terverifikasi', NULL, NULL),
(846, '2025', '2021501018', 'MOH. HASINUR ROHIM', 'L', 15, 'TALANGO', 'KAB. SUMENEP', 'Jawa Timur', 'SISTEM MONITORING SUHU DAN PH AIR TAMBAK UDANG VANAME BERBASIS IOT DI PT. ADIGUNA SUKSES SUMEKAR KECAMATAN TALANGO', 'Terverifikasi', NULL, NULL),
(847, '2025', '2021204063', 'EVI MAUFIROH', 'P', 5, 'Perak Barat', 'Surabaya', 'Jawa Timur', 'ANALISIS METODE BUSSINES MODEL CANVAS PADA “PT. DISTRIBUSI AIR SANTRI SURABAYA” DALAM MENGEMBANGKAN UNIT BISNIS AMDK', 'Terverifikasi', NULL, NULL),
(848, '2025', '2021301155', 'UNSIL FUAD', 'L', 8, 'BANYUPUTIH', 'KAB. SITUBONDO', 'Jawa Timur', 'ANALISIS KOMPETENSI PEDAGOGIKK GURU AGAMA ISLAM DALAM PENINGKATAN KREATIVITAS BELAJAR SISWA KELAS VIII B MTs NEGERI 3 SITUBONDO TAHUN PELAJARAN 2024-2025', 'Terverifikasi', NULL, NULL),
(849, '2025', '2021201057', 'SITI WAKINI', 'P', 2, 'Arjasa', 'Situbondo', 'Jawa Timur', 'Perspektif Hukumi Ekonomi Syariah Terhadap Jual Beli Kacang Hijau Desa Ketowan Kecamatan Arjasa Kabupaten Situbondo', 'Terverifikasi', NULL, NULL),
(850, '2025', '2021301076', 'MOH. AKMALIS SHOLIHIN', 'L', 8, 'BANYUPUTIH', 'KAB. SITUBONDO', 'Jawa Timur', 'PEMBELAJARAN TAJWID DALAM PENINGKATAN KOMPETENSI KEPESANTRENAN MEMBACA AL-QUR’AN MAHASISWA DI MADRASAH TA’HILIYAH IBRAHIMY PUTRA TAHUN PELAJARAN 2024-2025', 'Terverifikasi', NULL, NULL),
(851, '2025', '2021701034', 'MEI PUTIH INTAN LESTARI', 'P', 20, 'Wonosari', 'Bondowoso', 'Jawa Timur', 'PERANAN  KECERDASAN EMOSIONAL TERHADAP KEBERHASILAN MENGHAFAL AL-QUR’AN', '', NULL, NULL),
(852, '2025', '2021703049', 'SUSILOWATI', 'P', 18, 'Sempol', 'Bondowoso', 'Jawa Timur', 'Analisis Perhitungan Harga Pokok Produksi Dengan Menggunakan Metode Full Costing Sebagai Dasar Penentuan Harga Jual Pada Cv. Petani Hebat Di Kecamatan Ijen Kabupaten Bondowoso', 'Terverifikasi', NULL, NULL),
(853, '2025', '2021203021', 'Muhammad Khoirul Umam', 'L', 3, 'Wongsorejo', 'Banyuwangi', 'Jawa Timur', 'PERAN PRODUK PEMBIAYAAN SYARI’AH TERHADAP EKSISTENSI USAHA MIKRO KECIL DAN MENENGAH (UMKM) DALAM MENINGKATKAN PEMBERDAYAAN EKONOMI MASYARAKAT DI KSPPS BMT NU JAWA TIMUR CABANG WONGSOREJO 1 BANYUWANGI', 'Terverifikasi', NULL, NULL),
(854, '2025', '2021202061', 'SABILA', 'P', 4, 'Tapung Hilir', 'Kampar', 'Riau', 'STUDI KOMPARATIF PEMBERIAN NAFKAH KEPADA ISTRI YANG DI TALAK BA’IN MENURUT ABU HANIFAH DAN KOMPILASI HUKUM ISLAM', 'Terverifikasi', NULL, NULL),
(855, '2025', '2021204040', 'MOHAMMAD TAUFIQQURROHMAN', 'L', 5, 'Cermee', 'Bondowoso', 'Jawa Timur', 'ANALISIS MENEJEMEN KEPEMIMPINAN DALAM MENINGKATKAN KINERJA KARYAWAN [STUDI KASUS PT TULUS HIJRAH BAITULLAH GLAGAH OLESARI BANYUWANGI]', 'Terverifikasi', NULL, NULL),
(856, '2025', '2021205028', 'YULI YANTI', 'P', 1, 'Jangkar', 'Situbondo', 'Jawa Timur', 'analisis perbedaan harga saham sebelum dan sesudah pengumuman monkey pox pada perusahaan yang terindek di induk saham syari’ah indonesia', 'Terverifikasi', NULL, NULL),
(857, '2025', '2021201011', 'MOCH. FAIZAL AMIN', 'L', 2, 'BANYUPUTIH', 'KAB. SITUBONDO', 'Jawa Timur', 'PERSPEKTIF HUKUM EKONOMI SYARI’AH TENTANG PEMBERIAN UPAH PENGECER ES BATU DI DESA SUMBERANYAR BANYUPUTIH SITUBONDO', 'Terverifikasi', NULL, NULL),
(858, '2025', '2021202067', 'ZUHRATUL AZKA', 'P', 4, 'Sungai Manau', 'Merangin', 'Jambi', '\"CHILDFREE DALAM PERSPEKTIF MAQO SID AS-SYARI’AH', NULL, NULL, NULL),
(859, '2025', '2021204020', 'HILMA LUTFIYANA', 'P', 5, 'Glagah', 'Banyuwangi', 'Jawa Timur', 'PENERAPAN NILAI-NILAI ETIKA BISNIS ISLAM DALAM MENINGKATKAN MINAT KONSUMEN DI RESTORAN PAGLAK PETUNG CAFE AND ART BANYUWANGI', 'Terverifikasi', NULL, NULL),
(860, '2025', '2021301129', 'ROBI\'ATUL ADAWIYAH', 'P', 8, 'Siantan', 'Mempawah', 'Kalimantan Barat', '\"PENGEMBANGAN APLIKASI PEMBELAJARAN BERBASIS ANDROID', NULL, NULL, NULL),
(861, '2025', '2021301064', 'SISWANTO', 'L', 8, 'ARJASA', 'KAB. SUMENEP', 'JAWA TIMUR', 'IMPLEMENTASI TAHSINUL QIRO’AH DALAM PENINGKATAN KEMAMPUAN MEMBACA AL-QUR’AN DI LEMBAGA TAHSIN B ASRAMA TAHFIDZUL QUR’AN SALAFIYAH SYAFI’IYAH SUKOREJO TAHUN PELAJARAN 2024/2025', 'Terverifikasi', NULL, NULL),
(862, '2025', '2021503084', 'NURISMA LUTFIANA', 'P', 17, 'Blimbingsari', 'Banyuwangi', 'Jawa Timur', 'SISTEM PENDUKUNG KEPUTUSAN PRESTASI SISWA SEKOLAH MTS GINTANGAN DENGAN METODE SAW', 'Terverifikasi', NULL, NULL),
(863, '2025', '2021701017', 'ANDINI RAUDHATUL JANNAH', 'P', 20, 'Wongsorejo', 'Banyuwangi', 'Jawa Timur', 'HUBUNGAN TEMAN SEBAYA DAN FRIENDSHIP DENGAN KENAKALAN REMAJA DI MTS ISLAMIYAH WONGSOREJO', 'Terverifikasi', NULL, NULL),
(864, '2025', '2021701050', 'NUR FADILAH', 'P', 20, 'Asembagus', 'Situbondo', 'Jawa Timur', 'HUBUNGAN KONFORMITAS DAN GROUPTHINK DENGAN SELF ESTEEM REMAJA AWAL DI MTS NEGERI 3 SITUBONDO', 'Terverifikasi', NULL, NULL),
(865, '2025', '2021202016', 'KHAIRUL ANAM', 'L', 4, 'GAYAM', 'SUMENEP', 'JAWA TIMUR', 'PERSPEKTIF HUKUM ISLAM TENTANG SISTEM PENCATATAN WALI NIKAH TERHADAP ANAK ANGKAT (Study Kasus di KUA Kecamatan Jambesari Kabupaten Bondowoso)', 'Terverifikasi', NULL, NULL),
(866, '2025', '2015021169', 'BAJRIA TUL HASANA', 'P', 18, 'Selemadeg', 'Tabanan', 'Bali', 'IMPLEMENTASI LAPORAN KEUANGAN BERDASARKAN PEDOMAN AKUNTANSI PESANTREN PADA YAYASAN AINUL HUDA BANYUWANGI', 'Terverifikasi', NULL, NULL),
(867, '2025', '2021202066', 'ZAYANUN NAJAH', 'P', 4, 'Ra\'as', 'Sumenep', 'Jawa Timur', '\"TINJAUAN HUKUM ISLAM TERHADAP PENGALIHAN TANGGUNGAN MENGASUH ANAK OLEH', NULL, NULL, NULL),
(868, '2025', '2021703053', 'SADA SULASTI', 'P', 18, 'Songgon', 'Banyuwangi', 'Jawa Timur', 'ANALISIS MANAJEMEN RISIKO PADA PRODUK PEMBIAYAAN LAYANAN BERBASIS JAMAAH (LASISMA) DI KSPP SYARIAH BMT NU JAWA TIMUR CABANG ARJASA SITUBONDO', 'Terverifikasi', NULL, NULL),
(869, '2025', '202120241', 'RAGESTI DELLA MASDANA', 'P', 6, 'Arjasa', 'Situbondo', 'Jawa Timur', 'NILAI-NILAI KONSELING DALAM TRADISI ROKAT PANDHEBE DI DESA ARJASA KECAMATAN ARJASA KABUPATEN ARJASA', 'Terverifikasi', NULL, NULL),
(870, '2025', '2018302009', 'Fahrur Rozi', 'L', 16, 'Kalipuro', 'Banyuwangi', 'Jawa Timur', 'RANCANG BANGUN E-COMMERCE BERBASIS WEB', 'Terverifikasi', NULL, NULL),
(871, '2025', '2021504032', 'MUHAMMAD AINUL YAQIN', 'L', 12, 'TALANGO', 'KAB. SUMENEP', 'Jawa Timur', 'REVITALISASI PASAR TRADISIONAL TOGHUR BANG DI DESA PADIKE KECAMATAN TALANGO KABUPATEN SUMENEP, DENGAN PENDEKATAN ARSITEKTUR BERKELANJUTAN', '', NULL, NULL),
(872, '2025', '2020502006', 'AHMAD MAULANA IKMAN', 'L', 16, 'Jangkar', 'Situbondo', 'Jawa Timur', 'RANCANG BANGUN SISTEM INFORMASI ADMINISTRASI PEMBAYARAN SANTRI PADA PONDOK PESANTREN NURUL IMAN SELETRENG KAPONGAN SITUBONDO DENGAN BERBASIS WEBSITE DAN WHATSAPP GATEWAY', 'Terverifikasi', NULL, NULL),
(873, '2025', '2021301086', 'NURUL FITRIANA', 'P', 8, 'Wuluhan', 'Jember', 'Jawa Timur', 'implementasi metode talking stick dalam meningkatkan keaktifan dan hasil belajar siswa mata pelajaran agama islam kelas vii di smp swasta al-muthohhirin jember tahun pelajaran 2024/2025', 'Terverifikasi', NULL, NULL),
(874, '2025', '2021301029', 'IMAM FAWAIZ', 'L', 8, 'GAYAM', 'KAB. SUMENEP', 'JAWA TIMUR', 'KOMPETENSI PROFESIONAL GURU DALAM MENGIMPLEMENTASIKAN KURIKULUM MERDEKA PADA PEMBELAJARAN AL-QUR’AN HADITS DI MTS. NU PANCOR KECAMATAN GAYAM SUMENEP TAHUN PELAJARAN 2024/2025', 'Terverifikasi', NULL, NULL),
(875, '2025', '2021504006', 'Imam Baehaqi Aba Hidayat', 'L', 12, 'Srono', 'Banyuwangi', 'Jawa Timur', 'REDESAIN KANTOR BALAI DESA PARIJATAH KULON DENGAN PENDEKATAN ARSITEKTUR NEO VERNAKULAR', 'Terverifikasi', NULL, NULL),
(876, '2025', '2020201054', 'DIDIK HERMANTO', 'L', 2, 'Tenggarang', 'Bondowoso', 'Jawa Timur', '\"PRAKTEK PERMAINAN BONEKA CAPIT PRESPEKTIF HUKUM ISLAM', NULL, NULL, NULL),
(877, '2025', '2021702044', 'NADIYAH IZZATUN NADA', 'P', 19, 'Banyuputih', 'Situbondo', 'Jawa Timur', 'YURISDIKSI INTERNATIONAL CRIMINAL COURT (ICC) TERHADAP PELAKU KEJAHATAN HUMANITER BERDASARKAN STATUTA ROMA 1998', 'Terverifikasi', NULL, NULL),
(878, '2025', '2021201054', 'SILVIA TUQTAVIA', 'P', 2, 'Asembagus', 'Situbondo', 'Jawa Timur', 'tinjauan hukum islam terhadap jual beli furniture dengan sistem akad salam di toko arif ubud gianyar bali', 'Terverifikasi', NULL, NULL),
(879, '2025', '2021702031', 'BAIQ NOVIA MULIA RAMDANI', 'P', 19, 'Praya Barat', 'Lombok Tengah', 'NTB', 'tinjauan yuridis ganti kerugian pengadaan tanah untuk kepentingan umum', '', NULL, NULL),
(880, '2025', '2021201025', 'NURUL KHOIRON NISA\'', 'P', 2, 'Panji', 'Situbondo', 'Jawa Timur', 'PERSPEKTIF HUKUM EKONOMI SYARI’AH TERHADAP PRAKTIK JUAL BELI AYAM KAMPUNG DENGAN SISTEM TAKSIRAN (Studi Kasus Pasar Mimbaan Kecamatan Panji Kabupaten Situbondo)', 'Terverifikasi', NULL, NULL),
(881, '2025', '2021301131', 'SITI MAIMUNAH', 'P', 8, 'Seponti', 'Kayong Utara', 'Kalimantan Barat', 'IMPLEMENTASI METODE GIVING QUESTION AND GETTING ANSWER UNTUK MENINGKATKAN HASIL BELAJAR SISWA PADA MATA PELAJARAN AL-QUR’AN HADIS KELAS VIII B DI MTs. SABILUL HUDA GUNTUR DEMAK TAHUN PELAJARAN 2024/2025', 'Terverifikasi', NULL, NULL),
(882, '2025', '2021204029', 'Muh Kholid', 'L', 5, 'PRAYA', 'Lombok Tengah', 'Nusa Tenggara Barat', 'IMPLEMENTASI STRATEGI PELAYANAN ISLAM DALAM MENINGKATKAN KEPUASAN KONSUMEN (Studi kasus di Café Babanana Praya Lombok Tengah)', 'Terverifikasi', NULL, NULL),
(883, '2025', '202140142', 'SRI WAHYUNI', 'P', 7, 'Bekasi Barat', 'Bekasi', 'Jawa Barat', 'ANALISIS PESAN KOMUNIKASI ISLAM DALAM KITAB MUKHTASOR IHYA’ ULUMUDDIN KARYA IMAM AL-GHAZALI', 'Terverifikasi', NULL, NULL),
(884, '2025', '2021302001', 'Ach Fajri Qomaruzaman', 'L', 9, 'Sumberjambe', 'Jember', 'Jawa Timur', '\"استخدام طريقة الحوار لتحسين مهارات الكلام في المدرسة المتوسطة نورالقرنين الصف الثامن الباليد بارو سوكونو جمبر\"', 'Terverifikasi', NULL, NULL),
(885, '2025', '2021302026', 'ROJIKIN NURADIN', 'L', 9, 'Belik', 'Pemalang', 'Jawa Tengah', 'استخدام الوسائل السمعية والبصرية لترقية المفردات في الفصل السابع ح بالمدرسة المتوسطة نور القرنين جمبر جاوى الشرقية للعام الدراسي 2024/2025', 'Terverifikasi', NULL, NULL),
(886, '2025', '2021301035', 'M. Husaini Hafidz Ns', 'L', 8, 'Kalipuro', 'Banyuwangi', 'Jawa Timur', '“MODEL PEMBELAJARAN COOPERATIVE TIPE SCRIPT DALAM MENUMBUHKAN KEMAMPUAN BERFIKIR KRITIS SISWA PADA MATA PELAJARAN PAI KELAS VIII A DI SMPN 1 ASEMBAGUS TAHUN PELAJARAN 2024-2025”', 'Terverifikasi', NULL, NULL),
(887, '2025', '2021301170', 'Fuad Nurul Kawakib', 'L', 8, 'Kapongan', 'Situbondo', 'Jawa Timur', '\"EFEKTIVITAS PEMBINAAN KETAUHIDAN SISWA', NULL, NULL, NULL),
(888, '2025', '2021201041', 'YUSRIYATURROHMAH', 'P', 2, 'Kraton', 'Bangkalan', 'Jawa Timur', '\"PERSPEKTIF HUKUM EKONOMI SYARIAH TERHADAP MEKANISME JUAL BELI BIBIT TANAMAN BONSAI DENGAN SISTEM ONLINE ', NULL, NULL, NULL),
(889, '2025', '2021303021', 'SARIATUN SHOLIHAH', 'P', 10, 'Praya', 'Lombok Tengah', 'NTB', 'PENGGUNAAN MEDIA SCRAP BOOK UNTUK MENINGKATKAN PEMAHAMAN TATA SURYA PADA ANAK KELOMPOK B DI TK NURUL ULUM MERTAK TOMBOK TAHUN PELAJARAN 2024/2025', 'Terverifikasi', NULL, NULL),
(890, '2025', '2021020297', 'BAIQ HARMAYANI', 'P', 10, 'Praya', 'Lombok Tengah', 'NTB', 'PENERAPAN MODEL PEMBELAJARAN SENTRA BAHAN ALAM UNTUK MENINGKATKAN KECERDASAN NATURALIS ANAK KELOMPOK B TK AL ISTIQOMAH MONTONG SEMAYE LOMBOK TENGAH NTB TAHUN                        PELAJARAN 2024/2025', 'Terverifikasi', NULL, NULL),
(891, '2025', '2021204088', 'NURIL FARHANA AHMAD', 'P', 5, 'kalibaru', 'Banyuwangi', 'Jawa Timur', 'ANALISIS STRATEGI MANAJEMEN PROMOSI SYARIAH DALAM MENINGKATKAN VOLUME PENJUALAN PADA TOKO ADIBA COLLECTION SUKOREJO SITUBONDO', 'Terverifikasi', NULL, NULL),
(892, '2025', '2021703047', 'NURUL FITRIYAH', 'P', 18, 'Pujer', 'Bondowoso', 'Jawa Timur', 'Analisis Pengelolaan Keuangan Berdasarkan Interpretasi Standar Akuntansi Keuangan (Isak) No. 35 Di Smp Miftahul Ulum Pujer Kabupaten Bondowoso', '', NULL, NULL),
(893, '2025', '2019204046', 'MURSYIDUL QUROMAH', 'L', 5, 'Kapongan', 'Situbondo', 'Jawa Timur', '\"IMPLEMENTASI SUSTAINABLE DEVELOPMENT GOALS (SDG’s) INDONESIA DALAM UPAYA MENINGKATKAN MANAJEMEN SUMBER DAYA MANUSIA DALAM PERSPEKTIF ETIKA BISNIS ISLAM', NULL, NULL, NULL),
(894, '2025', '2021205038', 'NURUL HALIMAH', 'P', 1, 'Sukowono', 'Jember', 'Jawa Timur', 'Analisis Akuntansi Pembiayaan Mudharabah Berdasarkan Psak 105 Di Bmt Maslahah Lil Ummah Sukowono Jember', 'Terverifikasi', NULL, NULL),
(895, '2025', '2021303010', 'FITRI KAMILA DEWI', 'P', 10, 'Sempu', 'Banyuwangi', 'Jawa Timur', 'Meningkatkan Aspek Kognitif Anak Melalui Kegiatan Pembelajaran Make a Match Jam Dinding Pada Anak Kelompok B di TK Dharma Wanita 22 kelompok B tahun ajaran 2024/2025”', 'Terverifikasi', NULL, NULL),
(896, '2025', '2021205030', 'RETNO WINASIH', 'P', 1, 'Bajubang', 'Batanghari', 'Jambi', 'ANALISIS PERAN AUDITOR INTERNAL DALAM MENINGKATKAN KINERJA KEUANGAN PADA SWALAYAN PESANTREN MA’HDUL QUR’AN PUTRI P2S2 SUKOREJO', 'Terverifikasi', NULL, NULL),
(897, '2025', '2021503051', 'ZAINAL MO\'EN', 'L', 17, 'KADUR', 'KAB. PAMEKASAN', 'JAWA TIMUR', 'RANCANG BANGUN SISTEM PENDISTRIBUSIAN ROKOK BAWANG MAS BERBASIS WEBSITE', 'Terverifikasi', NULL, NULL),
(898, '2025', '2021503016', 'IMAM NAWAWI', 'L', 17, 'JAMBESARI', 'BONDOWOSO', 'Jawa Timur', '\"SISTEM INFORMASI MANAJEMEN BERBASIS KEY PERFORMANCE INDICATOR (KPI) DALAM MENGUKUR KINERJA GURU', NULL, NULL, NULL),
(899, '2025', '2021204097', 'SITI HANIFAH', 'P', 5, 'Wongsorejo', 'Banyuwangi', 'Jawa Timur', 'Pengaruh Spiritual Leadership dan Kompensasi Terhadap Kinerja Karyawan di KSPP Syari\'ah BMTNU Cabang 1 Wongsorejo', 'Terverifikasi', NULL, NULL),
(900, '2025', '2021503025', 'MOH. AQIL MUKHTAR. A', 'L', 17, 'KABAT', 'KAB. BANYUWANGI', 'Jawa Timur', 'APLIKASI PENGELOLAAN TABUNGAN DAN PEMBAYARAN BERBASIS WEB DENGAN INTEGRASI PAYMENT GATEWAY (STUDI KASUS MI ISLAMIYAH PENGATIGAN ROGOJAMPI)', 'Terverifikasi', NULL, NULL),
(901, '2025', '2021203042', 'KARINA HABSAWATI', 'P', 3, 'Kuta', 'Badung', 'Bali', 'perngaruh inovasi dan kualitas produk dalam meningkatkan minat beli konsumen produk sepatu kulit hewan di pt bel nin sejahtera jaya badung bali', 'Terverifikasi', NULL, NULL),
(902, '2025', '2021203098', 'ULFA MAULIDA', 'P', 17, 'Wongsorejo', 'Banyuwangi', 'Jawa Timur', 'implementasi metode saw pada sistem pendukung keputusan penentuan penerima bantuan beras bulog (studi kasus: kantor desa alasbuluh)', 'Terverifikasi', NULL, NULL),
(903, '2025', '2021703056', 'SINTA NURIAH', 'P', 18, 'Kute', 'Badung', 'Bali', '\"ANALISIS SISTEM PENGENDALIAN INTERNAL PADA PT INDUSTRI EKSPOR INTERNASIONAL', NULL, NULL, NULL),
(904, '2025', '2021304024', 'LUTFIAH NURLAILI', 'P', 11, 'Arjasa', 'Sumenep', 'Jawa Timur', 'PENGARUH PENGUNAAN MEDIA GAMIFIKASI DALAM PEMBELAJARAN MATEMATIKA TERHADAP MOTIVASI DAN HASIL BELAJAR SISWA', 'Terverifikasi', NULL, NULL),
(905, '2025', '2021301124', 'NURUL IMANIYAH', 'P', 8, 'Gayam', 'Sumenep', 'Jawa Timur', 'EFEKTIVITAS METODE GUIDED NOTE TAKING UNTUK MENINGKATKAN HASIL BELAJAR SISWA PADA MATA PELAJARAN SEJARAH KEBUDAYAAN ISLAM (SKI) DI KELAS VI MI JAM’IYATUL ISLAMIYAH GAYAM SUMENEP 2024-2025', 'Terverifikasi', NULL, NULL),
(906, '2025', '2021201038', 'SITI RIFQIYATUL HASANAH', 'P', 2, 'Asembagus', 'Situbondo', 'Jawa Timur', 'Perspektif Hukum Islam Terhadap Permasalahan Wanprestasi Dalam Penerapan Akad Mudarabahah lil Amir Bis Syira’ di PT. Permodalan Nasional Madani (Mekaar) Cabang Asembagus', 'Terverifikasi', NULL, NULL),
(907, '2025', '2021302044', 'MARDIA', 'P', 9, 'Pujer', 'Bondowoso', 'Jawa Timur', '\"PEMBUATAN MEDIA DOMINO MUFRODAT DALAM MENINGKATKAN PENGUASAAN KOSAKATA BAHASA ARAB PADA SISWA KELAS III MADRASAH DINIYAH MIFTAHUN NASI’IN PUJER BONDOWOSO ', NULL, NULL, NULL),
(908, '2025', '2021302046', 'NIKMATUL WAFIROH', 'P', 9, 'Kapongan', 'Situbondo', 'Jawa Timur', 'فعالية تطبيق الكاهوت!(kahoot!) في تحسين إتقان مادة المفردات لدى الطلّاب  في الفصل السابع في المدرسة المتوسطة الحكوميّة ۱ سيتوبوندو في العام الدراسي 2025-2024', 'Terverifikasi', NULL, NULL),
(909, '2025', '202140105', 'AHMAD BAKRI', 'L', 7, 'PENGAROM', 'KAB. BANJAR', 'Kalimantan Selatan', 'STRATEGI KOMUNIKASI ORGANISASI RAYON IKSASS ALUMNI KALIMANTAN SELATAN DALAM MENJAGA KEUTUHAN ORGANISASI PASCA PEMILUKADA 2024 DI KALIMANTAN SELATAN', 'Terverifikasi', NULL, NULL),
(910, '2025', '202140137', 'HARIWATI', 'P', 7, 'Praya', 'Lombok Tengah', 'NTB', 'Media Sosial Sebagai Media Dakwah (Studi Pada Akun Instagram @Muhajirafifuddin Edisi Bulan Maret-April 2025)', 'Terverifikasi', NULL, NULL),
(911, '2025', '202140134', 'BUNGA TANG', 'P', 7, 'Sadu', 'Tanjung Jabung Timur', 'Jambi', '\"INSTAGRAM SEBAGAI MEDIA DAKWAH', NULL, NULL, NULL),
(912, '2025', '2021503027', 'MOH SYAHRUL ISKANDAR', 'L', 17, 'AROSBAYA', 'KAB. BANGKALAN', 'Jawa Timur', 'IMPLEMENTASI APLIKASI MANAJEMEN ARSIP SURAT BERBASIS OPTICAL CHARACTER RECOGNITION PADA BADAN PUSAT STATISTIK BANYUWANGI', 'Terverifikasi', NULL, NULL),
(913, '2025', '2021402046', 'MALIK ABDULLAH', 'L', 7, 'SAPEKEN', 'KAB. SUMENEP', 'Jawa Timur', 'MEDIA SOSIAL WHATSAAP SEBAGAI MEDIA DAKWAH BAGI PENGURUS REMAJA MASJID TAKWA DESA JANGKAR KECAMATAN JANGKAR KABUPATEN SITUBONDO', 'Terverifikasi', NULL, NULL),
(914, '2025', '2021303022', 'ULFI RAHMAYANI', 'P', 10, 'Bathin II Pelayang', 'Bungo', 'Jambi', 'Meningkatkan kemampuan membaca permulaaan melalui media papan abjad pada kelompok B di TK Harapan Maju', 'Terverifikasi', NULL, NULL),
(915, '2025', '2021202062', 'SITI AISYAH', 'P', 4, 'Mandah', 'Indragiri Hilir', 'Riau', 'fenomena  hantaran   belanja  pra  nikah adat melayu riau (perspektif ‘urf)', 'Terverifikasi', NULL, NULL),
(916, '2025', '2020203005', 'AHMAD NABIL OBAEDILLA', 'L', 3, 'Gili Ginting', 'Sumenep', 'Jawa Timur', 'ANALISIS STRATEGI PEMASARAN SYARIAH DALAM MENINGKATKAN MINAT KONSUMEN (STUDI KASUS DI TOKO ROBET KELURAHAN RAWAMANGUN KECAMATAN PULOGADUNG JAKARTA TIMUR)', 'Terverifikasi', NULL, NULL),
(917, '2025', '202140246', 'SISKA DIAH UMAMI', 'P', 6, 'Bebandem', 'Karangasem', 'Bali', 'KONTRIBUSI PENYULUH AGAMA ISLAM KUA DALAM MEWUJUDKAN KELUARGA SAKINAH PADA MUALLAF  DI KECAMATAN BEBANDEM KABUPATEN KARANGASEM BALI', 'Terverifikasi', NULL, NULL),
(918, '2025', '2021501013', 'HASAN BASORI', 'L', 15, 'JANGKAR', 'KAB. SITUBONDO', 'Jawa Timur', 'AUTONOMOS KANDANG AYAM BROILER BERBASIS IOT', 'Terverifikasi', NULL, NULL),
(919, '2025', '2021502036', 'Muh. Febria Hafid S.', 'L', 16, 'Kelumpang Hilir', 'Kotabaru', 'KALSEL', 'STUDI PERBANDINGAN METODE ARIMA, DOUBLE EXPONENTIAL SMOOTHING, DAN SINGLE EXPONENTIAL SMOOTHING PADA PENJUALAN PUPUK', 'Terverifikasi', NULL, NULL),
(920, '2025', '2021502003', 'AHMAD HUDAY', 'L', 16, 'BEBANDEM', 'KAB. KARANGASEM', 'Bali', 'SISTEM INFORMASI PEMBELIAN TIKET WISATA TAMAN UJUNG SUKASADA KARANGASEM BALI BERBASIS WEBSITE', 'Terverifikasi', NULL, NULL),
(921, '2025', '2021501003', 'AHMAD FAWAID', 'L', 15, 'KOTA SUMENEP', 'KAB. SUMENEP', 'Jawa Timur', 'PROTOTYPE SMART HOME BERBASIS IOT MENGGUNAKAN NODEMCU ESP 32', '', NULL, NULL),
(922, '2025', '2021301063', 'SHOIMUL AROFAH AS-SYADZILI', 'L', 8, 'BANYUPUTIH', 'KAB. SITUBONDO', 'Jawa Timur', '\"PEMBELAJARAN INTERAKTIF', NULL, NULL, NULL),
(923, '2025', '2021204096', 'SITI AISYATUR ROHMAH R.', 'P', 5, 'Proppo', 'Pamekasan', 'Jawa Timur', '\"Analisis Strategi Pemasaran Syari’ah Terhadap Produk Paket Umroh Dalam Meningkatkan Jumlah Jamaah', NULL, NULL, NULL),
(924, '2025', '2021703048', 'RANI AULIA', 'P', 18, 'Negara', 'Jembrana', 'Bali', 'ANALISIS TINGKAT KESEHATAN KEUANGAN KOPERASI SIMPAN PINJAM PADA KOPERASI KARYAWAN MAYA MANUNGGAL TEGAL BADENG NEGARA BALI', 'Terverifikasi', NULL, NULL),
(925, '2025', '2021702037', 'AZKHA AFLAHIYAH', 'P', 19, 'Gerokgak', 'Buleleng', 'Bali', 'Penanganan Tindak Pidana Penyalahguna Narkotika Dalam Perspektif Restorative Justic', 'Terverifikasi', NULL, NULL),
(926, '2025', '2021201016', 'MOHAMMAD ARIANSYAH', 'L', 2, 'SANGKAPURA', 'KAB. GRESIK', 'JAWA TIMUR', 'ANALISIS HUKUM ISLAM TERHADAP PRAKTIK AKAD MUZARA’AH PADA PENGELOLAAN SAWAH DI DESA BALIK TERUS KECAMATAN SANGKAPURA KABUPETEN GRESIK', 'Terverifikasi', NULL, NULL),
(927, '2025', '2021302002', 'A. HABIBI AL MAHBUB', 'L', 9, 'BALUNG', 'KAB. JEMBER', 'JAWA TIMUR', 'تأثير استيعاب المفردات في طلاقة الكلام باللغة العربية لطلاب دار اللغة العربية بمعهد سلفية شافعية الإسلامي سكورجو سيتوبندو', 'Terverifikasi', NULL, NULL),
(928, '2025', '2021301093', 'FATIN ATIKA', 'P', 8, 'Jangkar', 'Situbondo', 'Jawa Timur', '\"penggunaan kitab manhalul qur’an sebagai sumber', NULL, NULL, NULL),
(929, '2025', '2021202043', 'HOLISATUN HASANAH', 'P', 4, 'Tegalampel', 'Bondowoso', 'Jawa Timur', 'Perspektif Hukum Islam Terhadap Nafkah Istri Dalam Perkara Cerai Gugat Nomor 940/Pdt.G/2023.PA.Bdw. (Studi Kasus Putusan Hakim Di Pengadilan Agama Bondowoso)', 'Terverifikasi', NULL, NULL),
(930, '2025', '2021703055', 'SAFIKA SAFA KAMILA', 'P', 18, 'Wonosari', 'Bondowoso', 'Jawa Timur', 'analisis manajemen risiko keuangan pada badan usaha milik desa (bumdes) di desa sumberwringin kecamatan sumberwringin kabupaten bondowoso', '', NULL, NULL),
(931, '2025', '2021703031', 'KELVIN MAELANI', 'P', 18, 'Mumbulsari', 'Jember', 'Jawa Timur', 'analisis perhitungan harga pokok produksi berdasarkan metode full costing untuk penetapan harga jual pada ud. faqih meubel mumbulsari jember', 'Terverifikasi', NULL, NULL),
(932, '2025', '2021501010', 'DIKRI WAHYU ILAHI', 'L', 15, 'KALISAT', 'KAB. JEMBER', 'Jawa Timur', 'PERANCANGAN DAN IMPLEMENTASI CLOSED LOOP OPERATING SISTEM PADA KENDALI PEMBIBITAN TANAMAN CABAI', 'Terverifikasi', NULL, NULL),
(933, '2025', '2021501016', 'MIFTAHUL HORRI', 'L', 15, 'RA\'AS', 'KAB. SUMENEP', 'Jawa Timur', 'IMPLIMENTASI WHATSAPP GETEWAY PADA SISTEM PENDUKUNG KEPUTUSAN PEMILIHAN GURU BERPRESTASI DI SMK AL-ITTIHAD RAAS MENGGUNAKAN  METODE (MFEP)', '', NULL, NULL),
(934, '2025', '2021501024', 'MOH. JAUHARIYANTO', 'L', 15, 'JANGKAR', 'KAB. SITUBONDO', 'Jawa Timur', 'IMPLEMENTASI AUTOMATIC FISH FEEDER DI KERAMBA MENGGUNAKAN MIKROKONTROLER', 'Terverifikasi', NULL, NULL),
(935, '2025', '2021503008', 'AMMAR FARISI', 'L', 17, 'BATURITI', 'KAB. TABANAN', 'Bali', 'PREDIKSI PENYAKIT DIABETES MENGGUNAKAN ALGORITMA SUPPORT VECTOR MACHINE (SVM)', 'Terverifikasi', NULL, NULL),
(936, '2025', '2021503032', 'SAMSUL', 'L', 17, 'BANYUPUTIH', 'KAB. SITUBONDO', 'JAWA TIMUR', 'SISTEM PAKAR DIAGNOSA PENYAKIT MENULAR DENGAN METODE CERTAINTY FACTOR BERBASIS ANDROID PADA PUSKESMAS BANYUPUTIH', 'Terverifikasi', NULL, NULL),
(937, '2025', '2021302053', 'SITI HALIMA', 'P', 9, 'Banyuputih', 'Situbondo', 'Jawa Timur', 'Pengembangan Media Pembelajaran Domino Card Kitab Al-Kaylani Untuk Meningkatkan Pemahaman Materi Shorrof Di Asrama Bahasa Nurul Qoni’ Pondok Pesantren Salafiiyah Syafi\'iyah Situbondo Tahun Pelajaran 2025-2026', 'Terverifikasi', NULL, NULL),
(938, '2025', '2021503010', 'As\'ad Alwi Shihab', 'L', 17, 'Srono', 'Banyuwangi', 'Jawa Timur', 'KLASIFIKASI KUALITAS DAGING AYAM MENGGUNAKAN CITRA DIGITAL DENGAN METODE GRAY LEVEL CO-OCCURRENCE MATRIX  (GLCM) DAN CONVOLUTIONAL NEURAL NETWORK (CNN)', 'Terverifikasi', NULL, NULL),
(939, '2025', '202140221', 'WAHYU TANTOWI', 'L', 6, 'MANGGALEWA', 'KAB. DOMPU', 'Nusa Tenggara Barat', 'KONSEP BIMBINGAN KELUARGA ISLAM DALAM SEJARAH RUMAH TANGGA RASULULLAH SAW. DENGAN KHADIJAH BINTI KHUWAILID DALAM BUKU KHADIJAH BINTI KHUWAILID KARYA Dr. MUHAMMAD ABDUH YAMANI', 'Terverifikasi', NULL, NULL),
(940, '2025', '202140215', 'MUH. KHAERUL AKBAR', 'L', 6, 'PRAYA TENGAH', 'KAB. LOMBOK TENGAH', 'Nusa Tenggara Barat', 'PERAN PENYULUH AGAMA ISLAM DALAM PENINGKATAN SOLIDARITAS REMAJA KELURAHAN TIWU GALIH KECAMATAN PRAYA KABUPATEN LOMBOK TENGAH', 'Terverifikasi', NULL, NULL),
(941, '2025', '2021401059', 'SHABRINA FARHANI', 'P', 6, 'Gerokgak', 'Buleleng', 'Bali', 'Hubungan Shalat Hajat 12 Rakaat Terhadap Kepatuhan Santri Pada Peraturan Pesantren di Pondok Pesantren Salafiyah Syafi\'iyah Sukorejo', 'Terverifikasi', NULL, NULL),
(942, '2025', '2021302047', 'NILA HERAWATI', 'P', 9, 'Silo', 'Jember', 'Jawa Timur', 'PEMBUATAN MEDIA POHON PINTAR UNTUK MENINGKATKAN PENGUASAAN KOSA KATA BAHASA ARAB SISWA KELAS V MIS MAMBAUL ULUM DARUNGAN KARANGHARJO SILO JEMBER', 'Terverifikasi', NULL, NULL),
(943, '2025', '2021302056', 'SYARIFATUL MUNAWAROH', 'P', 9, 'Wongsorejo', 'Banyuwangi', 'Jawa Timur', 'PENGEMBANGAN MEDIA PEMBELAJARAN MELALUI POP UP BOOK DALAM MENINGKATKAN KEMAMPUAN MUFRODAT SISWA KELAS IV MI RAUDLATUT THALIBIN  KLAMPOKAN PANJI SITUBONDO TAHUN PELAJARAN 2024-2025', '', NULL, NULL),
(944, '2025', '2021302051', 'ROKOIYAH', 'P', 9, 'Sukadana', 'Kayong Utara', 'Kalimantan Barat', 'PEMBUATAN MEDIA PEMBELAJARAN AUDIO VISUAL MUFRODAT UNTUK MENINGKATKAN KETERLIBATAN SISWA DALAM PEMBELAJARAN BAHASA ARAB KELAS VII MTS DARUT TARBIYAH KALIPURO BANYUWANGI PELAJARAN 2024/2025', 'Terverifikasi', NULL, NULL),
(945, '2025', '2020506001', 'Ahmad Fauzi', 'L', 13, 'jangkar', 'Situbondo', 'Jawa Timur', 'TEKNIK PEMBESARAN UDANG VANAME (Litopeneus vannamei) DENGAN SISTEM KOLAM BULAT UDANG VANAME (KODAME) DI TAMBAK UD. ZULFISH DESA BUGEMAN KECAMATAN BANYUPUTIH KABUPATEN SITUBONDO', '', NULL, NULL),
(946, '2025', '20200301029', 'M. Maulana Faturistiawan', 'L', 8, 'Kalipuro', 'Banyuwangi', 'Jawa Timur', 'PERAN KEPEMIMPINAN KEPALA SEKOLAH DALAM PENGEMBANGAN KARAKTER RELIGIUS DI SMA NEGERI 1 ASEMBAGUS SITUBONDO', 'Terverifikasi', NULL, NULL),
(947, '2025', '2021302039', 'JAIZATUT DINIYAH', 'P', 9, 'Tambak', 'Gresik', 'Jawa Timur', 'PEMBUATAN MEDIA PUZZLE MUFRODAT UNTUK MENINGKATKAN PENGUASAAN KOSAKATA BAHASA ARAB KELAS VII MTS HUSNUL-ISLAM BAWEAN GRESIK TAHUN AJARAN 2024-2025', 'Terverifikasi', NULL, NULL),
(948, '2025', '2022506023', 'SAHRUL AFTHONI', 'L', 13, 'Bangsalsari', 'Jember', 'Jawa Timur', 'TEKNIK PEMBENIHAN IKAN LELE (Clarias gariepinus )  DI BALAI PELATIHAN DAN PENYULUHAN PERIKANAN (BPPP) BANYUWANGI', 'Terverifikasi', NULL, NULL),
(949, '2025', '2020704005', 'FANDI AHMAD', 'L', 21, 'Kalipuro', 'Banyuwangi', 'Jawa Timur', 'IMPLEMENTATION OF LEARNING ENGLISH WITH TV SERIES CHANNEL ON STUDENTS’ VOCABULARY AT MTS NEGRI 1 BANYUWANGI', 'Terverifikasi', NULL, NULL),
(950, '2025', '2021301019', 'MAHRUS SHALEH', 'L', 8, 'BANYUPUTIH', 'KAB. SITUBONDO', 'JAWA TIMUR', 'PENGEMBANGAN KOMPETENSI PEDAGOGIK GURU PENDIDIKAN AGAMA ISLAM (PAI) DI SMPN 1 BANYUPUTIH TAHUN PELAJARAN 2024/2025', 'Terverifikasi', NULL, NULL),
(951, '2025', '2021203012', 'LUTFI KHAERUL FIKRI', 'L', 3, 'LINGSAR', 'KAB. LOMBOK BARAT', 'Nusa Tenggara Barat', '\"EFEKTIVITAS PEMBERDAYAAN EKONOMI PESANTREN DALAM PERSPEKTIF EKONOMI ISLAM', NULL, NULL, NULL),
(952, '2025', '2021304001', 'Abdurrahman Al Kayyis', 'L', 11, 'Panji', 'Situbondo', 'Jawa Timur', '\"INTEGRASI PEMIKIRAN KOMPUTASI DAN PEMBELAJARAN MATEMATIKA DALAM KURIKULUM SEKOLAH MENENGAH ATAS ', NULL, NULL, NULL),
(953, '2025', '2021302054', 'SRIWAHYUNI', 'P', 9, 'Wonosari', 'Bondowoso', 'Jawa Timur', 'pengembangan media pocket book untuk meningkatkan maharah al-kalam siswa kelas viii mtSn 01 bondowoso', 'Terverifikasi', NULL, NULL),
(954, '2025', '202140239', 'NUR WAHYUNI', 'P', 6, 'Negara', 'Jembrana', 'Bali', 'hubungan efikasi diri dengan prokrastinasi akademik siswa man 2 jembrana', 'Terverifikasi', NULL, NULL),
(955, '2025', '2021503009', 'ANZORI', 'L', 17, 'MAESAN', 'KAB. BONDOWOSO', 'JAWA TIMUR', 'SISTEM INFORMASI PENERIMAAN PESERTA DIDIK BARU DAN ADMINISTRASI PROGRAM PAKET PADA PKBM KARTINI MAESAN BONDOWOSO', 'Terverifikasi', NULL, NULL),
(956, '2025', '2021501015', 'M. FAHRIZAL RAHMAN', 'L', 15, 'KERITANG', 'KAB. INDRAGIRI HILIR', 'Riau', 'SISTEM DETEKSI DAN MONITORING ALKOHOL PADA NAFAS PENGEMUDI TRAVEL BERBASIS INTERNET OF THINGS (IoT)', 'Terverifikasi', NULL, NULL),
(957, '2025', '2021501001', 'ABDUL GAFUR', 'L', 15, 'PUJER', 'KAB. BONDOWOSO', 'JAWA TIMUR', 'RANCANG BANGUN SMART VILLAGE BERBASIS MIKROKONTROLER PENERANGAN DAN KEAMANAN DESA', 'Terverifikasi', NULL, NULL),
(958, '2025', '2021503014', 'FIKRI FEBRIAN', 'L', 17, 'MATAN HILIR SELATAN', 'KAB. KETAPANG', 'KALIMANTAN BARAT', 'STUDI KOMPARATIF METODE NAÏVE BAYES CLASSIFIER DAN SUPPORT VECTOR MACHINE DALAM ANALISIS SENTIMEN PUBLIK TERHADAP PROGRAM MAKAN SIANG GRATIS PRABOWO-GIBRAN', 'Terverifikasi', NULL, NULL),
(959, '2025', '202140216', 'MUHAMAD RIZKI', 'L', 6, 'PRAYA', 'KAB. LOMBOK TENGAH', 'NTB', 'BIMBINGAN PRIBADI DALAM MEMBENTUK OPTIMISME NARAPIDANA DI LEMBAGA PEMASYARAKATAN KELAS II A BANYUWANGI', '', NULL, NULL),
(960, '2025', '2021203053', 'SITI ZAENAB', 'P', 3, 'Sempol', 'Bondowoso', 'Jawa Timur', '\"analisis kualitas pelayanan dalam  meningkatkan  kepuasan konsumen', NULL, NULL, NULL),
(961, '2025', '2021703062', 'ULIL AULIA', 'P', 18, 'Taman Kerocok', 'Bondowoso', 'Jawa Timur', 'analisis perhitungan harga pokok produksi dengan metode job order costing sebagai dasar penentuan harga jual pada “meubel alda jaya bondowoso”', 'Terverifikasi', NULL, NULL),
(962, '2025', '2021204059', 'DITANUR SAFITRI', 'P', 5, 'Melaya', 'Jembrana', 'Bali', '\"Implementasi Strategi Pelayanan Islami Dalam', NULL, NULL, NULL),
(963, '2025', '2021703039', 'ISTRI ENDAH ISLAMIYATI', 'P', 18, 'Balung', 'Jember', 'Jawa Timur', 'analisis biaya produksi dalam menentukan harga jual tusuk sate pada desa curahlele kec balung kab jember', '', NULL, NULL),
(964, '2025', '2021201059', 'PUTRI INDA SAFITRI', 'P', 2, 'Bekasi Selatan', 'Kota Bekasi', 'Jawa Barat', '\"praktik sewa-menyewa mobil perspektif hukum islam', NULL, NULL, NULL),
(965, '2025', '2021301070', 'YUNUS ABBAS', 'L', 8, 'PANARUKAN', 'KAB. SITUBONDO', 'JAWA TIMUR', 'UPAYA GURU PAI DALAM PEMBENTUKAN NILAI-NILAI PENDIDIKAN KARAKTER ASPEK RELIGIUS SISWA KELAS XI A2 di SMAN 1 ASEMBAGUS TAHUN PELAJARAN 2024/2025', '', NULL, NULL),
(966, '2025', '2021204011', 'INDRA MAULANA', 'L', 5, 'JANGKAR', 'Situbondo', 'Jawa Timur', 'ANALISIS STRATEGI PEMASARAN SYARI’AH DALAM MENINGKATKAN VOLUME PENJUALAN DI KEDAI SIRING JANGKAR SITUBONDO', 'Terverifikasi', NULL, NULL),
(967, '2025', '2021302057', 'ULFI RIZA AZIZAH', 'P', 9, 'Blimbingsari', 'Banyuwangi', 'Jawa Timur', 'PEMBUATAN MEDIA KARTU TALK OR DARE UNTUK MENINGKATKAN MAHARAH KALAM  SISWA KELAS VII MADRASAH TSANAWIYAH NEGERI 10 BANYUWANGI TAHUN PELAJARAN 2024/2025', 'Terverifikasi', NULL, NULL),
(968, '2025', '2021113006', 'ILA MARDHATILLAH', 'P', 8, 'Ra\'as', 'Sumenep', 'Jawa Timur', 'implementasi metode permainan tebak kata dalam meningkatkan minat belajar siswa pada mata pelajaran pai di sma negeri 1 panji situbondo', 'Terverifikasi', NULL, NULL),
(969, '2025', '2021702042', 'MANDA SARI', 'P', 19, 'Praya', 'Lombok Tengah', 'NTB', 'Analisis Yuridis Pertanggungjawaban Kepala Desa Terhadap Pengelolaaan Dana Desa Berdasarkan Undang Undang No. 6 Tahun 2014 Tentang Desa(Studi Kasus Desa Kedungwaras, Kec. Modo, Kab. Lamongan)', '', NULL, NULL),
(970, '2025', '2021302015', 'M.Faqih Haekal A', 'L', 9, 'Narmada', 'Lombok barat', 'NTB', '\"استخدام طريقة القياس بوسيلة الفيديو املتحركة لتحسني فهم علم الصرف لدى', NULL, NULL, NULL),
(971, '2025', '2021301107', 'INDAH AYU FEBRIYANTI', 'P', 8, 'Bangsalsari', 'Jember', 'Jawa Timur', 'Penerapan Metode Explicit Instruction Untuk Meningkatkan Kemampuan Membaca Al-Qur’An Siswi Qira’Atuna Jilid v Di Asrama Al-Khuzaimah Pondok Pesantren Salafiyah Syafi’Iyah Sukorejo Situbondo', '', NULL, NULL),
(972, '2025', '2021302038', 'HASANAH INAYAH', 'P', 9, 'Teluk Batang', 'Kayong Utara', 'Kalimantan Barat', 'Pengembangan Buku Saku Mufrodat Muhawwaroh Dalam Meningkatkan Maharatul Kalam Marhalah      Mubtadi` Pondok     Pesantren Nurul Hasani Kayong Utara Tahun Ajaran 2024 - 2025', 'Terverifikasi', NULL, NULL),
(973, '2025', '2021203049', 'RUAINAH', 'P', 3, 'Sangkapura', 'Gresik', 'Jawa Timur', 'Pengaruh Pengendalian Persediaan Bahan Baku Dan Kualitas Produk Terhadap Minat Beli Konsumen(Studi Kasus Kth Mustika Aren Bawean Gresik)', 'Terverifikasi', NULL, NULL),
(974, '2025', '2021201092', 'ZAINIYAH', 'P', 2, 'Curahdami', 'Bondowoso', 'Jawa Timur', 'Tinjauan Hukum Islam Terhadap Praktik Akad Qardhul Hasan Di Bmt Nu Cabang Tegalampel Bondowoso', 'Terverifikasi', NULL, NULL),
(975, '2025', '2019204014', 'ANDRE MEIDY KURNIAWAN', 'L', 5, 'Gayam', 'Sumenep', 'Jawa Timur', 'STRATEGI MANAJEMEN PEMASARAN DALAM MENINGKATKAN PROFIT PENJUALAN PRODUK', 'Terverifikasi', NULL, NULL),
(976, '2025', '2021502011', 'AHMED ARIFI H.R', 'L', 16, 'GAYAM', 'KAB. SUMENEP', 'Jawa Timur', 'SISTEM PENDUKUNG KEPUTUSAN PENERIMA BPNT (BANTUAN PANGAN NON TUNAI) MENGGUNAKAN METODE (SIMPLE MULTI-ATTRIBUTE RATING TECHNIQUE) SMART DI DESA PANCOR GAYAM SUMENEP', 'Terverifikasi', NULL, NULL),
(977, '2025', '2021203001', 'AHMAD FAWAID', 'L', 3, 'RA\'AS', 'KAB. SUMENEP', 'Jawa Timur', 'ANALISIS STRATEGI PEMASARAN SYARIAH DALAM MEMPERTAHANKAN LOYALITAS PELANGGAN PADA HOME INDUSTY BERIAL DI DESA LATENG KECAMATAN BANYUWANGI KABUPATEN BANYUWANGI.', 'Terverifikasi', NULL, NULL),
(978, '2025', '2021503044', 'ROHIQIM MAHTUM', 'L', 17, 'KALIPURO', 'KAB. BANYUWANGI', 'JAWA TIMUR', 'RANCANG BANGUN SISTEM INFORMASI PRESENSI  BERBASIS GEOLOKASI DAN PENGGAJIAN UNTUK GURU DAN KARYAWAN DI MADRASAH ALIYAH AS’ADIYAH MENENG KETAPANG BANYUWANGI', 'Terverifikasi', NULL, NULL),
(979, '2025', '2021702039', 'BASTIA HAFILATUNNISA', 'P', 19, 'Jangkar', 'SITUBONDO', 'Jawa Timur', 'Analisis Yuridis Penerapan Diversi Terhadap Anak Yang Berhadapan Dengan Hukum', 'Terverifikasi', NULL, NULL),
(980, '2025', '2021302034', 'FELA FEBRIANTI', 'P', 9, 'Mumbulsari', 'Jember', 'Jawa Timur', 'Pengembangan Media Pembelajaran Hiwar Bahasa Arab Berbasis Canva Dalam Meningkatkan Motivasi Belajar Siswa Mts Darul Hikmah Tamansari Mumbulsari Jember Tahun 2024-2025', 'Terverifikasi', NULL, NULL),
(981, '2025', '2021301133', 'SITI NUR ARIFAH', 'P', 8, 'Tapen', 'Bondowoso', 'Jawa Timur', 'Implementasi Penilaian Autentik (Authentic Assesment) dalam Kurikulum Merdeka BelajarPada Pembelajaran PAI Di Smp Negeri 1 Tapen Bondowoso  Tahun Pelajaran 2024/2025', 'Terverifikasi', NULL, NULL),
(982, '2025', '2021502028', 'LUKMAN HAKIM ARDIANSYAH', 'L', 16, 'RAMAN UTARA', 'KAB. LAMPUNG TIMUR', 'Lampung', 'RANCANG BANGUN SISTEM INFORMASI PEMESANAN PAKET WISATA BERBASIS WEB UNTUK OPTIMALISASI LAYANAN BANYUWANGI TRANS WISATA', 'Terverifikasi', NULL, NULL),
(983, '2025', '2021501032', 'FATIHATIN NURIL ZAMANI', 'P', 15, 'Kapongan', 'Situbondo', 'Jawa Timur', 'Rancang Bangun Sistem Pembersih Saluran Air Berbasis Internet Of Things  (Iot)  Pada Perumahan Dawuhan Cluster Kabupaten Situbondo', 'Terverifikasi', NULL, NULL),
(984, '2025', '2021703034', 'MAS ULUL HIKMAH', 'P', 18, 'Bungatan', 'Situbondo', 'Jawa Timur', 'Analisis Prosedur Pemberian Pembiayaan Berdasarkan Prinsip 5c Dan 7p Di Bmt Ugt Capem Besuki Kabupaten Situbondo', 'Terverifikasi', NULL, NULL),
(985, '2025', '2021503005', 'AHMAD WAHYU F.', 'L', 17, 'KALISAT', 'KAB. JEMBER', 'JAWA TIMUR', 'RANCANG BANGUN SISTEM INFORMASI MARKETING PERUMAHAN RENGGANIS RESIDENCE BERBASIS WEB PT. RENGGANIS RAYHAN WIJAYA', 'Terverifikasi', NULL, NULL),
(986, '2025', '2021302033', 'FARHATUL LAILA', 'P', 9, 'Semboro', 'Jember', 'Jawa Timur', 'Pengembangan Media Ular Tangga Untuk Meningkatkan Maharah Al-Kalam Di Kelas I’dadi Asrama Bahasa Arab Pusat Putri Pondok Pesantren Salafiyah Syafi’iyah Sukorejo Situbondo Tahun Ajaran 2024-2025', 'Terverifikasi', NULL, NULL),
(987, '2025', '2021202063', 'NUR AFIFATUL LUTFIYAH', 'P', 4, 'Silo', 'Jember', 'Jawa Timur', 'Perspektif Madzhab Syafi’iyah Terhadap Nafkah Istri Narapidana (Studi Kasus Di Lembaga Pemasyarakatan Kelas II B Bondowoso)', 'Terverifikasi', NULL, NULL),
(988, '2025', '2021501009', 'BADRUS SHOLEH', 'L', 15, 'JAMBESARI DARUS SHOLAH', 'KAB. BONDOWOSO', 'JAWA TIMUR', 'SISTEM SMART CALLING DI WARUNG TELEPON ASRAMA MA’HADUL QUR’AN PONDOK PESANTREN SALAFIYAH SYAFI’IYAH SUKOREJO', 'Terverifikasi', NULL, NULL),
(989, '2025', '2021704027', 'SAFINATUL AULIA', 'P', 21, 'Banyuputih', 'Situbondo', 'Jawa Timur', 'Exploring The Effect Of Digital Dictogloss In Enhancing Listening Skill Among Tenth Grade Students at SMK Ibnu Sina Genteng', 'Terverifikasi', NULL, NULL),
(990, '2025', '2021205018', 'AMALIA FITRA FADILA', 'P', 1, 'Perapen', 'Lombok Tengah', 'NTB', 'Analisis Dupont System Guna Mengukur Kesehatan Perbankan Syariah Yang Terdaftar Pada Bursa Efek Indonesia (Bei)', 'Terverifikasi', NULL, NULL),
(991, '2025', '202010771', 'NUR KHOIRUL MUBIN', 'L', 15, 'Purwodadi', 'Grobogan', 'Jawa Tengah', '\"PROTOTYPE MONITORING PEMANTAUAN', NULL, NULL, NULL),
(992, '2025', '2021503053', 'ZAINUL ARIFIN ALWI. A', 'L', 17, 'WONGSOREJO', 'KAB. BANYUWANGI', 'Jawa Timur', 'PROGRAM APLIKASI PUBLIC SPEAKING BERBASIS WEBSITE DENGAN TEKNOLOGI MERN (Studi Kasus: Frasa Id)', '', NULL, NULL),
(993, '2025', '2020201014', 'MUHAMMAD FEBRIYANTO', 'L', 2, 'Jangkar', 'Situbondo', 'Jawa Timur', '“PERSPEKTIF HUKUM EKONOMI SYARIAH TERHADAP PENETAPAN HARGA JUAL BELI POHON BONSAI (Studi Kasus Di Desa Curah Kalak Kecamatan Jangkar Kabupaten Situbondo)”', 'Terverifikasi', NULL, NULL),
(994, '2025', '2021302027', 'TAHA RIDWAN', 'L', 9, 'RA\'AS', 'KAB. SUMENEP', 'JAWA TIMUR', 'PENGEMBANGAN BAHAN AJAR KITAB KUNING  MATAN AL-IZZI ((متن العزى BERBASIS SKEMA DALAM MENINGKATKAN PEMAHAMAN ILMU SHOROF SANTRI  KELAS 2 MADRASAH DINIYAH I’DADIYYAH PONDOK PESANTREN SALAFIYAH SYAFI’IYAH SUKOREJO SITUBONDO', 'Terverifikasi', NULL, NULL),
(995, '2025', '202140121', 'M. NOFAL SYAFI\'I', 'L', 7, 'KOTA WAIKABUBAK', 'KAB. SUMBA BARAT', 'NTT', 'STRATEGI DAKWAH NASIONAL TV BANYUWANGI PADA PROGRAM KULTUM RAMADAN MELALUI MEDIA YOUTUBE', 'Terverifikasi', NULL, NULL),
(996, '2025', '202140118', 'KHAIRUL  ABADI', 'L', 7, 'BANYUPUTIH', 'KAB. SITUBONDO', 'Jawa Timur', 'STRATEGI DAKWAH JAMIYAH RUQYAH ASWAJA JOKO SAMUDRO DALAM MENGUATKAN AJARAN AQIDAH AHLUSS SUNNAH WAL JAMA’AH DI KABUPATEN BANYUWANGI', 'Terverifikasi', NULL, NULL),
(997, '2025', '2021302052', 'SITI AISAH', 'P', 9, 'Kalipuro', 'Banyuwangi', 'Jawa Timur', 'إختلاف النحاة بين الحال والمفعول المطلق في كتاب ألفية إبن مالك', '', NULL, NULL),
(998, '2025', '2020502003', 'ABIL HASAN', 'L', 16, 'Jangkar', 'Situbondo', 'Jawa Timur', 'SISTEM INFORMASI PENANGANAN PERKARA PADA LEMBAGA BANTUAN HUKUM (LBH) MITRA SANTRI BERBASIS WEB DAN NOTIFIKASI WHATSAPP', '', NULL, NULL),
(999, '2025', '2022506010', 'MOH. SHAHIBUSSA\' DAIKI', 'L', 13, 'Banyuputih', 'Situbondo', 'Jawa Timur', '\"TEKNIK PEMBESARAN IKAN LELE DUMBO ( Clarias gariepinus)', NULL, NULL, NULL),
(1000, '2025', '2021502012', 'FAHRILLAH', 'L', 16, 'JANGKAR', 'KAB. SITUBONDO', 'Jawa Timur', 'RANCANG BANGUN SISTEM INFORMASI PENJADWALAN MATA PELAJARAN BERBASIS WEB DAN NOTIFIKASI WA DI MADRASAH IBTIDA’IYAH AL-FALAH PESANGGRAHAN', '', NULL, NULL),
(1001, '2025', '2021203010', 'HELMI ANUGRAHA', 'L', 3, 'JANAPRIA', 'KAB. LOMBOK TENGAH', 'Nusa Tenggara Barat', '\"ANALISIS PENGELOLAAN TABUNGAN MUDHARABAH (TABAH) DALAM MENARIK MINAT MASYARAKAT ', NULL, NULL, NULL),
(1002, '2025', '202140250', 'VIVIN YULIANA', 'P', 6, 'Arjasa', 'Sumenep', 'Jawa Timur', 'Efektivitas Konseling Qurani Pada Pola Hidup Sehat Santri Pondok Pesantren Salafiyah Syafi’Iyah Sukorejo', 'Terverifikasi', NULL, NULL),
(1003, '2025', '2021301082', 'KHAIRA NOVIKA WIDIANTI', 'P', 8, 'Gayam', 'Sumenep', 'Jawa Timur', 'Meningkatkan Keaktifan Dan Hasil Belajar Siswa Melalui Metode Think Pair Share Pada Mata Pelajaran Pai Kelas X1 Di Sman 1 Gayam Sumenep Tahun Pelajaran 2024/2025', 'Terverifikasi', NULL, NULL),
(1004, '2025', '2021204098', 'SITI MASLUHATUL HAFIDZAH', 'P', 5, 'Arjasa', 'Situbondo', 'Jawa Timur', 'Strategi Manajemen Organisasi  Dalam Meningkatkan  Kinerja Karyawan  Di Kspps Bmt Nu Jawa Timur Cabang Arjasa Situbondo', 'Terverifikasi', NULL, NULL),
(1005, '2025', '2021303044', 'NUR HALILATUT TOYYIBAH', 'P', 10, 'Asembagus', 'Situbondo', 'Jawa Timur', 'Penerapan Kegiatan Permainan Engklek Buah Untuk Meningkatkan Kognitif Anak Kelompok B Tk Al-Hasan Mojosari Asembagus Situbondo Tahun Ajaran 2024/2025', 'Terverifikasi', NULL, NULL),
(1006, '2025', '2021702036', 'FITRI KHOLIFATUL KHASANAH', 'P', 19, 'Wonosari', 'Bondowoso', '', 'Tinjauan Yuridis Pemberian Batasan Luas Tahah Hak Guna Usaha Berdasarkan Undang-Undang Nomor. 05 Tahun 1960 Tentang Pokok-Pokok Agraria', '', NULL, NULL),
(1007, '2025', '2021302030', 'ANA AGUSTIN', 'P', 9, 'Kalipuro', 'Banyuwangi', 'Jawa Timur', 'Pembuatan Media Tangga Pintar Untuk Meningkatkan    Kemampuan Siswa Dalam Memahami Mufrodat Bahasa Arab Kelas Ii Mi Darut Tarbiyah Kalipuro Banyuwangi', 'Terverifikasi', NULL, NULL),
(1008, '2025', '2021302055', 'SUMIATI', 'P', 9, 'Teluk Batang', 'Kayong Utara', 'Kal-Bar', 'Pembuatan Buku Saku Mufradat Bahasa Arab Untuk Meningkatkan Penguasaan Kosa Kata Bahasa Arab Di Madrasah Ibtida’iyah Nu Islamiyah Asembagus Situbondo Tahun Ajaran 2024/2025', 'Terverifikasi', NULL, NULL),
(1009, '2025', '2021302032', 'DEWI AYU ERLANA', 'P', 9, 'Praya Timur', 'Lombok Tengah', 'NTB', 'Pengembangan Bahan Ajar I’Rob Al Arabiyah Pada Contoh-Contoh Kalimat Dalam Kitab Matan Al Jurumiyah Untuk Meningkatkan Maharah Qira’Ah Santri Ponpes Riyadlul Mukhlisin Praya Timur Lombok Tengah', 'Terverifikasi', NULL, NULL),
(1010, '2025', '2021301080', 'IKLILAH MUKARRAMAH', 'P', 8, 'Banyuputih', 'Situbondo', 'Jawa Timur', 'Pengaruh Kompetensi Kepribadian Guru Pai Terhadap  Moral Siswa Di Sma Negeri 1 Situbondo Tahun Ajaran 2024/2025', 'Terverifikasi', NULL, NULL),
(1011, '2025', '2021301095', 'Fharadhiesty Abdianty P.', 'P', 8, 'Tapen', 'Bondowoso', 'Jawa Timur', 'Penerapan Afirmasi Positif Metode Hypnoteching Untuk Meningkatkan Motivasi Belajar Siswa Pada Mata Pelajaran PAI BP Di Kelas XI 7 Di SMA Negri 2 Situbondo Tahun Pelajaran 2024-2025', '', NULL, NULL),
(1012, '2025', '2021301030', 'MUHAMMAD FU\'ADI', 'L', 8, 'ASEMBAGUS', 'KAB. SITUBONDO', 'Jawa Timur', '\"PENERAPAN PENDEKATAN PEMBELAJARAN BERBASIS PERMAINAN GAME-BASED-LEARNING PADA MATA PELAJARAN PAI UNTUK MENINGKATKAN MOTIVASI BELAJAR SISWA KELAS IV DI SDN 2 WRINGIN ANOM KECAMATAN ASEMBAGUS', NULL, NULL, NULL),
(1013, '2025', '2021204065', 'FANIA ANDRIANI', 'P', 5, 'Sumber Jambe', 'Jember', 'Jawa Timur', 'Strategi Pemasaran Syari’ah Dalam Meningkatkan Minat Beli Konsumen (Studi Kasus Toko Murni Desa Jambearum Kec Sumberjambe Kabupaten Jember)', 'Terverifikasi', NULL, NULL),
(1014, '2025', '2021703019', 'ANGGI SITI MELITA P.S', 'P', 18, 'Kalisat', 'Jember', 'Jawa Timur', 'Analisis Anggaran Penjualan Dan Profitabilitas Pada Ud. J. Citra Grosir Kecamatan Kalisat Jember', 'Terverifikasi', NULL, NULL),
(1015, '2025', '2021202048', 'MAULIDA DWI SAFITRI', 'P', 4, 'Kencong', 'Jember', 'Jawa Timur', '\"Perspektif Hukum Islam Terhadap Contra Legem Dalam Permohonan Dispensasi Kawin', NULL, NULL, NULL);
INSERT INTO `mahasiswas` (`id`, `lulusan`, `nim`, `nama`, `jk`, `prodi_id`, `kecamatan`, `kabupaten`, `provinsi`, `tugas_akhir`, `verifikasi`, `created_at`, `updated_at`) VALUES
(1016, '2025', '2021301067', 'WARIS ALIMAN', 'L', 8, 'CERMEE', 'KAB. BONDOWOSO', 'Jawa Timur', 'Penerapan Metode Diskusi Untuk Meningkatkan Kemampuan Berpikir Kritis Siswa Kelas IX Mapel Al-Qur\'an Hadist di MTS Ibrahimy Cermee Bondowoso Tapel 2024-2025', 'Terverifikasi', NULL, NULL),
(1017, '2025', '2021202008', 'FATHUR RAHMAN', 'L', 4, 'KOPANG', 'Lombok Tengah', 'NTB', '\"TRADISI BESEANG DALAM PERCERAIAN PERSPEKTIF HUKUM ISLAM', NULL, NULL, NULL),
(1018, '2025', '202140233', 'IQRAUL KHALIFAH', 'P', 6, 'Arjasa', 'Sumenep', 'Jawa Timur', 'Layanan Konseling Behavioral Dengan Teknik Self-Management Dalam Meningkatkan Motivasi Belajar Siswa Kelas Vii Smpi Al-Afkar Di Kabupaten Sumenep', 'Terverifikasi', NULL, NULL),
(1019, '2025', '202120542', 'AISYAH AMELIA HASNA', 'P', 5, 'BANYUPUTIH', 'SITUBONDO', 'JAWA TIMUR', 'ANALISIS STRATEGI PENGEMBANGAN SUMBER DAYA INSANI DALAM MENINGKATKAN ETOS KERJA KARYAWAN (STUDI KASUS PT. BENIH CITRA ASIA)', 'Terverifikasi', NULL, NULL),
(1020, '2025', '202140226', 'FAULINA NUR AISYAH', 'P', 6, 'Arjasa', 'Sumenep', 'Jawa Timur', 'Pendekatan Konseling Keluarga Untuk Meningkatkan Kematangan Emosional  Remaja Korban Broken Home Di Desa Pajanangger Kecamatan Arjasa Kabupaten Sumenep', 'Terverifikasi', NULL, NULL),
(1021, '2025', '2021701014', 'AISYAH NANDA AUDINA', 'P', 20, 'WONOSARI', 'BONDOWOSO', '', 'Hubungan Sibling Rivalry Dengan Perilaku Asertif Pada Remaja Di Sma Negeri Plus Sukowono Jember', '', NULL, NULL),
(1022, '2025', '2021301062', 'Sarikul Akbar', 'L', 8, 'Batang Asai', 'Sarolangun', 'Jambi', 'IMPLEMENTASI MODEL PEMBELAJARAN INKUIRI DALAM MENINGKATKAN KUALITAS BELAJAR SISWA PADA MATA PELAJARAN PENDIDIKAN AGAMA ISLAM DIKELAS VIII SMPN 26 SAROLANGUN JAMBI TAHUN PELAJARAN 2024-2025', 'Terverifikasi', NULL, NULL),
(1023, '2025', '2020703016', 'ANISA ULKARIMAH SUWANDI', 'P', 18, 'Kalibaru', 'Banyuwangi', 'Jawa Timur', 'Pengaruh Implementasi Ketegasan Sanksi Pajak (Tax Punishment) Dan Tingkat Pendapatan Terhadap Kepatuhan Wajib Pajak Bumi Dan Bangunan (Wpbb) (Studi Kasus Kantor Desa Sitemu Pemalang Jawa Tengah)', '', NULL, NULL),
(1024, '2025', '2021.204.091', 'PUTRI ISKIANTIKA A.', 'P', 5, 'Silo', 'Jember', 'Jawa Timur', 'Implementasi Etika Bisnis Islam Dalam Peningkatan Kinerja Karyawan Di Bmt Ugt Nusantara Capem Silo Jember', 'Terverifikasi', NULL, NULL),
(1025, '2025', '2021302037', 'HAIFA RATNA WIYANTI', 'P', 9, 'Panji', 'Situbondo', 'Jawa Timur', '-', '', NULL, NULL),
(1026, '2025', '2021201043', 'DANIATUL MAULA', 'P', 2, 'Sukosari', 'Bondowoso', 'Jawa Timur', 'Perspektif Hukum Islam Terhadap Praktik Pembiayaan Murabahah Di Kspps Bmt Nu Cabang Sukosari Bondowoso', 'Terverifikasi', NULL, NULL),
(1027, '2025', '2021205021', 'SALAMAH', 'P', 1, 'Pragaan', 'Sumenep', 'Jawa Timur', 'Analisis Kinerja Keuangan Ditinjau Dari Rentabilitas, Solvabilitas Dan Likuiditas  (Studi Kasus Di Pt. Pegadaian (Persero) Pusat)', 'Terverifikasi', NULL, NULL),
(1028, '2025', '2021205008', 'FARIDA INTAN CAHYA', 'P', 1, 'Angsana', 'Tanah Bumbu', 'Kal-Sel', 'Analisis Pinjaman Multiguna Berkah (Rahn) Dalam Meningkatkan Produktivitas Usaha Mikro Di Lingkungan Bmt Nu Cabang Wonosari Bondowoso', 'Terverifikasi', NULL, NULL),
(1029, '2025', '2021301031', 'MABRUZAH', 'P', 8, 'Banyuputih', 'Situbondo', 'Jawa Timur', 'Pengalaman Guru Pendidikan Agama Islam Dalam Implementasi Kurikulum Merdeka Di Sma Ibrahimy 2 Sukorejo Situbondo', 'Terverifikasi', NULL, NULL),
(1030, '2025', '2021701029', 'IBANA FAIZATUL WIDAD', 'P', 20, 'Banyuputih', 'Situbondo', 'Jawa Timur', 'Hubungan Pola Asuh Otoriter Dan Pola Asuh Permisif Terhadap Perilaku Agresif Remaja Di Sman Plus Sukowono Jember', 'Terverifikasi', NULL, NULL),
(1031, '2025', '2021205019', 'NAILA ARIFAH', 'P', 1, 'Melaya', 'Jembrana', 'Bali', 'Analisis Perlakuan Akuntansi Persediaan Barang Dagang Berdasarkan Psak No. 14 Di Basmalah Cabang Melaya', 'Terverifikasi', NULL, NULL),
(1032, '2025', '2021704023', 'KHOIRUL ABROR', 'L', 21, 'LECES', 'KAB. PROBOLINGGO', 'JAWA TIMUR', 'A QUANTITATIVE STUDY ON THE EFFECTIVENESS OF FLIPPED CLASSROOM TECHNIQUES IN ENGLISH READING SKILL AT ENGLISH DORMITORY SALAFIYAH SYAFI\'IYAH ISLAMIC BOARDING SCHOOL', 'Terverifikasi', NULL, NULL),
(1033, '2025', '2021301158', 'ELVIRA DWI NOVIANTI', 'P', 8, 'PANARUKAN', 'SITUBONDO', 'Jawa Timur', 'IMPLEMENTASI JAM PEMBELAJARAN KE-0 DALAM PENGUATAN KARAKTER KEDISIPLINAN SISWA DI MTs. NEGERI 1 SITUBONDO TAHUN PELAJARAN 2024/2025', 'Terverifikasi', NULL, NULL),
(1034, '2025', '20200301122', 'SOFIA DWI RAHMATILLAH', 'P', 8, 'Panarukan', 'Situbondo', 'Jawa Timur', 'PENERAPAN METODE PEMBELAJARAN EVERYONE IS A TEACHER HERE UNTUK MENINGKATKAN HASIL BELAJAR PESERTA DIDIK KELAS IX PADA MATA PELAJARAN PAI DI SMPN 1 ATAP KANDANG TAHUN PELAJARAN 2024/2025', 'Terverifikasi', NULL, NULL),
(1035, '2025', '2021202039', 'DAYYINAH', 'P', 4, 'Lenteng', 'Sumenep', 'Jawa Timur', '\"Perspektif Hukum Islam Terhadap Tradisi ', NULL, NULL, NULL),
(1036, '2025', '2021303016', 'NARISYA AL FADILLA DWI S.', 'P', 10, 'Rogojampi', 'Banyuwangi', 'Jawa Timur', 'Upaya Meningkatkan Motorik Kasar Anak Melalui Kegiatan Senam Irama Pada Kelompok A Di Tk Muslimat Nu Aliyan Tahun Pelajaran 2024-2025', 'Terverifikasi', NULL, NULL),
(1037, '2025', '2021704034', 'AMINATUL MARDIYAH', 'P', 21, 'Jangkar', 'Situbondo', 'Jawa Timur', 'The Effect Of Prezi Multimedia Based Mind Mapping On Students’  Vocabulary', 'Terverifikasi', NULL, NULL),
(1038, '2025', '2021301139', 'WARDATUL HASANAH', 'P', 8, 'Arjasa', 'Sumenep', 'Jawa Timur', 'Keteladanan Ketua Kamar Dalam Membangun  Karakter Disiplin Santri Di Asrama Tahfidzul Putri No 06 Qur’an Putri No 06 Pondok Pesantren Salafiyah Syafi’iyah Sukorejo Situbondo', 'Terverifikasi', NULL, NULL),
(1039, '2025', '2020203071', 'ZURRIYATUN AINI', 'P', 3, 'Kopang', 'Lombok Tengah', 'NTB', 'Strategi Pemasaran Syari\'ah Terhadap Penerapan Akad Rahn Pada Pembiayaan Gadai Emas Dalam Peningkatan Minat Nasabah (Studi Kasus di KSPPS BMTNU Jawa Timur Cabang Grujugan Bondowoso)', 'Terverifikasi', NULL, NULL),
(1040, '2025', '2021703038', 'DEVITA YULIASTINA', 'P', 18, 'Arjasa', 'Situbondo', 'Jawa Timur', 'Penerapan Standar Akuntansi Keuangan Entitas Mikro Kecil Menengah (Emkm) Pada Umkm Mia Collection Desa Ketowan Kecamatan Arjasa Situbondo', '', NULL, NULL),
(1041, '2025', '2021301105', 'IKA NADIFATUL LAILI', 'P', 8, 'Songgon', 'Banyuwangi', 'Jawa Timur', 'Kompetensi Profesional Guru Pai Terhadap Peningkatan Hasil Belajar Siswa Kelas X Di Smk Al- Azhar Sempu Banyuwangi Tahun Pelajaran 2024/2025', 'Terverifikasi', NULL, NULL),
(1042, '2025', '2021702041', 'LURI NIKMATUL KAROMAH', 'P', 19, 'Wongsorejo', 'Banyuwangi', 'Jawa Timur', '\"Konsep Pertimbangan Hakim Dalam Pembuktian ', NULL, NULL, NULL),
(1043, '2025', '2021304013', 'PUJA DUWI LESTARI', 'P', 11, 'MUNCAR', 'BANYUWANGI', '', 'Efektivitas Penggunaan Media Pembelajaran Matematika Berbasis Teknologi Artificial Intelligence (Ai) Untuk Meningkatkan Hasil Belajar Siswa Sma: Systematic Literature Review (Slr)', '', NULL, NULL),
(1044, '2025', '2021601030', 'WANDA MUKAMMILATUZZAHRO', 'P', 23, 'JATIBANTENG', 'SITUBONDO', '', '\"AKTIVITAS ANTIDIABETES EKSTRAK ETANOL 96% KULIT ', NULL, NULL, NULL),
(1045, '2025', '2021601008', 'FEBYATUL FATONAH', 'P', 23, 'Talango', 'Sumenep', 'Jawa Timur', '\"PENGARUH VARIASI DAN KOMBINASI PEG 6000 DAN PVP K30 TERHADAP LAJU DISOLUSI IBUPROFEN MENGGUNAKAN', NULL, NULL, NULL),
(1046, '2025', '2021601022', 'RISZA FITRI NUR UMAMI', 'P', 23, 'WONGSOREJO', 'BANYUWANGI', 'JAWA TIMUR', 'AKTIVITAS ANTIBAKTERI RANTING DAN DAUN KAYU MANIS (Cinnamomum cassia (L.) J.Presl) DAN (Cinnamomum burmannii (Nees & T.Nees) Blume)', 'Terverifikasi', NULL, NULL),
(1047, '2025', '2021601026', 'SINTA WAHYU NINGTIYAS', 'P', 23, 'SEMPOL', 'BONDOWOSO', 'JAWA TIMUR', 'KOMPARASI ANTIOKSIDAN DAUN DAN RANTING EKSTRAK ETANOL Cryptocarya laevigata', 'Terverifikasi', NULL, NULL),
(1048, '2025', '2021601007', 'FATINATUL LAILIYAH', 'P', 23, 'BANYUPUTIH', 'SITUBONDO', 'JAWA TIMUR', '\"AKTIVITAS TOKSISITAS AKUT EKSTRAK ETANOL 96% RIMPANG LEMPUYANG GAJAH (Zingiber zerumbet) TERHADAP MENCIT JANTAN GALUR BALB/c DENGAN METODE', NULL, NULL, NULL),
(1049, '2025', '2021301151', 'MUHAMMAD NAUFAL', 'L', 8, 'MANGARAN', 'KAB. SITUBONDO', 'Jawa Timur', 'PEMBENTUKAN KARAKTER TOLERANSI DAN RELIGIUS DALAM MENGATASI BULLYING DI PONDOK PESANTREN SALAFIYAH ALASY’ARIYAH TAHUN PELAJARAN 2024/2025', '', NULL, NULL),
(1050, '2025', '2021601005', 'CINDY AULIA QORIYANA', 'P', 23, 'ARJASA', 'SITUBONDO', 'JAWA TIMUR', '\"IDENTIFIKASI PENGGUNAAN OBAT GOLONGAN STATIN PADA PASIEN KARDIOVASKULAR DI RUMAH SAKIT ELIZABETH SITUBONDO TAHUN 2024 DENGAN METODE ', NULL, NULL, NULL),
(1051, '2025', '2021601003', 'AZIMATUL MA\'UNA', 'P', 23, 'CERMEE', 'BONDOWOSO', 'JAWA TIMUR', 'KARAKTERISTIK FISIKOKIMIA DAN AKTIVITAS ANTIINFLAMASI EMULGEL EKSTRAK ETANOL DAUN WIDURI (Calotropis gigantea) DENGAN VARIASI EMULGATOR (TWEEN 80 DAN SPAN 80)', 'Terverifikasi', NULL, NULL),
(1052, '2025', '2021601002', 'A\'YUN QORINA', 'P', 23, 'KALIBARU', 'BANYUWANGI', 'JAWA TIMUR', '\"STUDI INTERAKSI DAN EVALUASI PENGGUNAAN ANTIBIOTIK PADA PASIEN PNEUMONIA DI INSTALASI RAWAT INAP ', NULL, NULL, NULL),
(1053, '2025', '2021601011', 'HILDA DWI RAHMA WATI', 'P', 23, 'Kedopok', 'Probolinggo', 'Jawa Timur', 'AKTIVITAS ANALGESIK EKSTRAK ETANOL 96% BUNGA KERTAS (Bougainvillea spectabilis) TERHADAP MENCIT JANTAN GALUR BALB/c', 'Terverifikasi', NULL, NULL),
(1054, '2025', '2021601017', 'NUR HAFIFAH', 'P', 23, 'Sumberwringin', 'Bondowoso', 'Jawa Timur', '\"KARAKTERISTIK DAN UJI STABILITAS FORMULA EMULGEL', NULL, NULL, NULL),
(1055, '2025', '2021601001', 'ANISATUL FAIZA', 'P', 23, 'KEBAYORAN LAMA', 'KOTA ADM. JAKARTA SELATAN', 'DKI JAKARTA', '\"ANALISIS EFEKTIVITAS BIAYA (AEB) PENGGUNAAN KOMBINASI ', NULL, NULL, NULL),
(1056, '2025', '2021601006', 'DURROTUL QOMARIAH', 'P', 23, 'Panji', 'Situbondo', 'Jawa Timur', '\"KARAKTERISTIK FISIKOKIMIA DAN AKTIVITAS ANTIHIPERKOLESTEROLEMIA SIRUP EKSTRAK ETANOL ', NULL, NULL, NULL),
(1057, '2025', '2021601004', 'AZIZATUL HOVIVIAH', 'P', 23, 'JENGGAWAH', 'JEMBER', '', 'VALIDASI METODE DAN ANALISIS BISPHENOL A PADA SUMBER AIR MINUM SANTRI DAN DEPOT AIR MINUM ISI ULANG DI DAERAH PONDOK PESANTREN “X” MENGGUNAKAN HPLC', 'Terverifikasi', NULL, NULL),
(1058, '2025', '2021601023', 'SAYYIDATUN KHOTIJAH', 'P', 23, 'CERMEE', 'BONDOWOSO', '', 'UJI TOKSISITAS AKUT FORMULA HERBAL ANTIINSOMNIA SECARA IN VIVO', 'Terverifikasi', NULL, NULL),
(1059, '2025', '2021601010', 'HAFIZATURRAHMAH', 'P', 23, 'Praya Barat Daya', 'Lombok Tengah', 'NTB', '\"ANALISA PERBANDINGAN KADAR HEMOGLOBIN PASIEN GAGAL GINJAL KRONIK (GGK) YANG MENJALANI TERAPI ', NULL, NULL, NULL),
(1060, '2025', '2021601029', 'WAHYU NIAR W.P.S', 'P', 23, 'Kuta Utara', 'Badung', 'Bali', '\"AKTIVITAS TONIKUM EKSTRAK ETANOL 96% BUNGA KAMBOJA PUTIH (Plumeria rubra) TERHADAP MENCIT JANTAN', NULL, NULL, NULL),
(1061, '2025', '2021301116', 'MUYASSARATUL JANNAH', 'P', 8, 'Wonosari', 'Bondowoso', 'Jawa Timur', 'Implementasi Metode Silat (Sehari Lima Ayat) Dalam Meningkatkan Kemampuan Membaca Al-Qur’an Siswa Kelas Vii Di Smp Nu 09 Bondowoso', 'Terverifikasi', NULL, NULL),
(1062, '2025', '2021301078', 'FAIQOTUL LUTVIYA', 'P', 8, 'Asembagus', 'Situbondo', 'Jawa Timur', 'Penerapan Model Cooperative Learning Tipe Inside Outside Circle Pada Pembelajaran Al-Qur’an Hadist Untuk Meningkatkan Pemahaman Siswa Kelas Vii Di Mts Negeri 3 Situbondo Tahun Pelajaran 2024-2025', 'Terverifikasi', NULL, NULL),
(1063, '2025', '2020202130', 'SYAIFIL QODIR', 'L', 4, 'ASEMBAGUS', 'SITUBONDO', 'JAWA TIMUR', 'TINJAUAN HUKUM ISLAM TERHADAP LEGALITAS MUT’AH DALAM KESEPAKATAN HASIL MEDIASI DI PENGADILAN AGAMA NOMOR PERKARA 373/PDT.G.2024.PA.PROB” (STUDI KASUS DI PENGADILAN AGAMA PROBOLINGGO).', 'Terverifikasi', NULL, NULL),
(1064, '2025', '202140223', 'ANISA SAFITRI', 'P', 6, 'Gerokgak', 'Buleleng', 'Bali', 'Bimbingan Kelompok Melalui Teknik Problem Solving Untuk Meningkatkan Resiliensi Warga Binaan Perempuan Di Lembaga Pemasyarakatan Kelas Ii B Singaraja Bali', 'Terverifikasi', NULL, NULL),
(1065, '2025', '202140227', 'FETI ROSA ANGGRAINI', 'P', 6, 'Arjasa', 'Sumenep', 'Jawa Timur', 'Implementasi Bimbingan Pada Calon Pengantin Di KUA Kecamatan Arjasa Kabupaten Sumenep', 'Terverifikasi', NULL, NULL),
(1066, '2025', '202140236', 'LILIS NUR INDAH SARI', 'P', 6, 'Arjasa', 'Sumenep', 'Jawa Timur', 'Layanan Konseling Qur’ani Dalam Meningkatkan Empati Pada Remaja Di Desa Arjasa Kecamatan Arjasa Kabupaten Sumenep', 'Terverifikasi', NULL, NULL),
(1067, '2025', '2021301050', 'Muhammad Ali Karomah', 'L', 8, 'Jambesari Darus Sholah', 'Bondowoso', 'Jawa Timur', 'PEMBELAJARAN PAI MATERI AQIDAH MELALUI METODE TADABBUR ALAM DI SEKOLAH DASAR ALAM INSAN CENDEKIA NANGKAAN BONDOWOSO TAHUN PELAJARAN 2024/2025', 'Terverifikasi', NULL, NULL),
(1068, '2025', '2021704009', 'AMELIA EKA HERTIANANDA', 'P', 21, 'Wonosari', 'Bondowoso', 'Jawa Timur', 'The Implementation Of Video Blogging In Self-Confident Practice Of Public Speaking In Language Boarding House Salafiyah Syafi’Iyah Sukorejo Situbondo', 'Terverifikasi', NULL, NULL),
(1069, '2025', '2021601016', 'NING ANISA FADILAH', 'P', 23, 'JATIBANTENG', 'SITUBONDO', '', 'OPTIMASI FORMULA KRIM IBUPROFEN DENGAN VARIASI TWEEN  80 DAN SPAN 80 SEBAGAI EMULGATOR', '', NULL, NULL),
(1070, '2025', '2021601014', 'JAMILATUR RIZQIYAH', 'P', 23, 'Banyuputih', 'Situbondo', 'Jawa Timur', '\"AKTIVITAS TONIKUM EKSTRAK ETANOL 96% DAUN KERSEN (Muntingia calabura) TERHADAP MENCIT JANTAN', NULL, NULL, NULL),
(1071, '2025', '2021601020', 'RIF\'ATIL BAROROH', 'P', 23, 'Kapongan', 'Situbondo', 'Jawa Timur', 'UJI AKTIVI TAS ANTIOKSIDAN INFUSA DAUN JAMBU AIR (Syzygium aqueum) MUDA DAN TUA DENGAN MENGGUNAKAN METODE 1,1-diphenyl-2-picrylhydrazyl (DPPH)', 'Terverifikasi', NULL, NULL),
(1072, '2025', '2021601021', 'RISKA ISNATUN NISA', 'P', 23, 'Sukadana', 'Kayong Utara', 'Kalimantan Barat', 'FORMULASI DAN EVALUASI COOLING PATCH TIPE MATRIKS EKSTRAK DAUN KEMBANG SEPATU (Hibiscus rosa-sinensis L)', '', NULL, NULL),
(1073, '2025', '2021601013', 'IFATUL MAULIA', 'P', 23, 'Botolinggo', 'Bondowoso', 'Jawa Timur', 'SINTESIS DAN IDENTIFIKASI GUGUS FUNGSI SENYAWA KITOSAN MENGGUNAKAN KULIT UDANG VANNAMEI (Litopenaeus vannamei) SEBAGAI ADSORBEN BISPHENOL-A (BPA)', '', NULL, NULL),
(1074, '2025', '2021601012', 'ICHA MERY ANDANI', 'P', 23, 'KENDIT', 'SITUBONDO', '', '\"AKTIVITAS ANTIBAKTERI EKSTRAK DAUN KAYU MANIS (Cinnamomum chinensis) TERHADAP Staphylococcus ', NULL, NULL, NULL),
(1075, '2025', '2021601024', 'SEKAR AYU AZZARA P.', 'P', 23, 'Banyuwangi', 'Banyuwangi', 'Jawa Timur', 'AKTIVITAS ANTIBAKTERI DAN ANTIFUNGI EKSTRAK DAUN Litsea mappacea Blume DAN Litsea elliptica Blume SECARA IN VITRO', 'Terverifikasi', NULL, NULL),
(1076, '2025', '2021601028', 'Vita Adi Latna', 'P', 23, 'Banyuputih', 'Situbondo', 'Jawa Timur', '\"ANALISIS TINGKAT KEPATUHAN SANTRI PUTRI TERHADAP PENGGUNAAN OBAT ANTIJAMUR UNTUK DERMATITIS', NULL, NULL, NULL),
(1077, '2025', '2021601025', 'SELVIA AULIA AGUSTIN', 'P', 23, 'ASEMBAGUS', 'SITUBONDO', '', 'PENGEMBANGAN INDIKATOR BERBASIS KERTAS DALAM ANALISIS BISPHENOL-A MENGGUNAKAN POLIMER KITOSAN', 'Terverifikasi', NULL, NULL),
(1078, '2025', '2021601009', 'HADFINA AFZA', 'P', 23, 'Gerokgak', 'Buleleng', 'Bali', '\"SINTESIS KITOSAN DENGAN METODE PEMANASAN', NULL, NULL, NULL),
(1079, '2025', '2021301102', 'HIKMATUL KAMILA', 'P', 8, 'Bebandem', 'Karangasem', 'Bali', '\"Implementasi Model Flipped Classroom Untuk Meningkatkan Pemahaman Siswa Kelas Vii Pada Mata Pelajaran Al-Qur’An Hadis Di Mts. Ma’Arif Bebandem Karangasem Bali ', NULL, NULL, NULL),
(1080, '2025', '2021301074', 'ANTIKA MAULIDDIA', 'P', 8, 'Banyuputih', 'Situbondo', 'Jawa Timur', '“Meningkatkan Kemampuan Berpikir Kritis Kelas Xi Pada Materi Akidah Akhlak Melalui Pembelajaran Berbasis Masalah Di Madrasah Aliyah Miftahul Arifin Ranurejo, Banyuputih Situbondo Tahun 2025”.', '', NULL, NULL),
(1081, '2025', '202140259', 'YUNI FITRIANI', 'P', 6, 'Arjasa', 'Sumenep', 'Jawa Timur', 'Pendekatan Konseling Behavioral Dengan Teknik Self-Management Untuk Menurunkan Perilaku Membolos Siswa Komuter Di Lembaga Mts Bustanul Huffadz Sumbernangka Kangean Sumenep', 'Terverifikasi', NULL, NULL),
(1082, '2025', '2021204037', 'Muhammad Qomaruz Zaman', 'L', 5, 'Kapongan', 'Situbondo', 'Jawa Timur', 'OPTIMALISASI MANAJEMEN PRODUKSI SYARIAH DALAM MENINGKATKAN PRODUKTIVITAS DEODORAN TAWAS SPRAY DI UD TAWAS BERKAH KAPONGAN SITUBONDO', 'Terverifikasi', NULL, NULL),
(1083, '2025', '2022506019', 'MUHAMMAD HOZIN HILMI', 'L', 13, 'BANGSAL SARI', 'JEMBER', 'JAWA TIMUR', 'TEKNIK PEMBENIHAN IKAN NILA SRIKANDI (Oreochromis aureus x niloticus) SECARA ALAMI DI BALAI PELATIHAN DAN PENYULUHAN PERIKANAN (BPPP) BANYUWANGI', 'Terverifikasi', NULL, NULL),
(1084, '2025', '202140244', 'ROHMATUS SALIMAH', 'P', 6, 'Socah', 'Bangkalan', 'Jawa Timur', 'Makna Layanan Bimbingan Karier Bagi Santri Di Pondok Pesantren Salafiyah Syafi’iyah Sukorejo', 'Terverifikasi', NULL, NULL),
(1085, '2025', '2021301057', 'RAHMAD KRIZE', 'L', 8, 'BALIKPAPAN UTARA', 'KOTA BALIKPAPAN', 'Kalimantan Timur', 'KOMPETENSI KEPRIBADIAN GURU PAI DALAM MENINGKATKAN KEDISIPLINAN SISWA MTsN 3 SITUBONDO TAHUN PELAJARAN 2024/2025', 'Terverifikasi', NULL, NULL),
(1086, '2025', '2021701005', 'Khulda Alfin Shofiyulloh', 'L', 20, 'Muncar', 'Banyuwangi', 'Jawa Timur', 'HUBUNGAN REGULASI DIRI DAN RELIGIUSITAS DENGAN RESILIENSI PADA SANTRI TAHFIDZ AL-QUR’AN PONDOK PESANTREN SALAFIYAH SYAFI’IYAH SUKOREJO SITUBONDO', 'Terverifikasi', NULL, NULL),
(1087, '2025', '2020303019', 'NURUL HIDAYATI', 'P', 10, 'Batukliang Utara', 'Lombok Tengah', 'NTB', 'Implementasi Projek Penguatan Profil Pelajar Pancasila Dalam Meningkatkan Karakter Anak Kelompok B Di Tk Islam Nurul Anshar Situbondo', 'Terverifikasi', NULL, NULL),
(1088, '2025', '2021301058', 'Refandi', 'L', 8, 'Arjasa', 'Sumenep', 'Jawa Timur', 'STRATEGI GURU PAI DALAM MEMBENTUK SIKAP SPIRITUAL DAN SOSIAL SISWA DI KELAS VIIA MTs NU ISLAMIYAH ASEMBAGUS SITUBONDO TAHUN PELAJARAN 2024/2025', '', NULL, NULL),
(1089, '2025', '2021303002', 'ARINA MUFIDAH', 'P', 10, 'Sangkapura', 'Gresik', 'Jawa Timur', 'Meningkatkan Kemampuan Kreativitas Berfikir Anak Melalui Kegiatan Menceritakan Gambar Kelompok B Di Tk Muslimat Nu Kebun Telukdalam Sangkapura Bawean Gresik Tahun Pelajaran 2024/2025', 'Terverifikasi', NULL, NULL),
(1090, '2025', '2021301121', 'NUR KARIMAH', 'P', 8, 'Blimbingsari', 'Banyuwangi', 'Jawa Timur', '\"Implementasi Metode Takrir Untuk Melatih Kosentrasi Menghafal Santri Tahfidzul Qur’An Putri Di Pondok Pesantren Salafiyah Syafi’Iyah Sukorejo Situbondo', NULL, NULL, NULL),
(1091, '2025', '202140242', 'REGINA PUTRI AULIA', 'P', 6, 'Penarukan', 'Situbondo', 'Jawa Timur', 'Implementasi Konseling Sufistik Dengan Teknik Tazkiyah An-Nafs Dalam Menanggulangi Perilaku Agresif Verbal Remaja Santri', '', NULL, NULL),
(1092, '2025', '2021702038', 'KAMILIYA VIRDAUSYAH', 'P', 19, 'Pujer', 'Bondowoso', 'Jawa Timur', 'Pertanggung Jawaban Pidana Kejahatan Pemilu Terhadap Surat Suara Tidak Sah Berdasarkan Undang Undang Nomor.7 Tahun 2017 Tentang Pemilu (Studi Putusan No.54/Pid.Sus/2019/Pn.Tab)', '', NULL, NULL),
(1093, '2025', '2021703021', 'ANISAH', 'P', 18, 'Arjasa', 'Situbondo', 'Jawa Timur', 'Implementasi Isak 35 Dalam Penyusunan Laporan Keuangan Di Kb Nurul Huda Fatayat Nu Arjasa Situbondo', 'Terverifikasi', NULL, NULL),
(1094, '2025', '2021702062', 'ZAHROTUL HASANAH', 'P', 19, 'Kamal', 'Bangkalan', 'Jawa Timur', 'Dinamika Masa Jabatan Kepala Desa Dalam Sistem Pemerintahan Indonesia: Kajian Konstitusional', 'Terverifikasi', NULL, NULL),
(1095, '2025', '2021703064', 'WARDATUL HASANAH', 'P', 18, 'Ra\'as', 'Sumenep', 'Jawa Timur', 'Analisis Peran Akuntansi Manjemen Dalam Menyusun Anggaran Penjualan Pada Toko Dina Abil Mart Sukorejo Situbondo', 'Terverifikasi', NULL, NULL),
(1096, '2025', '2021502075', 'UBEITUL MALTUF', 'L', 16, 'Jangkar', 'Situbondo', 'Jawa Timur', 'RANCANG BANGUN APLIKASI SISTEM INFORMASI SILATUROHIM ALUMNI DI (SDN 4 SOPET) BERBASIS WEBSITE', '', NULL, NULL),
(1097, '2025', '2021204067', 'GALUH CITRA ALFA AINUN', 'P', 5, 'KALIBARU', '', '', '\"Strategi Manajemen Produksi Islami Dalam Meningkatkan Kualitas Produk ', NULL, NULL, NULL),
(1098, '2025', '2021301113', 'MAULINDA INSIROTUR R.', 'P', 8, 'Semboro', 'Jember', 'Jawa Timur', 'School Religius Culture (Src) Dalam Menumbuhkan Karakter Religius Siswa Sma Negeri 1 Panji Tahun Pelajaran 2024/2025', 'Terverifikasi', NULL, NULL),
(1099, '2025', '20200301020', 'Hemyar', 'L', 8, 'Raas', 'Sumenep', 'Jawa Timur', '\"PENERAPAN METODE PEBELAJARAN STUDENT TEAM ACHIEVEMENT DIVISION (STAD) UNTUK MENINGKATKAN MINAT BELAJAR SISWA PADA MATA PELAJARAN AKIDAH AKHLAK DI MTs AL ITTIHAD KETUPAT RAAS', NULL, NULL, NULL),
(1100, '2025', '2021301091', 'DEVINTA ANGGI PRAMESTI', 'P', 8, 'Banyuputih', 'Situbondo', 'Jawa Timur', '\"PENERAPAN METODE TALAQQI UNTUK PENINGKATAN ', NULL, NULL, NULL),
(1101, '2025', '2021201051', 'SYARIEFATUL FADIELLAH .FARID', 'P', 2, 'Grujugan', 'Bondowoso', 'Jawa Timur', 'Perspektif Hukum  Ekonomi Syariah Terhadap Transaksi Jual Beli Genteng Sistem Borongan (Studi Kasus Di Desa Koncer Kidul Kecamatan Koncer Kabupaten Bondowoso)', '', NULL, NULL),
(1102, '2025', '202140254', 'MAHTUMATUS SHOLIHAH', 'P', 6, 'Wonosari', 'Bondowoso', 'Jawa Timur', 'Konseling Kelompok Dengan Teknik Goal Setting  Untuk Meningkatkan Motivasi Belajar Siswa Kelas Xi-A Smk Miftahul Ulum Tumpeng Kecamatan Wonosari Kabupaten Bondowoso', 'Terverifikasi', NULL, NULL),
(1103, '2025', '2021202036', 'AISYAH LUSIANA', 'P', 4, 'Kota Sumenep', 'Sumenep', 'Jawa Timur', 'Perspektif Hukum Islam Terhadap Tradisi Temang Manten (Studi Kasus Desa Gedang-Gedang Kecamatan Batuputih Kabupaten Sumenep)', 'Terverifikasi', NULL, NULL),
(1104, '2025', '2021205009', 'HOSWATUN DILAWATI', 'P', 1, 'Sumberwringin', 'Bondowoso', 'Jawa Timur', 'Analisis Pembiayaan Modal Kerja Pada Produk Kur Mikro Berdasarkan Psak No 105 Di Bank Syariah Indonesia Kcp Basuki Rahmat Situbondo', 'Terverifikasi', NULL, NULL),
(1105, '2025', '2021205007', 'FAKHIROTUL AFIFAH', 'P', 1, 'Wonopringgo', 'Pekalongan', 'Jawa Tengah', 'Pengaruh Pengetahuan Etika, Religiusitas Terhadap Persepsi Etis Mahasiswa Akuntansi Syariah (Studi Kasus Pada Mahasiswa Akuntansi Syariah Universitas Ibrahimy Situbondo)', 'Terverifikasi', NULL, NULL),
(1106, '2025', '2021201039', 'QURROTUL AINI', 'P', 2, 'Duren Sawit', 'ADM. Jakarta Timur', 'DKI Jakarta', 'Tinjauan Hukum Islam Terhadap Praktik Perlombaan Memancing Berhadiah  Di Kolam Pancing Ikan Gitik (Studi Kasus Di Desa Gitik, Kecamatan Rogojampi, Kabupaten Banyuwangi)', 'Terverifikasi', NULL, NULL),
(1107, '2025', '2021201049', 'IMROATUL JAMILAH', 'P', 2, 'Wongsorejo', 'Banyuwangi', 'Jawa Timur', 'Tinjauan Hukum Islam Terhadap Sistem Upah Lembur Bagi Tenaga Kerja Di Cv Keong Mas Permai Desa Bengkak Kecamatan Wongsorejo Kabupaten Banyuwangi', 'Terverifikasi', NULL, NULL),
(1108, '2025', '2021302048', 'NURAINI', 'P', 9, 'Sukadana', 'Kayong Utara', 'Kal-Bar', 'Pembuatan Media Pembelajaran Piramida Susun Untuk Meningkatkan Kosa Kata Bahasa Arab Kelas X Madrasah Aliyah Negeri 1 Kayong Utara Kalimantan Barat Tahun Ajaran 2024/2025', 'Terverifikasi', NULL, NULL),
(1109, '2025', '2021205029', 'ZULFA TALIZA', 'P', 1, 'Bungatan', 'Situbondo', 'Jawa Timur', 'Analisis Pengendalian Internal Atas Penyaluran Bantuan Sosial Berdasarkan Coso (Studi Kasus Pada Desa Selowogo Bungatan Situbondo)', 'Terverifikasi', NULL, NULL),
(1110, '2025', '2021201037', 'IKRIMATUS SHOLEHA', 'P', 2, 'Kalipuro', 'Banyuwangi', 'Jawa Timur', 'Sistem Penetapan Harga Pada Proses Penjualan Kopi Secara Borongan Perspektif Hukum Islam (Studi Kasus Di Desa Suko Gombengsari Kecamatan Kalipuro Kabupaten Banyuwangi)', '', NULL, NULL),
(1111, '2025', '2021702047', 'NADYA ALIFIA HAFSOH', 'P', 19, 'Kalipuro', 'Banyuwangi', 'Jawa Timur', 'Analisis Yuridis Pertimbangan Hakim Terhadap Korban Eksploitasi Seksual Dalam Tindak Pidana Perdagangan Orang  (Studi Putusan No.1824/Pid. Sus/Pn Mdn)', '', NULL, NULL),
(1112, '2025', '2021703029', 'IFFA SAADATUL MUJAHIDAH', 'P', 18, 'Arjasa', 'Sumenep', 'Jawa Timur', 'Analisis Harga Pokok Produksi Dalam Menentukan Harga Jual (Studi Kasus Cv. 916 Semoga Berkah Kangean)', '', NULL, NULL),
(1113, '2025', '2021704030', 'SYAFIQOH HIDAYAT', 'P', 21, 'Kendit', 'Situbondo', 'Jawa Timur', 'The Effect Of Bingo Game On Students’ Vocabulary Mastery', 'Terverifikasi', NULL, NULL),
(1114, '2025', '2020503024', 'MOH. DANIL ABDILLAH', 'L', 17, 'Wonosari', 'Bondowoso', 'Jawa Timur', 'E-MONITORING HAFALAN ALFIYAH IBNU MALIK BERBASIS WEB DI MTS SALAFIYAH SYAFI’IYAH PUTRA', 'Terverifikasi', NULL, NULL),
(1115, '2025', '2021301018', 'FAISAL TAMIM', 'L', 8, 'ARJASA', 'KAB. SUMENEP', 'Jawa Timur', 'UPAYA GURU PAI DALAM MEMBENTUK KARAKTER PRIBADI YANG ISLAMI SISWA SMP ISLAM ZAINUL HUDA DUKO LAOK ARJASA KANGEAN TAHUN PELAJARAN 2024/2025', 'Terverifikasi', NULL, NULL),
(1116, '2025', '2021204041', 'Nadifur Rohman', 'L', 5, 'Bungatan', 'Situbondo', 'Jawa Timur', '\"IMPLEMENTASI ETIKA BISNIS ISLAM', NULL, NULL, NULL),
(1117, '2025', '2021204051', 'ALVIN LAILA', 'P', 5, 'Jambesari', 'Bondowoso', 'Jawa Timur', '\"Analisis Strategi Promosi Syariah Dalam Meningkatkan Minat Beli Konsumen', NULL, NULL, NULL),
(1118, '2025', '2021205039', 'LABIBATUL MUTI\'AH', 'P', 1, 'Ajung', 'Jember', 'Jawa Timur', 'Analisis Pelaporan Keuangan Pondok Pesantren Berdasarkan Pedoman Akuntansi Pesantren (Studi Kasus Yayasan Pondok Pesantren Madinatul Ulum 2 Jember)', 'Terverifikasi', NULL, NULL),
(1119, '2025', '2020602021', 'SHERLY AGUSTINA', 'P', 22, '', '', '', 'Pengaruh Kombinasi Senam Kegel dan Terapi Benson Terhadap Penurunan Nyeri Dismenorea Pada Remaja Putri Di Asrama Ma\'had aly Pondok Pesantren Salafiyah Syafi\'iyah Sukorejo Situbondo', '', NULL, NULL),
(1120, '2025', '2021603012', 'HILMIA HIDAYATI PUTRI', 'P', 22, 'PRAYA', 'LOMBOK TENGAH', '', 'Pemberian EsKrim \"PIAKU\" Terhadap Kadar Hemoglobin Pada Remaja Putri Anemia Di Madrasah Ta\'hiliyah Pondok Pesantren Salafiyah Syafi\'iyah Sukorejo Situbondo 2025', '', NULL, NULL),
(1121, '2025', '2021502073', 'ANGELI DWIYANTI NUR\'AZIZAH', 'P', 16, 'Banyuwangi', 'Banyuwangi', 'Jawa Timur', 'Sistem Informasi Pendataan Inventory Dan Penjualan Barang Pada Asosiasi Umkm Umami Banyuwangi', 'Terverifikasi', NULL, NULL),
(1122, '2025', '2021703044', 'NUR HOLILA', 'P', 18, 'Arjasa', 'Situbondo', 'Jawa TImur', 'Analisis Manajemen Produksi Dalam Meningkatkan Penjualan Pada Usaha Selep Kopi Di Ud. Taman Jaya Gwc (Golden Wood Coffee) Taman Dadar Situbondo', 'Terverifikasi', NULL, NULL),
(1123, '2025', '2021603031', 'SITI NURHIDAYATI', 'P', 22, 'SUKOWONO', 'JEMBER', '', '\"PEMBERIAN KOMBINASI PUDING DAUN KELOR', NULL, NULL, NULL),
(1124, '2025', '2021603032', 'SRI WAHYUNI', 'P', 22, 'SEMPOL', 'BONDOWOSO', '', '\"PEMBERIAN MINUMAN BOBA SARI KACANG HIJAU (BOSAKA) TERHADAP KADAR HEMOGLOBIN PADA REMAJA SANTRI PUTRI ANEMIA DI MADRASAH TA’HILIYAH PONDOK PESANTREN', NULL, NULL, NULL),
(1125, '2025', '2021603034', 'UKHTUL IFA', 'P', 22, 'KANGAYAN', 'SUMENEP', '', 'PERBEDAAN PEMBERIAN  REBUSAN DAUN KELOR (Moringa oleifera) DAN REBUSAN DAUN KERSEN (Muntingia calabura L) TERHADAP NILAI KADAR GULA DARAH PADA REMAJA PUTRI  DI PONDOK PESANTREN DARUL FATWA GEGER KABUPATEN BANGKALAN', '', NULL, NULL),
(1126, '2025', '2021603025', 'NIKMATUL UMMA', 'P', 22, 'KANGAYAN', 'SUMENEP', '', 'PENGARUH PENERAPAN “BuSaPA” (Buku Saku Tanpa Anemia) TERHADAP PENINGKATAN PENGETAHUAN TENTANG ANEMIA PADA REMAJA PUTRI DI PONDOK PESANTREN SALAFIYAH SYAFIIYAH SITUBONDO', '', NULL, NULL),
(1127, '2025', '2021603029', 'SILATURROHMIH', 'P', 22, 'TLOGOSARI', 'BONDOWOSO', '', 'PENGARUH AROMATERAPI MAWAR (Rosa Centifolia) TERHADAP PENURUNAN TINGKAT KECEMASAN PADA IBU HAMIL TRIMESTER III DI WILAYAH KERJA PUSKESMAS TLOGOSARI KABUPATEN BONDOWOSO', '', NULL, NULL),
(1128, '2025', '2021603013', 'IKA LAILATUL F', 'P', 22, 'JANGKAR', 'SITUBONDO', '', '\"EFEK KOMBINASI PEMBERIAN PIJAT OKSITOSIN DAN SHOLAWAT SYIFA’ TERHADAP PENURUNAN TINGKAT KECEMASAN PADA IBU NIFAS DI WILAYAH KERJA PUSKESMAS ', NULL, NULL, NULL),
(1129, '2025', '2021603011', 'HERDYAH MAULY AZZANA BILLAH', 'P', 22, 'SUMBERWRINGIN', 'BONDOWOSO', '', '\"EFEK KOMBINASI EFFLURAGE MASSAGE MENGGUNAKAN LEMONGRASS OIL TERHADAP KELANCARAN ASI DI WILAYAH KERJA PUSKESMAS SUMBER WRINGIN BONDOWOSO ', NULL, NULL, NULL),
(1130, '2025', '2021603033', 'TIASA PUTRI', 'P', 22, 'TELUK BATANG', 'KAYONG UTARA', '', 'EFEK  PENGGUNAAN MEDIA KARTU KUARTET DENGAN   TINGKAT PENGETAHUAN KEPUTIHAN PADA REMAJA PUTRI KELAS XII SMA IBRAHIMY 2 SUKOREJO SITUBONDO JAWA TIMUR TAHUN 2025', '', NULL, NULL),
(1131, '2025', '2021302042', 'MAGHFIROTUN N.H.', 'P', 9, 'Rowokangkung', 'Lumajang', 'Jawa Timur', 'Penyusunan Buku Saku Mufrodat Bahasa Arab Untuk Meningkatkan Maharah Kalam Bagi Siswa Kelas 6 Madrasah Ibtidaiyah Syarifuddin Lumajang Tahun Pelajaran 2024/2025', 'Terverifikasi', NULL, NULL),
(1132, '2025', '2021603018', 'LAILA HAFIDHATUN NISA\'', 'P', 22, 'BINAKAL', 'BONDOWOSO', '', 'PEMBERIAN SMOOTHIES BIJI LABU KUNING DAN KURMA (BILAKUMA) TERHADAP KADAR HEMOGLOBIN PADA REMAJA PUTRI ANEMIA DI MA’HAD ALY ILMU FIQIH WAUSULIHI PONDOK PESANTREN SALAFIYAH SYAFI’IYAH SUKOREJO SITUBONDO TAHUN 2025', '', NULL, NULL),
(1133, '2025', '2021603008', 'HALIMATUS SYA\'DIAH', 'P', 22, 'KLABANG', 'BONDOWOSO', '', 'EFEK PEMBERIAN SNACK BAR “UBIKA” TERHADAP NILAI KADAR GULA DARAH PADA REMAJA PUTRI PP. MANBAUL ULUM KABUPATEN BONDOWOSO', '', NULL, NULL),
(1134, '2025', '2021301111', 'KHILDA SHAFIRA', 'P', 8, 'Gerokgak', 'Buleleng', 'Bali', 'Implementasi Kegiatan Osiqy ( Orientasi Santri Enqy) Dalam Penanaman Nilai-Nilai Spiritual Pada Santri Baru Di Asrama Nurul Qoni’ Pondok  Pesantren Salafiyah Safiiyah Sukorejo', 'Terverifikasi', NULL, NULL),
(1135, '2025', '2021603014', 'ISMAWATI DEWI', 'P', 22, 'KWANYAR', 'BANGKALAN', '', '\"PENGARUH PEMBERIAN MINUMAN BTS (bunga telang serai) TERHADAP NILAI KADAR GULA DALAM DARAH UNTUK MENCEGAH TERJADINYA DIABETES MELLITUS PADA REMAJA ', NULL, NULL, NULL),
(1136, '2025', '2021302049', 'NURIYATUL SYAMSIYAH', 'P', 9, 'Grujugan', 'Bondowoso', 'Jawa Timur', 'Pengembangan Media Pembelajaran Bahasa Arab  Berbasis Pocket Mufrodat Untuk Meningkatkan Penguasaan Mufrodat Pada Siswa Kelas Viii Mtsn 1 Situbondo Tahun Pelajaran 2024-2025', 'Terverifikasi', NULL, NULL),
(1137, '2025', '2021603016', 'IVADATUL MARDIAH', 'P', 22, 'ARJASA', 'JEMBER', '', 'PENGARUH PEMBERIAN MP-ASI KERUPUK TULANG IKAN LELE (Clarias Sp.0202120948S PROKA terhadap PENINGKATAN BERAT BADAN BALITA STUNTING DI WILAYAH KERJA PUSKESMAS ARJASA JEMBER', '', NULL, NULL),
(1138, '2025', '2021204055', 'AULIA AZIZAH', 'P', 5, 'Kediri', 'Lombok Barat', 'NTB', 'Pengaruh Harga, Promosi, Dan Pelayanan Terhadap Keputusan Pembelian Di Cv. Grand Hero Praya Lombok Tengah Ntb', 'Terverifikasi', NULL, NULL),
(1139, '2025', '202140211', 'M. FARIHAN AL PARISI', 'L', 6, 'PRAYA', 'KAB. LOMBOK TENGAH', 'Nusa Tenggara Barat', 'PENGARUH KONSELING KONSELING FOCUSED BRIEF THERAPY (SFBT) TERHADAP PENINGKATAN KEMATANGAN EMOSI SISWA KELAS XI SMAN 3 PRAYA KABUPATEN LOMBOK TENGAH', '', NULL, NULL),
(1140, '2025', '2022506022', 'BAYU MAULANA ISHAK', 'L', 13, 'BANYUWANGI', 'BANYUWANGI', 'Jawa Timur', 'TEKNIK PEMBESARAN IKAN LELE DUMBO (CLARIAS GARIEPINUS) DI KOLAM BUNDAR DENGAN SISTEM PROBIOTIK DI BALAI PELATIHAN DAN PENYULUHAN PERIKANAN (BPPP) BANGSRING BANYUWANGI', 'Terverifikasi', NULL, NULL),
(1141, '2025', '2021603019', 'LIA MARDIANI', 'P', 22, 'WAWAY KARYA', 'LAMPUNG TIMUR', '', 'EFEK VIDEO EDUKASI PENCEGAHAN ANEMIA PADA IBU HAMIL (PAP-BUMIL) TERHADAP TINGKAT PENGETAHUAN IBU HAMIL TRIMESTER I DI WILAYAH KERJA PUSKESMAS ASEMBAGUS', '', NULL, NULL),
(1142, '2025', '2021603024', 'NIKMATUL MAULA RIZKA', 'P', 22, 'BELIK', 'PEMALANG', '', 'EFEK KOMBINASI BIRTHBALL DAN AROMATERAPI LAVENDER TERHADAP PENURUNAN TINGKAT KECEMASAN IBU HAMIL TRIMESTER III DI WILAYAH KERJA PUSKESMAS BELIK PEMALANG', 'Terverifikasi', NULL, NULL),
(1143, '2025', '2021603021', 'MAULIDINA VINA ANNISA', 'P', 22, 'BONDOWOSO', 'BONDOWOSO', '', 'Efek pemberian terapi warna (Chromatherapy) dan murottal Al-Quran terhadap tingkat kecemasan pada remaja kelas XII SMA Ibrahimy 2 Pondok Pesantren Salafiyah Syafi’iyah Sukorejo Situbondo Tahun 2025', '', NULL, NULL),
(1144, '2025', '2021603020', 'MARIANA', 'P', 22, 'BATUKLIANG UTARA', 'LOMBOK TENGAH', '', '\"EFEK PEMBERIAN CHAMOMILE ESSENTIAL OIL TERHADAP NYERI DISMENORE PRIMER', NULL, NULL, NULL),
(1145, '2025', '2021603003', 'BAIQ INAYATURROHMANI', 'P', 22, 'KOPANG', 'LOMBOK TENGAH', '', 'EFEK PEMBERIAN AROMATERAPI PEPPERMINT TERHADAP PENURUNAN EMESIS GRAVIDARUM PADA  IBU HAMIL TRIMESTER I DI  WILAYAH KERJA PUSKESMAS KAPONGAN SITUBONDO', '', NULL, NULL),
(1146, '2025', '2021603017', 'Khoirunnisak', 'P', 22, 'Bekasi Timur', 'Kota Bekasi', 'Jawa Barat', '\"EFIKASI BRISK WALKING EXERCISE DAN MEDITASI DZIKIR ASMA’UL HUSNA (BWE-DAH) TERHADAPHIPERTENSI PADA WANITA USIA SUBUR DIWILAYAH KERJA PUSKESMAS MODUNG', NULL, NULL, NULL),
(1147, '2025', '2021603036', 'YUSRIANI', 'P', 22, 'KOPANG', 'LOMBOK TENGAH', '', '\"EFEK SENAM TERA DAN SENAM ERGONOMIK TERHADAP PENURUNAN TEKANAN DARAH ', NULL, NULL, NULL),
(1148, '2025', '2021603005', 'DEWI PURNAYANTI', 'P', 22, 'KOPANG', 'LOMBOK TENGAH', '', '\"PENGARUH TERAPI MUROTTAL AL-QUR’AN SURAH AR- RAHMAN TERHADAP TINGKAT KECEMASAN PADA IBU HAMIL TM III DALAM MENGHADAPI PERSALINAN DI WILAYAH KERJA', NULL, NULL, NULL),
(1149, '2025', '2021204019', 'MOH FAIZAL AMIN', 'L', 5, 'Arjasa', 'Sumenep', 'JAWA TIMUR', 'IMPLEMENTASI ETIKA BISNIS ISLAM DALAM MENINGKATKAN MINAT BELI KONSUMEN DI CV. RA. JAYA ARJASA SUMENEP', 'Terverifikasi', NULL, NULL),
(1150, '2025', '2021202029', 'SITI NUR KHOLISAH', 'P', 4, 'Mumbulsari', 'Jember', 'Jawa Timur', '\"Perspektif Hukum Islam Terhadap Hak Asuh Anak Dikarenakan Perceraian Orang Tua', NULL, NULL, NULL),
(1151, '2025', '2021301036', 'M. NASRUL DANIL H.', 'L', 8, 'WONGSOREJO', 'BANYUWANGI', 'Jawa Timur', '\"IMPLEMENTASI P5', NULL, NULL, NULL),
(1152, '2025', '2021603027', 'RUKWANINGSIH', 'P', 22, 'PAMUKAN UTARA', 'KOTABARU', '', 'EFEK PEMBERIAN YOGA BALASANA TERHADAP PENURUNAN NYERI DISMENOREA PADA REMAJA PUTRI DI SMA IBRAHIMY 2 SUKOREJO PONDOK PESANTREN SALAFIYAH SYAFI’IYAH SITUBONDO', '', NULL, NULL),
(1153, '2025', '2021603001', 'AMELIA PUTRI', 'P', 22, 'JAMBESARI DARUS SHOLAH', 'BONDOWOSO', '', '\"PENGARUH PEMBERIAN KOMBINASI SARI KACANG MERAH DAN JAHE MERAH TERHADAP ', NULL, NULL, NULL),
(1154, '2025', '2021204061', 'EKA AULIA KHOIRUNNISA', 'P', 5, 'Grujugan', 'Bondowoso', 'Jawa Timur', 'Implementasi Manajemen Produksi Syari’ah Dalam Upaya Meningkatkan Kualitas Produk Roti (Studi Kasus Toko Roti Bunda Kapongan Situbondo)', 'Terverifikasi', NULL, NULL),
(1155, '2025', '2021203044', 'MILHAYATUL HIKMAH', 'P', 3, 'Praya Tengah', 'Lombok Tengah', 'NTB', 'Implementasi Pelayanan Islami Dalam Meningkatkan Kepuasan Konsumen Di Koperasi UD Insan Tani Desa Kilang Kecamatan Montong Gading, Nusa Tenggara Barat.', 'Terverifikasi', NULL, NULL),
(1156, '2025', '2021201031', 'MAISARA', 'P', 2, 'Gayam', 'Sumenep', 'Jawa Timur', '\"Tinjauan Hukum Islam Terhadap Praktik Hadiah Lomba Balap Merpati', NULL, NULL, NULL),
(1157, '2025', '2021603028', 'SALMATUN NI\'MAH AL MUZAMMIL', 'P', 22, 'KUTA SELATAN', 'BADUNG', '', 'PENGARUH PEMBERIAN KOMBINASI AROMATERAPI MELATI (Jasminum Sambac) DAN PIJAT OKSITOSIN TERHADAP PENINGKATAN PRODUKSI ASI PADA IBU NIFAS DI WILAYAH KERJA PUSKESMAS SONGGON KABUPATEN BANYUWANGI', '', NULL, NULL),
(1158, '2025', '2021603026', 'NURNILA KANDI NIRANTA S.', 'P', 22, 'Batu Ampar', 'Batam', 'Kepulauan Riau', 'TERAPI NON-FARMAKOLOGI DAUN SIRIH TERHADAP KEPUTIHAN PADA WANITA USIA SUBUR: SYSTEMATIC LITERATURE REVIEW TAHUN 2019-2024', '', NULL, NULL),
(1159, '2025', '2021204062', 'ELOK ROFIQA', 'P', 5, 'Nonggunong', 'Sumenep', 'Jawa Timur', '\"Implementasi Etika Bisnis Islam Dalam Meningkatkan Profitabilitas', NULL, NULL, NULL),
(1160, '2025', '2021501034', 'IKA INDAH LESTARI', 'P', 15, 'Kao', 'Halmahera Utara', 'Maluku Utara', 'Prototype Sistem Oven Daun Tembakau Otomatis Berbasis Arduino Uno', 'Terverifikasi', NULL, NULL),
(1161, '2025', '202140136', 'ERWIN DITA', 'P', 7, 'Ra\'as', 'Sumenep', 'Jawa Timur', 'Etika Komunikasi Pada Akun Tiktok Rian Fahardhi Dalam Menyampaikan Aspirasi Mengenai Kebebasan Demokrasi Kepada Generasi Z (Gen Z)', 'Terverifikasi', NULL, NULL),
(1162, '2025', '202140238', 'NORMAWATI', 'P', 6, 'Bungatan', 'Situbondo', 'Jawa Timur', 'Efektivitas Rational Emotif Behavior Therapy Terhadap Pengurangan Kecemasan Santri Dalam Menghadapi Ujian Massal Di Asrama Tahfidzul Quran Puteri Pondok Pesantren Salafiyah-Syafi’iyah Sukorejo', 'Terverifikasi', NULL, NULL),
(1163, '2025', '2021703061', 'TITIN PUSPITA SARI', 'P', 18, 'Kalipuro', 'Banyuwangi', 'Jawa Timur', 'Implementasi Laporan Keuangan Berdasarkan Sak Emkm Pada Umkm Banyuwangi (Studi Kasus Pada Usaha Jahit Desa Bulusari Kalipuro Banyuwangi)', '', NULL, NULL),
(1164, '2025', '2021205003', 'ANA NIKMATUR ROMADANI', 'P', 1, 'Suboh', 'Situbondo', 'Jawa Timur', 'Analisis Perlakuan Akuntansi Qardhul Hasan Di Kspps Bmt Nu Jawa Timur Cabang Suboh Berdasarkan Psak 101', 'Terverifikasi', NULL, NULL),
(1165, '2025', '202140126', 'Muh. Fauzi', 'L', 7, 'Kopang', 'Lombok Tengah', 'NTB', '\"STRATEGI KOMUNIKASI DALAM TRADISI NYONGKOLAN ', NULL, NULL, NULL),
(1166, '2025', '2021704032', 'ZULFA AMILATUS SHOLEHA', 'P', 21, 'Sukamara', 'Sukamara', 'Kalimantan Tengah', 'Students’ Vocabulary Mastery Through English Reels Video On Instagram: A Pre-Experimental Study At Language Boarding House Salafiyah Syafi’iyah Sukorejo Islamic Boarding School', '', NULL, NULL),
(1167, '2025', '2021704035', 'MIFA NURAMALIAH', 'P', 21, 'Arjasa', 'Situbondo', 'Jawa Timur', 'Hyponym Game In Enriching Students’ English Vocabulary At Language Boarding House', '', NULL, NULL),
(1168, '2025', '2021201055', 'WILDATUL ALUF', 'P', 2, 'Asembagus', 'Situbondo', 'Jawa Timur', 'Tinjauan Hukum Islam Terhadap Pembulatan Timbangan Pada Jasa Pengiriman Barang Di Pt Jalur Nugraha Ekakurir Situbondo  (Studi Kasus Di Pt Jalur Nugraha Ekakurir Jne Jln Wr. Anom Penarukan Situbondo)', 'Terverifikasi', NULL, NULL),
(1169, '2025', '2021301103', 'WILDA LUTHFIYAH ALUF', 'P', 8, 'wongsorejo', 'Banyuwangi', 'Jawa Timur', 'Implementasi Model Pembelajaran Moving Class Dalam Meningkatkan Minat Belajar Siswa Pada Mata Pelajaran Pendidikan Agama Islam Di Sma Negeri 1 Panji', '', NULL, NULL),
(1170, '2025', '20190301029', 'MASRULLAH', 'L', 8, 'Tanggul', 'Jember', 'Jawa Timur', '\"UPAYA GURU KE NU-AN DALAM MENANAMKAN NILAI-NILAI', NULL, NULL, NULL),
(1171, '2025', '2021603015', 'ITQONIYAH ZULFA', 'P', 22, 'WONGSOREJO', 'BANYUWANGI', '', 'PENGARUH BOOMI “BOOKLET IBU MENYUSUI” TERHADAP TINGKAT PENGETAHUAN IBU MENYUSUI PRIMIPARA DI WILAYAH KERJA PUSKESMAS BAJULMATI WONGSOREJO BANYUWANGI', '', NULL, NULL),
(1172, '2025', '2021603030', 'SITI HILMI MUSAROFAH', 'P', 22, 'AJUNG', 'JEMBER', '', 'Efek senam Maryam terhadap Tingkat kecemasan dan kesiapan persalinan ibu hamil primigravida trimester III diwilayah kerja puskesmas gumukmas', '', NULL, NULL),
(1173, '2025', '2021603007', 'FITRIYATUL JANNAH', 'P', 22, 'SEMPOL', 'BONDOWOSO', '', 'Efektivitas kombinasi pijat laktasi dan kompres daun kubis terhadap kelancaran pengeluaran ASI di Wilayah Kerja Puskesmas Tenggarang Kabupaten Bondowoso', '', NULL, NULL),
(1174, '2025', '2021603037', 'ZAHROTUN NAQIYAH SABRINA PUTRI', 'P', 22, 'SUKOWONO', 'JEMBER', '', 'Pengaruh pemberian Aromaterapi Lemon terhadap intensitas nyeri dismenorea pada remaja di asrama nurul qoni’ pondok pesantren salafiyah syafi\'iyah Sukorejo Situbondo', '', NULL, NULL),
(1175, '2025', '2021603006', 'DIAN AMALIA PUTRI', 'P', 22, 'GEROKGAK', 'BULELENG', '', 'Pengaruh pemberian cookies  daun kelor  (Moringa oleifera) terhadap peningkatan berat badan pada balita di Wilayah Kerja Puskesmas Gerokgak 1 Kabupaten Buleleng Tahun 2025', '', NULL, NULL),
(1176, '2025', '2021603010', 'HAYATUN NUPUS', 'P', 22, 'WONOSARI', 'BONDOWOSO', '', '\"PERBEDAAN EFIKASI ANTARA PEMBERIAN AIR REBUSAN DAUN SIRSAK DAN DAUN SALAM TERHADAP PENURUNAN TEKANAN DARAH PADA PREMENOPAUSE', NULL, NULL, NULL),
(1177, '2025', '2021603002', 'APRIL NUR RAHMA', 'P', 22, 'PONTIANAK KOTA', 'KOTA PONTIANAK', '', 'EFEK PEMBERIAN PUDING DAUN KELOR TERHADAP KADAR GULA DARAH PADA REMAJA PUTRI DI PONDOK PESANTREN SALAFIYAH AL-USTMANI BEDDIAN JAMBESARI DARUS SHOLAH BONDOWOSO', '', NULL, NULL),
(1178, '2025', '2021603023', 'NAILATUL MUFIDAH', 'P', 22, 'ARJASA', 'SITUBONDO', '', 'Efek kombinasi pemberian pijat endorphin dan relaksasi benson terhadap penurunan tingkat kecemasan pada ibu nifas di Wilayah Kerja Puskesmas Mangaran Kabupaten Situbondo Tahun 2025', 'Terverifikasi', NULL, NULL),
(1179, '2025', '2021603009', 'HAVILLA BERLIANA', 'P', 22, 'BANGSALSARI', 'JEMBER', '', 'EFIKASI PENERAPAN BUKU SAKU “BPJS ENDORPHIN” TERHADAP PENGETAHUAN, SIKAP DAN KETERAMPILAN DALAM PENANGANAN DISMENORE PRIMER PADA REMAJA DI SMP IBRAHIMY 3 SUKOREJO SITUBONDO', '', NULL, NULL),
(1180, '2025', '2021702053', 'RIFDATUL RISQYANTI', 'P', 19, 'WONOSARI', 'BONDOWOSO', '', 'Eksistensi Asas Praduga Tak Bersalah dalam penyidikan terhadap  Perlindungan Hak Tersangka pada Sistem Peradilan Pidana', '', NULL, NULL),
(1181, '2025', '2021301028', 'IBNU SABIL', 'L', 8, 'Seririt', 'Buleleng', 'Bali', 'PERAN KOMPETENSI KEPRIBADIAN GURU PENDIDIKAN AGAMA ISLAM (PAI) DALAM PEMBENTUKAN SIKAP RELIGIUS SISWA DI SMPN 1 ASEMBAGUS TAHUN PELAJARAN 2024/2025', 'Terverifikasi', NULL, NULL),
(1182, '2025', '2021301138', 'ULFI ROFIQO', 'P', 8, 'Asembagus', 'Situbondo', 'Jawa Timur', 'Penerapan Model Pembelajaran Card Sort Untuk Meningkatkan Hasil Belajar Siswa Kelas X Materi Pai Di Sman 1 Asembagus Tahun Pelajaran 2024/2025', 'Terverifikasi', NULL, NULL),
(1183, '2025', '2021302011', 'KHOLILIR ROHMAN', 'L', 9, 'Sumbawa', 'Sumbawa Besar', 'NTB', '“PENGEMBANGAN BAHAN AJAR LKPD NAHWU BAGI PEMULA BERBASIS HEYZINE FLIPBOOKS SISWA-SISWI KELAS VII MTS NEGERI 03 SITUBONDO”', '', NULL, NULL),
(1184, '2025', '2021704006', 'Muhaimin Dwi Kurnianto', 'L', 21, 'Situbondo', 'Situbondo', 'Jawa Timur', 'THE IMPLEMENTATION OF DIGITAL STORY TELLING IN ENGLISH SPEAKING SKILL AT SMP MISHBAHUL ULUM', 'Terverifikasi', NULL, NULL),
(1185, '2025', '2021702034', 'FADILATUL JANNAH', 'P', 19, 'banyuputih', 'Situbondo', 'Jawa Timur', 'Penerapan Business Judgment Rule (Bjr) Sebagai Alat Pembelaan Dalam Tindak Pidana Korupsi Di Indonesia', 'Terverifikasi', NULL, NULL),
(1186, '2025', '2021205005', 'DWI IRAWATI', 'P', 1, 'Blimbingsari', 'Banyuwangi', 'Jawa Timur', 'Analisis Tata Kelola Dana Tabungan Haji Muda Indonesia Dalam Meningkatkan Minat Nasabah Di Bsi Kcp Situbondo Basuki Rahmat', 'Terverifikasi', NULL, NULL),
(1187, '2025', '2021704025', 'RIFKA DIANA', 'P', 21, 'Arjasa', 'Sumenep', 'Jawa Timur', 'The Effect Of Comic Strips In Reading Comprehension: Students’ Perspective And Achievement', 'Terverifikasi', NULL, NULL),
(1188, '2025', '2021202060', 'QURRATUL AINI', 'P', 4, 'Gayam', 'Sumenep', 'Jawa Timur', 'Perspektif Hukum Islam Terhadap Pembaruan Akad Nikah (Studi Kasus Di Desa Jambuwir Kecamatan Gayam Kabupaten Sumenep)', '', NULL, NULL),
(1189, '2025', '2022506021', 'ZAKA MAULANA', 'L', 13, 'Asembagus', 'Situbondo', 'Jawa Timur', 'TEKNIK PENDEDERAN IKAN KERAPU CANTANG (Ephinephelus fuscoguttatus x Ephinephelus lanceolatus) DI HATCHERY GELUNG MAS SITUBONDO', 'Terverifikasi', NULL, NULL),
(1190, '2025', '2021603004', 'DELIZA NURKHOFIDAYAH', 'P', 22, 'KANGAYAN', 'SUMENEP', '', 'Pengaruh pemberian jus Pisang Ambon dan madu (PIMADU) terhadap penurunan tekanan darah pada ibu hamil trimester III di wilayah kerja Puskesmas Wonorejo, Kabupaten Situbondo', '', NULL, NULL),
(1191, '2025', '2021202033', 'USMAN JAYADI', 'L', 4, 'PRAYA BARAT', 'KAB. LOMBOK TENGAH', 'Nusa Tenggara Barat', 'PANDANGAN HUKUM ISLAM DAN HUKUM POSITIF TERHADAP TRADISI PEMBAGIAN HIBAH TANPA WARISAN', 'Terverifikasi', NULL, NULL),
(1192, '2025', '2021302018', 'MOCH. TAUFIQUR R.', 'L', 9, 'TENGGARANG', 'KAB. BONDOWOSO', 'JAWA TIMUR', '\"تطبيق طريقة غناء العربي  لتحسين إتقان المفرودات العربية في الصف الرابع', NULL, NULL, NULL),
(1193, '2025', '2021601027', 'SOVI AYU RAHMAWATI', 'P', 23, 'KALIPURO', 'BANYUWANGI', '', '\"RASIONALITAS PENGGUNAAN OBAT ANTI HIPERLIPIDEMIA DI ', NULL, NULL, NULL),
(1194, '2025', '202140248', 'ULFATUN NI\'MAH', 'P', 6, 'Kabat', 'Banyuwangi', 'Jawa Timur', 'Peningkatan Keharmonisan Interaksi Sosial Santri Melalui Layanan Bimbingan Konseling Di Pondok Pesantren Salafiyah Syafi’Iyah Sukorejo Situbondo', 'Terverifikasi', NULL, NULL),
(1195, '2025', '2021301100', 'UKHTUL IFA', 'P', 8, 'Kuta', 'Badung', 'Bali', 'Penerapan Metode Student Facilitator And Explaining Dalam Meningkatkan Keaktifan Dan Hasil Belajar Siswa Pada Mata Pelajaran Pendidikan Agama Islam Kelas Viii Di Smp Negeri 2 Gerokgak Tahun Pelajaran 2024/2025', 'Terverifikasi', NULL, NULL),
(1196, '2025', '2021501045', 'USWATUN HASANAH', 'P', 15, 'Ra\'as', 'Sumenep', 'Jawa Timur', 'Rancang Bangun Prototype Ruang Server Berbasis Mikrokontroler Arduino Uno Menggunakan Radio Frequency Identification', 'Terverifikasi', NULL, NULL),
(1197, '2025', '2021301134', 'SITI NUR LAILATUL HASANAH', 'P', 8, 'Panti', 'Jember', 'Jawa Timur', 'Meningkatkan Keterampilan Berwudhu Siswa Melalui Metode Practice Rehearsal Pairs Di Kelas Viii Smp Al-Muthohhirin Jember Tahun Pelajaran 2024/2025', 'Terverifikasi', NULL, NULL),
(1198, '2025', '2021703008', 'FAJRUL MAULANA', 'L', 18, 'JENGGAWAH', 'KAB. JEMBER', 'Jawa Timur', 'ANALISIS PEMAHAMAN DAN KEPATUHAN WAJIB PAJAK PADA USAHA MIKRO KECIL DAN MENENGAH (UMKM) DI KECAMATAN JENGGAWAH JEMBER', 'Terverifikasi', NULL, NULL),
(1199, '2025', '2021703023', 'DEWI NUR HALISA', 'P', 18, 'Panji', 'Situbondo', 'Jawa Timur', 'Analisis Manajemen Risiko Keuangan (Studi Kasus Pada Toko Sembako Rosida, Pasar Panji- Situbondo)', 'Terverifikasi', NULL, NULL),
(1200, '2025', '2021202046', 'KUNI MALIKAH ADILIYAH FILLAH', 'P', 4, 'Panji', 'Situbondo', 'Jawa Timur', 'Perspektif Hukum Islam Terhadap Penggunaan Harta Waris Untuk Biaya Tahlilan (Studi Kasus Di Desa Curah Jeru Kecamatan Panji Kabupaten Situbondo)', 'Terverifikasi', NULL, NULL),
(1201, '2025', '2021204079', 'MIA FITROH ZANNAH E.', 'P', 5, 'Arjasa', 'Jember', 'Jawa Timur', 'Penerapan Etika Bisnis Islam Dalam Meningkatkan Loyalitas Jama’ah Di Pt.Faroq Sulaiman Al-Fatah Tours & Travel Bondowoso', '', NULL, NULL),
(1202, '2025', '2021202014', 'IVAN JAMALULLAIL', 'L', 4, 'GEROKGAK', 'BULELENG', 'BALI', '\"ANALISIS HUKUM ISLAM TERHADAP PENYELESAIAN KONFLIK AKIBAT PERAN ISTRI SEBAGAI TENAGA KERJA MIGRAN WANITA', NULL, NULL, NULL),
(1203, '2025', '2021703041', 'NADIVA NURUL RAHMA', 'P', 18, 'Balung', 'Jember', 'Jawa Timur', 'Analisis Perhitungan Harga Pokok Produksi Dengan Menggunakan Metode Job Order Costing Untuk Penentuan Harga Jual (Ud. Hasan Basri Masada Shop Badung Bali)', '', NULL, NULL),
(1204, '2025', '2021302013', 'Lalu Ahmad Kholis Bukran', 'L', 9, 'Praya', 'Lombok Tengah', 'NTB', 'IMPLEMENTASI METODE NGAJI TOKOL DALAM PENINGKATAN MAHARAH AL-QIRA’AH KITAB KUNING SANTRI TAKHASSUS PONDOK PESANTREN                 AL-FATHIYAH YASIN DUSUN DASAN BARU DESA PRINGGARATA KECAMATAN PRINGGARATA LOMBOK TENGAH NTB', 'Terverifikasi', NULL, NULL),
(1205, '2025', '2021204058', 'DILA SAPTIKA WULANDARI', 'P', 5, 'Gerokgak', 'Buleleng', 'Bali', '\"Analisis Penerapan Strategi Manajemen Bisnis Syariah  Dalam Upaya Meningkatkan Volume Penjualan ', NULL, NULL, NULL),
(1206, '2025', '2021301083', 'ALIFIYA ROHMAH', 'P', 8, 'Gayam', 'Sumenep', 'Jawa Timur', '\"Pelaksanaan Ekstrakurikuler Tahfidz Al-Qur’An Dalam Membentuk Karakter Religius Siswa Di Sman 1 Gayam Sumenep', NULL, NULL, NULL),
(1207, '2025', '2021204106', 'LAILATUL MUSYARROFA', 'P', 5, 'Gayam', 'Sumenep', 'Jawa Timur', 'Penerapan Pelayanan Islami Dalam Meningkatkan Kepuasan Konsumen Di Toko Alfa Barokah Kecamatan Gayam Kabupaten Sumenep', 'Terverifikasi', NULL, NULL),
(1208, '2025', '2021201056', 'UFIYATUN NIKMAH', 'P', 2, 'Asembagus', 'Situbondo', 'Jawa Timur', 'Tinjauan Hukum Islam Terhadap Praktik Jual Beli Ikan  Pindang Antara Pemasok Dan Pedagang (Studi Kasus Di Pasar Jangkar Kecamatan Jangkar Kabupaten Situbondo)', 'Terverifikasi', NULL, NULL),
(1209, '2025', '2021301130', 'SITI HATIJA', 'P', 8, 'Besuki', 'Situbondo', 'Jawa Timur', 'Kegiatan Program Keagamaan Dalam Menanamkan Nilai-Nilai Religius Siswa Smp Islam Sunan Bonang Arjasa Situbondo Tahun Pelajaran 2024/2025', 'Terverifikasi', NULL, NULL),
(1210, '2025', '2021701019', 'FADILA RAHMA DINI', 'P', 20, 'Sempu', 'Banyuwangi', 'Jawa Timur', 'Proses Penyesuaian Diri Santri Baru Di Prediksi Dari Dukungan Sosial Dan Efikasi Diri', '', NULL, NULL),
(1211, '2025', '202130006', 'HAYATI', 'P', 10, 'Lenteng', 'Sumenep', 'Jawa Timur', 'Meningkatkan Perkembangan Kognitif Anak Menggunakan Metode Make A  Match Dalam Pembelajaran Bahasa Arab Untuk Anak Kelompok B Di Tk Miftahul Ulum Lenteng Timur Sumenep Tahun Pelajaran 2024/2025', 'Terverifikasi', NULL, NULL),
(1212, '2025', '2021703001', 'ABD WAFI', 'L', 18, 'Ra\'as', 'Sumenep', 'Jawa Timur', 'ANALISIS PENENTUAN HARGA POKOK PRODUKSI DENGAN METODE ACTIVITY BASED COSTING SEBAGAI DASAR PENENTUAN HARGA JUAL DI CV. COCO ROTI TAMAN GIRI JIMBARAN', 'Terverifikasi', NULL, NULL),
(1213, '2025', '2021301055', 'Mohammad Zakylilah', 'L', 8, 'Bangkalan', 'Bangkalan', 'Jawa Timur', 'Pengembangan Bahan Ajar Kaifa Tusholli dengan Metode Nadhom di Kelas 9 SMP PLUS Fityani Pujon Malang', 'Terverifikasi', NULL, NULL),
(1214, '2025', '2021601019', 'PUJI RAHAYU', 'P', 23, 'Sekarbela', 'Kota Mataram', 'NTB', 'ETNOFARMAKOLOGI TUMBUHAN OBAT SUKU SASAK DI PROVINSI NUSA TENGGARA BARAT', '', NULL, NULL),
(1215, '2025', '2021204005', 'AHMAD FUDHA\'ILUL IBAD AL AFAD', 'L', 5, 'ARJASA', 'Sumenep', 'Jawa Timur', 'STRATEGI PEMASARAN SYARIAH PADA AIR MINERAL SEMOGA BERKAH CV. SEMOGA BERKAH 916 KANGEAN SUMENEP UNTUK EKSPANSI PASAR DI LUAR PULAU KANGEAN (Studi Kasus Di CV. Semoga Berkah 916 Desa Sambakati, Kecamatan Arjasa, Kabupaten Sumenep)', 'Terverifikasi', NULL, NULL),
(1216, '2025', '2021702048', 'NUR FADILAH', 'P', 19, 'Cermee', 'Bondowoso', 'Jawa Timur', 'Peran Pembuktian Forensik Terhadap Tindak Pidana Pembunuhan Dalam Pasal 184 Undang-Undang No 8 Tahun 1981 Kuhap', 'Terverifikasi', NULL, NULL);
INSERT INTO `mahasiswas` (`id`, `lulusan`, `nim`, `nama`, `jk`, `prodi_id`, `kecamatan`, `kabupaten`, `provinsi`, `tugas_akhir`, `verifikasi`, `created_at`, `updated_at`) VALUES
(1217, '2025', '2020203006', 'ANDRIYANTO', 'L', 3, 'Ra\'as', 'Sumenep', 'Jawa Timur', 'IMPLEMENTASI ETIKA BISNIS ISLAM DALAM MENINGKATKAN PROFIT PADA CV. SAGOA DI TIBU BENENG KUTA UTARA BADUNG BALI', 'Terverifikasi', NULL, NULL),
(1218, '2025', '2021502019', 'IHYA NUR PAMUNGKAS', 'L', 16, 'DENPASAR TIMUR', 'KOTA DENPASAR', 'Bali', 'SISTEM PENDUKUNG KEPUTUSAN PENENTUAN SISWA TERBAIK DI MTS ISTANA HATI DENPASAR SELATAN KABUPATEN DENPASAR DENGAN METODE SIMPLE ADDITIVE WEIGHTING (SAW)', 'Terverifikasi', NULL, NULL),
(1219, '2025', '2021303032', 'SUSWATI', 'P', 10, 'TAPEN', 'BONDOWOSO', 'JAWA TIMUR', 'MENINGKATKAN KEMAMPUAN STEAM MENGGUNAKAN MEDIA KOTAK AJAIB PADA ANAK KELOMPOK A DI TK DHARMA WANITA 01 GUNUNG ANYAR TAHUN PELAJARAN 2024/2025', 'Terverifikasi', NULL, NULL),
(1220, '2025', '2021303050', 'SOFIATUL LAILI', 'P', 10, 'BANYUPUTIH', 'SITUBONDO', 'JAWA TIMUR', 'PENGEMBANGAN BUKU CERITA INTERAKTIF BERBASIS AUGMENTED REALITY UNTUK MENINGKATKAN LITERASI AWAL ANAK USIA DINI KELOMPOK B DI  RA AL KHODIJAH SUMBERANYAR TAHUN PELAJARAN  2024/2025', 'Terverifikasi', NULL, NULL),
(1221, '2025', '2021301081', 'ALFIYAH JAWAHIRUL M.', 'P', 8, 'Pajeten', 'Bondowoso', 'Jawa Timur', 'Penerapan Ice Breaking Dalam Pembelajaran Untuk Meningkatkan Motivasi Dan Minat Belajar Siswa Mata Pelajaran Sejarah Kebudayaan Islam Di Mi At-Taqwa Bondowoso Tahun Pelajaran 2024/2025', 'Terverifikasi', NULL, NULL),
(1222, '2025', '2021301071', 'ANA SHUFRIYATIN', 'P', 8, 'Asembagus', 'Situbondo', 'Jawa Timur', '\"Meningkatkan Hasil Belajar Mata Pelajaran Pai Menggunakan Pendekatan Tpack (Technological Pedagogical Content Knowledge) Dengan Aplikasi Android Game Wordwall Pada Siswa Dikelas Viii Mts Negeri 3 Situbondo', NULL, NULL, NULL),
(1223, '2025', '2021301079', 'HIKMATUS SHOLIHAH', 'P', 8, 'Watukebo', 'Banyuwangi', 'Jawa Timur', '\"Meningkatkan Keaktivan Belajar Siswa Melalui Metode Talking Stick Pada Mata Pelajaran Fiqih Kelas Xi Man 2 Situbondo', NULL, NULL, NULL),
(1224, '2025', '2021304015', 'SABRINA PUTRI AULIA', 'P', 11, 'Bebandem', 'Karangasem', 'Bali', 'Analisis Kesalahan Siswa Dalam Memecahkan Soal Higher Order Thinking Skills (Hots)', 'Terverifikasi', NULL, NULL),
(1225, '2025', '2021301110', 'JUNAINATUL BADIAH', 'P', 8, 'BANYUPUTIH', 'SITUBONDO', 'Jawa Timur', '\"Peran Guru Pai Dalam Membentuk Akhlak Siswa ', NULL, NULL, NULL),
(1226, '2025', '2021301077', 'LAYLIYATUL KAMILA', 'P', 8, 'Banyuputih', 'Situbondo', 'Jawa Timur', 'Pengaruh Keterampilan Mengajar Guru Terhadap  Kemampuan Berpikir Kritis Siswa  Pada Mata Pelajaran Pendidikan Agama Islam Di Sma  Ibrahimy 2 Sukorejo Situbondo Tahun Ajaran 2024/2025', 'Terverifikasi', NULL, NULL),
(1227, '2025', '2021202020', 'NURIL ARISKA', 'P', 4, 'Srono', 'Banyuwangi', 'Jawa Timur', '\"Tinjauan Hukum Islam Terhadap   Gugatan Rekonvensi Dalam Cerai Talak Nomor: 2790/Pdt.G/2023/ Pa.Bwi.', NULL, NULL, NULL),
(1228, '2025', '2021703009', 'FATHOR ROHMAN', 'L', 18, 'KENDIT', 'KAB. SITUBONDO', 'Jawa Timur', 'ANALISIS KINERJA KEUANGAN BUMDES BERKARYA PADA PERIODE TAHUN 2020-2024 ( Studi Kasus Klatakan-Kendit-Situbondo )', '', NULL, NULL),
(1229, '2025', '2021704042', 'NOR FAISEH', 'P', 21, 'Kapongan', 'Situbondo', 'Jawa Timur', 'The Effect Of Vlog Towards Students’ Speaking Skill At The Tenth Grade Of Sman 2 Situbondo: A Quasi-Experimental Study', 'Terverifikasi', NULL, NULL),
(1230, '2025', '202140230', 'HILNA FITRIANI', 'P', 6, 'Sukasada', 'Buleleng', 'Jawa Timur', 'Hubungan Kompetensi Konselor Bersertifikat Dengan Layanan Bimbingan Dan Konseling Pada Pasien Rehabilitasi Narkoba Di Rumah Merah Putih Surabaya', 'Terverifikasi', NULL, NULL),
(1231, '2025', '2021304042', 'WILDA AL AFUF', 'P', 11, 'Banyuputih', 'Situbondo', 'Jawa Timur', 'Implementasi Pemecahan Masalah Model Polya Pada Ilmu Faraid Untuk Meningkatkan Pemahaman Matematis Siswa Melalui Materi Bilangan Pecahan', 'Terverifikasi', NULL, NULL),
(1232, '2025', '2021703012', 'MISBAHUL ULUM', 'L', 18, 'BANGSALSARI', 'KAB. JEMBER', 'JAWA TIMUR', '\"ANALISIS PENGELOLAAN KEUANGAN DESA BERDASARKAN PERMENDAGRI NOMOR 20 TAHUN 2018 TAHUN ANGGARAN 2024', NULL, NULL, NULL),
(1233, '2025', '2021301145', 'ZULVA NA\'ILATUN NAJWA', 'P', 8, 'Rogojampi', 'Banyuwangi', 'Jawa Timur', 'Pengaruhumetode5Pembelajaran Ummie Terhadap Kemampuan Membaca Al-Qur’An Santri Di Tpq Sritanjung Rogojampi Tahun Pelajaran 2024/2025', '', NULL, NULL),
(1234, '2025', '20212014044', 'ROYHAN KHAIRUL A.', 'L', 5, 'CERMEE', 'BONDOWOSO', 'JAWA TIMUR', 'PENGARUH KUALITAS BAHAN BAKU GABAH DAN PROSES PRODUKSI TERHADAP KUALITAS PRODUK BIBIT PADI PADA CV. HASANAH KECAMATAN MAESAN KABUPATEN BONDOWOSO', 'Terverifikasi', NULL, NULL),
(1235, '2025', '2021303005', 'GINA KHARIDAH', 'P', 10, 'Arjasa', 'Sumenep', 'Jawa Timur', 'Penerapan Kegiatan Cooking Class Untuk Mengenalkan Kearifan Budaya Lokal Di Daerah Kangean Pada Anak Kelompok B Tk An-Nabilah Tajjan Angon-Angon', 'Terverifikasi', NULL, NULL),
(1236, '2025', '2021201052', 'SASKIA AMANDA', 'P', 2, 'Banjar', 'Buleleng', 'Bali', 'Perspektif Hukum Islam Terhadap Jual Beli Handphone Melalui Online Secara Kredit (Studi Kasus Di Toko Central Grosir Singaraja Kota Buleleng Bali)', '', NULL, NULL),
(1237, '2025', '2021303035', 'Himmatu Auliyaillah', 'P', 10, 'bungatan', 'situbondo', 'Jawa TImur', 'PENGEMBANGAN MEDIA “QUR’ANIC ADVENTURE BOOK” UNTUK MENINGKATKAN LITERASI QUR’AN PADA ANAK KELOMPOK B DI RA MADINATUL ULUM TAHUN PELAJARAN 2024/2025', 'Terverifikasi', NULL, NULL),
(1238, '2025', '2021702008', 'IBRAHIM MOFIK', 'L', 19, 'ARJASA', 'KAB. SUMENEP', 'Jawa Timur', 'PENERAPAN RECHTSVINDING BERDASARKAN UNDANG-UNDANG NOMER 48 TAHUN 2009 TENTANG KEKUASAAN KEHAKIMAN', 'Terverifikasi', NULL, NULL),
(1239, '2025', '20200301062', 'Zulfan Khairi Tamimi', 'L', 8, 'praya', 'Lombok Tengah', 'NTB', 'PROGRAM UNGGULAN KEAGAMAAN DI MADRASAH ALIYAH NURUL QUR’AN LENDANG SIMBE MERTAK TOMBOK PRAYA LOMBOK TENGAH NTB', '', NULL, NULL),
(1240, '2025', '2021703011', 'M. IRFAN SHOLEH', 'L', 18, 'SUKORAMBI', 'JEMBER', 'JAWA TIMUR', 'ANALISIS LAPORAN KEPALA DESA BERDASARKAN PERMENDAGRI NO 46 TAHUN 2016 DI DESA SOMBER KEC. NONGGUNONG KAB. SUMENEP', 'Terverifikasi', NULL, NULL),
(1241, '2025', '2021703035', 'MAZIYATUL IMANI', 'P', 18, 'Bungatan', 'Situbondo', 'Jawa Timur', 'Pengaruh Ukuran Perusahaan Liabilitas Terhadap Laba Bersih Pada Perusahaan Food And Baverage Terdaftar Dibursa Efek (Bei) Indonesia Tahun 2020-2024', 'Terverifikasi', NULL, NULL),
(1242, '2025', '2021302017', 'MAULANA TAUHIDIL FA\'IQ', 'L', 9, 'PAKEM', 'KAB. BONDOWOSO', 'JAWA TIMUR', 'تطبيق طريقة محافظة في زيادة المفرودات لطلاب الصف 5 بمعهد مصر في تقوى بوندوسو للعام', '', NULL, NULL),
(1243, '2025', '2019501014', 'QULYUBI', 'L', 15, 'Panji', 'Situbondo', 'Jawa Timur', '\"PENYIRAMAN TANAMAN OTOMATIS ', NULL, NULL, NULL),
(1244, '2025', '2021301090', 'CAHYAWATI', 'P', 8, 'Bebandem', 'Karangasem', 'Bali', 'Implementasi Pembelajaran Ilmu Tajwid Menggunakan Kitab Matan Jazariyyah Dalam Peningkatan Kemampuan Membaca Al-Qur’An Santri Pondok Pesantren Baitul Qur’An An-Nur Karangasem Bali Tahun 2025', 'Terverifikasi', NULL, NULL),
(1245, '2025', '2021202040', 'FATIMATUS ZAHRO', 'P', 4, 'Panji', 'Situbondo', 'Jawa Timur', 'Perspektif Hukum Islam Terhadap Tradisi Pencatatan Lalabet Kematian (Studi Kasus Di Dusun Penjalinan Desa Kedunglo Kecamatan Asembagus Kabupaten Situbondo)', 'Terverifikasi', NULL, NULL),
(1246, '2025', '2021204064', 'FAIDATUL JAZILAH', 'P', 5, 'Asembagus', 'Situbondo', 'Jawa Timur', 'Implementasi Manajemen Sumber Daya Insani Dalam Meningkatkan Produktivitas Kerja Karyawan (Di Pg Asembagoes Kecamatan Asembagus Kabupaten Situbondo )', 'Terverifikasi', NULL, NULL),
(1247, '2025', '2021203056', 'WIRDATUL AZIZAH', 'P', 3, 'Jangkar', 'Situbondo', 'Jawa Timur', '\"Pengaruh Pelayanan Islami Dan Kualitas Produk Terhadap Kepuasan Konsumen ', NULL, NULL, NULL),
(1248, '2025', '2020203015', 'Fikri Aqil Zaini', 'L', 3, 'Kalipuro', 'Banyuwangi', 'Jawa Timur', 'IMPLEMENTASI AKAD AL-QORDLU AL-HASAN  PADA PRODUK PEMBIAYAAN LASISMA DI KSPP.SYARIAH BMT NU CABANG KALIPURO BANYUWANGI', 'Terverifikasi', NULL, NULL),
(1249, '2025', '2021301040', 'Misbahul Munir', 'L', 8, 'Kalisat', 'Jember', 'Jawa Timur', 'PENDIDIKAN KARAKTER DISIPLIN HIDUP BERSIH SANTRI DI ASRAMA FAVORIT PONDOK PESANTREN SALAFIYAH SYAFI’IYYAH SUKOREJO TAHUN 2025', 'Terverifikasi', NULL, NULL),
(1250, '2025', '2021301114', 'MIFTAHUL JANNAH', 'P', 8, 'Praya', 'Lombok Tengah', 'NTB', '\"Implementasi Metode Pembelajaran Storytelling Untuk Meningkatkan Keterampilan Bercerita Siswa Pada Mata Pelajaran Pai Kelas Vii Di Smp Negeri 8 Pujut Lombok Tengah ', NULL, NULL, NULL),
(1251, '2025', '2021204102', 'NURUL AINI PUTRI', 'P', 5, 'Pujer', 'Bondowoso', 'Jawa Timur', 'Strategi Relationship Marketing Dalam Peningkatan Loyalitas Pelanggan Di Cv. Alam Raya Bondowoso', 'Terverifikasi', NULL, NULL),
(1252, '2025', '2022506011', 'AGENG PRAYOGA WICAKSONO', 'L', 13, 'Asembagus', 'Situbondo', 'Jawa Timur', 'TEKNIK PEMBESARAN UDANG VANAME (Litopenaeus Vannamei) PADA KOLAM BUNDAR TERPAL HDPE DI TAMBAK ZULFISH', 'Terverifikasi', NULL, NULL),
(1253, '2025', '2021701006', 'LUQMAN HAKIM', 'L', 20, 'CAKUNG', 'KOTA ADM. JAKARTA TIMUR', 'DKI Jakarta', 'HUBUNGAN ANTARA KONSEP DIRI DAN RELIGIUSITAS DENGAN MOTIVASI BERPRESTASI SANTRI', 'Terverifikasi', NULL, NULL),
(1254, '2025', '2021304019', 'WILDA WARDATUN NIHAYAH', 'P', 11, 'Darul Makmur', 'Ngan Raya', 'Aceh', 'Eksplorasi Matematika Graf Pada Pola Tanam Kelapa Sawit Di Aceh', '', NULL, NULL),
(1255, '2025', '202140106', 'AHMAD FAHRUR ROZI', 'L', 7, 'BALUNG', 'KAB. JEMBER', 'Jawa Timur', 'STRATEGI KOMUNIKASI IKATAN PERSAUDARAAN HAJI INDONESIA DALAM BIMBINGAN MANASIK HAJI DI KECAMATAN BALUNG, KABUPATEN JEMBER', 'Terverifikasi', NULL, NULL),
(1256, '2025', '2021702060', 'SISILIA AISYAH', 'P', 19, 'Tamanan', 'Bondowoso', 'Jawa Timur', 'Pemenuhan Hak Disabilitas Sebagai Korban Kekerasan Seksual', '', NULL, NULL),
(1257, '2025', '2021301117', 'NADA NABILLAH', 'P', 8, 'Telanaipura', 'Kota jambi', 'Jambi', 'Pengembangan Media Pembelajaran Pai Kelas Ix Menggunakan Kartu Uno Question Dare Dalam Meningkatkan Daya Ingat Siswa Di Smp 3 Ibrahimy Sukorejo Tahun Pelajaran 2024/2025', 'Terverifikasi', NULL, NULL),
(1258, '2025', '2021204089', 'SIFAUL HASANAH', 'P', 5, 'Sumberwringin', 'Bondowoso', 'Jawa Timur', '\"Pengaruh Kelengkapan Barang Terhadap Minat Beli Konsumen', NULL, NULL, NULL),
(1259, '2025', '2021204060', 'DWI ELSA NURIN CAHYA', 'P', 5, 'Asembagus', 'Situbondo', 'Jawa Timur', 'Pengaruh Motivasi Kerja Dan Gaya Kepemimpinan Islami Terhadap Kinerja Karyawan Di Pg. Assembagoes Situbondo', 'Terverifikasi', NULL, NULL),
(1260, '2025', '2021204100', 'SRI SOFIANA', 'P', 5, 'Asembagus', 'Situbondo', 'Jawa Timur', 'Pengaruh Citra Merek Dan Kualitas Produk Terhadap Minat Beli Konsumen (Studi Kasus Cv. Hafas P2s2 Sukorejo Situbondo)', 'Terverifikasi', NULL, NULL),
(1261, '2025', '2021301112', 'MAULIDIA RAHMAH', 'P', 8, 'Wongsorejo', 'Banyuwangi', 'Jawa Timur', 'Upaya Meningkatkan Standar Kompetensi Lulusan   Dengan Program Al-Risalah Di Madrasah Aliyah Putri Salafiyah Syafi’Iyah Sukorejo Tahun Pelajaran 2024/2025', 'Terverifikasi', NULL, NULL),
(1262, '2025', '2021303025', 'YANTI YULIS', 'P', 10, 'Dungkek', 'Sumenep', 'Jawa Timur', '\"Meningkatkan Perkembangan Bahasa Melalui Bermain Peran Makro Pada Kelompok B Di ', NULL, NULL, NULL),
(1263, '2025', '2021203055', 'USLIFATUL LAILI', 'P', 3, 'Gayam', 'Sumenep', 'Jawa Timur', '\"Implementasi Strategi Pemasaran Islami Dalam Penetapan Merek/Label Produk Keripik Singkong Untuk Meningkatkan Minat Beli Konsumen', NULL, NULL, NULL),
(1264, '2025', '2021301044', 'Moh. Sulthon Hayatullah Thoyyib', 'L', 8, 'Banyuputih', 'Situbondo', 'Jawa Timur', '\"PENGGUNAAN MEDIA PEMBELAJARAN INTERAKTIF DALAM RANGKA PENINGKATAN KONSENTRASI BELAJAR SISWA PADA MATA PELAJARAN PENDIDIKAN AGAMA ISLAM', NULL, NULL, NULL),
(1265, '2025', '2021505002', 'LAILIA KHURIYYATUS SA\'ADAH', 'P', 14, 'Muncar', 'Banyuwangi', 'Jawa Timur', 'Analisis Aktivitas Antioksidan Dan Fitokimia Teh Kombucha Rumput Laut (Eucheuma Cottonii) Dengan Waktu Fermentasi Yang Berbeda', 'Terverifikasi', NULL, NULL),
(1266, '2025', '2020203066', 'SILMI SUHAENI', 'P', 3, 'Narmada', 'Lombok Barat', 'NTB', 'Perspektif Ekonomi Islam Terhadap Pengelolaan Wisata Alam Gunung Jae Dalam Memberdayakan Ekonomi Masyarakat Desa Sedau Kecamatan Narmada Lombok Barat', '', NULL, NULL),
(1267, '2025', '2021303007', 'IFA\'ATUL MILADIYAH ROSA', 'P', 10, 'Gayam', 'Sumenep', 'Jawa Timur', '\"Meningkatkan Kemampuan Sosial Emosional Anak Usia Dini Melalui Kegiatan Menganyam Menggunakan Kertas Di Kelompok B', NULL, NULL, NULL),
(1268, '2025', '2021202001', 'ABDULLAH ALI HAYAT', 'L', 4, 'PRAGAAN', 'Sumenep', 'Jawa Timur', '\"PERSPEKTIF HUKUM ISLAM DAN HUKUM POSITIF TERHADAP PERTANGGUNG JAWABAN AHLI WARIS ATAS HUTANG PEWARIS', NULL, NULL, NULL),
(1269, '2025', '2021204025', 'MOHAMMAD ALDI', 'L', 5, 'Ledokombo', 'Jember', 'Jawa Timur', 'ANALISIS PENGENDALIAN KUALITAS PRODUK DENGAN MENGGUNAKAN STATISTICAL QUALITI CONTROL (SQC) DAN PERSPEKTIF SYARI’AH DI PABRIK AIR MINUM DALAM KEMASAN (AMDK) P2S2 CV. HAFAS SITUBONDO', 'Terverifikasi', NULL, NULL),
(1270, '2025', '2021504005', 'FAUZAN HADI', 'L', 12, 'AMPENAN', 'KOTA MATARAM', 'Nusa Tenggara Barat', 'PENERAPAN KONSEP GREEN ARCHITECTURE PADA PERANCANGAN PUSKESMAS LINGSAR LOMBOK BARAT', 'Terverifikasi', NULL, NULL),
(1271, '2025', '2021701011', 'Prian Nurbian', 'L', 20, 'Cibinong', 'Bogor', 'Jawa Barat', 'HUBUNGAN RELIGIUSITAS DENGAN QUARTER LIFE CRISIS MAHASISWA SEMESTER AKHIR UNIVERSITAS IBRAHIMY SITUBONDO', 'Terverifikasi', NULL, NULL),
(1272, '2025', '2021301072', 'AL HAYA URRIZQI M.', 'P', 8, 'Mataram', 'Kota Mataram', 'NTB', '\"Penerapan Metode Fun Teaching Teknik Tebak  Kata ', NULL, NULL, NULL),
(1273, '2025', '2021302041', 'LAYYINATUL AZHARI', 'P', 9, 'Praya Tengah', 'Lombok Tengah', 'NTB', 'Penyusunan Buku Saku Mufrodat Untuk Meningkatkan Penguasaan Kosakata Bahasa Arab Siswa Madrasah Aliyah Nurul Ulum Mertak Tombok Tahun Pelajaran 2025', 'Terverifikasi', NULL, NULL),
(1274, '2025', '2021702055', 'Sulmainingsih', 'P', 19, 'Pomalaa', 'Kolaka', 'Sulawesi Tenggara', 'Tinjauan Yuridis Kekuatan Alat Bukti Sebagai Dasar Penetapan Tersangka Berdasarkan  Pasal 184 Kuhap (Putusan Praperadilan Nomor: 33/Pid.Prap/2020/Pn.Jkt.Sel)', 'Terverifikasi', NULL, NULL),
(1275, '2025', '2020203033', 'RIZIQ FARIDO', 'L', 3, 'Arjasa', 'Sumenep', 'Jawa Timur', 'ANALISIS PEMASARAN SYARI’AH TERHADAP STRATEGI PEMASARAN YANG DITERAPKAN SWALAYAN 916 Desa Arjasa Kecamatan Arjasa Kabupaten Sumenep', 'Terverifikasi', NULL, NULL),
(1276, '2025', '2021202037', 'ANISATURRAHMAH', 'P', 4, 'Banyuputih', 'Situbondo', 'Jawa Timur', 'Tinjauan Hukum Islam  Terhadap Pembatalan Perkawinan Qobla Dhukul (Studi Kasus Di Pengadilan Agama Bondowoso Dengan Nomor Putusan 1422/Pdt.G/2024/Pa.Bdw.)', 'Terverifikasi', NULL, NULL),
(1277, '2025', '2021703025', 'DWI NOVITA', 'P', 18, 'Pejaten', 'Bondowoso', 'Jawa Timur', '\"Implementasi Metode Full Costing Dalam Perhitungan Harga Pokok Produksi Pada Usaha Daging Ayam Sebagai Dasar Penentuan Harga Jual Di Kios Ibu Andi Tenggarang Bondowoso', NULL, NULL, NULL),
(1278, '2025', '2021202005', 'AHMAD WAHYUDI', 'L', 4, 'GERUNG', 'KAB. LOMBOK BARAT', 'Nusa Tenggara Barat', '\"PERSPEKTIF HUKUM ISLAM TERHADAP ADAT BEGAWE BELEQ DALAM PERNIKAHAN', NULL, NULL, NULL),
(1279, '2025', '2022506001', 'ACH. DANIEL FIRMANSYAH', 'L', 13, 'Banyuputih', 'Situbondo', 'Jawa Timur', 'PEMBENIHAN IKAN LELE DUMBO (Clarias gariepinus) DI RAJA LELE SITUBONDO', '', NULL, NULL),
(1280, '2025', '2022506020', 'SYAUQIL ADIM AL MURTADHA', 'L', 13, 'Banyuputih', 'Situbondo', 'Jawa Timur', 'TEKNIK PEMBESARAN IKAN LELE DUMBO (Clarias gariepinus) SECARA INTENSIF DI KOLAM TERPAL DI RAJA LELE SITUBONDO', '', NULL, NULL),
(1281, '2025', '202140257', 'SANNADATUS SYARI\'AH', 'P', 6, 'Bungatan', 'Situbondo', 'Jawa Timur', 'Pendekatan Konseling Rasional Emotif Perilaku Dengan Teknik Kognitif Untuk Meningkatkan Resiliensi Warga Binaan Pencandu Narkoba Di Lapas Kelas II B Bondowoso', 'Terverifikasi', NULL, NULL),
(1282, '2025', '2021204076', 'KHOINIYAR', 'P', 5, 'Tlogosari', 'Bondowoso', 'Jawa Timur', 'Analisis Penerapan Strategi Pemasaran Syari’Ah Dalam Meningkatkan Minat Beli Konsumen Di Perusahaan Air Minum Dalam Kemasan P2S2 Di Cv. Hafas Pondok Pesantren Salafiyah Syafi’Iyah Sukorejo', 'Terverifikasi', NULL, NULL),
(1283, '2025', '2021204078', 'NURIL IHFA', 'P', 5, 'Jangkar', 'Situbondo', 'Jawa Timur', 'Pengaruh Kualitas Produk Dan Harga Terhadap Loyalitas Konsumen Di Toko Diva Collection Banyuputih Situbondo', 'Terverifikasi', NULL, NULL),
(1284, '2025', '2021204090', 'SULISTIANI', 'P', 5, 'Nonggunong', 'Sumenep', 'Jawa Timur', 'Pengaruh Kualitas Pelayanan Dan Lokasi Terhadap Kepuasan Konsumen Di Toko Diva Collection Banyuputih Situbondo', 'Terverifikasi', NULL, NULL),
(1285, '2025', '2020203008', 'BADRUL ANWAR', 'L', 3, 'Mangaran', 'Situbondo', 'Jawa Timur', 'ANALISIS IMPLEMENTASI AKAD AL-QORDLUL HASAN PADA PRODUK PEMBIAYAAN LASISMA DI KSPP. SYARIAH BMT NU CABANG MANGARAN SITUBONDO BEDASARKAN FATWA DSN MUI NOMOR 19', 'Terverifikasi', NULL, NULL),
(1286, '2025', '2021302006', 'AZIZUL HAKIM', 'L', 9, 'Sekotong', 'Lombok Barat', 'NTB', 'PENGEMBANGAN MEDIA PEMBELAJARAN BERBASIS PERMAINAN “BERBURU KATA” UNTUK MENINGKATKAN MINAT BELAJAR BAHASA ARAB SISWA KELAS IV MIN 2 SITUBONDO TAHUN PELAJARAN 2024/2025', 'Terverifikasi', NULL, NULL),
(1287, '2025', '2021502046', 'NABILA KHANSA NOER MAUDY', 'P', 16, 'SUKOMANUNGGAL', 'KOTA SURABAYA', '', 'Digitalisasi Manajemen Akademik Melalui Sistem Informasi Berbasis Website Di Language Boarding House (Lbh)', 'Terverifikasi', NULL, NULL),
(1288, '2025', '2021502067', 'INDAH NOVITA SARI', 'P', 16, 'BONDOWOSO', 'BONDOWOSO', '', 'Analisis Perbandingan Algoritma Decision Tree, Random Forest, Dan Naive Bayes Dalam Klasifikasi Gangguan Tidur', '', NULL, NULL),
(1289, '2025', '2021703003', 'ACHMAD FUDHAILI', 'L', 18, 'Jangkar', 'Situbondo', 'Jawa Timur', 'ANALISIS CONTRIBUTION MARGIN DALAM PENJUALAN PRODUK JAMUDIN DAN MARNING PADA UMKM SARI BAGUS KERTOSARI ASEMBAGUS SITUBONDO', '', NULL, NULL),
(1290, '2025', '2020204026', 'LALU MUH. KHOLIL ARRAJANI', 'L', 5, 'Pujut', 'Lombok Tengah', 'NTB', 'ANALISIS STRATEGI MANAJEMEN SUMBER DAYA INSANI DALAM MENINGKATKAN KINERJA KARYAWAN PADA BANK WAKAF MIKRO ATQIA DI DESA BONDER KECAMATAN PRAYA BARAT LOMBOK TENGAH NTB', 'Terverifikasi', NULL, NULL),
(1291, '2025', '2020402019', 'MUHAMAD AFRIANTO', 'L', 7, 'Air Hitam', 'Sorolangun', 'Jambi', 'METODE DAKWAH SANTRI PATRIOT BANGSA (SATRIA) PONDOK PESANTREN SALAFIYAH SYAFI’IYAH SUKOREJO DALAM MENEGUHKAN SEMANGAT NASIONALISME', '', NULL, NULL),
(1292, '2025', '2021302036', 'FITROTIN MAULIDA', 'P', 9, 'Bluto', 'Sumenep', 'Jawa Timur', '\"Pembuatan Media Pembelajaran Mufrodat Spinner Untuk Meningkatkan Maharah Qira’Ah Sisiwa Kelas Vii Mts. Raudlatul Ulum Palongan Bluto Sumenep', NULL, NULL, NULL),
(1293, '2025', '2021702025', 'Nurifan Hairi', 'L', 19, 'Ra\'as', 'Sumenep', 'Jawa Timur', 'ANALSIS YURIDIS TERHADAP PENYALAHGUNAAN WEWENANG PENYELENGGARA NEGARA DALAM TINDAK PIDANA KORUPSI (Studi Putusan Nomor: 35/Pid.Sus-TPK/2020/PT.SBY.)', 'Terverifikasi', NULL, NULL),
(1294, '2025', '2021702043', 'FAIKATUL JANNAH', 'P', 19, 'Pujer', 'Bondowoso', 'Jawa Timur', 'Analisa Yuridis Upaya Penegakan Hukum Terhadap Pelaku Kejahatan Hak Cipta Berdasarkan Undang-Undang Nomor 28 Tahun 2014', '', NULL, NULL),
(1295, '2025', '2021702017', 'MOH. FAIQUL HIMAM', 'L', 19, 'MLANDINGAN', 'KAB. SITUBONDO', 'Jawa Timur', 'KEDUDUKAN PEJABAT PERANCANG PERATURAN PERUNDANG-UNDANGAN DALAM MEKANISME PEMBENTUKAN PERATURAN PERUNDANG-UNDANGAN', 'Terverifikasi', NULL, NULL),
(1296, '2025', '2021301054', 'MUHAMMAD ILYAS', 'L', 8, 'BANYUPUTIH', 'KAB. SITUBONDO', 'Jawa Timur', 'PEMBIASAAN AKTIVITAS KEAGAMAAN SEBAGAI UPAYA PENANAMAN SIKAP SPIRITUAL SISWA DI SMPN 2 ASEMBAGUS TAHUN PELAJARAN 2024/2025', 'Terverifikasi', NULL, NULL),
(1297, '2025', '2021702054', 'SITI MAULIDATIL KAMILAH', 'P', 19, 'Banyuputih', 'Situbondo', 'Jawa Timur', 'Politik Hukum Pertanahan Di Indonesia Dalam Penyelesaian Konflik Pertanahan Melalui Mediasi Oleh Badan Pertanahan Nasional', 'Terverifikasi', NULL, NULL),
(1298, '2025', '2021302004', 'Andre Setia Budi', 'L', 9, 'Mandah', 'Indragiri Hilir', 'Riau', 'PENGARUH PENGGUNAAN KITAB ASMA’ AL-YAUMIYAH TERHADAP PENINGKATAN KOSAKATA BAHASA ARAB SANTRI ASRAMA BAHASA ASING PONDOK PESANTREN SALAFIYAH SYAFI’IYAH SUKOREJO', '', NULL, NULL),
(1299, '2025', '2021301020', 'Fajri Alfin Hidayatullah', 'L', 8, 'Banyuputih', 'Situbondo', 'Jawa Timur', 'IMPLEMENTASI PEMBELAJARAN PENDIDIKAN AGAMA ISLAM BERBASIS PROYEK DALAM PENINGKATAN KREATIVITAS SISWA DI SMPN 2 ASEMBAGUS', '', NULL, NULL),
(1300, '2025', '2021204105', 'YUNITA', 'P', 5, 'Klabang', 'Bondowoso', 'Jawa Timur', '\"Strategi Pemasaran Bisnis Islami Mebel 3 Saudara Menggunakan Influencer Melalui Media Sosial Tiktok Panji Situbondo', NULL, NULL, NULL),
(1302, '2025', '2021202044', 'MUHAMMAD DANDY MUHLIS', 'L', 4, 'BONDOWOSO', 'KAB. BONDOWOSO', 'Jawa Timur', 'PERSFEKTIF HUKUM ISLAM TENTANG RITUAL TRADISI PANDHEBEH DI DESA PATEMON KECAMATAN TLOGOSARI KABUPATEN BONDOWOSO', '', NULL, NULL),
(1303, '2025', '2021201018', 'INFITAHUL AIMMAH', 'P', 2, 'Banyuputih', 'Situbondo', 'Jawa Timur', 'Tasi Akad Wakalah Dalam Transaksi Jual Beli Online Di Platform Marketplace', 'Terverifikasi', NULL, NULL),
(1304, '2025', '2021301123', 'NUR LAELATUL MUKAROMAH', 'P', 8, 'Melaya', 'Jembrana', 'Bali', '\"Implementasi   Metode  Make A Match  Dalam Meningkatan Keaktifan  Siswa Pada Mata Pelajaran Fiqih  Bab Sholat Fardu Jama’ Dan Qosor Kelas Vii A Mts Negeri  3 Jembrana  Bali  Tahun Pelajaran ', NULL, NULL, NULL),
(1305, '2025', '2021702050', 'SARIFAH MAULIDIATUL J.', 'P', 19, 'Sukowono', 'Jember', 'Jawa Timur', 'Analis Yuridis Kewenangan Kejaksaan Melakukan Operasi Tangkap Tangan Dalam Upaya Penindakan Dan Pemberantasan Korupsi', '', NULL, NULL),
(1306, '2025', '2021204101', 'SRI WAHYUNI', 'P', 5, 'Mlandingan', 'Situbondo', 'Jawa Timur', '\"Analisis Penetapan Harga Jual Dalam Upaya Meningkatkan Provitabilitas', NULL, NULL, NULL),
(1307, '2025', '202140138', 'IKA SUKMA FITRIYANTI', 'P', 7, 'Singojuruh', 'Banyuwangi', 'Jawa Timur', 'Analisis Reorika Komunikasi Ustadz Ghofar Dalam Penyampaian Dakwah Pada Channel Youtube Ghofur Rohim', 'Terverifikasi', NULL, NULL),
(1308, '2025', '202140143', 'WASSAMATUL HIKMAH', 'P', 7, 'Rungkut', 'Kota Surabaya', 'Jawa Timur', 'Analisis Program Padhange Ati  Di Jtv Surabaya Menurut Dakwah Islam', 'Terverifikasi', NULL, NULL),
(1309, '2025', '2021502061', 'SITI ROMLAH', 'P', 16, 'PANJI', 'SITUBONDO', 'Jawa Timur', 'Implementasi Algoritma Random Forest Untuk Mengklasifikasi Hasil Pengobatan Kesehatan Mental', 'Terverifikasi', NULL, NULL),
(1310, '2025', '2021204039', 'MUHAMMAD TANZIL FURQONI', 'L', 5, 'RAMBIPUJI', 'Jember', 'Jawa Timur', 'PENGARUH KUALITAS PRODUK DAN CITRA MEREK TERHADAP KEPUTUSAN PEMBELIAN (Studi Kasus CV Dlima Anam Mas Rambipuji Jember)', 'Terverifikasi', NULL, NULL),
(1311, '2025', '202140122', 'M. PANDU WIDARTA', 'L', 7, 'PRAYA BARAT DAYA', 'KAB. LOMBOK TENGAH', 'Nusa Tenggara Barat', '\"POLA KOMUNIKASI PENGURUS PESANTREN ', NULL, NULL, NULL),
(1312, '2025', '2021503126', 'NUR AIZAH', 'P', 17, 'PANJI', 'SITUBONDO', 'Jawa Timur', 'PERBANDINGAN EFEKTIVITAS METODE K-NEAREST NEIGHBOR DAN NAÏVE BAYES DALAM DATA PENGAMATAN KESEHATAN TANAMAN', 'Terverifikasi', NULL, NULL),
(1313, '2025', '2021301047', 'Muh. Haryanto', 'L', 8, 'K. Walkabubak', 'Sumba Barat', 'NTT', '\"PEMBELAJARAN TUTOR SEBAYA (PEER TEACHING) MATA PELAJARAN PENDIDIKAN AGAMA ISLAM DALAM PENINGKATAN MOTIVASI BELAJAR SISWA DI SMPN 1 ASEMBAGUS', NULL, NULL, NULL),
(1314, '2025', '2021201042', 'TIARATUL IMANIA', 'P', 2, 'Botolinggo', 'Bondowoso', 'Jawa Timur', 'Pandangan Hukum Ekonomi Syariah Terhadap Pelaksanaan Lelang Barang Jaminan Gadai Pada Upc Pegadaian Kabupaten Bondowoso (Studi Kasus Upc Pegadaian Jawa Timur Unit Cabang Bondowoso)', 'Terverifikasi', NULL, NULL),
(1315, '2025', '2021204099', 'MURISATUL BULQIAH HASAN', 'P', 5, 'Sukowono', 'Jember', 'Jawa Timur', 'Implementasi Manajemen Sumber Daya Insani (Msdi) Dalam Meningkatkan Kualitas Pelayanan (Studi Kasus Tour Travel Haji Dan Umroh  Kbihu Al-Multazam Di Cangkring Jenggawah Kabupaten Jember)', 'Terverifikasi', NULL, NULL),
(1316, '2025', '2021301024', 'MOH FARHAN RIZALDI', 'L', 8, 'Banyuputih', 'Situbondo', 'JAWA TIMUR', 'PENGGUNAAN MEDIA PEMBELAJARAN BERBASIS POWERPOINT DALAM MENINGKATKAN MOTIVASI BELAJAR PESERTA DIDIK KELAS IX PADA MATA PELAJARAN PENDIDIKAN AGAMA ISLAM DI SMP NEGERI 1 BANYUPUTIH SITUBONDO TAHUN PELAJARAN 2024/2025', '', NULL, NULL),
(1317, '2025', '2021301048', 'M. ANTONI FAHRUROZI', 'L', 8, 'Praya B', 'Lombok Tengah', 'NTB', 'PERAN GURU DALAM PEMBINAAN RITUAL SOLAT FARDU MELALUI BUKU PANDUAN KAIFA TUSHOLLY :( Studi Kasus di SMP Plus Fityani Pujon-Malang  Tahun Pelajaran 2024-2025 )', 'Terverifikasi', NULL, NULL),
(1318, '2025', '2021702056', 'UKHTUL ISTIFADAH', 'P', 19, 'Sukodono', 'Lumajang', 'Jawa Timur', 'Penyelesaian Hukum Terhadap Kesaalahan Prosedur Penangkapan Oleh Penyidik Atas Korban Salah Tangkap', '', NULL, NULL),
(1319, '2025', '2021303001', 'ALVI NADIA', 'P', 10, 'Banyuputih', 'Situbondo', 'Jawa Timur', 'Penerapan Metode Bermain Bowling Aritmatika Untuk Mengembangkan Kemampuan Matematika Permulaan Kelompok B Di Ra Ibrahimy Sukorejo Pada Tahun Pelajaran 2025/2026', '', NULL, NULL),
(1320, '2025', '2021703046', 'KAMILATUS SU\'ADAH', 'P', 18, 'Tabanan', 'Tabanan', 'Bali', 'Analisis Pengelolaan Keuangan Badan Usaha Milik Desa (Bumdes) Bumi Pertiwi Jungkat Berdasarkan Pp No 11 Tahun 2021 Di Desa Jungkat Kecamatan Raas Kabupaten Sumenep', '', NULL, NULL),
(1321, '2025', '2021703045', 'SITI ROMLAH', 'P', 18, 'Banyuputih', 'Situbondo', 'Jawa Timur', 'Analisis Tingkat Kinerja Keuangan Dengan Metode Du Pont Periode 2023/2024 Pada Koperasi Musa’adah Pp. Salafiyah Syafi’iyah Sukorejo', 'Terverifikasi', NULL, NULL),
(1322, '2025', '2021301094', 'FATMAWATI', 'P', 8, 'Kampung Baru', 'Buleleng', 'Bali', 'Pelaksanaan P5 Dengan Dzikir Basmalah Dalam Pembentukan Karakter Budi Pekerti Siswi Kelas X Di Sma Ibrahimy 2 Sukorejo Tahun Pelajaran 2024-2025', '', NULL, NULL),
(1323, '2025', '2021701009', 'MUHAMMAD BRIAN LINTANG ADZANI', 'L', 20, 'MUNCAR', 'KAB. BANYUWANGI', 'Jawa Timur', 'Hubungan Antara Rasa Syukur dan Dukungan Sosial Dengan Kesejahteraan Psikologi Pada Santri Salafiyah Syafi’iyah Sukorejo', 'Terverifikasi', NULL, NULL),
(1324, '2025', '2021701042', 'RISMA NOVIANA DEWI', 'P', 20, 'Kabat', 'Banyuwangi', 'Jawa Timur', 'Dinamika Dukungan Sosial Pada Kepala Kamar Di Asrama Ma’had Aly Pondok Pesantren Salafiyah Syafi’iyah Sukoejo Situbondo', '', NULL, NULL),
(1325, '2025', '2021202012', 'HABIB RAHMAN', 'L', 4, 'PANDAN', 'TAPANULI TENGAH', 'SUMATERA UTARA', 'SAMPUL PERSPEKTIF HUKUM ISLAM TERHADAP TRADISI KATOPAK DALAM ACARA RESEPSI PERNIKAHAN (Studi Kasus di Desa Tonduk Kecamatan Ra’as Kabupaten Sumenep)', 'Terverifikasi', NULL, NULL),
(1326, '2025', '2021204008', 'Ahmad Rusdi Mubarok', 'L', 5, 'Cermee', 'Bondowoso', 'Jawa Timur', '\"ANALISIS STRATEGI PEMASARAN SYARIAH DALAM MENINGKATKAN VOLUME PENJUALAN', NULL, NULL, NULL),
(1327, '2025', '2021701043', 'KAMILATUL UMAMAH A.', 'P', 20, 'Besuki', 'Situbondo', 'Jawa Timur', 'Pengaruh Media Sosial Terhadap Kesehatan Mental Siswa Mts Al-Amanah Besuki', '', NULL, NULL),
(1328, '2025', '20200301013', 'Dimas Wahyu Oktaviansyah', 'L', 8, 'Seririt', 'Buleleng', 'Bali', 'PENERAPAN METODE BERMAIN PERAN DALAM MENINGKATKAN HASIL BELAJAR MATERI SEJARAH KEBUDAYAAN ISLAM KELAS VII DI MTs NURUL KHOLIS PEBUAHAN JEMBRANA BALI TAHUN PELAJARAN 2024/2025', '', NULL, NULL),
(1329, '2025', '2021303031', 'SRI NINGSIH', 'P', 10, 'JANGKAR', 'SITUBONDO', 'JAWA TIMUR', 'Implementasi Metode Project Based Learning (PjBL) untuk meningkatkan kreativitas anak', 'Terverifikasi', NULL, NULL),
(1330, '2025', '2021303030', 'SRI LINDAYANI', 'P', 10, 'MLANDINGAN', 'SITUBONDO', 'JAWA TIMUR', 'Penerapan Proyek Penguatan Profil Pelajar Pancasila Melalui Kegiatan Eksperimen Kristal Garam Untuk Meningkatkan Kognitif Anak Kelompok B RA Darul Falah Mlandingan Tahun Pelajaran 2024/2025', 'Terverifikasi', NULL, NULL),
(1331, '2025', '2021303037', 'Wasilah', 'P', 10, 'Bungatan', 'Situbondo', 'Jawa TImur', 'Meningkatkan kreativitas anak usia dini menggunakan media loose part di TK Baitul Qur\'an Al islamy kelompok B desa bletok', 'Terverifikasi', NULL, NULL),
(1332, '2025', '2021205012', 'LAILATUL MUKARROMAH', 'P', 1, 'Banyuputih', 'Situbondo', 'Jawa Timur', 'Penerapan Psak 107 Pada Transaksi Gadai Emas Syariah Di Pt. Bank Syariah Indonesia Kcp Situbondo Basuki Rahmat', 'Terverifikasi', NULL, NULL),
(1333, '2025', '2021205026', 'WALIATUL FAJRIN', 'P', 1, 'Banyuputih', 'Situbondo', 'Jawa Timur', 'Analisis Perlakuan Akuntansi Murabahah Berdasarkan Psak 102 Pada Pembiayaan Produk Bsi Griya Hasanah Di Bank Syariah Indonesia Kcp Situbondo  Basuki Rahmat', 'Terverifikasi', NULL, NULL),
(1334, '2025', '2021703054', 'VIVI OCTAVIA  DELA', 'P', 18, 'Wonosari', 'Bondowoso', 'Jawa Timur', 'Analisis Pengelolaan Limbah Dan Penerapan Corporate Social Responsibility (Csr) Pada Pabrik Tempe Maknyoess Ala Bapak Mamak (Studi Kasus Di Desa Koparsih Kecamatan Wonosari Kabupaten Bondowoso)', '', NULL, NULL),
(1335, '2025', '2021703040', 'JAMILA REGINA PUTRI', 'P', 18, 'Asembagus', 'Situbondo', 'Jawa Timur', 'Analisis Pengendalian Internal Penggajian Pada Cabang Pt. Indomobil Prima Energi (Studi Kasus Spbu Cabang Pt. Indomobil Prima Energi Kecamatan Jangkar Kabupaten Situbondo)', '', NULL, NULL),
(1336, '2025', '2021504030', 'SITTI MAIMUNAH', 'P', 12, 'Sumberjambe', 'Jember', 'Jawa Timur', '\"Penerapan Konsep Sustainable Design ', NULL, NULL, NULL),
(1337, '2025', '2021201023', 'SITI KHOIROTUN NISA\'', 'P', 2, 'Cermee', 'Bondowoso', 'Jawa Timur', 'Perspektif Hukum Ekonomi Syari’ah Terhadap Hadiah Kupon Undian Tabungan Hari Raya (Studi Kasus Di Azana Barokah Desa Ramban Kulon Kecamatan Cermee Kabupaten Bondowoso)', '', NULL, NULL),
(1338, '2025', '2021504012', 'NOVESHA ALVIANI', 'P', 12, 'Sukowono', 'Jember', 'Jawa Timur', 'Perancangan Ruang Seni Pertunjukan Berbasis Kearifan Lokal Bali Di Desa Adat Tuban Kabupaten Badung Dengan Pendekatan Desain Arsitektur Tradisional Bali', 'Terverifikasi', NULL, NULL),
(1339, '2025', '2021301092', 'FATEHATUL HASINAH', 'P', 8, 'Sangkapura', 'Gresik', 'Jawa Timur', 'Standar Input Dalam Meningkatkan Materi Keislaman Siswa Baru Di Smpn 6 Batam Tahun Ajaran 2024/2025', '', NULL, NULL),
(1340, '2025', '2021504026', 'RAUDATUL AMANIYAH', 'P', 12, 'GIRI', 'BANYUWANGI', '', 'Perancangan Pusat Budaya Dengan Konsep Arsitektur Tradisional Osing Di Desa Kemiren, Kecamatan Glagah, Kabupaten Banyuwangi', 'Terverifikasi', NULL, NULL),
(1341, '2025', '2021301101', 'HANIF LIFIYAH SARI', 'P', 8, 'Sempol', 'Bondowoso', 'Jawa Timur', 'Problematika Penerapan Kurikulum Merdeka Pada Pembelajaran Pendidikan Agama Islam Di Smp Negeri 1 Ijen Tahun Pelajaran 2024-2025 Bondowoso', 'Terverifikasi', NULL, NULL),
(1342, '2025', '2021020332', 'HANI ROHMATUL ULA', 'P', 8, 'Kartanegara', 'Purbalingga', 'Jawa Tengah', 'Penerapan Metode Think Pair Share Dalam Meningkatan Hasil  Belajar Siswa Pada Mata Pelajaran Fiqih Kelas III D Di Madrasah Ta’hiliyah Sukorejo 2024-2025', '', NULL, NULL),
(1343, '2025', '2021504022', 'LAILATUL FITRIYAH', 'P', 12, 'Jenggawah', 'Jember', 'Jawa Timur', 'Perancangan Desain Gudang Pengeringan Tembakau Di Desa Kemuning Kabupaten Jember Dengan Penerapan Konsep Greenhouse', 'Terverifikasi', NULL, NULL),
(1344, '2025', '2021701047', 'NOVITA', 'P', 20, 'Magersari', 'Mojokerto', 'Jawa Timur', 'Hubungan Religiusitas Dengan Stres Akademik Mahasantri Ma’had Aly Salafiyah Syafi’iyah Situbondo', 'Terverifikasi', NULL, NULL),
(1345, '2025', '2021202030', 'SYAHFITROH FIQRI', 'L', 4, 'Penjaringan', 'Jakarta Utara', 'DKI Jakarta', 'PERSPEKTIF HUKUM ISLAM TERHADAP PERNIKAHAN BEDA SUKU PADA ADAT BETAWI', 'Terverifikasi', NULL, NULL),
(1346, '2025', '20200301039', 'MUHAMMAD BAGUS ZIDNI ILMAN', 'L', 8, 'WONOSARI', 'KAB. BONDOWOSO', 'Jawa Timur', 'STRATEGI GURU AL QUR’AN HADITS DALAM PENINGKATAN KEMAMPUAN MEMBACA AL QUR’AN SISWA KELAS VII DI MTs MANBAUL ULUM BONDOWOSO TAHUN PELAJARAN 2024/2025', '', NULL, NULL),
(1347, '2025', '2021201035', 'NAILUL MARAM', 'P', 2, 'Nonggunong', 'Sumenep', 'Jawa Timur', '\"Perspektif Hukum Ekonomi Syari’Ah Terhadap Pembatalan Akad Jual Beli Berpanjar Pada Jual Beli Sapi Karapan', NULL, NULL, NULL),
(1348, '2025', '2021301119', 'NUR AZIZAH', 'P', 8, 'Banyuputih', 'Situbondo', 'Jawa Timur', 'Pembelajaran Pendidikan Agama Islam Berbasis Diskusi Kelompok Untuk Meningkatkan Keterampilan Komunikasi Siswa Kelas VIII C Di SMPN 1 Arjasa Tahun Pelajaran 2024/2025', '', NULL, NULL),
(1349, '2025', '2021301132', 'SITI MARYAM', 'P', 8, 'Banyuputih', 'Situbondo', 'Jawa Timur', 'Pengembangan Buku Saku Berbasis Mind Mapping Pada Materi Bmk Untuk Meningkatkan Hasil Belajar Siswa Madrasah Aliyah Salafiyah Syafi’iyah Putri', '', NULL, NULL),
(1350, '2025', '2021301122', 'NUR KHARISMA', 'P', 8, 'Banyuputih', 'Situbondo', 'Jawa Timur', 'Kreativitas Guru Pai Dalam Mengelola Kelas Untuk Peningkatkan Keaktifan Belajar Siswa Di Kelas Ix C Smpn 1 Arjasa Tahun Pelajaran 2024-2025', '', NULL, NULL),
(1351, '2025', '2021204015', 'IKRAM MUKHLIS', 'L', 5, 'RA\'AS', 'SUMENEP', 'Jawa Timur', 'IMPLEMENTASI MANAJEMEN PEMASARAN SYARIAH DALAM MENINGKATKAN VOLUME PENJUALAN DI TOKO AL-BAROKAH RA’AS SUMENEP', 'Terverifikasi', NULL, NULL),
(1352, '2025', '2021203030', 'AISHA TURRADIA', 'P', 3, 'Dungkek', 'Sumenep', 'Jawa Timur', 'Pengaruh Efektivitas Dan Efisiensi Penggunaan Sistem Pembayaran Non-Tunai (Cashless Payment) Berbasis Kartu (El-Santri) Terhadap Kepuasan Belanja Santri (Studi Kasus Di Asrama Ma’had Aly Putri Pondok Pesantren Salafiah Syafi’iyah Sukorejo)', 'Terverifikasi', NULL, NULL),
(1353, '2025', '2021501012', 'HAMZANWADI', 'L', 15, 'Wanasaba', 'Lombok Timur', 'NTB', 'RANCANG BANGUN PROTOTYPE SISTEM PENGERING PADI OTOMATIS BERBASIS INTERNET OF THINGS', '', NULL, NULL),
(1354, '2025', '2021204022', 'MOCH. SHOLEHUDDIN A.', 'L', 5, 'BUBUTAN', 'SURABAYA', 'JAWA TIMUR', 'IMPLEMENTASI MANAJEMEN SUMBER DAYA INSANI DALAM PENINGKATAN KINERJA KARYAWAN. (STUDI KASUS KSPPS BMT AMANAH UMMAH GAYUNGAN JEMUR WONOSARI SURABAYA).', 'Terverifikasi', NULL, NULL),
(1355, '2025', '2021504018', 'ARFATIL HAQIKAH', 'P', 12, 'Talkandang', 'Situbondo', 'Jawa Timur', 'Desain Glamping Eco-Friendly Untuk Mendukung Wisata Ramah Lingkungan Di Pantai Pathek Kecamatan Panarukan, Kabupaten Situbondo', 'Terverifikasi', NULL, NULL),
(1356, '2025', '2021504025', 'PUJA TRISNANING ARIYAWATI', 'P', 12, 'Jangkar', 'Situbondo', 'Jawa Timur', 'Perancangan Kafe Di Kawasan Pesisir Pelabuhan Jangkar Dengan Pendekatan Lanskap Tropis Untuk Meningkatkan Daya Tarik Wisatawan', '', NULL, NULL),
(1357, '2025', '2021504021', 'KHOTMAH DZIKRO M.', 'P', 12, 'Tlogosari', 'Bondowoso', 'Jawa Timur', 'Perancangan Museum Kereta Api Bondowoso Dengan Konsep Reuse Bangunan Terbengkalai Dengan Pendekatan Arsitektur Hijau', 'Terverifikasi', NULL, NULL),
(1358, '2025', '2021504031', 'SYARIFAH. S.A', 'P', 12, 'BESUKI', 'SITUBONDO', '', 'Perancangan Pasar Trasidional Kec.Besuki, Kab.Situbondo Untuk Meningkatkan Perekonomian Daerah Dengan Nilai Harritage Berbasis Arsitektur Berkelanjutan', '', NULL, NULL),
(1359, '2025', '2021201053', 'WINDI TRI HANDAYANI', 'P', 2, 'Jelbuk', 'Jember', 'Jawa Timur', 'Tinjauan Hukum Islam Terhadap Jual Beli Kulit Sapi Dengan Sistem Taksir Study Kasus Di Desa Suger Kidul 01 Kecamatan Jelbuk Kabupaten Jember', '', NULL, NULL),
(1360, '2025', '2021505001', 'AINI NUR ARIFAH', 'P', 14, 'Banyuputih', 'Situbondo', 'Jawa Timur', 'Daya Terima Dan Karakteristik Kimia Dimsum Ikan Petek (Leiognathus Sp.) Dan Wortel (Daucus Carota)  Sebagai Produk Diversifikasi Pangan', 'Terverifikasi', NULL, NULL),
(1361, '2025', '2021504023', 'MUHAMMAD ROYHAN', 'L', 12, 'JANGKAR', 'KAB. SITUBONDO', 'Jawa Timur', 'PERANCANGAN PELABUHAN WISATA DENGAN KONSEP ARSITEKTUR NEO VERNAKULAR DI PELABUHAN JANGKAR SITUBONDO', 'Terverifikasi', NULL, NULL),
(1362, '2025', '2021703014', 'MOCHAMAD CHOFIFI', 'L', 18, 'DENPASAR BARAT', 'KOTA DENPASAR', 'Bali', 'PENERAPAN ISAK NO. 35 TENTANG PENYAJIAN LAPORAN KEUANGAN PADA ENTITAS BERORIENTASI NONLABA (Studi Kasus pada Masjid Suci Denpasar Bali)', 'Terverifikasi', NULL, NULL),
(1363, '2025', '2021202021', 'NURDINA KAMELIA', 'P', 2, 'Jangkar', 'Situbondo', 'Jawa Timur', '\"Analisis Maslahah Mursalah Terhadap Putusan Pengadilan Agama Nomor: 530/Pdt.P/2023/Pa.Bdw Tentang Isbath Nikah Yang Ditolak', NULL, NULL, NULL),
(1364, '2025', '2021303038', 'Wildatur Rofiah', 'P', 10, 'Tapen', 'Bondowoso', 'Jawa Timur', 'Pengembangan Media Buku Flanel untuk Meningkatkan Pemahaman Konsep Matematika Permulaan pada Anak Kelompok A Usia 4-5 Tahun di TK Mawar 01Tapen Bondowoso Tahun Pelajaran 2024/2025', 'Terverifikasi', NULL, NULL),
(1365, '2025', '2020303012', 'Ika Rahmawati', 'P', 10, 'Banyuputih', 'Situbondo', 'Jawa Timur', 'MENINGKATKAN KEMAMPUAN MOTORIK HALUS ANAK MELALUITEKNIK MOZAIK PADA KELOMPOK B3 DI RA IBRAHIMY SUKOREJO SUMBERJO BANYUPUTIH SITUBONDO TAHUN PELAJARAN 2024/2025', 'Terverifikasi', NULL, NULL),
(1366, '2025', '2019303043', 'Ritmatus Saleha', 'P', 10, 'Bungatan', 'Situbondo', 'Jawa Timur', 'UPAYA MENINGKATKAN KEMAMPUAN BERBAHASA ANAK DENGAN METODE BERCERITA BEBAS PADA KELOMPOK B TK HASYIM ASY\'ARI BUNGATAN SITUBONDO TAHUN PELAJARAN 2024/2025', 'Terverifikasi', NULL, NULL),
(1367, '2025', '2020501011', 'MABSUR AL - FANDARIS', 'L', 15, 'Rubaru', 'Sumenep', 'Jawa Timur', 'ABSENSI MENGGUNAKAN RFID BERBASIS IOT DI SEKOLAH SMPI AL MASTHURIYAH SUMENEP MADURA', '', NULL, NULL),
(1368, '2025', '2021204006', 'Ahmad Noval Hamidi', 'L', 5, 'J. Darus Sholah', 'Bondowoso', 'Jawa Timur', 'ANALISIS STRATEGI MANAJEMEN PEMASARAN SYARIAH DALAM   MENINGKATKAN MINAT KONSUMEN PADA UD. NANO COLLECTION PURBOSARI BONDOWOSO', 'Terverifikasi', NULL, NULL),
(1369, '2025', '2021701051', 'SITI ROIDATUN NABILA', 'P', 20, 'Silo', 'Jember', 'Jawa Timur', 'Hubungan Motivasi Akademik Dan Burnout Dengan Performansi Akademik Siswi Unggulan Smp Ibrahimy 3 Sukorejo Di Imaroh As – Shofwah', '', NULL, NULL),
(1370, '2025', '2021701027', 'HIKMATUL KAMILA', 'L', 20, 'Kalipuro', 'Banyuwangi', 'Jawa Timur', 'Hubungan Fear Of Missing Out Sosial Media Terhadap Psychological Well-Being Di Sma Nahdlatul Ulama Gombeng Sari Banyuwangi', '', NULL, NULL),
(1371, '2025', '2021204069', 'HARYANA TUL Q.', 'P', 5, 'Dungkek', 'Sumenep', 'Jawa Timur', 'Strategi Manajemen Pemasaran Syariah Dalam Upaya Meningkatkan Penjualan Di Swalayan Quatro Nu Mangaran Situbondo', 'Terverifikasi', NULL, NULL),
(1372, '2025', '2021303049', 'SUYATIN IZZA', 'P', 10, 'ASEMBAGUS', 'SITUBONDO', 'JAWA TIMUR', 'Meningkatkan Kemampuan Kognitif Anak kelompok A dengan Media Ular Tangga di TK NU Al-Islam Kedunglo Tahun Pelajaran 2024/2025', 'Terverifikasi', NULL, NULL),
(1373, '2025', '2021303036', 'Muizatul khasanah', 'P', 10, 'Bungatan', 'Situbondo', 'Jawa Timur', 'Penggunaan media busy book untuk meningkatkan pemahaman kesehatan gigi pada anak kelompok B RA Madinatul ulum selowogo kecamatan bungatan kabupaten Situbondo tahun pelajaran 2024/2025', 'Terverifikasi', NULL, NULL),
(1374, '2025', '202140120', 'LALU AAN HIDAYAT', 'L', 7, 'PRAYA BARAT', 'KAB. LOMBOK TENGAH', 'Nusa Tenggara Barat', '\"STRATEGI DAKWAH TGH. SABARUDIN ', NULL, NULL, NULL),
(1375, '2025', '2021301085', 'ANGGUN RIZKIA', 'P', 8, 'Glagah', 'Banyuwangi', 'Jawa Timur', 'Implementasi Metode Yanbu’a Dan Qiroati Untuk Meningkatkan Kemampuan Membaca Al-Qur’an ( Studi Komparasi Kelas Vii Di Smp Unggulan Hidayatun Najah Dan Mts Masyaul Huda )', 'Terverifikasi', NULL, NULL),
(1376, '2025', '2021205037', 'ANA LUTFIAH', 'P', 1, 'Pesanggaran', 'Banyuwangi', 'Jawa Timur', 'ANALISIS PERBEDAAN KINERJA KEUANGAN BANK KONVENSIONAL DAN BANK SYARIAH YANG TELAH TERDAFTAR DI BURSA EFEK INDONESIA (BEI) PERIODE 2022-2024', 'Terverifikasi', NULL, NULL),
(1377, '2025', '2021603038', 'ZAKIATUN NAVISAH', 'P', 22, 'SINGOJURUH', 'BANYUWANGI', '', 'EFEK APLIKASI AKU TAHU AKU SIAP “ATASI” TERHADAP PENGETAHUAN PENYIAPAN KEHIDUPAN BERKELUARGA BERBASIS ISLAM DAN KESEHATAN PADA REMAJA DI SMK IHYA’ ULUMMUDIN SINGOJURUH  BANYUWANGI', '', NULL, NULL),
(1378, '2025', '2021302040', 'LAILATUL BADRIYAH', 'P', 9, 'Kalisat', 'Jember', 'Jawa Timur', 'Pengembangan Video Pembelajaran Dalam Meningkatkan Maharah Istima’ Siswa Kelas Iii Di Madrasah Muassasah Al – Kautsar Kalisat Jember Tahun Pelajaran 2024/2025', 'Terverifikasi', NULL, NULL),
(1379, '2025', '2021701032', 'Maslahatul Sakinatuzzahra', 'P', 20, 'Telukjambe Timur', 'Karawang', 'Jawa Timur', 'Hubungan Lingkungan Belajar Dan Tingkat Kecemasan Dengan Performansi Belajar Siswa Kelas X Sma Ibrahimy 2 Sukorejo', '', NULL, NULL),
(1380, '2025', '2021703013', 'MOCH. FAISAL AMIN', 'L', 18, 'TLOGOSARI', 'KAB. BONDOWOSO', 'Jawa Timur', '\"ANALISIS PERHITUNGAN HARGA POKOK PRODUKSI DENGAN METODE FULL COSTING', NULL, NULL, NULL),
(1381, '2025', '202140210', 'IZLAN HASIM', 'L', 6, 'PRAYA', 'KAB. LOMBOK TENGAH', 'Nusa Tenggara Barat', 'Peran Penyuluh Agama Islam dalam Mencegah Kasus Terjadinya Perceraian di Usia Dini', 'Permohonan Terkirim', NULL, NULL),
(1382, '2025', '2020201011', 'Kholilur Rahman', 'L', 2, 'Nonggunong', 'Sumenep', 'Jawa Timur', 'TINJAUAN HUKUM ISLAM TERHADAP PENGALIHAN UANG KEMBALIAN PADA TRANSAKSI JUAL BELI DI PERTOKOAN UD ASSYARIF PONDOK PESANTREN SALAFIYAH SYAFI’IYAH SUKOREJO SITUBONDO', '', NULL, NULL),
(1383, '2025', '2021204074', 'LAILATUL FITRIYAH', 'P', 5, 'Batang-Batang', 'Sumenep', 'Jawa Timur', '\"Pengaruh Kepemimpinan Dan Motivasi Kerja Terhadap Kinerja Karyawan ', NULL, NULL, NULL),
(1384, '2025', '2021204009', 'AHMAD UBAIDILLA', 'L', 5, 'BANYUPUTIH', 'KAB. SITUBONDO', 'Jawa Timur', 'MANAJEMEN STRATEGI PEMASARAN SYARIAH DALAM MENINGKATKAN MINAT KONSUMEN DI SEKAT CLOTHING PESANGGRAHAN  JANGKAR SITUBONDO', 'Terverifikasi', NULL, NULL),
(1385, '2025', '2008302021', 'DIKI WAHYUDI', 'L', 9, 'KALIPURO', 'KAB. BANYUWANGI', 'JAWA TIMUR', 'PENGEMBANGAN BUKU MUFRODAT AL-YAUMIYYAH BERBASIS IBARAH DALAM MENINGKATKAN MAHARATUL KALAM SISWA KELAS X MA FATHUL ULUM WANGKAL KALIPURO BANYUWANGI TAHUN PELAJARAN 2024-2025', 'Terverifikasi', NULL, NULL),
(1386, '2025', '2021704022', 'NUR ILYANA QISTINA', 'P', 21, 'Cermee', 'Bondowoso', 'Jawa Timur', 'Students’ Perception Of Duolingo Application And Effect On Students’ Grammar Mastery At The Tenth Grade Of Sma Ibrahimy 02 Sukorejo', 'Terverifikasi', NULL, NULL),
(1387, '2025', '2021703015', 'M. DANIAL ISLAMI', 'L', 18, 'MUNCAR', 'KAB. BANYUWANGI', 'Jawa Timur', 'PERANCANGAN SISTEM INFORMASI AKUNTANSI PENGGAJIAN BERBASIS VISUAL BASIC FOR APPLICATION (VBA) EXCEL PADA MI DARUL ULUM II MUNCAR', '', NULL, NULL),
(1388, '2025', '2021204085', 'MIFTAHUL ULUM', 'L', 5, 'GAYAM', 'Sumenep', 'Jawa Timur', 'STRATEGI PROMOSI SYARI’AH DALAM MENINGKATKAN MINAT NASABAH BERDASARKAN ETIKA BISNIS ISLAM DI KSPPS BMT NU JAWA TIMUR CABANG GAYAM SAPUDI', 'Terverifikasi', NULL, NULL),
(1389, '2025', '2021702001', 'ABDUSSYUKUR ALKHAWAJIKI', 'L', 19, 'TAMBAK', 'KAB. GRESIK', 'Jawa Timur', 'UPAYA PENEGAKAN HUKUM TERHADAP PELAKU MAIN HAKIM SENDIRI (EIGENRICHTING)” PADA PELAKU TINDAK PIDANA TERTANGKAP TANGAN', 'Terverifikasi', NULL, NULL),
(1390, '2025', '2021701008', 'MUHAMMAD ASRORI', 'L', 20, 'PRAYA', 'KAB. LOMBOK TENGAH', 'Nusa Tenggara Barat', 'HUBUNGAN ANTARA KECERDASAN EMOSI DENGAN PENYESUAIAN DIRI SANTRI BARU PONDOK PESANTREN NURUL ULUM MERTAK TOMBOK', 'Terverifikasi', NULL, NULL),
(1391, '2025', '2021205006', 'EFSILIA AKYUNINA', 'P', 1, 'Nonggunong', 'Sumenep', 'Jawa Timur', 'Analisis Kinerja Keuangan Dengan Pendekatan Value Formoney Terhadap Bprs Bhakti Sumekar', 'Terverifikasi', NULL, NULL),
(1392, '2025', '2021704010', 'ANISATUL ULUM', 'P', 21, 'Banyuputih', 'Situbondo', 'Jawa Timur', 'The Correlation Between Multiple Intelligences And Students’ Speaking Skill In English Speaking Program At Ibrahimy University Salafiyah Syafi’iyah Sukorejo Islamic Boarding School', '', NULL, NULL),
(1393, '2025', '2020703045', 'ACHMAD ROHIL', 'L', 18, 'Banyuputih', 'Situbondo', 'Jawa Timur', 'ANALISIS KEPATUHAN PENYUSUNAN RKPDES DESA SUMBEREJO KECAMATAN BANYUPUTIH KABUPATEN SITUBONDO BERDASARKAN PERMENDAGRI NO.114 TAHUN 2014', '', NULL, NULL),
(1394, '2025', '2021301041', 'MOH ALFIN ILHAM PRIYADI', 'L', 8, 'BANYUPUTIH', 'SITUBONDO', 'JAWA TIMUR', 'PEMBINAAN SENI BACAAN AL-QUR’AN OLEH JAM’IYAH QURRO’ WAL KHOTTOTIN (JQK) KHUSUSNYA SANTRI REMAJA DAN DEWASA DI PONDOK PESANTREN SLAFIYAH SYAFI’IYAH SUKOREJO TAHUN PELAJARAN 2024/2025', '', NULL, NULL),
(1395, '2025', '2021504017', 'AINUL KAROMY', 'L', 12, 'BANYUPUTIH', 'KAB. SITUBONDO', 'Jawa Timur', 'PERANCANGAN RUMAH TINGGAL MINIMALIS MODERN DENGAN PENEKANAN PADA FLEKSIBILITAS RUANG DAN OPTIMALISASI PENCAHAYAAN ALAMI DI SUKOREJO SITUBONDO', '', NULL, NULL),
(1396, '2025', '2022506030', 'MUHAMMAD FAUZI ASEPTIAN', 'L', 13, 'KENDIT', 'SITUBONDO', 'JAWA TIMUR', 'PENGUKURAN KONSENTRASI AMONIAK DAN NITRIT PADA KEGIATAN BUDIDAYA UDANG VANAME (Litopenaeus vannamei) DI BALAI PERIKANAN BUDIDAYA AIR PAYAU SITUBONDO', 'Terverifikasi', NULL, NULL),
(1397, '2025', '2021303034', 'TIJANIYAH', 'P', 10, 'SITUBONDO', 'SITUBONDO', 'JAWA TIMUR', 'PENGGUNAAN MEDIA POP UP BOOK CERITA BINATANG UNTUK MENINGKATKAN PERKEMBANGAN BAHASA ANAK KELOMPOK A DI RA NURUL BAHRI TAHUN PELAJARAN 2024/2025', 'Terverifikasi', NULL, NULL),
(1398, '2025', '2022506035', 'YUSUF AMINULLAH', 'L', 13, 'Wuluhan', 'Jember', 'Jawa Timur', 'Deteksi Kelimpahan Bakteri Vibrio sp. dengan Metode Total Plate Count pada Sistem Budidaya Udang Vanname (Litopenaeus vannamei) di Laboratorium Kesehatan Ikan dan Lingkungan  BPBAP Situbondo', 'Terverifikasi', NULL, NULL),
(1399, '2025', '2021503124', 'BASMALIA', 'P', 17, 'ASEMBAGUS', 'SITUBONDO', 'JAWA TIMUR', 'Implementasi Multi Factor Evaluation Process ( MFEP) Untuk Pemilihan Kompetensi Keahlian di SMKN1 Banyuputih', 'Terverifikasi', NULL, NULL),
(1400, '2025', '2021503119', 'PRASTIKA BUYA HAKIM', 'P', 17, 'PANARUKAN', 'SITUBONDO', 'JAWA TIMUR', 'IMPLEMENTASI ORDER TRACKING PADA SISTEM INFORMASI MANAJEMEN LAUNDRY', 'Terverifikasi', NULL, NULL),
(1401, '2025', '2022506038', 'ZAINUR AL WAIS', 'L', 13, 'SUBUH', 'SITUBONDO', 'JAWA TIMUR', 'Teknik Pembesaran Udang Vaname Di tambak Millenial Shrimp Farm (MSF) Gundil BPBAP Situbondo', '', NULL, NULL),
(1402, '2025', '2020503007', 'Ahmad Muflih Wafir. S. A', 'L', 17, 'Negara', 'Jembrana', 'Bali', 'KLASIFIKASI PENYAKIT JANTUNG DENGAN METODE RANDOM FOREST', '', NULL, NULL),
(1403, '2025', '2021302019', 'MOH ZAINUL HUDA', 'L', 9, 'KALIPURO', 'KAB. BANYUWANGI', 'JAWA TIMUR', 'PENGEMBANGAN MEDIA PEMBELAJARAN BAHASA ARAB BERBASIS WEBSITE UNTUK SISWA KELAS X MADRASAH ALIYAH DARUL FALAH TAHUN PELAJARAN 2024/2025', 'Terverifikasi', NULL, NULL),
(1404, '2025', '2021301066', 'S. Muhammad Fathurroyyan', 'L', 8, 'Jujuhan Ilir', 'Bungo', 'Jambi', '\"IMPLEMENTASI METODE DISKUSI DALAM PENINGKTAN PEMAHAMAN SISWA KELAS IVB  PADA MATA PELAJARAN FIKIH DI MADRASAH TA’HILIYAH IBRAHIMY PONDOK PESANTREN SALAFIYAH SYAFI’IYAH SUKOREJO SITUBONDO', NULL, NULL, NULL),
(1405, '2025', '2021501041', 'RUSMAWATI', 'P', 15, 'Ra\'as', 'Sumenep', 'Jawa Timur', 'Rancang Bangun Prototipe Sistem Pemantauan Penggunaan Air Pada Rumah Kost Anindya Citra Di Badung Bali Menggunakan Iot', 'Terverifikasi', NULL, NULL),
(1406, '2025', '2021505007', 'SITI MUDRIKAH', 'P', 14, 'Pakuhaji', 'Tangerang', 'Banten', 'Analisis Karakteristik Total Bakteri, Kimia Dan Sensori Ikan Kurisi Marinasi Selama Penyimpanan Dingi', 'Terverifikasi', NULL, NULL),
(1407, '2025', '2021701062', 'ULY HUMAIROH', 'P', 20, 'Sempol', 'Bondowoso', 'Jawa Timur', 'Penerimaan Diri Orang Tua Pada Anak Tunarungu Di Desa Jampit Kecamatan Sempol Kabupaten Bondowoso', '', NULL, NULL),
(1408, '2025', '2021703007', 'DANNY PEBRIYANTO', 'L', 18, 'GEROKGAK', 'KAB. BULELENG', 'Bali', 'ANALISIS PENERAPAN AKUNTANSI BERDASARKAN SAK EMKM DENGAN PENGGUNAAN APLIKASI MICROSOFT EXCEL PADA UMKM DI KECAMATAN RA’AS-SUMENEP', '', NULL, NULL),
(1409, '2025', '2021502056', 'NORI NUR FASRATUL AINI', 'P', 16, 'Arjasa', 'Sumenep', 'Jawa Timur', 'Sistem Informasi Manajemen Jasa Pemesanan Photography  Dan Penggajian Di Studio 916 Berbasis Website', 'Terverifikasi', NULL, NULL),
(1410, '2025', '2022506002', 'ADHEN ANIL YAHYA', 'L', 13, '', 'JEMBER', '', '\"TEKNIK PEMBESARAN UDANG VANNAMEI (Litopenaeus vannamei)', NULL, NULL, NULL),
(1411, '2025', '2020702014', 'MOH JALU FIRMANSAH', 'L', 19, 'Jember', 'Jember', 'Jawa Timur', 'PERLINDUNGAN HAK-HAK ISTRI DAN ANAK PASCA PERCERAIAN YANG DIPUTUS SECARA VERSTEK PERSPEKTIF HUKUM POSITIF DAN HUKUM ISLAM (Studi Putusan No.931/Pdt.G/2022/PA.Jr)', '', NULL, NULL),
(1412, '2025', '202107218', 'MOH. SYAFI\'UL ALIM', 'L', 19, 'ARJASA', 'KAB. SUMENEP', 'Jawa Timur', 'ANALISIS YURIDIS REHABILITASI PELAKU ANAK DALAM PENYALAHGUNAAN NARKOTIKA', '', NULL, NULL),
(1413, '2025', '2021503068', 'TOLAK IDAYATI', 'P', 17, 'Jangkar', 'Situbondo', 'Jawa Timur', 'Sistem Pakar Penentuan Produk Dan Konsultasi Pelanggan Di Aesthetic Naomiqueen Menggunakan Metode Algoritma Genetika', 'Terverifikasi', NULL, NULL),
(1414, '2025', '2021701016', 'ANDINI FITRI MUANISAH', 'P', 20, 'Cluring', 'Banyuwangi', 'Jawa Timur', 'Hubungan Husnudzan Dan Sabar Dengan Manajemen Stres Pada Santri Pondok Full Day Sunan Ampel Banyuwangi', '', NULL, NULL),
(1415, '2025', '2020703017', 'ASYIQOTUL ABADIYAH', 'P', 18, 'Asembagus', 'Situbondo', 'Jawa Timur', 'Analisis Pengelolaan Laporan Keuangan Dana Bospmenggunakan Aplikasi Arkas 4.0 Berdasarkan Permen Dikbud Restek No.36 Tahun 2022 (Studi Kasus Di Smp Khamas Asembagus)', '', NULL, NULL),
(1416, '2025', '2021503102', 'AHMAD GUNAWAN', 'L', 17, 'JANGKAR', 'KAB. SITUBONDO', 'Jawa Timur', 'IMPLEMENTASI ALGORITMA NAÏVE BAYES KLASIFIKASI PENERIMA BANTUAN BLT DI DESA PESANGGRAHAN', 'Terverifikasi', NULL, NULL),
(1417, '2025', '2021505056', 'PUTRI SAHIRAH', 'P', 14, 'Pakuhaji', 'Tangerang', 'Banten', 'Analisis Kandungan Logam Berat Timbal (Pb) Pada Ikan Sarden (Sardinella Longiceps) Kaleng Di Supermarket Kabupaten Situbondo', 'Terverifikasi', NULL, NULL);
INSERT INTO `mahasiswas` (`id`, `lulusan`, `nim`, `nama`, `jk`, `prodi_id`, `kecamatan`, `kabupaten`, `provinsi`, `tugas_akhir`, `verifikasi`, `created_at`, `updated_at`) VALUES
(1418, '2025', '2021503113', 'MA\'RUF UBAIDILLAH', 'L', 17, 'JANGKAR', 'KAB. SITUBONDO', 'Jawa Timur', 'ANALISIS SENTIMEN MENGGUNAKAN ALGORITMA NAIVE BAYES PADA PILKADA KABUPATEN SITUBONDO TAHUN', 'Terverifikasi', NULL, NULL),
(1419, '2025', '2021503117', 'MUHAMMAD YASIN', 'L', 17, 'JANGKAR', 'KAB. SITUBONDO', 'Jawa Timur', 'KLASIFIKASI  DATA  PENDUDUK  MISKIN  MENGGUNAKAN  METODE  NAIVE  BAYES  UNTUK  MENGETAHUI  PENDUDUK  MISKIN  PADA  DESA  SOPET  JANGKAR  SITUBONDO', 'Terverifikasi', NULL, NULL),
(1420, '2025', '2021503112', 'LEGI OCTA SOFYAN FIRMANDALA', 'L', 17, 'SELEMADEG', 'KAB. TABANAN', 'Bali', '\"KLASIFIKASI CUACA BERDASARKAN DATA SUHU,', NULL, NULL, NULL),
(1421, '2025', '2021204095', 'SISKA NOVITA SARI', 'P', 5, 'Banyuputih', 'Situbondo', 'Jawa Timur', 'Pengaruh Pemberian Reward Dan Punishment Terhadap Kinerja Karyawan Studi Kasus Pt. Prima Mina Sakti Utama Sumberejo Banyuputih Situbondo', 'Terverifikasi', NULL, NULL),
(1422, '2025', '2019503097', 'LUKMAN NURKHOLIS', 'L', 17, 'Klabang', 'Bondowoso', 'Jawa Timur', 'SISTEM INFORMASI MANAGEMENT  KADERISASI PMII KABUPATEN SITUBONDO BERBASIS WEB', '', NULL, NULL),
(1423, '2025', '2021701056', 'ROIS BAHRUDDIN', 'L', 20, 'Tanjung Bumi', 'Bangkalan', 'Jawa Timur', 'HUBUNGAN ANTARA DUKUNGAN SOSIAL DENGAN REULASI DIRI SISWA KELAS X SMA IBRAHIMY 1 SUKOREJO', '', NULL, NULL),
(1424, '2025', '20182005021', 'Rizal Fikri Busthomi', 'L', 1, 'Cermee', 'Bondowoso', 'Jawa Timur', 'ANALISIS PENCATATAN PERSEDIAN BARANG DAGANG BERDASARKAN PSAK NO. 14 Tahun 2018  PADA TOKO MAKMUR SWALAYAN CERME BONDOWOSO JAWA TIMUR', '', NULL, NULL),
(1425, '2025', '2020503047', 'LINNY FADHILAH', 'P', 17, 'Saronggi', 'Sumenep', 'Jawa Timur', 'Sistem Informasi Ujian Online Berbasis Website pada UPT Balai Latihan Kerja Situbondo', '', NULL, NULL),
(1426, '2025', '201950024', 'Marzan Iskandar', 'L', 9, 'Pringgarata', 'Lombok Tengah', 'NTB', 'PENGEMBANGAN MEDIA PEMBELAJARAN BERBASIS APLIKASI ANDROID PADA MATA PELAJARAN BAHASA ARAB UNTUK KELAS VII DI MTS NU ISLAMIYAH ASEMBAGUS', '', NULL, NULL),
(1427, '2025', '2021702014', 'MOCHAMMAD ALFAN MAULANA', 'L', 19, 'BANGSALSARI', 'KAB. JEMBER', 'Jawa Timur', 'AKTA DIBAWAH TANGAN SEBAGAI BUKTI KEPEMILIKAN DALM PENDAFTARAN HAK ATAS TANAH MENURUT PERATURAN PEMERINTAH NOMOR 18 TAHUN 2021 TENTANG PENDAFTRAN TANAH', 'Terverifikasi', NULL, NULL),
(1428, '2025', '2021702022', 'MUHAMMAD HAMDAN KHIDIR BILYAN', 'L', 19, 'BANYUPUTIH', 'Situbondo', 'Jawa Timur', 'ANALISA YURIDIS HAK KEUANGAN RT DAN RW BERDASARKAN UNDANG UNDANG NOMOR 16 TAHUN 2014 DI DESA SUMBERJO BANYUPUTIH SITUBONDO', '', NULL, NULL),
(1429, '2025', '2021203047', 'QURROTUL FAKHIROH', 'P', 3, 'Panarukan', 'Situbondo', 'Jawa Timur', 'Implementasi Strategi Pemasaran Syariah Dalam Upaya Meningkatkan Minat Menabung Nasabah Di Kspps Bmt Nu Jawa Timur Cabang Kendit Situbondo', 'Terverifikasi', NULL, NULL),
(1430, '2025', '2021501035', 'KHAILA FIRNANDA', 'P', 15, 'MAGERSARI', 'KOTA MOJOKERTO', '', 'Implementasi Metode Saw Dan Ahp Penentuan Kamar Ternakal Pada Pelanggaran Sub Ubudiyah', 'Terverifikasi', NULL, NULL),
(1431, '2025', '2021203035', 'BINTAN NAVISATUL QOLBI', 'P', 3, 'Pujer', 'Bondowoso', 'Jawa Timur', 'Implementasi Strategi Promosi Syariah Dalam Meningkatkan Minat Nasabah Di Kspps Bmt Nu Jawa Timur Cabang Klabang Bondowoso', '', NULL, NULL),
(1432, '2025', '2021503033', 'MUHAMAD ILHAN MANSIZ', 'L', 17, 'Cakung', 'Jakarta Timur', 'Dki Jakarta', 'IMPLEMENTASI ALGORITMA KLASIFIKASI C4.5 UNTUK MEMPREDIKSI RESIKO TERKENA PENYAKIT PARU-PARU', 'Terverifikasi', NULL, NULL),
(1433, '2025', '2021203009', 'Firajul Firdaus', 'L', 3, 'Tlogosari', 'KAB. Bondowoso', 'Jawa Timur', '\"IMPLEMENTASI AKAD MUDHARABAH ', NULL, NULL, NULL),
(1434, '2025', '2021703060', 'NURUL ANISA', 'P', 18, 'Wongsorejo', 'Banyuwangi', 'Jawa Timur', '\"Analisis Biaya Tenaga Kerja Dalam Menghasilkan Harga Pokok Produksi Pada Cv. Keong Mas Permai Di Kecamatan Wongsorejo Banyuwangi', NULL, NULL, NULL),
(1435, '2025', '20190301168', 'TAUFIQURRAHMAN', 'L', 8, 'Bungatan', 'Situbondo', 'Jawa Timur', '“UPAYA GURU PAI DALAM PENANAMAN NILAI-NILAI AKHLAKUL KARIMAH SISWA KELAS VII B DI SMP ISLAM AS SIDDIQY BLITOK BUNGATAN SITUBONDO TAHUN PELAJARAN 2024/2025”', 'Terverifikasi', NULL, NULL),
(1436, '2025', '2022506034', 'SOFYAN SAHORI', 'L', 13, 'Suboh', 'SITUBONDO', 'JAWA TIMUR', 'PEMBESARAN UDANG VANAME (Litopenaeus vannamei) PADA KOLAM TERPAL HDPE DI UNIT PELAKSANA TEKNIS PERIKANAN BUDIDAYA AIR TAWAR/AIR PAYAU (UPT. PBATAP) SITUBONDO', 'Terverifikasi', NULL, NULL),
(1437, '2025', '2021504014', 'TAUFIK HIDAYAT', 'L', 12, 'WONGSOREJO', 'KAB. BANYUWANGI', 'Jawa Timur', 'PERANCANGAN PABRIK TAHU DENGAN KONSEP INDUSTRIAL DI DESA TAMBAK UKIR KECAMATAN KENDIT KABUPATEN SITUBONDO', '', NULL, NULL),
(1438, '2025', '2020502011', 'ILHAM HABIB FIRDAUS', 'L', 16, 'Karangasem', 'Karangasem', 'Bali', 'PENERAPAN DATA MINING UNTUK MENGELOMPOKKAN MAHASISWA BERDASARKAN NILAI MENGGUNAKAN ALGORITMA K-MEANS', 'Terverifikasi', NULL, NULL),
(1439, '2025', '2021501046', 'Moh. Nidhom Fahmi', 'L', 15, 'Puger', 'Jember', 'Jawa Timur', 'RACANG BANGUN PROTOTYPE KEAMANAN PERLINTASAN KERETA API OTOMATIS', 'Terverifikasi', NULL, NULL),
(1440, '2025', '2021501002', 'Akhmad Naufal Fadhailul Anam', 'L', 15, 'Kendit', 'Situbondo', 'Jawa Timur', 'IMPLEMENTASI SMART DEODORIZING SYSTEM PADA KANDANG SAPI BERBASIS MIKROKONTROLER', '', NULL, NULL),
(1441, '2025', '2020202003', 'Ach. Riv\'or Rofiqi', 'L', 4, 'Gayam', 'Sumenep', 'Jawa Timur', 'TINJAUAN HUKUM ISLAM TERHADAP TRADISI PEMBAGIAN HARTA WARIS (STUDI KASUS DI DESA TAREBUNG KECAMATAN GAYAM KABUPATEN SUMENEP)', 'Terverifikasi', NULL, NULL),
(1442, '2025', '2021505053', 'NILTA FADLA MAULIDA', 'P', 14, 'BANYUWANGI', 'BANYUWANGI', '', 'Pengaruh Penambahan Hidrolisat Protein Ikan Petek (Leiognathus Sp.) Terhadap Kandungan Protein Dan Karakteristik Organoleptik Pada Mie Kering', '', NULL, NULL),
(1443, '2025', '2021502066', 'FITRIA AYU ULANDARI', 'P', 16, 'WONGSOREJO', 'BANYUWANGI', 'Jawa Timur', 'Sistem Informasi Praktik Kerja Lapangan (Pkl) Berbasis Website  Di Smk Ibrahimy Miftahul Ulum Bengkak Wongsorejo', '', NULL, NULL),
(1444, '2025', '2021502095', 'YULINA SARI', 'P', 16, 'KALIPURO', 'BANYUWANGI', 'Jawa Timur', 'Rancang Bangun Aplikasi Point Of Sale (Pos) Untuk Mendukung Pemasaran Dan Penjualan Di Toko Sultan Kosmetik Situbondo', '', NULL, NULL),
(1445, '2025', '2021301009', 'AHMAD IRFAN WAFIQUR RAHMAN', 'L', 8, 'BINAKAL', 'KAB. BONDOWOSO', 'Jawa Timur', 'PENGGUNAAN METODE QUR’ANUNA DALAM PENINGKATAN KEMAMPUAN KOGNITIF SISWA PEMBELAJARAN AL QUR’AN         MTS NURUL FALAH TAHUN PELAJARAN 2024-2025', '', NULL, NULL),
(1446, '2025', '2021701022', 'FITRI AYU RAMADANI', 'P', 20, 'Pontianak Kota', '', 'Kalimantan Barat', 'Hubungan Gaya Belajar Dengan Performa Akademik Siswi Sma Ibrahimy', '', NULL, NULL),
(1447, '2025', '2021503090', 'MOH. BAHA\'UDDIN', 'L', 17, 'KANGAYAN', 'KAB. SUMENEP', 'Jawa Timur', 'IMPLEMENTASI RFID PADA SISTEM INFORMASI PRESENSI SISWA DI MAS AL-HUDA KANGAYAN DENGAN NOTIFIKASI WHATSAPP GATEWAY', 'Terverifikasi', NULL, NULL),
(1448, '2025', '2021502088', 'DWI ALYA PUTRI ARIFANY', 'P', 16, 'Wonosari', 'Bondowoso', 'Jawa Timur', 'Sistem Sistem Informasi Penilaian Kinerja Guru Di Sd Darut Tholabah Wonosari Bondowoso Berbasis Website', '', NULL, NULL),
(1449, '2025', '2021502021', 'Ilham Rafi Jawara', 'L', 16, 'Mangaran', 'Situbondo', 'Jawa Timur', 'ANALISIS POLA PELANGGARAN KEBERSIHAN SANTRI DENGAN PENDEKATAN ALGORITMA APRIORI PADA PONDOK PESANTREN SALAFIYAH SYAFI’IYAH SUKOREJO', 'Terverifikasi', NULL, NULL),
(1450, '2025', '2021502091', 'SITI NUR ANISAH', 'P', 16, 'Tanah Merah', 'Bangkalan', 'Jawa Timur', 'Sistem Informasi Pendaftaran Dan Penjadwalan Pelatihan Di Blkk Multimedia Pondok Pesantren Salafiyah Syafi’iyah Sukorejo Berbasis Website', 'Terverifikasi', NULL, NULL),
(1451, '2025', '2021502084', 'NURUL QOLBI RAHMAWATI', 'P', 16, 'Tabanan', 'Tabanan', 'Bali', 'Sistem Informasi Pengajuan Izin Periksa Sub Bagian Kesehatan Pondok Pesantren Salafiyah Syafi’iyah Sukorejo Berbasis Web', 'Terverifikasi', NULL, NULL),
(1452, '2025', '2021505006', 'ROBIATUL ADAWIYAH', 'P', 14, 'Kokop', 'Bangkalan', 'Jawa Timur', 'Pengaruh Subsitusi Msg Dengan Bubuk Kaldu Produk Hasil Samping Pembekuan Udang Vannamei ((Litopenaeus Vannamei) Terhadap Organoleptik Dan Daya Patah Kue Stik', 'Terverifikasi', NULL, NULL),
(1454, '2025', '2021203031', 'AISYAH WULANDARI', 'P', 3, 'Jangkar', 'Situbondo', 'Jawa Timur', '\"Implementasi Manajemen Produksi Dalam Meningkatkan Pesediaan Barang', NULL, NULL, NULL),
(1455, '2025', '2021505009', 'WILDATUN AL\'ALUF', 'P', 14, 'Baturiti', 'Tabanan', 'Bali', 'Daya Terima Konsumen Pada Produk Patty Ikan Dengan Berbagai Jenis Ikan', 'Terverifikasi', NULL, NULL),
(1456, '2025', '2021703010', 'Januar Batista Ardana', 'L', 18, 'Muncar', 'Banyuwangi', 'Jawa Timur', 'ANALISIS PENGENDALIAN BIAYA OPERASIONAL DALAM PENINGKATKAN PROFITABILITAS PERUSAHAAN PADA RESTORAN SRENGENGE WETAN TRADITIONAL OSING FOOD & COFFE BANYUWANGI', '', NULL, NULL),
(1457, '2025', '2021502078', 'AVIATUS SHOLIHA', 'P', 16, 'Panji', 'Situbondo', 'Jawa Timur', 'Sistem Informasi Pengelolaan Obat Dengan Metode Inventory Control Di Klinik Bidan Hasmi Desa Tenggir', '', NULL, NULL),
(1458, '2025', '2021502085', 'QITTRATUL AMALIATUS  SHOLEHAH', 'P', 16, 'PUJER', 'BONDOWOSO', '', 'Sistem Informajsi Manajment Asset Dinas Pertanian Dan Ketahanan Pangan Kabupaten Bondowoso', '', NULL, NULL),
(1459, '2025', '2019502018', 'NOR HASAN', 'L', 16, 'Gayam', 'Sumenep', 'Jawa Timur', 'ANALISIS POLA PEMBELIAN BUKU MENGGUNAKAN ALGORITMA APRIORI (Studi Kasus: Toko UD.ASSYARIF Pondok Pesantren Salafiyah Syafi’iyah Sukorejo)', '', NULL, NULL),
(1460, '2025', '2021504013', 'RHAFIDZAR MUHAMMAD AL FATHONI', 'L', 12, 'KIARACONDONG', 'KOTA BANDUNG', 'Jawa Barat', 'PENERAPAN PRINSIP BIOPHILIC ARCHITECTURE DALAM PERANCANGAN KANTOR KREATIF DI KAWASAN URBAN DAERAH LEMBANG DI JL. MARIBAYA', 'Terverifikasi', NULL, NULL),
(1461, '2025', '2021702045', 'NABILA AYU MAZIDAH', 'P', 19, 'Banyuputih', 'Situbondo', 'Jawa Timur', 'Analisis Yuridis Penerapan Restorative justice dalam Putusan Perkara Pidana Nomor 63/Pid.B/2021/PN. Skm dan Implikasi Perdamaian Adat dalam Pertimbangan Hakim', 'Terverifikasi', NULL, NULL),
(1462, '2025', '2021502044', 'LISA NOVIA RAMDANI', 'P', 16, 'SUKORAMBI', 'JEMBER', '', 'Komparasi Algoritma Decision Tree Dan Support Vector Machine (Svm) Dalam Klasifikasi Risiko Anemia', '', NULL, NULL),
(1463, '2025', '2021204080', 'MILFINA', 'P', 5, 'Ra\'as', 'Sumenep', 'Jawa Timur', 'Pengaruh Harga Dan Motivasi Belanja Hedonis Terhadap Minat Beli Konsumen Pada Aplikasi Shopee (Studi Kasus Desa Sambakati Kecamatan Arjasa Kabupaten Sumenep)', '', NULL, NULL),
(1464, '2025', '2021204070', 'MAULIDIL MAARIP', 'L', 5, 'NONGGUNONG', 'Sumenep', 'Jawa Timur', 'ANALISIS STRATEGI PELAYANAN ISLAMI DALAM MENINGKATKAN KEPUASAN NASABAH KSPPS BMT NU KECAMATAN GAYAM SUMENEP', 'Terverifikasi', NULL, NULL),
(1465, '2025', '2021502048', 'NUR RIZATUL MUFIDAH', 'P', 16, 'Asembagus', 'Situbondo', 'Jawa Timur', 'Sistem Pendukung Keputusan Penentuan Siswa Berprestasi Ra Ibrahimy Menggunakan Metode Weight Product(Wp)', 'Terverifikasi', NULL, NULL),
(1466, '2025', '2021503082', 'NAZHIFATUL MUTHOHHAROH', 'P', 17, 'PANJI', 'SITUBONDO', '', 'Perbandingan Algoritma Naïve Bayes Dan K-Nearest Neighbor (Knn) Untuk Mengklasifikasikan Status Kesehatan', 'Terverifikasi', NULL, NULL),
(1467, '2025', '2021503066', 'FADHILLAH RASHIDATUL A\'LA', 'P', 17, 'GEROKGAK', 'BULELENG', 'Jawa Timur', 'Implementasi Algoritma K-Nearest Neighbor (K-Nn) Untuk Klasifkasi Status Gizi Balita', 'Terverifikasi', NULL, NULL),
(1468, '2025', '2021503041', 'LULUK NURIL M.', 'P', 17, 'Jangkar', 'Situbondo', 'Jawa Timur', 'Sistem Informasi  Poin Pelanggaran Siswi Di Mts Nu Islamiyah  Asembagus Dengan Metode Prototyping Dan Whatshapp Gateway', '', NULL, NULL),
(1469, '2025', '2021503093', 'SITI NUR AZIZAH', 'P', 17, 'Kademangan', 'Bondowoso', 'Jawa Timur', 'Sistem Informasi  Kegiatan Ekstrakurikuler Di Mtsn 2 Bondowoso Berbasis Web', '', NULL, NULL),
(1470, '2025', '2021701012', 'Syarif Rofiqi', 'L', 20, 'Asembagus', 'Situbondo', 'Jawa Timur', 'HUBUNGAN KECERDASAN EMOSI DAN EMPATI DENGAN KESEJAHTERAAN PSIKOLOGIS SANTRI PONDOK PESANTREN SALAFIYAH SYAFI’IYAH SUKOREJO', '', NULL, NULL),
(1471, '2025', '2021501007', 'AMANDA RISKY SULTAN', 'L', 15, 'NIPAH PANJANG', 'KAB. TANJUNG JABUNG TIMUR', 'Jambi', 'RANCANG BANGUN SISTEM KEAMANAN RUMAH SMART DOOR LOCK DENGAN PENGENALAN WAJAH BERBASIS MIKROKONTROLLER ESP32-CAM', 'Terverifikasi', NULL, NULL),
(1472, '2025', '2021503081', 'SYAIFUL HASAN A.', 'L', 17, 'MANGARAN', 'KAB. SITUBONDO', 'JAWA TIMUR', 'SISTEM INFORMASI MONITORING ATLET DINAS PEMUDA DAN OLAHRAGA KABUPATEN SITUBONDO MENGGUNAKAN METODE SAW (SIMPLE ADDITIVE WEIGHTING)', '', NULL, NULL),
(1473, '2025', '2021503038', 'AUDIATUL JINAN', 'P', 17, 'SILO', 'JEMBER', '', 'Sistem Informasi Penyediaan Obat Berbasis W5Ebsite Di Puskesmas Silo Jember', 'Terverifikasi', NULL, NULL),
(1474, '2025', '2021503099', 'ULVI MUNAWAROH', 'P', 17, 'SONGGON', 'BANYUWANGI', '', 'Perancangan Sistem Informasi E-Recruitment Pengajar Studi Kasus Mi Salafiyah Syafi’Iyah Putri P.P. Salafiyah Syafi’Iyah Sukorejo', 'Terverifikasi', NULL, NULL),
(1475, '2025', '2021702029', 'AISYATIN KAMILAH', 'P', 19, 'BANYUPUTIH', 'SITUBONDO', 'Jawa Timur', 'Analisis Pertimbangan Hukum Oleh Hakim terhadap Pembatalan Status Tersangka (Studi Putusan Nomor: 15/Pid.Prap/2017/PN.Jkt.Sel)', '', NULL, NULL),
(1476, '2025', '2022506028', 'MOHAMMAD SHOLIHIN', 'L', 13, 'Panarukan', 'Situbondo', 'Jawa Timur', 'Manajemen Kualitas Air Pada Pembesaran Udang Vaname (Litopenaeus vannamei) DI PT. Samudra Duwet Pranata Kecamatan Panarukan Kabupaten Situbondo Jawa Timur', '', NULL, NULL),
(1477, '2025', '2024503095', 'Siti Nur Khalishah', 'P', 17, 'Banyuputih', 'Situbondo', 'Jawa Timur', 'Implementasi Optical Character Recognition Pada Sistem Informasi Persuratan Berbasis Web DI Kantor Pusat KSASS Alumni', '', NULL, NULL),
(1478, '2025', '2021301149', 'MOHAMMAD FA\'IZ', 'L', 8, 'SITUBONDO', 'KAB. SITUBONDO', 'Jawa Timur', 'STRATEGI GURU DALAM PENDIDIKAN ANTI BULLYING DENGAN PEMANFAATAN MEDIA SOSIAL', '', NULL, NULL),
(1479, '2025', '2021301160', 'Kholila', 'P', 8, 'Mlandingan', 'Situbondo', 'Jawa Timur', 'IMPLEMENTASI PROGRAM SHOLAT DHUHA BERJAMAAH DALAM PENINGKATAN  KARAKTER DISIPLIN SISWA DI MA NURUL JADID TAHUN PELAJARAN 2024/2025', '', NULL, NULL),
(1480, '2025', '202130154', 'SUNJOKO KUSUMO', 'L', 8, 'BANGSALSARI', 'KAB. JEMBER', 'Jawa Timur', 'PENERAPAN MODEL PEMBELAJARAN CREATIVE PROBLEM SOLVING UNTUK PENINGKATAN MORAL SISWA PADA MATA PELAJARAN AQIDAH AKHLAK KELAS VII DI MTS PGRI ZAINUL FAUZI KENDIT SITUBONDO TAHUN PELAJARAN 2024/2025', '', NULL, NULL),
(1481, '2025', '2021503122', 'ZAINUR RAHMAN', 'L', 17, 'PANJI', 'KAB. SITUBONDO', 'Jawa Timur', 'IMPLEMENTASI ALGORITMA K-MEANS CLUSTERING UNTUK PENGELOMPOKAN LOYALITAS PELANGGAN PADA KONVEKSI AL MAIDAH DI SITUBONDO BERBASIS WEB APPS', '', NULL, NULL),
(1482, '2025', '2021501038', 'LAILA NUR YASMIN', 'P', 15, 'Sapeken', 'Sumenep', 'Jawa Timur', 'Implementasi Metode Saw Bagi Penerima Bansos Di Desa Sakala  Berbasis Whatsapp Gateway', 'Terverifikasi', NULL, NULL),
(1483, '2025', '2021502082', 'NUR MAYMUNA', 'P', 16, 'Jangkar', 'Situbondo', 'Jawa Timur', 'Sistem Pendukung Keputusan Penerima Bantuan Blt Menggunakan Metode Topsis Studi Kasus Desa Sopet Kecamatan Jangkar', '', NULL, NULL),
(1484, '2025', '2020501030', 'APRILEYANI', 'P', 15, 'Jatibanteng', 'Situbondo', 'Jawa Timur', 'Penerapan Algoritma Naïve Bayes Pada Klasifikasi Tingkat Obesitas', 'Terverifikasi', NULL, NULL),
(1485, '2025', '2021503037', 'ALIYATUL KAMILA', 'P', 17, 'Banyuputih', 'Situbondo', 'Jawa Timur', '“Rancang Bangun E_Commerce Pada Koperasi Kelompok Swadaya Masyarakat Nelayan Dan Tani Banyuputih Berbasis Android Dan Customer Relationship Management (Crm)\"', 'Terverifikasi', NULL, NULL),
(1486, '2025', '2021501033', 'HALILATUR RAFIA', 'P', 15, 'Arjasa', 'Sumenep', 'Jawa Timur', 'Implementasi Sensor Ultrasonik Pada Kotak Sampah Otomatis Berbasis Iot Dengan Notifikasi Whatsapp Gateway Di Mts Salafiya Syafiyah Sukorejo', 'Terverifikasi', NULL, NULL),
(1487, '2025', '2020501034', 'HALIMATUS SAKDIYA', 'P', 15, 'Arjasa', 'Sumenep', 'Jawa Timur', 'Absensi Sholat Berjamaah Menggunakan Radio Frequency Identification (Rfid) Technology Di Musholla Putri Pondok Pesantren Salafiyah – Syafi’iyah Sukorejo', '', NULL, NULL),
(1488, '2025', '2021701037', 'SILVIANA KURNIA PUTRI', 'P', 20, 'Kamal', 'Bangkalan', 'Jawa Timur', 'Kontribusi Pola Asuh Indulgent Permissive Pada Perilaku Agresif Remaja', '', NULL, NULL),
(1489, '2025', '2022506036', 'ZAINULLAH', 'L', 13, 'Bungatan', 'Situbondo', 'Jawa Timur', 'TEKNIK PEMBESARAN UDANG VANNAMEI SECARA INTENSIF PADA KOLAM BETON DI UPT.PBATAP', '', NULL, NULL),
(1490, '2025', '2022506027', 'MOH. GHOFI PUTRA RAMADHAN', 'L', 13, 'Besuki', 'Situbondo', 'Jawa Timur', 'TEKNIK PEMBESARAN UDANG VANNAMEI SKALA RUMAH TANGGA UNIT PELAKSANA TEKNIS PERIKANAN BUDIDAYA AIR TAWAR/AIR PAYAU (UPT.PBATAP)', '', NULL, NULL),
(1491, '2025', '2021503063', 'SITI SULAIHA', 'P', 17, 'BUNGATAN', 'SITUBONDO', 'Jawa Timur', 'Sistem Informasi Pelayanan Kesehatan Hewan Berbasis Web Studi Kasus: Pada Puskeswan Bungatan', 'Terverifikasi', NULL, NULL),
(1492, '2025', '2021503096', 'SULISTIA WARDANI', 'P', 17, 'BENUA KAYONG', 'KETAPANG', '', 'Sistem Informasi Manajemen Lembaga Non Formal Amsilati Ma’Had Aly Berbasis Web', '', NULL, NULL),
(1493, '2025', '2021503075', 'LULU SAPITRI', 'P', 17, 'Matan Hilir Selatan', 'Ketapang', 'KAlimantan Barat', 'Sistem Informasi Monitoring Kegiatan Ubudiyah Asrama Pusat Putri Berbasis Web', 'Terverifikasi', NULL, NULL),
(1494, '2025', '2021203040', 'ITTAKIYAH NING DIAH SARI', 'P', 3, 'Jangkar', 'Situbondo', 'Jawa Timur', 'Implementasi Manajemen Sumber Daya Insani Dalam Meningkatkan Kepuasan Konsumen Di Swalayan Skmart Jangkar (Studi Kasus Desa Jangkar  Kec. Jangkar Kab. Situbondo)', 'Terverifikasi', NULL, NULL),
(1495, '2025', '2021502063', 'SUCI MULIANINGSIH', 'P', 16, 'Praya', 'Lombok Tengah', 'NTB', 'Rancang Bangun Sistem Informasi Manajemen Bimbingan Konseling Di Smk Ibrahimy Sukorejo Berbasis Whatsapp Gateway', '', NULL, NULL),
(1496, '2025', '2021502081', 'NUR KAMILA', 'P', 16, 'LICIN', 'BANYUWANGI', '', 'Penerapan Naïve Bayes Untuk Mendeteksi Sentimen Publik Pada Komentar Youtube Terkait Kontroversi Tambang Untuk Organisasi Masyarakat', '', NULL, NULL),
(1497, '2025', '2021502097', 'YURIDA ISLAHATUL MUASAROH', 'P', 16, 'Kunir', 'Lumajang', 'Jawa Timur', 'Analisis Sentimen Komentar Youtube Terhadap Isu Ijazah Presiden Jokowi Menggunakan Support Vector Machine Dan Random Forest', 'Terverifikasi', NULL, NULL),
(1498, '2025', '2021501039', 'LAILATUN NUR JANNAH', 'P', 15, 'Ra\'as', 'Sumenep', 'Jawa Timur', 'Sistem Pendukung Keputusan Untuk Menentukan Penerima Bantuan Bedah Rumah Di Desa Brakas Menggunakan Metode Simple Additive Weighting (Saw)', '', NULL, NULL),
(1499, '2025', '2021702040', 'LAILATUL QOMARIYAH', 'P', 19, 'Wongsorejo', 'Banyuwangi', 'Jawa Timur', 'Kepastian Hukum Mekanisme Permohonan Hak Milik Atas Tanah Negara Berdasarkan Permen Atr/ Bpn Nomor 18 Tahun 2021', '', NULL, NULL),
(1500, '2025', '2021202024', 'MUHAMMAD HASYIM', 'L', 4, 'PANJI', 'SITUBONDO', 'JAWA TIMUR', '\"TINJAUAN HUKUM ISLAM DAN HUKUM POSITIF TERHADAP PENGUBAHAN IDENTITAS SEBELUM PERKAWINAN', '', NULL, NULL),
(1501, '2025', '2020703001', 'AHMAD ZAINAL ABIDIN', 'L', 18, 'Banyuputih', 'Situbondo', 'Jawa Timur', 'PENGARUH PEMAHAMAN PERPAJAKAN DAN SANKSI PERPAJAKAN TERHADAP KEPATUHAN WAJIB PAJAK UMKM', '', NULL, NULL),
(1502, '2025', '2021503120', 'SIRAJUDDENI', 'L', 17, 'CERMEE', 'KAB. BONDOWOSO', 'Jawa Timur', '\"SISTEM INFORMASI AKADEMIK MADRASAH ', NULL, NULL, NULL),
(1503, '2025', '2021503104', 'AHMAD SU\'AYDI', 'L', 17, 'PANJI', 'KAB. SITUBONDO', 'Jawa Timur', 'SISTEM PENDUKUNG KEPUTUSAN PENENTUAN SISWA KELAS  UNGGULAN MENGGUNAKAN METODE AHP DAN SAW', 'Terverifikasi', NULL, NULL),
(1504, '2025', '2021503121', 'YUA ISMAN ISLAM', 'L', 17, 'KAPONGAN', 'KAB. SITUBONDO', 'Jawa Timur', 'PREDIKSI PENENTUAN CALON SISWA BARU DI SMK SUMBER BUNGA MENGGUNAKAN METODE TIME SERIES', '', NULL, NULL),
(1505, '2025', '2020704004', 'ANDIKA RAHMATULLAH', 'L', 21, 'JEMBRANA', 'JEMBRANA', 'BALI', 'Implementing the Use of Hand Puppet Media in Teaching Speaking at Foreign Language Dormitory of Salafiyah Syafi’iyah Islamic Boarding School', 'Terverifikasi', NULL, NULL),
(1506, '2025', '2021502025', 'KEVIN RIYAS ROBBANI', 'L', 16, 'LEDOKOMBO', 'KAB. JEMBER', 'Jawa Timur', 'ANALISIS SENTIMEN PADA ARTIKEL BERITA TENTANG TRANSFORMASI DIGITAL PENDIDIKAN DI INDONESIA BERBASIS INSET LEXICON MENGGUNAKAN LOGISTIC REGRESSION', '', NULL, NULL),
(1507, '2025', '201502037', 'MUHAMMAD HASAN', 'L', 16, 'BONDOWOSO', 'KAB. BONDOWOSO', 'Jawa Timur', 'SISTEM PENDUKUNG KEPUTUSAN PENENTUAN DOSEN TERBAIK DI UNIVERSITAS IBRAHIMY MENGGUNAKAN SIMPLE ADDITIVE WEIGHTING (SAW)', '', NULL, NULL),
(1508, '2025', '2021204034', 'MUHAMMAD KHOLIL', 'L', 5, 'KALIPURO', 'BANYUWANGI', 'JAWA TIMUR', 'Implementasi Kepemimpinan Islami Dalam Meningkatkan Kinerja Karyawan (Studi Kasus Villa Domisili Ijen Cliff Licin Banyuwangi)', 'Terverifikasi', NULL, NULL),
(1509, '2025', '2021503114', 'MUHAMMAD HANIF ZAKY UBAIDILLAH', 'L', 17, 'ASEMBAGUS', 'KAB. SITUBONDO', 'Jawa Timur', 'Implementasi webGis untuk Objek Wisata Kabupaten Situbondo Dengan Metode Location Based Service', '', NULL, NULL),
(1510, '2025', '2021503118', 'Naufal Arif Maulana', 'L', 17, 'Situbondo', 'Situbondo', 'Jawa Timur', 'Analisis sentimen ulasan pengguna terhadap aplikasi simantap di google play store menggunakan naive bayes.', 'Terverifikasi', NULL, NULL),
(1511, '2025', '2020503118', 'Zulva Rohadatul \'Aisy', 'P', 17, 'Asembagus', 'Situbondo', 'Jawa Timur', 'Pengembangan sistem e-voting osim di mtsn 3 situbondo berbasis android', '', NULL, NULL),
(1512, '2025', '2019503121', 'Siti Nur Holifa', 'P', 17, 'Mangaran', 'Situbondo', 'jawa Timur', 'Sistem Informasi Praktek Kerja Lapangan Berbasis Website Universitas Ibrahimy Situbondo', '', NULL, NULL),
(1513, '2025', '2021506004', 'ACHMAD DHOFYUN NUFUR', 'P', 13, 'BANYUPUTIH', 'SITUBONDO', '', 'TEKNIK PEMBESARAN LELE (Clarias gariepinus) INTENSIF SISTEM PROBIOTIK DI  POKDAKAN SANTRI AKUAKULTUR IBRAHIMY SUKOREJO SITUBONDO', '', NULL, NULL),
(1514, '2025', '2021501043', 'SITI KHOLIFAH', 'P', 15, 'Arjasa', 'Sumenep', 'Jawa Timur', 'Rancang Bangun Prototipe Sistem Bukatutup Tirai Otomatis Pada Ruang Kuliah Fakultas Sains Dan Teknologi  Berbasis Internet Of Things', '', NULL, NULL),
(1515, '2025', '2021502047', 'MOH. ZAINI ROMLY', 'L', 16, 'WONGSOREJO', 'KAB. BANYUWANGI', 'JAWA TIMUR', 'RANCANG BANGUN SISTEM PENDUKUNG KEPUTUSAN UNTUK EVALUASI KINERJA KARYAWAN DI PABRIK AIR MINUM P2S2 CV. HAFAS SITUBONDO DENGAN METODE SMART', '', NULL, NULL),
(1516, '2025', '2021502041', 'MOH. SOFYAN ALFANDI', 'L', 16, 'BALUNG', 'KAB. JEMBER', 'JAWA TIMUR', 'RANCANG BANGUN SISTEM INFORMASI INVENTORY STOK UNTUK PRODUKSI DAN DISTRIBUSI PADA PABRIK AIR MINUM DALAM KEMASAN (AMDK) P2S2 CV.HAFAS SITUBONDO BERBASIS WEB', '', NULL, NULL),
(1517, '2025', '2021503092', 'DELA ALAINA LAILATUL MAQFIROH', 'P', 17, 'SILO', 'JEMBER', 'Jawa Timur', 'Sistem Pendukung Keputusan Pengajuan Beasiswa Pada Badan Amil Zakat Nasional (Baznas) Menggunakan Metode Saw Kabupaten Jember', '', NULL, NULL),
(1518, '2025', '2021503111', 'Komarul Imam', 'L', 17, 'Kapongan', 'Situbondo', 'Jawa Timur', 'Sistem pendukung keputusan pemilihan guru teladan di sumber bunga dengan metode MFEP', '', NULL, NULL),
(1519, '2025', '2021503087', 'ARIFAH AMALIYAH QORI\'AH', 'P', 17, 'SILO', 'JEMBER', '', 'Sistem Informasi Penggajian Karyawan Berbasis Web Di Pdp Kalimrawan Jember', '', NULL, NULL),
(1520, '2025', '2021201047', 'FAUZIYAH', 'P', 2, 'Gayam', 'Sumenep', 'Jawa Timur', '\"Perspektif Hukum Ekonomi Syari’Ah Terhadap Jual Beli Hasil Penyisihan Zakat Fitrah Untuk Perehaban Masjid ', NULL, NULL, NULL),
(1521, '2025', '2021201045', 'ULFATUR RASIDAH', 'P', 2, 'Gayam', 'Sumenep', 'Jawa Timur', '\"Perspektif Hukum Ekonomi Syariah Terhadap Jual Beli Emas Dengan Sistem Tukar Tambah', NULL, NULL, NULL),
(1522, '2025', '2021503059', 'SAFNA DIANDHITA', 'P', 17, 'Sandubaya', 'Mataram', 'Nusa Tenggara Barat', 'Proposal Skripsi “Penerapan Customer Relationship Management (Crm) Berbasis Whatsapp Gateway Pada Layanan Bale Laundry”', 'Terverifikasi', NULL, NULL),
(1523, '2025', '2021503095', 'DELLA NATASYA', 'P', 17, 'JANGKAR', 'SITUBONDO', '', 'Analisis Pola Pembelian Produk Makanan Dan Minuman Menggunakan Metode Apriori Pada Swalayan Salafiyah Sukorejo', '', NULL, NULL),
(1524, '2025', '2021503079', 'MIFTA WILDA AL ALUF', 'P', 17, 'WONGSOREJO', 'BANYUWANGI', '', 'Rancang Bangun Platform E-Commerce Toko Iksass Mart Berbasis Web', '', NULL, NULL),
(1525, '2025', '2021502059', 'RUQOYYATUL WIDAD', 'P', 16, 'KAPONGAN', 'SITUBONDO', '', 'Sistem Pendukung Keputusan Penerimaan Siswa Baru Menggunakan Metode Profile Matching Pada Sd Al Irsyad Al Islamiyyah Situbondo', '', NULL, NULL),
(1526, '2025', '2021203045', 'MUYASSIRAH', 'P', 3, 'Ra\'as', 'Sumenep', 'Jawa Timur', 'Pengaruh Promosi Islami Dan Kualitas Pelayanan Terhadap Kepuasan Nasabah Pada Bprs Bhakti Sumekar Cabang Pratama Ra’As Sumenep', '', NULL, NULL),
(1527, '2025', '2021113037', 'TOLAK AINI', 'P', 8, 'Bungatan', 'Situbondo', 'Jawa Timur', 'Meningkatkan Keterampilan Berfikir Mahasiswa Kelas 1 Mti Melalui Pemanfaatan Metode Concept Mapping Di Mti Salafiyah Syafi’iyah Sukorejo Situbondo Tahun 2024/2025', '', NULL, NULL),
(1528, '2025', '2021301148', 'AHMAD IMRON GAZALI', 'L', 8, 'ASEMBAGUS', 'KAB. SITUBONDO', 'Jawa Timur', 'Penerapan Strategi Reading Guide Dalam Peningkatan Budaya Literasi Pada Siswa Di Kelas 6A SDN 1 Sumber Anyar Tahun Pelajaran 2024/2025', '', NULL, NULL),
(1529, '2025', '2021501044', 'TOLAK IZZE', 'P', 15, 'Mangaran', 'Situbondo', 'Jawa Timur', 'Sistem Pendukung Keputusan Pemberian Beasiswa Di Ma Nurus Sholeh  Menggunakan Metode Ahp', '', NULL, NULL),
(1530, '2025', '2021502038', 'Citra Nursihah', 'P', 16, 'Giri', 'Banyuwangi', 'Jawa Timur', 'Sistem Informasi Mekanisme Kredensial Dan Rekredensial Tenaga Kesehatan Berbasis Web Di Dinas Kesehatan Situbondo', '', NULL, NULL),
(1531, '2025', '2021301137', 'TOLAK AINI', 'P', 8, 'Bungatan', 'Situbondo', 'Jawa Timur', 'Meningkatkan Keterampilan Berfikir Mahasiswa Kelas 1 Mti Melalui Pemanfaatan Metode Concept Mapping Di Mti Salafiyah Syafi’Iyah Sukorejo Situbondo Tahun 2024/2025', '', NULL, NULL),
(1532, '2025', '2021503094', 'SITI NURIL MAGHFIRATUS SHOLEHA', 'P', 17, 'CAKUNG', 'KOTA ADM. JAKARTA TIMUR', '', 'Prediksi Harga Laptop Berdasarkan Spesifikasi Menggunakan Regresi Linear Dan Random Forest Regression', '', NULL, NULL),
(1533, '2025', '2021501040', 'NOVIA DWI MEYLINDA', 'P', 15, 'SITUBONDO', 'SITUBONDO', '', 'Rancang Bangun Smarthome Sistem Pendeteksi Kebakaran Berbasis Internet Of Things Menggunakan Arduino', '', NULL, NULL),
(1534, '2025', '2021503071', 'IVANA DWI KARTIKASARI', 'P', 17, '', 'BANYUWANGI', '', 'Sistem Informasi Poin Pelanggaran Santri Di Bidang Keamanan Asrama Ma’Hadul Qur’An Putri Pp Salafiyah Syafi’Iyah Sukorejo Situbondo', '', NULL, NULL),
(1535, '2025', '2021502077', 'NABILA SOFIA AZZAHRA', 'P', 16, 'BANYUPUTIH', 'SITUBONDO', '', 'Rancang Bangun Sistem Informasi Penjualan Pada Usaha Angkringan Pandan Wangi Berbasis Web', '', NULL, NULL),
(1536, '2025', '2021502060', 'RUWAIDA KHOLLATIL W.', 'P', 16, 'Arjasa', 'Sumenep', 'Jawa Timur', 'Sistem Informasi (Psb) Penerimaan Siswa Baru Pada Sd Ibrahimy Sukorejo', '', NULL, NULL),
(1537, '2025', '2021502055', 'ABDUR ROHMAN NURUT. T', 'L', 16, 'JANGKAR', 'KAB. SITUBONDO', 'Jawa Timur', 'Analisis Pola Pelanggaran Santri Dalam Bidang Keamanan Dan Ketertiban Dengan Menggunakan Metode Asosiasi', '', NULL, NULL),
(1538, '2025', '2021304003', 'ANNISAUL QOYYIMAH', 'P', 11, 'Ajung', 'Jember', 'Jawa Timur', 'Analisis Efektivitas Penerapan Metode Mathemagic Terhadap High Order Thinking Skills (Hots) Siswa Smp Negeri 1 Situbondo', 'Terverifikasi', NULL, NULL),
(1539, '2025', '2021702016', 'MOH. BAKIR', 'L', 19, 'KAPONGAN', 'KAB. SITUBONDO', 'Jawa Timur', 'Analisis Yuridis Upaya Penegakan Hukum Terhadap Pelaku Pelanggaran Rokok  Ilegal Berdasarkan Undang-Undang Nomor 39 Tahun 2007 Tentang Cukai (Studi Putusan Nomor: 142/Pid.Sus/2024/Pn Sit)', '', NULL, NULL),
(1540, '2025', '2021701052', 'WAHIDATUN HIDAYAH N.', 'P', 20, 'Klari', 'Karawang', 'Jawa Barat', 'Resiliensi Remaja Yatim Piatu', 'Terverifikasi', NULL, NULL),
(1541, '2025', '2021701036', 'NI\'MATUL FADILAH', 'P', 20, 'Banyuputih', 'Situbondo', 'Jawa Timur', 'Strategi Coping Pada Korban Perselingkuhan Di Kabupaten Situbondo', '', NULL, NULL),
(1542, '2025', '2021503089', 'RITA IRAWATI', 'P', 17, 'Banyuputih', 'Situbondo', 'Jawa Timur', 'Sistem Informasi Pelanggaran Santri Berbasis Web Untuk Pemantauan Dan Pelaporan Pada Kamtib Putri Pondok Pesantren Salafiyah Syafi’iyah', '', NULL, NULL),
(1543, '2025', '2021502045', 'MUTMAINNAH ILMIATUL FAIDAH', 'P', 16, 'Kamal', 'Bangkalan', 'Jawa Timur', 'Rancang Bangun Sistem Informasi E – Learning Berbasis Website Pada Smp Ibrahimy 2 Sukorejo', '', NULL, NULL),
(1544, '2025', '2021203038', 'HIMMATUL HOIROH', 'P', 3, 'Grujugan', 'Bondowoso', 'Jawa Timur', 'Implementasi Etos Kerja Islami Dalam Meningkatkan Kinerja Karyawan Di Home Industry Kerupuk Barokah Kecamatan Kota Kabupaten Bondowoso', 'Terverifikasi', NULL, NULL),
(1545, '2025', '2021503101', 'YENI NURHASANAH', 'P', 17, 'Sempol', 'Bondowoso', 'Jawa Timur', 'Rancang Bangun Sistem Informasi Lowongan Kerja Berbasis Web (Study Kasus Kantor Induk Ptpn Xii Blawan)', '', NULL, NULL),
(1546, '2025', '2021503067', 'FATMA NUR AFIAH', 'P', 17, 'SUKADANA', 'KAYONG UTARA', 'KALIMANTAN BARAT', 'Sistem Informasi Manajemen Ektrakurikuler Di MA Nu Islamiyah Berbasis Website', 'Terverifikasi', NULL, NULL),
(1547, '2025', '2020502008', 'DINOL FAHROSI', 'L', 16, 'Silo', 'Jember', 'Jawa Timur', 'SISTEM PENDUKUNG KEPUTUSAN PENENTUAN SISWA BERPRESTASI DENGAN MENGGUKAN METODE SIMPLE MULTI ATTRIBUTE RETTING TECHNIQUE PADA SMP IBRAHIMY 1 SUKOREJO', '', NULL, NULL),
(1548, '2025', '2021301150', 'Muhammad Ainul Yaqin', 'L', 8, 'Cermee', 'Bondowoso', 'Jawa Timur', 'Penerapan Metode Pembelajaran Tutor Sebaya Dalam Peningkatan Hasil Belajar Siswa Mata Pelajaran Akidah Akhlak Di Madrasah Ibtidaiyah Ibrahimy Cermee Bondowoso Tahun Pelajaran 2025/2026', '', NULL, NULL),
(1549, '2025', '2021503074', 'LINA SOSIANA', 'P', 17, 'Arjasa', 'Sumenep', 'Jawa Timur', 'Sistem Informasi Pencatatan Transaksi Penjualan Dan Pembelian Barang Berbasis Web Pada Toko Sembakoh Barokah', '', NULL, NULL),
(1550, '2025', '2021503065', 'E PARIANI', 'P', 17, 'Praya', 'Lombok Tengah', 'NTB', 'Santri Berprestasi (Aspi) Ma’had Aly Salafiah Syafi’iyah Sukorejo', 'Terverifikasi', NULL, NULL),
(1551, '2025', '2021502080', 'NUR HOMAIDA', 'P', 16, 'Ra\'as', 'Sumenep', 'Jawa Timur', 'Sistem Informasi Peminjaman Dan Pengembalian Buku Pada Perpustakaan  Smp Negeri 1 Raas', '', NULL, NULL),
(1552, '2025', '2021301032', 'Muhammad Sultan Auliya', 'L', 8, 'Lembar', 'Lombok Barat', 'Nusa Tenggara Barat', 'PENERAPAN ISLAMIC PARENTING  DALAM MENGUATKAN PROFIL PELAJAR PANCASILA ASPEK KREATIF  DI MTS PP AL-AZIMIYAH PUYAHAN LEMBAR LOMBOK BARAT TAHUN PELAJARAN 2024/2025', '', NULL, NULL),
(1553, '2025', '2021503078', 'MARYANA', 'P', 17, 'SUKADANA', 'KAYONG UTARA', '', '\"Sistem Informasi Perizinan Santri Ma’Hadul Qur’An Berbasis Web Pondok Pesantren Salafiyah Syafi’Iyah', NULL, NULL, NULL),
(1554, '2025', '2021503072', 'LAILA DEVI SARI', 'P', 17, 'MAESAN', 'BONDOWOSO', '', 'Rancang Bangun Learning Manajemen Sistem Berbasis Web Pada Fakultas Sains Dan Teknologi Universitas Ibrahimy', '', NULL, NULL),
(1555, '2025', '2021503086', 'REGGINA IZZA AOFKARINA', 'P', 17, 'PUJER', 'BONDOWOSO', '', 'Implementasi Metode Saw Untuk Penentuan Penerima Beasiswa Bagi Mahasiswa Bondowoso', '', NULL, NULL),
(1556, '2025', '2021503080', 'MUZAYYANA', 'P', 17, 'Ra\'as', 'Sumenep', 'Jawa Timur', 'Sistem Informasi Penerimaan Santri Baru,Di Pondok Pesantren Kasyfudduja Brakas Ra’As Berbasis Web', '', NULL, NULL),
(1557, '2025', '20213101056', 'ONKKY KHAIRULLAH', 'L', 8, 'RA', 'KAB. SUMENEP', 'Jawa Timur', 'PEMANFAATAN MEDIA PRESENTASI DALAM PROSES PEMBELAJARAN PENDIDIKAN AGAMA ISLAM DI KELAS VIII SMP ISLAM SIRAJUL AKHYAR RA’AS TAHUN PELAJARAN 2024-2025', '', NULL, NULL),
(1558, '2025', '2020501044', 'WILDATUL JANNAH', 'P', 14, 'Arjasa', 'Sumenep', 'Jawa Timur', 'RANCANG BANGUN ALAT PENGASAP IKAN OTOMATIS MENGUNAKAN MIKROKONTROLER ESP-32', '', NULL, NULL),
(1559, '2025', '2021502027', 'KHAIRULLAH IRFANSYAH', 'L', 16, 'Cakung', 'Kota ADM Jakarta Timur', 'DKI Jakarta', 'RANCANG BANGUN SISTEM INFORMASI MANAJEMEN SISWA BERBASIS WEB PADA MADRASAH ALIYAH SALAFIYAH SYAFI’IYAH SUKOREJO', 'Terverifikasi', NULL, NULL),
(1560, '2025', '2020502051', 'ITA ULIZZAH', 'P', 16, 'Jembrana', 'Jembrana', 'Bali', 'Skripsi Sistem Informasi Penjualan Ayam Berbasis Web Pada Toko Ayam Makin Di Jembrana', '', NULL, NULL),
(1561, '2025', '2020503067', 'SOFIYATUL LAILI', 'P', 17, 'Kapongan', 'Situbondo', 'Jawa Timur', 'Analisis Sistem Informasi Inventaris Sarana Prasarana Di Mts Darul Ulum Kapongan Berbasis Web', '', NULL, NULL),
(1562, '2025', '2021205016', 'NAZELA NURIEL AKBAR', 'P', 1, 'KEDUNGDUNG', 'SAMPANG', '', 'Perlakuan Akuntansi Syariah Pada Produk Tabungan Easy Wadiah Di Bank Syariah Indonesia Kcp Basuki Rahmat Situbondo', '', NULL, NULL),
(1563, '2025', '2019501006', 'NASRUDDIN', 'L', 15, 'Arjasa', 'Sumenep', 'Jawa Timur', 'Rancang Bangun Smart Inkubator Penetas Telur Ayam Berbasis Internet Of Thing (IOT)', '', NULL, NULL),
(1564, '2025', '2021204092', 'RANIYATUL JAMILAH', 'P', 5, 'Banyuputih', 'Situbondo', 'Jawa Timur', 'Analisis Strategi Pengembangan Umkm Untuk Meningkatkan Profitabilitas Di Era Revolusi Industri 4.0 Dan Society 5.0 (Studi Kasus Toko Diva Collection Sumberejo Banyuputih Situbondo)', '', NULL, NULL),
(1565, '2026', '2019503053', 'NING ANISA NURUL KHORIYAH', 'P', 17, 'Banyuputih', 'Situbondo', 'Jawa Timur', 'Rancang Bangun Sistem Informasi Penilaian Raport Peserta Didik Berbasis WEB Pada SDN 1 Sumberwaru Situbondo Menggunakan PHP dan MYSQL', '', NULL, NULL),
(1566, '2026', '2021502007', 'ALFAN JAMIL', 'L', 16, 'JELBUK', 'KAB. JEMBER', 'Jawa Timur', 'IMPLEMENTASI ALGORITMA K-NN DALAM MEMPREDIKSI PENJUALAN KITAB DAN BUKU TERLARIS MENGGUNAKAN METODE K-NEAREST NEIGHBOR (K-NN) STUDI KASUS. TOKO KITAB ASSYARIF PP. SALAFIYAH SYAFI\'IYAH SUKOREJO', '', NULL, NULL),
(1567, '2026', '2021502005', 'BAGAS WIRA YUDA', 'L', 16, 'PANJI', 'KAB. SITUBONDO', 'JAWA TIMUR', 'RANCANG BANGUN SISTEM INFORMASI PRAKTIK KERJA LAPANGAN PADA SMKS NURUL ULUM SEMIRING SITUBONDO', '', NULL, NULL),
(1568, '2026', '2021203024', 'Muhammad Nur Hasyim', 'L', 3, 'Tenggarang', 'Bondowoso', 'Jawa Timur', 'ANALISIS PRAKTIK PEMBIAYAAN MUDHARABAH DALAM PERSPEKTIF EKONOMI SYARIAH PADA BANK SYARIAH INDONESIA (BSI) KC BANYUWANGI BASUKI RAHMAT', '', NULL, NULL),
(1569, '2024', '20190301004', 'Achmad Nur Faizin', '-', 8, 'Wongsorejo', 'Banyuwangi', 'Jawa Timur', 'Implementasi Metode Binnadzor dalam Peningkatkan Kemampuan Membaca Al-Quran Secara Tartil Santri Pra Tahfidz di Tahfidzul Quran Putra Pondok Pesantren Syalafiyah Syafi’iyah Sukorejo Situbondo 2023-2024', 'Terverifikasi', NULL, NULL),
(1570, '2024', '2020302020', 'Reza Fadhoilol Maulidil Bayan', '-', 9, 'Bondowoso', 'Bondowoso', 'Jawa Timur', 'Pengembangan Media Pembelajaran Bahasa Arab Berbasis Domino Card Aroby Dalam Menghafal Mufrodat di Asrama Sunan Kali Jogo no.18 PP. Salafiyah Syafi\'iyah Sukorejo', 'Terverifikasi', NULL, NULL),
(1571, '2024', '2020702024', 'Rizki Shofar Attaka', '-', 19, 'Kalipuro', 'Banyuwangi', 'Jawa Timur', 'Analisis Yuridis Tindak Pidana Pencabulan Terhadap Anak Di Bawah Umur Dalam Putusan No. 86/Pid.Sus/2022/PT.Bdg', 'Terverifikasi', NULL, NULL),
(1572, '2024', '2020502034', 'Zainur Rohman', '-', 16, 'Arjasa', 'Situbondo', 'Jawa Timur', 'Penerapan Metode Naive Bayes Untuk Penerima Kartu Indonesia Pintar(KIP)', 'Terverifikasi', NULL, NULL),
(1573, '2024', '2019202011', 'Hanin Faizi', '-', 4, 'Jembrana', 'Bali', 'Bali', 'Tinjauan Hukum Islam Terhadap Tradisi \"Keiakat\" Dalam Perkawinan Di Desa Loloan Timur Jembrana Bali', 'Terverifikasi', NULL, NULL),
(1574, '2024', '2020304027', 'Sita Nadiatul Husnah', '-', 11, 'Songgon', 'Banyuwangi', 'Jawa Timur', 'Pengaruh Model Pembelajaran Jigsaw Terhadap Hasil Belajar Matematika Kelas X Pada Materi Fungsi Invers', 'Terverifikasi', NULL, NULL),
(1575, '2024', '2020702035', 'Firdaus Hasanah', '-', 19, 'Jambesari', 'Bondowoso', 'Jawa Timur', 'Perlindungan Hukum Bagi Perangkat Desa Yang diberhentikan Tidak Sesuai dengan Peraturan Perundang-undangan.', 'Terverifikasi', NULL, NULL),
(1576, '2024', '2020702034', 'Fatimatus Zahro', '-', 19, 'Silo', 'Jember', 'Jawa Timur', 'Perlindungan Hukum Bagi/Terhadap Korban Tindak Pidana Perdagangan Orang Pidana Eksploitasi Orang', 'Terverifikasi', NULL, NULL),
(1577, '2024', '2020503061', 'Siti Rofi\'ah', '-', 17, 'Wongsorejo', 'Banyuwangi', 'Jawa Timur', 'Sistem Penentu keputusan Kelas Unggulan Dengan Metode Simple Additive Weighting (SAW)', 'Terverifikasi', NULL, NULL),
(1578, '2024', '2020202020', 'Mohammad Amyal', '-', 19, 'Pujer', 'Bondowoso', 'Jawa Timur', 'Prespektif Hukum Islam Terhadap Putusan Hakim Nomor: 1690/Pdt.G/2023/PA.SIT Tentang Gugatan Hak Asuh Anak Pasca Perceraian (Studi Kasus di Pengadilan Agama Situbondo)', 'Terverifikasi', NULL, NULL),
(1579, '2024', '2020702039', 'Julia Putri Nur Azizah', '-', 19, 'Silo', 'Jember', 'Jawa Timur', 'Perlindungan Hukum Bagi Pemegang Hak Cipta Buku(Copyright) Berdasarkan Undang-Undang Republik Indonesia No. 28 Tahun 2014 Tentang Hak Cipta', 'Terverifikasi', NULL, NULL),
(1580, '2024', '2019702039', 'Nyoman Fitriyatun Naziroh', '-', 19, 'Sukasada', 'Buleleng', 'Bali', 'Analisis Unsur Perencanaan Dalam Tindak Pidana Pembunuhan Berencana Sebagimana Pasal 340 KUHP (Studi Putusan Hakim Nomor 709/Pid.B/2019/PN Jmr)', 'Terverifikasi', NULL, NULL),
(1581, '2024', '2020402016', 'Syaifi Ali Ahmad Almadani', '-', 7, 'Grokgak', 'Buleleng', 'Bali', 'Komunikasi Organisasi Via WhatsApp Bagi pengurus IPNU Dan IPPNU di Pejarakan Gerokgak Buleleng Bali', 'Terverifikasi', NULL, NULL),
(1582, '2024', '2020402012', 'Zammil Iwan Zainuri', '-', 7, 'Asembagus', 'Situbondo', 'Jawa Timur', 'Dakwah KH. Moh. Aso Syamsuddin Pada Komunitas Gapsafa', 'Terverifikasi', NULL, NULL),
(1583, '2024', '2019703018', 'Fatimatus Zahro', '-', 18, 'Jangkar', 'Situbondo', 'Jawa Timur', 'Analisis Akuntabilitas dan Transparansi Laporan Keuangan Pada Bumdes Desa Sopet Kecamatan Jangkar Kabupaten Situbondo', 'Terverifikasi', NULL, NULL),
(1584, '2024', '2020703024', 'Lindawati', '-', 18, 'Grokgak', 'Buleleng', 'Bali', 'PENGARUH KUALITAS PELAYANAN DAN HARGA TERHADAP KEPUASAN KONSUMEN PADA WARUNG MUSLIM SPESIAL IKAN LAUT BAKAR PAK HAJI BULELENG', 'Terverifikasi', NULL, NULL),
(1585, '2024', '2020204018', 'Hadi Pratama', '-', 5, 'Sandubaya', 'Mataram', 'Nusa Tenggara Barat', 'Manajemen Strategi Pemasaran Syariah Dalam Meningkatkan Minat Konsumen', 'Terverifikasi', NULL, NULL),
(1586, '2024', '2022503123', 'Ani Rahman', '-', 17, 'Wonosari', 'Bondowoso', 'Jawa Timur', 'Sistem Informasi Perpustakaan MTsN 2 Bondowoso Berbasis Web', 'Terverifikasi', NULL, NULL),
(1587, '2024', '20205010027', 'Zikrullah', '-', 15, 'Wanasaba', 'Lombok Timur', 'Nusa Tenggara Barat', 'Rancang Bangun Alat Pendekteksi Asap Rokok Berbasis IoT Menggunakan Micro Controller ESP32-CAM Dan Sensor MQ-135 Di Pondok Pesantren Salafiyah Syafi\'iyah Sukorejo', 'Terverifikasi', NULL, NULL),
(1588, '2024', '2020302005', 'Andrian Hidayat', '-', 9, 'Batu Kliyan Utara', 'Lombok Tengah', 'Nusa Tenggara Barat', 'Pengembangan Kitab Ajar Matan Al-Jurumiyah Berbasis Tanya Jawab Dan Skema Dalam Meningkatkan Kemampuan Baca Kitab Di Madrasah Diniyah Pondok Pesantren Nurul Qur\'an Lendang Simbe Praya Lombok Tengah Tahun Pelajaran 2023/2024', 'Terverifikasi', NULL, NULL),
(1589, '2024', '2020704011', 'Anisa Shofiyah', '-', 21, 'Jambesari', 'Bondowoso', 'Jawa Timur', 'DEVELOPING PART OF SPEECH BOOK IN GRAMMAR CLASS OF ENGLISH', 'Terverifikasi', NULL, NULL),
(1590, '2024', '2020702009', 'Haqqul Yaqin', '-', 19, 'Nonggunung', 'Sumenep', 'Jawa Timur', 'Analisis Yuridis Perlindungan Hukum Terhadap Korban Tindak Pidana E-Commerce', 'Terverifikasi', NULL, NULL),
(1591, '2024', '2020702010', 'Izzul Muslim', '-', 19, 'Jangkar', 'Situbondo', 'Jawa Timur', 'Perlindungan Konsumen Akibat Kelalaian Pelaku Usaha Jasa Laundry Berdasarkan Undang-Undang No. 8 Tahun 1999 Tentang Perlindungan Konsumen', 'Terverifikasi', NULL, NULL),
(1592, '2024', '2020701002', 'Andriyan Adi Wijaya', '-', 20, 'Sukowono', 'Jember', 'Jawa Timur', 'Hubungan Antara Regulasi Diri dan Performansi Akademik Siswa Sekolah Menengah Kejuruan(SMK) Ibrahimy 1 Sukorejo', 'Terverifikasi', NULL, NULL),
(1593, '2024', '2020202014', 'Hizwan Irwana', '-', 4, 'Janapria', 'Lombok Tengah', 'Nusa Tenggara Barat', 'Perpektif Hukum Islam Terhadap Adat Botak Jodok Langan Aran  Pra Ta\'aruf', 'Terverifikasi', NULL, NULL),
(1594, '2024', '2020031155', 'Rizki Mariyatul Qibtiyah', '-', 8, 'Asembagus', 'Situbondo', 'Jawa Timur', 'Pengaruh Pergaulan Teman Sebaya Terhadap Kepribadian Siswa Kelas IX di MTs. Darur Rahma Asembagus Situbondo Tahun Pelajaran 2023/2024', 'Terverifikasi', NULL, NULL),
(1595, '2024', '2020703007', 'Moh. Mujib', '-', 18, 'Banyuwangi', 'Banyuwangi', 'Jawa Timur', 'Pengaruh Kompertensi Sumgber Daya Manusia Dan Gaya Kepemimpinan Terhadap Kualitas Laporan Keuangan Desa Di Desa Kecamatan Kalipuro Kabupaten Banyuwangi', 'Terverifikasi', NULL, NULL),
(1596, '2024', '2020205004', 'Isqiyyatun Itfiyah', '-', 1, 'Bungatan', 'Situbondo', 'Jawa Timur', 'Pengaruh Modal Kerja Dan Struktur Modal Terhadap Profitabilitas Perusahaan (Studi Kasus Pada Perusahaan Food And Baferage)', 'Terverifikasi', NULL, NULL),
(1597, '2024', '2020204023', 'Khoirullah', '-', 5, 'Grujugan', 'Bondowoso', 'Jawa Timur', 'Implementasi Etika Bisnis Islam Dalam Meningkatkan Volume Penjualan Di Nabila Collection Bondowoso', 'Terverifikasi', NULL, NULL),
(1598, '2024', '2020401013', 'Muhammad I\'tizam Habaz', '-', 6, 'Grokgak', 'Buleleng', 'Bali', 'Konseling Islam Dalam Mengatasi Kekerasan Dalam Rumah Tangga KUA Gerokgak Buleleng Bali', 'Terverifikasi', NULL, NULL),
(1599, '2024', '20200301144', 'Taufiq Hidayat', '-', 8, 'Sumber Malang', 'Situbondo', 'Jawa Timur', 'Kolaborasi Guru Dengan Wali Murid Dalam Pemberntukan Karakter Religius Siswa Kelas VIII MMts Miftahul Jannah Desa Rawan Selataan Kecamatan Besuki Kabupaten  Situbondo Tahun Pelajaran 2023/2024', 'Terverifikasi', NULL, NULL),
(1600, '2024', '20200301016', 'Firman Hidayatullah', '-', 8, 'Raas', 'Sumenep', 'Jawa Timur', 'Pembinaan Akhlaq Siswa Kelas VIII di SMP Ibrahimy 1 Sukorejo', 'Terverifikasi', NULL, NULL),
(1601, '2024', '2018303032', 'Alif Irma Mardini', '-', 17, 'Jangkar', 'Situbondo', 'Jawa Timur', 'Sistem Informasi Penjualan Alat Tulis Kantor(ATK) Pondok Pesantren Al-Falah Yang Efektif dan Efisien Dengan Menggunakan PHP dan MySql', 'Terverifikasi', NULL, NULL),
(1602, '2024', '20200301068', 'Anis Fitria Shodiq', '-', 8, 'Banyuputih', 'Situbondo', 'Jawa Timur', 'Implementasi Kegiatan Ekstrakurikuler Tahfidz Dalam Membentuk Karakter Religius Siswa Di SMPN 1 Banyuputih Tahun Pelajaran 2023/2024', 'Terverifikasi', NULL, NULL),
(1603, '2024', '2020302045', 'Sinta Nurul Izzati', '-', 9, 'Wonosari', 'Bondowoso', 'Jawa Timur', 'Pengembangan Media  FlashCard Dalam Meningkatkan Penguasaan Mufrodat Anak Usia Dini RA Manbaul Ulum Tangsil Wetan Bondowoso Kelompok B Tahun Pelajaran 2024/2025', 'Terverifikasi', NULL, NULL),
(1604, '2024', '2020701036', 'Rahmawati', '-', 20, 'Asembagus', 'Situbondo', 'Jawa Timur', 'Hubungan Antara Dukungan Sosial Dengan Kepercayaan Diri Orang Tua Yang Memiliki Anak Berkebutuhan Khusus di SLB Dharma Wanita Situbondo', 'Terverifikasi', NULL, NULL),
(1605, '2024', '20200301036', 'Muh. Arifin', '-', 8, 'Wanasaba', 'Lombok Timur', 'Nusa Tenggara Barat', 'PPemanfaatan Kitab Manhalul Qur\'an Sebagai Sumber Referensi Pembelajaran Al-Qur\'an Siswa Kelas (A) Al Barqi Pondok PPesantren Baiturrahman Bagik Papan Tahun  Pelajaran 2023/2024', 'Terverifikasi', NULL, NULL),
(1606, '2024', '2020702045', 'NUR KHOLISHAH', '-', 19, 'Kuta', 'Badung', 'Bali', 'Implementasi Perwujudan Asas Peradilan Sederhana, Cepat Dan Biaya Ringan Melalui Electronic Justice System (E-Court) (Studi Di Pengadilan Negeri Kraksaan Kelas 1 B)', 'Terverifikasi', NULL, NULL),
(1607, '2024', '2020502015', 'Lukman Hakim', '-', 16, 'Modung', 'Bangkalan', 'Jawa Timur', 'Penentuan Pola Pelanggaran Santri Pada Bidang Keamanan Dan Ketertiban dengan Menggunakan Algoritma Apriori', 'Terverifikasi', NULL, NULL),
(1608, '2024', '2020302023', 'Wahyu Abdul Qadir', '-', 9, 'Negara', 'Jembrana', 'Bali', 'Pengembangan Media Pembelajaran Flash Card Dalam Pembelajaran Bahasa Arab Untuk Meningkatkan Hasil Belajar  Siswa Kelas Vii Mts N 3 Jembrana', 'Terverifikasi', NULL, NULL),
(1609, '2024', '2019501006', 'Nasruddin', '-', 15, 'Arjasa', 'Sumenep', 'Jawa Timur', 'Rancang Bangun Smart Inkubator Penetasan Telur Ayam Berbasis Internet Of Things (IoT)', 'Terverifikasi', NULL, NULL),
(1610, '2024', '2020302022', 'Subhan Basori', '-', 9, 'Cermee', 'Bondowoso', 'Jawa Timur', 'Pengembangan Media Pembelajaran Menggunakan Kartu Arabic Berbasis Media Visual Proyektor di MTS. Raudatul Falah Cermee Kelas VII B Tahun Akademik 2023/2024', 'Terverifikasi', NULL, NULL),
(1611, '2024', '2020205011', 'Rif\'atul Husna', '-', 1, 'Kuta', 'Badung', 'Bali', 'Penerapan Akuntansi Syari\'ah Pada Gadai Emas Berdasarkan PSAK 59 Di Pegadaian Syari\'ah Cabang Kartini Denpasar Bali', 'Terverifikasi', NULL, NULL),
(1612, '2024', '2020701041', 'Siti Holisah Anjari', '-', 20, 'Tlogosari', 'Bondowoso', 'Jawa Timur', 'Hubungan Antara Bondwagon Effect dengan perilaku Konsumtif Remaja di Asrama Nyai Mukarromah Ponpes Salafiyah Syafi\'iyah', 'Terverifikasi', NULL, NULL),
(1613, '2024', '2020703008', 'Moh. Risky Afifuddin', '-', 18, 'Asembagus', 'Situbondo', 'Jawa Timur', 'Analisis Perbandingan Produksi Menggunakan Metode Full Costing Serta Variable Costing Pada UMKM Roti Ariska Jangkar', 'Terverifikasi', NULL, NULL),
(1614, '2024', '2020502002', 'Abdul Wasik', '-', 16, 'Sukowono', 'Jember', 'Jawa Timur', 'Implementasi Data Mining Untuk Memprediksi Penjualan Accessoris Handphone dan handphone Terlaris Menggunakan Metode K-NN', 'Terverifikasi', NULL, NULL),
(1615, '2024', '2020203020', 'Malikul Irfan', '-', 3, 'Sumberjambe', 'Jember', 'Jawa Timur', 'Analisis Akad Murabahah bil Wakalah Pada Pembiayaan Konsumtif Terhadap Kemaslahatan Bank dan Nasabah', 'Terverifikasi', NULL, NULL),
(1616, '2024', '2019702003', 'Abdul Aziz Yusrissurur', '-', 19, 'Gayam', 'Sumenep', 'Jawa Timur', 'Pertanggungjawaban Tindak Pidana Pembunuhan Berencana Terhadap Anak Kandung (Putusan Mahkamah Agung Nomor 564 K/Pid.Sus/2018)', 'Terverifikasi', NULL, NULL),
(1617, '2024', '2020303016', 'Nita Nazila Rahma', '-', 10, 'Gerokgak', 'Buleleng', 'Bali', 'Pengembangan Media Pembelajaran Berbasis Augmented Reality Canva Tema Binatang Untuk Meningkatkan Kognitif Anak Kelompok B RA Fatahillah Gondol Gerokgak Buleleng Bali Tahun Pelajaran 2023/2024', 'Terverifikasi', NULL, NULL),
(1618, '2024', '2020302012', 'M. HIKAM ISMIL HABAIB', '-', 9, 'Banyuputih', 'Situbondo', 'Jawa Timur', 'PENGEMBANGAN BAHAN AJAR LEMBAR KERJA SISWA BAHASA ARAB MELALUI MEDIA POWER POINT KELAS 4 DI MADRASAH IBTIDA’IYAH AL-IKHLAS KARANGREJO SUMBEREJO BANYUTPUTIH SITUBONDO TAHUN 2023-2024', 'Terverifikasi', NULL, NULL),
(1619, '2024', '2020302004', 'Alvian Fuadi', '-', 9, 'Banyuputih', 'Situbondo', 'Jawa Timur', 'PENGEMBANGAN BAHAN AJAR KITAB QIRA’AH RASYIDAH MUHADASTAH BAHASA ARAB BERBASIS POLA UNGKAPAN DALAM AL-QUR’AN MELALUI IQTIBAS DI KELAS I WUSTHA BAHASA MADRASAH I’DADDIYAH SALAFIYAH SYAFI’IYAH PUTRA 2024', 'Terverifikasi', NULL, NULL),
(1620, '2024', '2020702012', 'M.Sampasihullisan', '-', 19, 'Praya Timur', 'Lombok Tengah', 'Nusa Tenggara Barat', 'Analisis pertimbangan putusan Hukum Hakim  tentang Noodweer Excess (studi putusan No:99 /Pid.B/2022/PN.pya)', 'Terverifikasi', NULL, NULL),
(1621, '2024', '2020701045', 'Ulfatul Hasanah', '-', 20, 'Ganding', 'Sumenep', 'Jawa Timur', 'Hubungan Kematangan Emosi dengan Kepatuhan Santri di Asrama Al-Khuzaimah Pondok Pesantren Salafiyah Syafi\'iyah Sukorejo', 'Terverifikasi', NULL, NULL),
(1622, '2024', '2020302020', 'Dewi Aisyah', '-', 9, 'Nonggunong', 'Sumenep', 'Jawa Timur', 'Pengembangan Buku Saku Mufradat Bahasa Arab Dengan Media Audiovisual Pada Maharah Kalam Siswa Kelas Mubtadi’in di Asrama Bahasa Pusat Putri Salafiyah Syafi’iyah Sukorejo Situbondo Tahun 2024-2025', 'Terverifikasi', NULL, NULL),
(1623, '2024', '2020502052', 'Lailatul Udmah', '-', 16, 'Kalibaru', 'Banyuwangi', 'Jawa Timur', 'Implementasi Smart tracking Pada Manajemen Pengiriman Barang Berbasis WEB', 'Terverifikasi', NULL, NULL),
(1624, '2024', '2020502049', 'Ikfina Azizah', '-', 16, 'Arjasa', 'Jember', 'Jawa Timur', 'Particle Swarm Optimization (PSO) Sebagai Optimasi Algoritma Naive Bayes Untuk Analisis Sentimen Twitter Pada Drama Queen Of Tears', 'Terverifikasi', NULL, NULL),
(1625, '2024', '2020502039', 'Cholifah', '-', 16, 'Pujer', 'Bondowoso', 'Jawa Timur', 'Perancangan dan Implementasi Sistem Informasi Elektronik Rice Card (Erica) Pada Pondok Pesantren Kunuzul Imam Kauman Bondowoso', 'Terverifikasi', NULL, NULL),
(1626, '2024', '2019504003', 'Muhammad Raden Fatah', '-', 12, 'Bangurejo', 'Banyuwangi', 'Jawa Timur', 'Perancangan Auditorium Ponpes SMP ALAM Banyuwangi Islamic School Dengan Konsep Arsitektur Islam NEO VERNAKULER', 'Terverifikasi', NULL, NULL),
(1627, '2024', '2020701007', 'Moh. Ifan Khumaini', '-', 20, 'Jangkar', 'Situbondo', 'Jawa Timur', 'HUBUNGAN DUKUNGAN SOSIAL DAN KETAKUTAN AKAN KEGAGALAN DENGAN MOTIVASI BERPRESTASI SANTRI JAM’IYATUL QURRO’ PONDOK PESANTREN SALAFIYAH SYAFI’IYAH SUKOREJO SITUBONDO', 'Terverifikasi', NULL, NULL);
INSERT INTO `mahasiswas` (`id`, `lulusan`, `nim`, `nama`, `jk`, `prodi_id`, `kecamatan`, `kabupaten`, `provinsi`, `tugas_akhir`, `verifikasi`, `created_at`, `updated_at`) VALUES
(1628, '2024', '2024604001', 'Anisa Febrianti', '-', 24, 'Mayang', 'Jember', 'Jatim', 'Asuhan Kebidanan Komprehensif pada Ny. “S” dengan Kekurangan Energi Kronis (KEK) di Wilayah Kerja Puskesmas Kapongan', 'Terverifikasi', NULL, NULL),
(1629, '2024', '2024604002', 'Arifah Arifin', '-', 24, 'Bangsalsari', 'Jember', 'Jatim', 'Asuhan Kebidanan Komprehensif pada Ny. “R” dengan Kekurangan Energi Kronis (KEK) di Wilayah Kerja Puskesmas Arjasa Kabupaten Situbondo', 'Terverifikasi', NULL, NULL),
(1630, '2024', '2024604003', 'Arifatul Hasanah', '-', 24, 'Bungatan', 'Situbondo', 'Jatim', 'Asuhan Kebidanan Komprehensif pada Ny. “S” dengan Kekurangan Energi Kronis (KEK) di Wilayah Kerja Puskesmas Panarukan', 'Terverifikasi', NULL, NULL),
(1631, '2024', '2024604004', 'Dianatul Firdausiyeh', '-', 24, 'Sukowono', 'Jember', 'Jatim', 'Asuhan Kebidanan Komprehensif pada Ny. “Y” dengan Hipertensi Gestasional di Wilayah Kerja Puskesmas Mangaran Kabupaten Situbondo', 'Terverifikasi', NULL, NULL),
(1632, '2024', '2024604005', 'Dina Al Habsyi', '-', 24, 'Sangkapura', 'Gresik', 'Jatim', 'Asuhan Kebidanan Komprehensif pada Ny. “S” dengan Kekurangan Energi Kronis (KEK) di Wilayah Kerja Puskesmas Panji Kabupaten Situbondo', 'Terverifikasi', NULL, NULL),
(1633, '2024', '2024604006', 'Euis Nur Fatihah', '-', 24, 'Cakung', 'Jakarta Timur', 'DKI Jakarta', 'Asuhan Kebidanan Komprehensif pada Ny. “F” dengan Anemia di Wilayah Kerja Puskesmas Kapongan Kabupaten Situbondo', 'Terverifikasi', NULL, NULL),
(1634, '2024', '2024604007', 'Eyyi Tuwidis Sidari', '-', 24, 'Wongsorejo', 'Banyuwangi', 'Jatim', 'Asuhan Kebidanan Komprehensif pada Ny. “N” dengan Kekurangan Energi Kronis (KEK) di Wilayah Puskesmas Banyuputih Kabupaten Situbondo', 'Terverifikasi', NULL, NULL),
(1635, '2024', '2024604008', 'Fany Matul Hidayah', '-', 24, 'Singojuruh', 'Banyuwangi', 'Jatim', 'Asuhan Kebidanan Komprehensif pada Ny. “D” dengan Kekurangan Energi Kronik (KEK) di Wilayah Kerja Puskesmas Panarukan Kabupaten Situbondo', 'Terverifikasi', NULL, NULL),
(1636, '2024', '2024604009', 'Haerani', '-', 24, 'Sapeken', 'Sumenep', 'Jatim', 'Asuhan Kebidanan Komprehensif pada Ny. “U” dengan Kehamilan Risiko Tinggi Abortus di Wilayah Kerja Puskesmas Arjasa Situbondo', 'Terverifikasi', NULL, NULL),
(1637, '2024', '2024604010', 'Hermiyati Rohmanah', '-', 24, 'Gerokgak', 'Buleleng', 'Bali', 'Asuhan Kebidanan Komprehensif pada Ny. “M” dengan Kekurangan Energi Kronis (KEK) dan Anemia di Wilayah Kerja Puskesmas Mangaran Kabupaten Situbondo', 'Terverifikasi', NULL, NULL),
(1638, '2024', '2024604011', 'Iif Nurifqoh', '-', 24, 'Panongan', 'Tangerang', 'Banten', 'Asuhan Kebidanan Komprehensif pada Ny. “A” dengan Anemia di Wilayah Kerja Puskesmas Kapongan Kabupaten Situbondo', 'Terverifikasi', NULL, NULL),
(1639, '2024', '2024604012', 'Ilta Susiana', '-', 24, 'Dungkek', 'Sumenep', 'Jatim', 'Asuhan Kebidanan Komprehensif pada Ny. “B” dengan Kekurangan Energi Kronik (KEK) di Wilayah Kerja Puskesmas Panarukan Kabupaten Situbondo', 'Terverifikasi', NULL, NULL),
(1640, '2024', '2024604013', 'Ismayani', '-', 24, 'Kopang', 'Lombok Tengah', 'Nusa Tenggara Barat', 'Asuhan Kebidanan Komprehensif pada Ny. “V” dengan Kekurangan Energi Kronis (KEK) di Wilayah Kerja Puskesmas Banyuputih Kabupaten Situbondo', 'Terverifikasi', NULL, NULL),
(1641, '2024', '2024604014', 'Lailatul Latifah', '-', 24, 'Silo', 'Jember', 'Jawa Timur', 'Asuhan Kebidanan Komprehensif pada Ny. “L” dengan Anemia di Wilayah Kerja Puskesmas Panji Kabupaten Situbondo', 'Terverifikasi', NULL, NULL),
(1642, '2024', '2024604015', 'Nadila Dwi Saputri', '-', 24, 'Klungkung', 'Klungkung', 'Bali', 'Asuhan Kebidanan Komprehensif pada Ny. “F” dengan Anemia di Wilayah Kerja Puskesmas Mangaran Kabupaten Situbondo', 'Terverifikasi', NULL, NULL),
(1643, '2024', '2024604016', 'Nur Dina Camelia', '-', 24, 'Kangayan', 'Sumenep', 'Jatim', 'Terapi Redam Kaki dengan Air Hangat Sebagai Upaya Penurunan Hipertensi', 'Terverifikasi', NULL, NULL),
(1644, '2024', '2024604017', 'Rohmatul Fadilah', '-', 24, 'Jatiroto', 'Lumajang', 'Jatim', 'Asuhan Kebidanan Komprehensif Pada Ny  D\" Dengan Kehamilan Berisiko Tinggi dan Hipertensi Gestasional di Wilayah Kerja Puskesmas Asembagus Kabupaten Situbondo', 'Terverifikasi', NULL, NULL),
(1645, '2024', '2024604018', 'Siti Romlah', '-', 24, 'Gerokgak', 'Buleleng', 'Bali', 'Asuhan Kebidanan Komprehensif pada Ny. “S” dengan Kehamilan Risiko Tinggi di Wilayah Kerja Puskesmas Arjasa Kabupaten Situbondo', 'Terverifikasi', NULL, NULL),
(1646, '2024', '2024604019', 'Susiana', '-', 24, 'Arjasa', 'Sumenep', 'Jatim', 'Asuhan Kebidanan Komprehensif pada Ny. “S” dengan Anemia di Wilayah Kerja Puskesmas Panji Kabupaten Situbondo', 'Terverifikasi', NULL, NULL),
(1647, '2024', '2024604020', 'Tiara Indriani', '-', 24, 'Sangkapura', 'Gresik', 'Jatim', 'Asuhan Kebidanan Komprehensif pada Ny \"H\" dengan Jarak Kehamilan Terlalu Dekat dan Anemia di Wilayah Kerja Puskesmas Panji Kabupaten Situbondo', 'Terverifikasi', NULL, NULL),
(1648, '2024', '2024604021', 'Umi Nur Kholifah', '-', 24, 'Rogojampi', 'Banyuwangi', 'Jatim', 'Asuhan Kebidanan Komprehensif pada Ny. “N” dengan Kekurangan Energi Kronis (KEK) di Wilayah Kerja Puskesmas Banyuputih Kabupaten Situbondo', 'Terverifikasi', NULL, NULL),
(1649, '2024', '2024604022', 'Wili Sinarti', '-', 24, 'Kopang', 'Lombok Tengah', 'Nusa Tenggara Barat', 'Asuhan Kebidanan pada Ny. “A” dengan Kekurangan Energi Kronis (KEK) di Wilayah Kerja Puskesmas Mangaran Kabupaten Situbondo', 'Terverifikasi', NULL, NULL),
(1650, '2024', '2024604023', 'Yaumil Fitriyah', '-', 24, 'Gerokgak', 'Buleleng', 'Bali', 'Asuhan Kebidanan Komprehensif pada Ny. “D” dengan Anemia di Wilayah Kerja Puskesmas Panarukan Kabupaten Situbondo', 'Terverifikasi', NULL, NULL),
(1651, '2024', '2024604024', 'Zidni Karimatun Nisa', '-', 24, 'Purwoharjo', 'Banyuwangi', 'Jatim', 'Asuhan Kebidanan Komprehensif pada Ny. “L” dengan Kekurangan Energi Kronis (KEK) di Wilayah Kerja Puskesmas Kapongan Kabupaten Situbondo', 'Terverifikasi', NULL, NULL),
(1652, '2024', '2020502027', 'Rahmat Arif Widyanto', '-', 16, 'Kalibaru', 'Banyuwangi', 'Jawa Timur', 'Sistem Informasi Geografis Pemetaan Pasar tradisional di Kabupaten banyuwangi', 'Terverifikasi', NULL, NULL),
(1653, '2024', '2020501032', 'Farah Sakina', '-', 15, 'Kalibaru', 'Banyuwangi', 'Jawa Timur', 'RANCANG BANGUN SISTEM PENDETEKSI KEBOCORAN GAS LPG MENGGUNAKAN SENSOR MQ2 DAN MIKROKONTROLER ESP32', 'Terverifikasi', NULL, NULL),
(1654, '2024', '2019702001', 'A.HABAIBURRAHMAN', '-', 19, 'Gayam', 'Sumenep', 'Jawa Timur', 'PENERAPAN PROSES PENYIDIKAN MENCARI ALAT BUKTI KETERANGAN DENGAN MELANGGAR ASAS EQUALITY BEFORE THE LAW DALAM PUTUSAN PERKARA PIDANA NOMOR 541/PID.B/2022/PN JKT.PST', 'Terverifikasi', NULL, NULL),
(1655, '2024', '2020304021', 'Nur Aminatun Nadhifah', '-', 11, 'Kwanyar', 'Bangkalan', 'Jawa Timur', 'PENGEMBANGAN PERANGKAT PEMBELAJARAN BERBASIS ETHNOMATEMATICS DENGAN MODEL GUIDED DISCOVERY LEARNING', 'Terverifikasi', NULL, NULL),
(1656, '2024', '20200301057', 'Syukron Khoirus Shobri', '-', 8, 'Banyuputih', 'Situbondo', 'Jawa Timur', 'Pembentukan karakter Religius Siswa Di SMP Negeri 1 Banyuputih Situbondo Tahun Pelajaran 2023/2024', 'Terverifikasi', NULL, NULL),
(1657, '2024', '2020701001', 'Ahmad Alfin Zaman', '-', 20, 'Denpasar', 'Denpasar', 'Bali', 'Hubungan Konformitas Dan Kontrol Diri Dengan Intensi Kenakalan Santri Rayon Iksass Bali Pondok Pesantren Salafiyah Syafi’iyah Sukorejo', 'Terverifikasi', NULL, NULL),
(1658, '2024', '2020302003', 'Akhmad Mutawakil', '-', 9, 'Negara', 'Jembrana', 'Bali', 'PENGEMBANGAN BUKU SAKU PINTAR ILMU NAHWU DALAM PENINGKATAN MAHARAH QIRA’AH SANTRI ASRAMA SUNAN DRAJAT NOMOR 02 PONDOK PESANTREN SALAFIYAH SYAFI’IYAH', 'Terverifikasi', NULL, NULL),
(1659, '2024', '20200301055', 'Syakur Ramadhan', '-', 8, 'Simpang Ilir', 'Kayong Utara', 'Kalimantan Barat', 'PERAN GURU PENDIDIKAN AGAMA ISLAM PADA PROJEK PENGUATAN PROFIL PELAJAR PANCASILA DI SMP ISLAM SUNAN BONANG ARJASA SITUBONDO', 'Terverifikasi', NULL, NULL),
(1660, '2024', '2019503057', 'Sitti Diana Aisyah', '-', 17, 'Bawean Sangkapura', 'Gresik', 'Jawa Timur', 'Rancang bangun sistem informasi pelayanan pasien poskestren putri PP. Salafiyah Syafi\'iyah berbasis Web', 'Terverifikasi', NULL, NULL),
(1661, '2024', '2020503030', 'Muis', '-', 17, 'Jatibanteng', 'Situbondo', 'Jawa Timur', 'IMPLEMENTASI METODE MULTI OBJECTIVE OPTIMIZATION BY RATIO ANALYSIS (MOORA) PADA SISTEM PENDUKUNG KEPUTUSAN SELEKSI BANTUAN SISWA MISKIN DI SDN 1 KEMBANGSARI', 'Terverifikasi', NULL, NULL),
(1662, '2024', '2020201016', 'Salman Al faris', '-', 2, 'Grujugan', 'Bondowoso', 'Jawa Timur', 'TINJAUAN HUKUM ISLAM TENTANG JUAL BELI PADI DENGAN SISTEM BORONGAN DI DESA GRUJUGAN KIDUL KECAMATAN GRUJUGAN KABUPATEN BONDOWOSO', 'Terverifikasi', NULL, NULL),
(1663, '2024', '20200301061', 'Zaenal Abidin', '-', 8, 'Rowokangkung', 'Lumajang', 'Jawa Timur', 'PENERAPAN OUTDOOR STUDY DALAM PEMBELAJARAN FIQH KELAS X DI MADRASAH ALIYAH RAUDHATUL ULUM SUMBERANYAR ROWOKANGKUNG LUMAJANG TAHUN PELAJARAN 2023/2024', 'Terverifikasi', NULL, NULL),
(1664, '2024', '2020202026', 'Suprian Pratama', '-', 4, 'Gerung', 'Lombok Barat', 'NTB', 'Prespektif Hukum Islam Terhadap Tradisi Pegat Talin Kepeng Dalam Upacara Perkawinan Masyarakat Adat Suku Sasak', 'Terverifikasi', NULL, NULL),
(1665, '2024', '2020030141', 'M. Rahul Putra Candran', '-', 8, 'Dempet', 'Demak', 'Jawa Tengah', 'PEMBIASAAN PERILAKU POSITIF SISWA DALAM MEMBENTUK SIKAP MORAL (MORAL FEELING) DAN PERILAKU MORAL (MORAL BEHAVIOR) DI MI NEGERI 2 SITUBONDO TAHUN PELAJARAN 2023/2024', 'Terverifikasi', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_08_14_170933_add_two_factor_columns_to_users_table', 1),
(5, '2026_04_01_075239_add_username_avatar_to_users_table', 1),
(6, '2026_04_03_222917_create_permission_tables', 2),
(7, '2026_04_06_110105_create_fakultas_table', 3),
(8, '2026_04_06_113554_create_prodis_table', 4),
(9, '2026_04_06_230818_create_dosens_table', 5),
(10, '2026_04_07_031708_create_mahasiswas_table', 6),
(11, '2026_04_10_031713_create_plagiasi_tas_table', 7),
(12, '2026_04_10_033221_create_plagiasita_histories_table', 8),
(13, '2026_05_10_091751_create_dokumentasis_table', 9),
(14, '2026_05_10_091751_create_dokumentasi_table', 10),
(15, '2026_05_10_134755_create_doc_kategori_table', 11),
(20, '2026_05_10_135901_create_dokumentasi_table', 12);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(7, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 22);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'lihat-user', 'web', '2026-04-03 22:45:13', '2026-04-03 22:45:13'),
(2, 'tambah-user', 'web', '2026-04-03 22:45:13', '2026-04-03 22:45:13'),
(3, 'edit-user', 'web', '2026-04-03 22:45:13', '2026-04-03 22:45:13'),
(4, 'hapus-user', 'web', '2026-04-03 22:45:13', '2026-04-03 22:45:13'),
(5, 'lihat-role', 'web', '2026-04-05 01:13:50', '2026-04-05 01:13:50'),
(6, 'tambah-role', 'web', '2026-04-05 01:13:50', '2026-04-05 01:13:50'),
(7, 'edit-role', 'web', '2026-04-05 01:13:50', '2026-04-05 01:13:50'),
(8, 'hapus-role', 'web', '2026-04-05 01:13:50', '2026-04-05 01:13:50'),
(9, 'lihat-akses', 'web', '2026-04-06 01:49:56', '2026-04-06 01:49:56'),
(10, 'tambah-akses', 'web', '2026-04-06 01:49:56', '2026-04-06 01:49:56'),
(11, 'edit-akses', 'web', '2026-04-06 01:49:56', '2026-04-06 01:49:56'),
(12, 'hapus-akses', 'web', '2026-04-06 01:49:56', '2026-04-06 01:49:56'),
(19, 'lihat-fakultas', 'web', '2026-04-06 07:06:39', '2026-04-06 07:06:39'),
(20, 'lihat-prodi', 'web', '2026-04-06 07:06:47', '2026-04-06 07:06:47'),
(21, 'lihat-dosen', 'web', '2026-04-06 07:07:21', '2026-04-06 07:07:21'),
(22, 'lihat-mahasiswa', 'web', '2026-04-06 07:07:30', '2026-04-06 07:07:30'),
(23, 'tambah-fakultas', 'web', '2026-04-06 11:26:17', '2026-04-06 11:26:17'),
(24, 'edit-fakultas', 'web', '2026-04-06 11:26:27', '2026-04-06 11:26:27'),
(25, 'hapus-fakultas', 'web', '2026-04-06 11:27:57', '2026-04-06 11:27:57'),
(26, 'tambah-prodi', 'web', '2026-04-06 18:02:38', '2026-04-06 18:02:38'),
(27, 'edit-prodi', 'web', '2026-04-06 18:02:43', '2026-04-06 18:02:43'),
(28, 'hapus-prodi', 'web', '2026-04-06 18:02:48', '2026-04-06 18:02:48'),
(29, 'tambah-dosen', 'web', '2026-04-06 23:39:01', '2026-04-06 23:39:01'),
(30, 'edit-dosen', 'web', '2026-04-06 23:39:07', '2026-04-06 23:39:07'),
(31, 'hapus-dosen', 'web', '2026-04-06 23:39:17', '2026-04-06 23:39:17'),
(32, 'tambah-mahasiswa', 'web', '2026-04-07 04:03:01', '2026-04-07 04:03:01'),
(33, 'edit-mahasiswa', 'web', '2026-04-07 04:03:07', '2026-04-07 04:03:07'),
(34, 'hapus-mahasiswa', 'web', '2026-04-07 04:03:11', '2026-04-07 04:03:11'),
(40, 'lihat-plagiasi_ta', 'web', '2026-04-10 02:12:43', '2026-04-10 02:12:43'),
(41, 'edit-plagiasi_ta', 'web', '2026-04-10 02:12:50', '2026-04-10 02:12:50'),
(42, 'tambah-plagiasi_ta', 'web', '2026-04-10 02:13:01', '2026-04-10 02:13:01'),
(43, 'hapus-plagiasi_ta', 'web', '2026-04-10 02:13:07', '2026-04-10 02:13:07'),
(44, 'lihat-plagiasi_nonta', 'web', '2026-04-10 02:13:35', '2026-04-10 02:13:44'),
(45, 'lihat-dokumentasi', 'web', '2026-05-10 07:39:31', '2026-05-10 07:39:31'),
(46, 'tambah-dokumentasi', 'web', '2026-05-10 07:39:42', '2026-05-10 07:39:42'),
(47, 'edit-dokumentasi', 'web', '2026-05-10 07:39:50', '2026-05-10 07:39:50'),
(48, 'hapus-dokumentasi', 'web', '2026-05-10 07:40:04', '2026-05-10 07:40:04');

-- --------------------------------------------------------

--
-- Table structure for table `plagiasita_histories`
--

CREATE TABLE `plagiasita_histories` (
  `id` bigint UNSIGNED NOT NULL,
  `plagiasi_id` bigint UNSIGNED NOT NULL,
  `persentase` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_hasil` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plagiasi_tas`
--

CREATE TABLE `plagiasi_tas` (
  `id` bigint UNSIGNED NOT NULL,
  `mahasiswa_id` bigint UNSIGNED NOT NULL,
  `dosen1_id` bigint UNSIGNED NOT NULL,
  `dosen2_id` bigint UNSIGNED NOT NULL,
  `judul` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `update_count` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `plagiasi_tas`
--

INSERT INTO `plagiasi_tas` (`id`, `mahasiswa_id`, `dosen1_id`, `dosen2_id`, `judul`, `file`, `update_count`, `created_at`, `updated_at`) VALUES
(7, 623, 9, 5, 'ada dah dah as', 'plagiasi-ta/ta-ahmad-zeinuri-2020503009-revisi-2.docx', 2, '2026-04-11 14:32:35', '2026-04-14 06:24:28');

-- --------------------------------------------------------

--
-- Table structure for table `prodis`
--

CREATE TABLE `prodis` (
  `id` bigint UNSIGNED NOT NULL,
  `prodi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fakultas_id` bigint UNSIGNED NOT NULL,
  `kontak` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `prodis`
--

INSERT INTO `prodis` (`id`, `prodi`, `kode`, `fakultas_id`, `kontak`, `created_at`, `updated_at`) VALUES
(1, 'Akuntansi Syariah', 'AKS', 1, '081332065955', NULL, NULL),
(2, 'Hukum Ekonomi Syariah', 'HES', 1, '081249208894', NULL, NULL),
(3, 'Ekonomi Syariah', 'ES', 1, '082302323402', NULL, NULL),
(4, 'Hukum Keluarga Islam', 'HKI', 1, '082316319982', NULL, NULL),
(5, 'Manajemen Bisnis Syariah', 'MBS', 1, '082332662772', NULL, NULL),
(6, 'Bimbingan Penyuluhan Islam', 'BPI', 2, '082131030947', NULL, NULL),
(7, 'Komunikasi Penyiaran Islam', 'KPI', 2, '081883412852', NULL, NULL),
(8, 'Pendidikan Agama Islam', 'PBA', 3, '081330958826', NULL, NULL),
(9, 'Pendidikan Bahasa Arab', 'PBA', 3, '082330644253', NULL, NULL),
(10, 'Pendidikan Islam Anak Usia Dini', 'PIAUD', 3, '085228886883', NULL, NULL),
(11, 'Tadris Matematika', 'TMTK', 3, '081249269720', NULL, NULL),
(12, 'Arsitektur', 'ARS', 4, '081914721510', NULL, NULL),
(13, 'Budidaya Perikanan', 'BDP', 4, '082233850712', NULL, NULL),
(14, 'Teknologi Hasil Perikanan', 'THP', 4, '085230713369', NULL, NULL),
(15, 'Ilmu Komputer', 'IK', 4, '085257227194', NULL, NULL),
(16, 'Sistem Informasi', 'SI', 4, '085234551166', NULL, NULL),
(17, 'Teknologi Informasi', 'TI', 4, '082331214399', NULL, NULL),
(18, 'Akuntansi', 'AK', 5, '085230699285', NULL, NULL),
(19, 'Hukum', 'HK', 5, '085236554330', NULL, NULL),
(20, 'Psikologi', 'PSI', 5, '081222111360', NULL, NULL),
(21, 'Pendidikan Bahasa Inggris', 'PBI', 5, '085101930848', NULL, NULL),
(22, 'Kebidanan', 'Kebidanan', 6, '085236348619', NULL, NULL),
(23, 'Farmasi', 'Farmasi', 6, '082297017827', NULL, NULL),
(24, 'Pendidikan Profesi Bidan', 'Profesi Bidan', 6, '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(2, 'user', 'web', '2026-04-03 22:45:13', '2026-04-03 22:45:13'),
(7, 'admin', 'web', '2026-04-06 01:49:56', '2026-04-06 01:49:56');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 2),
(1, 7),
(2, 7),
(3, 7),
(4, 7),
(5, 7),
(6, 7),
(7, 7),
(8, 7),
(9, 7),
(10, 7),
(11, 7),
(12, 7),
(19, 7),
(20, 7),
(21, 7),
(22, 7),
(23, 7),
(24, 7),
(25, 7),
(26, 7),
(27, 7),
(28, 7),
(29, 7),
(30, 7),
(31, 7),
(32, 7),
(33, 7),
(34, 7),
(40, 7),
(41, 7),
(42, 7),
(43, 7),
(44, 7),
(45, 7),
(46, 7),
(47, 7),
(48, 7);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('UkZVJAmhugt34fNicApZ9JDxpv70ukHMdwm3xyZH', NULL, '172.19.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 'eyJfdG9rZW4iOiJMTXJGb1N6SUZuZ09OSHV6YW4yckpZMGlyUERrTkp5V0VPa2htYmhSIiwidXJsIjp7ImludGVuZGVkIjoiaHR0cDpcL1wvbG9jYWxob3N0XC9kYXNoYm9hcmQifSwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119LCJfcHJldmlvdXMiOnsidXJsIjoiaHR0cDpcL1wvbG9jYWxob3N0XC9sb2dpbiIsInJvdXRlIjoibG9naW4ifX0=', 1775187873);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `avatar`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Ahmad Zeinuri', 'zeinuri', 'zeinuriahmad33@gmail.com', NULL, NULL, '$2y$12$Nh3fnLWvdO0k7JL9mSJ27eG7O5lpTOznG6MsXvAt6SNkx4pTpOXKK', NULL, NULL, NULL, 'ZpHvOOQ3veYXbPLFUaOhUAJxRdsQlePvZm6fAj99sHCzS4tMDHnGIH3kZK1g', '2026-04-01 07:57:42', '2026-04-06 02:12:16'),
(22, 'kucing', 'oyen', NULL, 'avatars/2EeU6SVMORvr5Vk9q1L2dZ0OFteaVUa574p0zwkT.png', NULL, '$2y$12$/RUbCjLNVxol3QTq61Qi4OWyArkh9bwqu1TS/58bO8khBtBhjYDj6', NULL, NULL, NULL, NULL, '2026-04-02 12:13:48', '2026-04-06 02:19:37');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Indexes for table `doc_kategori`
--
ALTER TABLE `doc_kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dokumentasi`
--
ALTER TABLE `dokumentasi`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `dokumentasi_slug_unique` (`slug`),
  ADD KEY `dokumentasi_doc_kategori_id_foreign` (`doc_kategori_id`);

--
-- Indexes for table `dosens`
--
ALTER TABLE `dosens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dosens_prodi_id_foreign` (`prodi_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `fakultas`
--
ALTER TABLE `fakultas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mahasiswas`
--
ALTER TABLE `mahasiswas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mahasiswas_prodi_id_foreign` (`prodi_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `plagiasita_histories`
--
ALTER TABLE `plagiasita_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plagiasita_histories_plagiasi_id_foreign` (`plagiasi_id`);

--
-- Indexes for table `plagiasi_tas`
--
ALTER TABLE `plagiasi_tas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plagiasi_tas_mahasiswa_id_foreign` (`mahasiswa_id`),
  ADD KEY `plagiasi_tas_dosen1_id_foreign` (`dosen1_id`),
  ADD KEY `plagiasi_tas_dosen2_id_foreign` (`dosen2_id`);

--
-- Indexes for table `prodis`
--
ALTER TABLE `prodis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prodis_fakultas_id_foreign` (`fakultas_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `doc_kategori`
--
ALTER TABLE `doc_kategori`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `dokumentasi`
--
ALTER TABLE `dokumentasi`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `dosens`
--
ALTER TABLE `dosens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=252;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fakultas`
--
ALTER TABLE `fakultas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mahasiswas`
--
ALTER TABLE `mahasiswas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1672;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `plagiasita_histories`
--
ALTER TABLE `plagiasita_histories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plagiasi_tas`
--
ALTER TABLE `plagiasi_tas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `prodis`
--
ALTER TABLE `prodis`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dokumentasi`
--
ALTER TABLE `dokumentasi`
  ADD CONSTRAINT `dokumentasi_doc_kategori_id_foreign` FOREIGN KEY (`doc_kategori_id`) REFERENCES `doc_kategori` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `dosens`
--
ALTER TABLE `dosens`
  ADD CONSTRAINT `dosens_prodi_id_foreign` FOREIGN KEY (`prodi_id`) REFERENCES `prodis` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `mahasiswas`
--
ALTER TABLE `mahasiswas`
  ADD CONSTRAINT `mahasiswas_prodi_id_foreign` FOREIGN KEY (`prodi_id`) REFERENCES `prodis` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `plagiasita_histories`
--
ALTER TABLE `plagiasita_histories`
  ADD CONSTRAINT `plagiasita_histories_plagiasi_id_foreign` FOREIGN KEY (`plagiasi_id`) REFERENCES `plagiasi_tas` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `plagiasi_tas`
--
ALTER TABLE `plagiasi_tas`
  ADD CONSTRAINT `plagiasi_tas_dosen1_id_foreign` FOREIGN KEY (`dosen1_id`) REFERENCES `dosens` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `plagiasi_tas_dosen2_id_foreign` FOREIGN KEY (`dosen2_id`) REFERENCES `dosens` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `plagiasi_tas_mahasiswa_id_foreign` FOREIGN KEY (`mahasiswa_id`) REFERENCES `mahasiswas` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `prodis`
--
ALTER TABLE `prodis`
  ADD CONSTRAINT `prodis_fakultas_id_foreign` FOREIGN KEY (`fakultas_id`) REFERENCES `fakultas` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
