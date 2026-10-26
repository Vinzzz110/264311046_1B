-- Penambahan Tabel --

CREATE TABLE penanganan_alert (
    id_tindakan    VARCHAR(10) PRIMARY KEY,
    id_alert       VARCHAR(10) NOT NULL,
    id_pengguna    VARCHAR(10) NOT NULL,
    jenis_tindakan VARCHAR(30) NOT NULL,
    catatan        VARCHAR(255) NULL,
    waktu_tindakan DATETIME NOT NULL,
    waktu_selesai  DATETIME NULL,

    FOREIGN KEY (id_alert)
        REFERENCES peringatan_pembobolan(id_alert),
    FOREIGN KEY (id_pengguna)
        REFERENCES admin(id_pengguna)
);

CREATE INDEX idx_penanganan_alert
    ON penanganan_alert (id_alert, waktu_tindakan);

-- Constraint Validasi --

ALTER TABLE penanganan_alert
ADD CONSTRAINT chk_waktu_selesai
CHECK (
    waktu_selesai IS NULL
    OR waktu_selesai >= waktu_tindakan
);

ALTER TABLE penanganan_alert
ADD CONSTRAINT chk_jenis_tindakan
CHECK (
    jenis_tindakan IN (
        'Verifikasi Rekaman',
        'Menghubungi Penghuni',
        'Kunci Ulang Pintu',
        'Lapor Pihak Berwenang',
        'Tutup Peringatan'
    )
);

-- Data Pendukung (tabel induk dari Modul 7) --

INSERT INTO pengguna (id_pengguna, nama, role, status_aktif) VALUES
    ('U001', 'Admin A', 'Admin', 'Aktif'),
    ('U002', 'Admin B', 'Admin', 'Aktif'),
    ('U003', 'Tamu A',  'Tamu',  'Aktif');

INSERT INTO admin (id_pengguna) VALUES ('U001'), ('U002');

INSERT INTO tamu (id_pengguna, masa_berlaku_akses) VALUES ('U003', '2026-12-31');

INSERT INTO pintu (id_pintu, status_pintu) VALUES
    ('P01', 'Terkunci'),
    ('P02', 'Terkunci');

INSERT INTO log_akses
    (id_akses, waktu_akses, status_akses, status_pintu, id_pengguna, id_pintu)
VALUES
    ('L001', '2026-10-13 08:05:00', 'Gagal', 'Terkunci', 'U003', 'P01'),
    ('L002', '2026-10-16 08:30:00', 'Gagal', 'Terkunci', 'U003', 'P02');

INSERT INTO peringatan_pembobolan
    (id_alert, status_alert, tanggal, jam, id_akses, id_pintu)
VALUES
    ('A001', 'Selesai',  '2026-10-13', '08:06:00', 'L001', 'P01'),
    ('A002', 'Diproses', '2026-10-16', '08:31:00', 'L002', 'P02');

-- Data Tabel --

INSERT INTO penanganan_alert
    (id_tindakan, id_alert, id_pengguna, jenis_tindakan, catatan, waktu_tindakan, waktu_selesai)
VALUES
    ('T001', 'A001', 'U001', 'Verifikasi Rekaman',
     'Rekaman menunjukkan percobaan akses gagal berulang',
     '2026-10-13 08:10:00', '2026-10-13 08:20:00'),

    ('T002', 'A001', 'U002', 'Menghubungi Penghuni',
     'Penghuni mengonfirmasi tidak ada tamu',
     '2026-10-13 08:25:00', '2026-10-13 08:30:00'),

    ('T003', 'A002', 'U001', 'Kunci Ulang Pintu',
     'Terdeteksi percobaan pembukaan paksa',
     '2026-10-16 08:35:00', NULL);

-- Pengujian: riwayat penanganan per peringatan --

SELECT a.id_alert, a.status_alert, p.nama AS admin,
       t.jenis_tindakan, t.waktu_tindakan, t.waktu_selesai
FROM penanganan_alert t
JOIN peringatan_pembobolan a ON a.id_alert = t.id_alert
JOIN pengguna p              ON p.id_pengguna = t.id_pengguna
ORDER BY a.id_alert, t.waktu_tindakan;
