#!/bin/bash

sudo mysql <<EOF
CREATE DATABASE IF NOT EXISTS abc;
USE abc;
CREATE TABLE IF NOT EXISTS tabel_siswa (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(100),
    kelas INT,
    jurusan VARCHAR(50),
    gender VARCHAR(10)
);
EOF

echo "Database abc and table tabel_siswa created."

# ====== CATATAN CARA MENGISI TABEL ======
# Masuk ke mysql dulu:
#   sudo mysql
#
# Lalu pilih databasenya:
#   USE abc;
#
# Contoh mengisi data:
#   INSERT INTO tabel_siswa (nama, kelas, jurusan, gender)
#   VALUES ('Budi', 10, 'RPL', 'L');
#
# Melihat data:
#   SELECT * FROM tabel_siswa;
#
# Melihat struktur tabel:
#   DESC tabel_siswa;
