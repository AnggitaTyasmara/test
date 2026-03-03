-- =============================================================
--  TES TEKNIKAL PROGRAMMER
--  RSU Aisyiyah Muntilan
--  Large Data & Validation
-- =============================================================

-- -------------------------------------------------------------
-- 1. SETUP DATABASE
-- -------------------------------------------------------------

CREATE DATABASE IF NOT EXISTS tes_teknikal_rsu
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE tes_teknikal_rsu;

-- -------------------------------------------------------------
-- 2. BUAT TABEL
-- -------------------------------------------------------------

CREATE TABLE IF NOT EXISTS dokter (
  id_dokter       INT           PRIMARY KEY,
  nama_dokter     VARCHAR(100)  NOT NULL,
  spesialisasi    VARCHAR(100)  NOT NULL,
  jadwal_praktik  VARCHAR(100)  NOT NULL
);

CREATE TABLE IF NOT EXISTS pasien (
  id_pasien    INT          PRIMARY KEY AUTO_INCREMENT,
  nama         VARCHAR(100) NOT NULL,
  tgl_lahir    DATE,
  no_bpjs      VARCHAR(20)  NULL,
  status_aktif TINYINT(1)   NOT NULL DEFAULT 1
);

CREATE TABLE IF NOT EXISTS rekam_medis (
  id_rm          INT          PRIMARY KEY AUTO_INCREMENT,
  id_pasien      INT          NOT NULL,
  id_dokter      INT          NOT NULL,
  tgl_kunjungan  DATE         NOT NULL,
  diagnosa       VARCHAR(200) NOT NULL,
  biaya          INT          NOT NULL DEFAULT 0,
  FOREIGN KEY (id_pasien) REFERENCES pasien(id_pasien),
  FOREIGN KEY (id_dokter) REFERENCES dokter(id_dokter)
);

-- -------------------------------------------------------------
-- 3. DATA SAMPEL
--    Catatan: Sebagian data mengandung anomali yang disengaja.
--    Peserta diminta mendeteksi & memperbaikinya.
-- -------------------------------------------------------------

INSERT INTO dokter (id_dokter, nama_dokter, spesialisasi, jadwal_praktik) VALUES
  (10, 'dr. Hendra Kusuma',   'Penyakit Dalam',  'Senin, Rabu, Jumat'),
  (11, 'dr. Sari Wulandari',  'Umum',            'Selasa, Kamis'),
  (12, 'dr. Reza Firmansyah', 'Paru-Paru',       'Senin, Kamis'),
  (13, 'dr. Lina Marlina',    'Anak',            'Selasa, Rabu, Jumat'),
  (14, 'dr. Bagus Santoso',   'Ortopedi',        'Senin, Kamis, Sabtu'),
  (15, 'dr. Nita Rahayu',     'Jantung',         'Rabu, Jumat'),
  (16, 'dr. Arif Budiman',    'Saraf',           'Selasa, Kamis, Sabtu'),
  (17, 'dr. Dewi Puspita',    'Kulit & Kelamin', 'Senin, Rabu');

INSERT INTO pasien (id_pasien, nama, tgl_lahir, no_bpjs, status_aktif) VALUES
  -- Data normal
  ( 1, 'Andi Saputra',       '1985-03-12', '0001234567890', 1),
  ( 2, 'Budi Hartono',       '2010-07-22', '0001234567891', 1),
  ( 6, 'Fajar Nugroho',      '1995-09-08', '0001234567894', 1),
  ( 7, 'Gilang Ramadhan',    '1988-12-01', '0001234567895', 1),
  ( 8, 'Hana Pertiwi',       '2000-04-17', '0001234567896', 1),
  ( 9, 'Irwan Setiawan',     '1975-08-30', '0001234567897', 1),
  (10, 'Joko Prasetya',      '1992-06-14', '0001234567898', 1),
  (11, 'Kartika Sari',       '1983-01-25', '0001234567899', 1),
  (12, 'Lestari Ningrum',    '2005-11-09', '0001234567900', 1),
  (13, 'Muhamad Rizki',      '1998-03-03', '0001234567901', 1),
  (14, 'Nadia Fitriani',     '1971-07-18', '0001234567902', 1),
  (15, 'Omar Abdullah',      '1993-09-22', '0001234567903', 1),
  (16, 'Putri Rahayu',       '2008-02-11', '0001234567904', 1),
  (17, 'Qori Handayani',     '1980-05-29', '0001234567905', 1),
  (18, 'Rizal Maulana',      '1967-10-06', '0001234567906', 1),
  (19, 'Siti Aminah',        '2002-12-20', '0001234567907', 1),
  (20, 'Teguh Prasetyo',     '1990-08-08', '0001234567908', 1),
  (21, 'Umar Hakim',         '1977-04-04', '0001234567909', 1),
  (22, 'Vera Susanti',       '1995-01-31', '0001234567910', 1),
  (23, 'Wahyu Nugroho',      '2001-06-26', '0001234567911', 1),
  (24, 'Xena Maharani',      '1987-03-15', '0001234567912', 1),
  (25, 'Yusuf Hidayat',      '1962-11-11', '0001234567913', 1),
  (26, 'Zahira Putri',       '2003-07-07', '0001234567914', 1),
  (27, 'Agus Priyanto',      '1979-09-19', '0001234567915', 1),
  (28, 'Bayu Setiawan',      '1991-02-28', '0001234567916', 1),
  (29, 'Chandra Wijaya',     '1986-10-10', '0001234567917', 1),
  (30, 'Diana Kusuma',       '2006-04-23', '0001234567918', 1),
  (31, 'Eko Santoso',        '1974-06-16', '0001234567919', 1),
  (32, 'Fitri Handayani',    '1999-08-05', '0001234567920', 1),
  (33, 'Gunawan Prabowo',    '1968-12-30', '0001234567921', 1),
  (34, 'Halimah Nurdiana',   '1996-05-13', '0001234567922', 1),
  (35, 'Indra Permana',      '2004-01-08', '0001234567923', 1),
  (36, 'Juliana Saptari',    '1982-07-21', '0001234567924', 1),
  (37, 'Kurnia Dewi',        '1970-03-03', '0001234567925', 0),
  (38, 'Lukman Hakim',       '1994-11-17', '0001234567926', 1),
  (39, 'Maya Anggraini',     '2007-09-01', '0001234567927', 1),
  (40, 'Naufal Ardiansyah',  '1984-06-06', '0001234567928', 0),
  (47, 'Pandu Wicaksono',    '1989-05-17', '0001234567931', 1),
  (48, 'Qisthi Amalia',      '2004-10-03', '0001234567932', 1),
  (49, 'Rangga Saputra',     '1973-08-22', '0001234567933', 1),
  (50, 'Siska Rahmawati',    '1997-12-05', '0001234567934', 1),
  (51, 'Tri Susanto',        '1981-04-14', '0001234567935', 1),
  (52, 'Ulfa Nurhaliza',     '2006-01-28', '0001234567936', 1),
  (53, 'Valdi Hidayat',      '1963-07-09', '0001234567937', 1),
  (54, 'Wulan Sari',         '1992-03-31', '0001234567938', 1),
  (55, 'Yanuar Pratama',     '1986-09-16', '0001234567939', 1),
  (56, 'Zulfa Mardiyah',     '2001-11-24', '0001234567940', 1),
  (57, 'Arini Kusumastuti',  '1978-06-07', '0001234567941', 1),
  (58, 'Baskoro Aji',        '1994-02-19', '0001234567942', 1),
  (59, 'Cantika Putri',      '2008-08-13', '0001234567943', 1),
  (60, 'Dimas Aryo',         '1971-05-02', '0001234567944', 0),
  -- ⚠ Anomali: no_bpjs NULL
  ( 3, 'Citra Dewi',         '1990-11-05', NULL,            1),
  (41, 'Panji Asmara',       '1997-02-14', NULL,            1),
  (42, 'Rini Susilo',        '2009-08-18', NULL,            0),
  (61, 'Ester Wijayanti',    '1983-11-30', NULL,            1),
  (62, 'Fandi Ahmad',        '2000-07-17', NULL,            1),
  -- ⚠ Anomali: no_bpjs duplikat
  ( 4, 'Doni Pratama',       '1978-01-30', '0001234567890', 1),
  (43, 'Slamet Riyadi',      '1985-04-04', '0001234567891', 1),
  (44, 'Tono Subekti',       '1993-07-07', '0001234567894', 1),
  (63, 'Galih Permana',      '1988-03-21', '0001234567895', 1),
  -- ⚠ Anomali: tgl_lahir tidak valid (masa depan)
  ( 5, 'Eka Susanti',        '2035-06-15', '0001234567893', 0),
  (45, 'Ummi Kalsum',        '2040-01-01', '0001234567929', 1),
  (46, 'Vino Bastian',       '2031-12-31', '0001234567930', 1);

INSERT INTO rekam_medis (id_rm, id_pasien, id_dokter, tgl_kunjungan, diagnosa, biaya) VALUES
  (101,  1, 10, '2024-01-10', 'Hipertensi',           250000),
  (102,  1, 11, '2024-03-22', 'Flu',                  150000),
  (103,  2, 10, '2024-02-14', 'Demam Berdarah',      1200000),
  (104,  3, 12, '2024-04-01', 'Maag',                 180000),
  (105,  4, 10, '2024-04-15', 'Diabetes',             320000),
  (106,  6, 11, '2024-05-10', 'Batuk Kronis',         210000),
  (107,  6, 12, '2024-06-01', 'Batuk Kronis',         210000),
  (108,  1, 10, '2024-06-18', 'Hipertensi',           260000),
  (109,  7, 13, '2024-01-15', 'Bronkitis',            175000),
  (110,  7, 14, '2024-03-10', 'Patah Tulang',         850000),
  (111,  8, 13, '2024-02-20', 'Tifoid',               300000),
  (112,  9, 10, '2024-03-05', 'Diabetes Tipe 2',      420000),
  (113,  9, 15, '2024-05-18', 'Gagal Jantung',       1500000),
  (114, 10, 11, '2024-01-28', 'ISPA',                 130000),
  (115, 10, 16, '2024-04-22', 'Migrain',              275000),
  (116, 11, 10, '2024-02-08', 'Hipertensi',           240000),
  (117, 11, 15, '2024-06-14', 'Aritmia',              980000),
  (118, 12, 13, '2024-01-30', 'Diare',                120000),
  (119, 13, 11, '2024-03-17', 'Flu',                  140000),
  (120, 13, 17, '2024-05-05', 'Dermatitis',           220000),
  (121, 14, 10, '2024-02-25', 'Gout',                 195000),
  (122, 14, 14, '2024-04-30', 'Osteoporosis',         430000),
  (123, 15, 16, '2024-03-12', 'Epilepsi',             560000),
  (124, 16, 13, '2024-01-22', 'Campak',               160000),
  (125, 17, 15, '2024-05-27', 'Jantung Koroner',     1750000),
  (126, 18, 10, '2024-02-11', 'Hipertensi',           255000),
  (127, 19, 11, '2024-04-08', 'Anemia',               185000),
  (128, 20, 16, '2024-06-03', 'Stroke Ringan',        890000),
  (129, 21, 10, '2024-01-19', 'Diabetes',             310000),
  (130, 22, 17, '2024-03-28', 'Psoriasis',            340000),
  (131, 23, 12, '2024-05-15', 'Asma',                 230000),
  (132, 24, 14, '2024-02-06', 'Cedera Lutut',         620000),
  (133, 25, 10, '2024-04-20', 'Gagal Ginjal',        1100000),
  (134, 26, 13, '2024-06-10', 'Demam',                115000),
  (135, 27, 15, '2024-01-25', 'Hipertensi Berat',     780000),
  (136, 28, 11, '2024-03-15', 'Flu',                  145000),
  (137, 29, 16, '2024-05-22', 'Parkinson',            670000),
  (138, 30, 13, '2024-02-18', 'Cacar Air',            175000),
  (139, 31, 10, '2024-04-05', 'Diabetes Tipe 2',      395000),
  (140, 32, 17, '2024-06-20', 'Eksim',                260000),
  (141, 33, 10, '2024-01-12', 'Gagal Ginjal',        1050000),
  (142, 34, 12, '2024-03-25', 'PPOK',                 480000),
  (143, 35, 13, '2024-05-08', 'Alergi',               155000),
  (144, 36, 14, '2024-02-14', 'Hernia',               920000),
  (145, 38, 11, '2024-04-18', 'ISPA',                 135000),
  (146, 39, 13, '2024-06-25', 'Diare',                125000),
  (147,  2, 13, '2024-05-30', 'Tifoid',               285000),
  (148,  8, 15, '2024-06-07', 'Penyakit Jantung',    1320000),
  (149, 12, 11, '2024-04-12', 'Flu',                  140000),
  (150, 20, 10, '2024-05-03', 'Hipertensi',           245000),
  (151, 47, 14, '2024-01-08', 'Cedera Bahu',          530000),
  (152, 48, 13, '2024-02-22', 'Alergi Kulit',         165000),
  (153, 49, 10, '2024-03-30', 'Hipertensi',           270000),
  (154, 50, 11, '2024-04-14', 'Flu',                  135000),
  (155, 51, 16, '2024-05-19', 'Migrain Kronis',       450000),
  (156, 52, 13, '2024-06-04', 'Tifoid',               295000),
  (157, 53, 10, '2024-01-17', 'Diabetes Tipe 2',      410000),
  (158, 54, 17, '2024-02-28', 'Dermatitis',           235000),
  (159, 55, 15, '2024-03-20', 'Jantung Koroner',     1680000),
  (160, 56, 12, '2024-04-25', 'Asma',                 215000),
  (161, 57, 10, '2024-05-12', 'Gout',                 205000),
  (162, 58, 11, '2024-06-17', 'ISPA',                 125000),
  (163, 59, 13, '2024-01-29', 'Campak',               155000),
  (164, 60, 16, '2024-03-06', 'Alzheimer',            720000),
  (165, 47, 15, '2024-05-25', 'Aritmia',              870000),
  (166, 49, 14, '2024-06-11', 'Patah Tulang',         900000),
  (167, 51, 10, '2024-02-03', 'Hipertensi',           260000),
  (168, 53, 12, '2024-04-09', 'PPOK',                 465000),
  (169, 55, 16, '2024-06-22', 'Stroke',               940000),
  (170, 57, 15, '2024-03-14', 'Gagal Jantung',       1550000);

-- =============================================================
--  AREA JAWABAN PESERTA
--  Tulis jawaban di bawah masing-masing tugas.
--  DILARANG menulis di luar area jawaban yang telah disediakan.
-- =============================================================

-- -------------------------------------------------------------
-- TUGAS 1 — Deteksi Anomali Data
-- Tulis 3 query untuk mendeteksi masing-masing anomali:
--   1a. Pasien dengan no_bpjs NULL
--   1b. no_bpjs yang dimiliki lebih dari satu pasien (duplikat)
--   1c. Pasien dengan tgl_lahir melebihi tanggal hari ini
-- -------------------------------------------------------------

-- [1a] Deteksi no_bpjs NULL — tulis jawaban di bawah ini:



-- [1b] Deteksi no_bpjs duplikat — tulis jawaban di bawah ini:



-- [1c] Deteksi tgl_lahir tidak valid — tulis jawaban di bawah ini:



-- -------------------------------------------------------------
-- TUGAS 2 — Perbaikan N+1 Query
-- Kode bermasalah (pseudocode):
--   $list = RekamMedis::all();
--   foreach ($list as $rm) {
--       $dokter = Dokter::find($rm->id_dokter); -- N+1 !
--   }
-- Tulis query SQL menggunakan JOIN sebagai solusinya.
-- -------------------------------------------------------------

-- [2] Solusi SQL (JOIN) — tulis jawaban di bawah ini:



-- -------------------------------------------------------------
-- TUGAS 3 — Query Laporan Agregasi
-- Tampilkan: nama_dokter, jumlah_pasien (unik),
--            total_kunjungan, total_biaya
-- Diurutkan dari total_biaya tertinggi.
-- -------------------------------------------------------------

-- [3] Query laporan — tulis jawaban di bawah ini:



-- -------------------------------------------------------------
-- TUGAS 4 — Tambah Constraint & Index
--   4a. Bersihkan data duplikat no_bpjs terlebih dahulu
--   4b. Tambah UNIQUE constraint pada pasien.no_bpjs
--   4c. Tambah CHECK constraint pada pasien.tgl_lahir
--   4d. Tambah INDEX pada rekam_medis.id_pasien
-- -------------------------------------------------------------

-- [4a] Bersihkan data duplikat — tulis jawaban di bawah ini:



-- [4b] UNIQUE constraint — tulis jawaban di bawah ini:



-- [4c] CHECK constraint — tulis jawaban di bawah ini:



-- [4d] INDEX — tulis jawaban di bawah ini:



-- -------------------------------------------------------------
-- TUGAS 5 — Stored Procedure Validasi
-- Buat procedure tambah_pasien dengan parameter:
--   IN  p_nama, p_tgl_lahir, p_no_bpjs, p_status_aktif
--   OUT p_pesan VARCHAR(100)
-- Validasi:
--   - tgl_lahir > CURDATE()        → 'tgl_lahir tidak valid'
--   - no_bpjs sudah ada di tabel   → 'no_bpjs sudah terdaftar'
--   - Lolos semua validasi → INSERT → 'pasien berhasil ditambahkan'
-- -------------------------------------------------------------

-- [5] Stored procedure — tulis jawaban di bawah ini:

DELIMITER $$



$$

DELIMITER ;

-- =============================================================
--  END OF FILE
-- =============================================================
