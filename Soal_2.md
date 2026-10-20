-- SOAL 2: OPERASI CRUD DASAR

Langkah 1: CREATE

INSERT INTO pengguna (id_pengguna, nama, role, status_aktif) VALUES
('U004', 'Rina',   'penghuni', 'aktif'),
('U005', 'Dewi',   'penghuni', 'aktif'),
('U006', 'Tamu B', 'tamu',     'aktif');

INSERT INTO pintu (id_pintu, status_pintu) VALUES
('P003', 'terkunci'),
('P004', 'terkunci'),
('P005', 'terbuka');
<img width="1917" height="1036" alt="Screenshot 2026-10-20 150644" src="https://github.com/user-attachments/assets/9fa1bfdb-b0fa-4789-997e-e98be0696931" />


INSERT INTO log_akses (id_akses, waktu_akses, status_akses, status_pintu, id_pengguna, id_pintu) VALUES
('A004', '2026-10-20 07:15:00', 'Berhasil', 'terbuka',  'U004', 'P003'),
('A005', '2026-10-20 08:30:00', 'Gagal',    'terkunci', 'U006', 'P003'),
('A006', '2026-10-20 09:45:00', 'Berhasil', 'terbuka',  'U005', 'P004');
<img width="1917" height="1016" alt="Screenshot 2026-10-20 150657" src="https://github.com/user-attachments/assets/c9436532-a5f0-43a5-acad-f29bfd11af27" />


Langkah 2: READ

SELECT * FROM pengguna;
<img width="1882" height="1018" alt="Screenshot 2026-10-20 150716" src="https://github.com/user-attachments/assets/4b48feeb-dd65-46ff-bf9a-03011755dc0a" />


Langkah 3: UPDATE

UPDATE log_akses
SET status_akses = 'Berhasil', status_pintu = 'terbuka'
WHERE id_akses = 'A005';
<img width="1917" height="984" alt="Screenshot 2026-10-20 150750" src="https://github.com/user-attachments/assets/0e7315da-6011-4325-8ab0-f65f4a1f513e" />


Langkah 4: DELETE

DELETE FROM log_akses
WHERE id_akses = 'A006';
<img width="1913" height="1026" alt="Screenshot 2026-10-20 150822" src="https://github.com/user-attachments/assets/546c2cff-d877-41ae-8de8-d5e469c53621" />



