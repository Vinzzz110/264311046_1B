# SOAL 3: Query Laporan Ringkasan

**Materi:** SELECT, JOIN, WHERE, dan GROUP BY

## Soal

Buatlah satu query SQL untuk menghasilkan laporan ringkasan jumlah akses berhasil per pengguna dengan menggunakan komponen `SELECT`, fungsi agregat, `JOIN`, `WHERE`, dan `GROUP BY`.

## Jawaban

### 1. Kode SQL

```sql
-- SOAL 3: QUERY LAPORAN RINGKASAN
-- Jumlah akses berhasil per pengguna

SELECT
    p.nama,
    COUNT(l.id_akses) AS total_akses_berhasil
FROM log_akses l
JOIN pengguna p
    ON l.id_pengguna = p.id_pengguna
WHERE l.status_akses = 'Berhasil'
GROUP BY p.id_pengguna, p.nama;
```

### 2. Penjelasan Query

1. **SELECT:** Menampilkan nama pengguna dan jumlah akses berhasil.
2. **COUNT():** Menghitung jumlah akses berhasil setiap pengguna.
3. **JOIN:** Menggabungkan tabel `log_akses` dengan tabel `pengguna` melalui kolom `id_pengguna`.
4. **WHERE:** Menampilkan data akses yang memiliki status `Berhasil`.
5. **GROUP BY:** Mengelompokkan hasil berdasarkan ID dan nama pengguna.

### 3. Hasil Eksekusi

![Screenshot hasil eksekusi query laporan ringkasan](https://github.com/user-attachments/assets/43e365b1-2037-4e7a-8a3e-6de4d358ad6c)
