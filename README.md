# Cara Penggunaan Script

Semua script bisa dijalankan dengan **sudo**.

---

## 1. ip.sh — Setting IP Address

```bash
sudo bash ip.sh
```

Mengkonfigurasi netplan:
- `enp0s3` → DHCP
- `enp0s8` → static IP `192.168.145.10/24` dengan DNS `8.8.8.8` & `1.1.1.1`

---

## 2. paket.sh — Install Paket

```bash
sudo bash paket.sh
```

Menginstall: `openssh-server`, `apache2`, `samba`, `mariadb-server`, `bind9`.

---

## 3. bind9.sh — Konfigurasi DNS Server

```bash
sudo bash bind9.sh
```

Melakukan:
- Edit file zone di `/etc/bind/` (db.127, db.local)
- Edit `named.conf.default-zones`
- Ganti nameserver di `/etc/resolv.conf` menjadi `192.168.145.10`
- Restart service bind9

---

## 4. mariadb.sh — Setup Database

```bash
sudo bash mariadb.sh
```

Membuat database `abc` dan tabel `tabel_siswa` di MySQL.

### Cara isi data manual:

```sql
sudo mysql
USE abc;
INSERT INTO tabel_siswa (nama, kelas, jurusan, gender)
VALUES ('Nama', 10, 'Jurusan', 'L/P');
SELECT * FROM tabel_siswa;
```
