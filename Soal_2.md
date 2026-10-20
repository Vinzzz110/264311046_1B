# SOAL 2: Operasi CRUD Dasar

## Langkah 1: CREATE — Menambahkan Data

Menambahkan masing-masing tiga baris data dummy ke tabel `pengguna`, `pintu`, dan `log_akses`.

### A. Menambahkan Data Pengguna

```sql
INSERT INTO pengguna (id_pengguna, nama, role, status_aktif) VALUES
('U004', 'Rina', 'penghuni', 'aktif'),
('U005', 'Dewi', 'penghuni', 'aktif'),
('U006', 'Tamu B', 'tamu', 'aktif');
```

### B. Menambahkan Data Pintu

```sql
INSERT INTO pintu (id_pintu, status_pintu) VALUES
('P003', 'terkunci'),
('P004', 'terkunci'),
('P005', 'terbuka');
```

**Hasil Eksekusi:**

![Screenshot hasil INSERT data pengguna dan pintu](https://github.com/user-attachments/assets/9fa1bfdb-b0fa-4789-997e-e98be0696931)

### C. Menambahkan Data Log Akses

```sql
INSERT INTO log_akses
(id_akses, waktu_akses, status_akses, status_pintu, id_pengguna, id_pintu)
VALUES
('A004', '2026-10-20 07:15:00', 'Berhasil', 'terbuka', 'U004', 'P003'),
('A005', '2026-10-20 08:30:00', 'Gagal', 'terkunci', 'U006', 'P003'),
('A006', '2026-10-20 09:45:00', 'Berhasil', 'terbuka', 'U005', 'P004');
```

**Hasil Eksekusi:**

![Screenshot hasil INSERT data log akses](https://github.com/user-attachments/assets/c9436532-a5f0-43a5-acad-f29bfd11af27)

## Langkah 2: READ — Menampilkan Data

Menampilkan seluruh data pada tabel `pengguna` menggunakan perintah `SELECT *`.

```sql
SELECT * FROM pengguna;
```

**Hasil Eksekusi:**

![Screenshot hasil SELECT data pengguna](https://github.com/user-attachments/assets/4b48feeb-dd65-46ff-bf9a-03011755dc0a)

## Langkah 3: UPDATE — Mengubah Data

Mengubah status akses dan status pintu pada tabel `log_akses` untuk data dengan ID akses `A005`. Klausa `WHERE` digunakan berdasarkan Primary Key agar hanya satu baris data yang diperbarui.

```sql
UPDATE log_akses
SET status_akses = 'Berhasil',
    status_pintu = 'terbuka'
WHERE id_akses = 'A005';
```

**Hasil Eksekusi:**

![Screenshot hasil UPDATE data log akses](https://github.com/user-attachments/assets/0e7315da-6011-4325-8ab0-f65f4a1f513e)

## Langkah 4: DELETE — Menghapus Data

Menghapus satu baris data pada tabel `log_akses` dengan ID akses `A006`. Klausa `WHERE` digunakan agar hanya data yang ditentukan yang dihapus.

```sql
DELETE FROM log_akses
WHERE id_akses = 'A006';
```

**Hasil Eksekusi:**

![Screenshot hasil DELETE data log akses](https://github.com/user-attachments/assets/546c2cff-d877-41ae-8de8-d5e469c53621)
