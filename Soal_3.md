-- =====================================================================

-- SOAL 3: QUERY LAPORAN RINGKASAN

-- Jumlah akses berhasil per pengguna

-- (SELECT + agregat, JOIN, WHERE, GROUP BY)

-- =====================================================================

KODE SQL:


SELECT p.nama,
       COUNT(l.id_akses) AS total_akses_berhasil
FROM log_akses l
JOIN pengguna p ON l.id_pengguna = p.id_pengguna
WHERE l.status_akses = 'Berhasil'
GROUP BY p.id_pengguna, p.nama;


HASIL EKSEKUSI:


<img width="1917" height="1018" alt="Screenshot 2026-10-20 153338" src="https://github.com/user-attachments/assets/43e365b1-2037-4e7a-8a3e-6de4d358ad6c" />

