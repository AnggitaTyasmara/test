# Test Repo
-- =============================================================
-- TES TEKNIKAL PROGRAMMER
-- RSU Aisyiyah Muntilan
-- =============================================================

USE tes_teknikal_rsu;

-- =============================================================
-- TUGAS 1 – DETEKSI ANOMALI DATA
-- =============================================================

-- 1. Pasien tanpa no_bpjs
SELECT id_pasien, nama, no_bpjs
FROM pasien
WHERE no_bpjs IS NULL;

-- 2. no_bpjs duplikat
SELECT no_bpjs, COUNT(_) AS jumlah
FROM pasien
WHERE no_bpjs IS NOT NULL
GROUP BY no_bpjs
HAVING COUNT(_) > 1;

-- 3. tgl_lahir melebihi hari ini
SELECT id_pasien, nama, tgl_lahir
FROM pasien
WHERE tgl_lahir > CURDATE();

-- =============================================================
-- TUGAS 2 – PERBAIKAN N+1 QUERY (SQL JOIN)
-- =============================================================

SELECT
rm.id_rm,
rm.diagnosa,
d.nama_dokter
FROM rekam_medis rm
JOIN dokter d ON rm.id_dokter = d.id_dokter;

-- =============================================================
-- TUGAS 3 – QUERY LAPORAN AGREGASI
-- =============================================================

SELECT
d.nama_dokter,
COUNT(DISTINCT rm.id_pasien) AS jumlah_pasien,
COUNT(\*) AS total_kunjungan,
SUM(rm.biaya) AS total_biaya
FROM rekam_medis rm
JOIN dokter d ON rm.id_dokter = d.id_dokter
GROUP BY d.id_dokter, d.nama_dokter
ORDER BY total_biaya DESC;

-- =============================================================
-- TUGAS 4 – DATA CLEANING & CONSTRAINT
-- =============================================================

-- 1. Hapus rekam medis pasien duplikat
DELETE rm
FROM rekam_medis rm
INNER JOIN pasien p1 ON rm.id_pasien = p1.id_pasien
INNER JOIN pasien p2
ON p1.no_bpjs = p2.no_bpjs
AND p1.id_pasien > p2.id_pasien
WHERE p1.no_bpjs IS NOT NULL;

-- 2. Hapus pasien duplikat (pertahankan id terkecil)
DELETE p1
FROM pasien p1
INNER JOIN pasien p2
ON p1.no_bpjs = p2.no_bpjs
AND p1.id_pasien > p2.id_pasien
WHERE p1.no_bpjs IS NOT NULL;

-- 3. Perbaiki tanggal lahir masa depan
UPDATE pasien
SET tgl_lahir = NULL
WHERE tgl_lahir > CURDATE();

-- 4. Tambah UNIQUE constraint
ALTER TABLE pasien
ADD CONSTRAINT uq_no_bpjs UNIQUE (no_bpjs);

-- =============================================================
-- TUGAS 5 – STORED PROCEDURE VALIDASI
-- =============================================================

DELIMITER $$

CREATE PROCEDURE tambah_pasien(
IN p_nama VARCHAR
(100),
IN p_tgl_lahir DATE,
IN p_no_bpjs VARCHAR
(20),
IN p_status_aktif TINYINT,
OUT p_pesan VARCHAR
(100)
)
BEGIN

-- Validasi tanggal
IF p_tgl_lahir > CURDATE() THEN
SET p_pesan
= 'tgl_lahir tidak valid';

-- Validasi duplikat BPJS
ELSEIF EXISTS
(
SELECT 1
FROM pasien
WHERE no_bpjs = p_no_bpjs
)
THEN
SET p_pesan
= 'no_bpjs sudah terdaftar';

    -- Jika valid
    ELSE

INSERT INTO pasien
(nama, tgl_lahir, no_bpjs, status_aktif)
VALUES
(p_nama, p_tgl_lahir, p_no_bpjs, p_status_aktif);

SET p_pesan
= 'pasien berhasil ditambahkan';
END
IF;

END$$

DELIMITER ;

-- =============================================================
-- CONTOH PEMANGGILAN STORED PROCEDURE
-- =============================================================

CALL tambah_pasien
(
'Pasien Baru',
'1995-05-10',
'8888888888888',
1,
@pesan
);

SELECT @pesan;

-- =============================================================
-- END OF PROGRAM
-- =============================================================

KESIMPULAN :
TUGAS 1 – Deteksi Anomali Data

Ditemukan 3 jenis masalah:

no_bpjs NULL
→ Data pasien tidak lengkap.

no_bpjs duplikat
→ Berpotensi menyebabkan konflik identitas pasien.

tgl_lahir melebihi hari ini
→ Data tidak valid secara logika.

✔ Kesimpulan:

Database awal memang mengandung anomali yang harus dibersihkan sebelum diberi constraint agar tidak terjadi error saat penambahan aturan integritas.

TUGAS 2 – Perbaikan N+1 Query

Awalnya data dokter kemungkinan diambil terpisah per rekam medis (tidak efisien).

Solusi:
Menggunakan JOIN antara tabel:

rekam_medis

dokter

✔ Kesimpulan:

Penggunaan JOIN:

Mengurangi jumlah query

Meningkatkan performa

Lebih scalable untuk data besar

TUGAS 3 – Query Laporan Agregasi

Dilakukan agregasi:

Jumlah pasien unik per dokter

Total kunjungan

Total biaya

Diurutkan berdasarkan total biaya terbesar

✔ Kesimpulan:

Query ini menghasilkan laporan manajerial yang dapat digunakan untuk:

Evaluasi kinerja dokter

Analisis pendapatan

Pengambilan keputusan strategis

TUGAS 4 – Data Cleaning & Constraint

Dilakukan:

Hapus rekam medis pasien duplikat

Hapus pasien duplikat

Perbaiki tanggal lahir tidak valid

Tambahkan UNIQUE constraint pada no_bpjs

Masalah yang muncul:

Error foreign key saat menghapus pasien.

Solusi:

Hapus child (rekam_medis) terlebih dahulu sebelum parent (pasien).

✔ Kesimpulan:

Data integrity harus dijaga dengan urutan operasi yang benar.
Setelah constraint ditambahkan, database menjadi:

Lebih konsisten

Lebih aman

Tidak bisa menerima data duplikat lagi

TUGAS 5 – Stored Procedure Validasi

Procedure tambah_pasien melakukan:

Validasi tanggal lahir

Validasi duplikasi no_bpjs

Insert jika valid

Mengembalikan pesan hasil proses

✔ Kesimpulan:

Stored procedure:

Memindahkan logika validasi ke sisi database

Mengurangi risiko kesalahan dari sisi aplikasi

Meningkatkan keamanan dan konsistensi data
