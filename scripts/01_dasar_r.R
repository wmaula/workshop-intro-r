# =============================================================================
# WORKSHOP INTRODUCTION TO R
# Sesi 1-2: Pengenalan R/RStudio & Dasar-dasar R
# =============================================================================

# Cek versi R yang terpasang
R.version.string

# -----------------------------------------------------------------------
# A. R sebagai kalkulator
# -----------------------------------------------------------------------

2 + 2
10 / 3
2 ^ 5          # pangkat
sqrt(81)       # akar kuadrat
round(3.14159, 2)

# -----------------------------------------------------------------------
# B. Variabel dan assignment
# -----------------------------------------------------------------------
# Gunakan tanda panah "<-" untuk menyimpan nilai ke sebuah nama variabel

usia_pasien <- 34
usia_pasien                    # tampilkan isi variabel

nama_puskesmas <- "Puskesmas Melati"
nama_puskesmas

# variabel bisa dipakai untuk perhitungan lain
usia_pasien_tahun_depan <- usia_pasien + 1
usia_pasien_tahun_depan

# -----------------------------------------------------------------------
# C. Tipe data dasar
# -----------------------------------------------------------------------

class(usia_pasien)             # numeric
class(nama_puskesmas)          # character
status_kunjungan <- TRUE
class(status_kunjungan)        # logical

# hati-hati: angka dalam tanda kutip dianggap character, bukan numeric
salah_tipe <- "34"
class(salah_tipe)
# salah_tipe + 1                # akan error, coba jalankan (hapus tanda # di depan)

# -----------------------------------------------------------------------
# D. Vektor: kumpulan nilai dengan tipe yang sama
# -----------------------------------------------------------------------

usia_5_pasien <- c(25, 34, 60, 18, 45)
usia_5_pasien
length(usia_5_pasien)          # jumlah elemen
class(usia_5_pasien)

jenis_kelamin_5_pasien <- c("Perempuan", "Laki-laki", "Laki-laki", "Perempuan", "Perempuan")
jenis_kelamin_5_pasien

# indexing: mengambil elemen tertentu, penomoran dimulai dari 1
usia_5_pasien[1]               # elemen pertama
usia_5_pasien[3]               # elemen ketiga
usia_5_pasien[c(1, 3)]         # elemen pertama dan ketiga

# operasi vektor bersifat "vectorized": berlaku ke semua elemen sekaligus
usia_5_pasien + 1
usia_5_pasien > 30             # menghasilkan vektor logical
mean(usia_5_pasien)
sd(usia_5_pasien)
max(usia_5_pasien)
min(usia_5_pasien)

# -----------------------------------------------------------------------
# LATIHAN MANDIRI
# -----------------------------------------------------------------------
# 1. Buat variabel bernama usia_saya berisi usia Anda sendiri
# 2. Buat vektor bernama suhu_5_pasien berisi 5 nilai suhu tubuh (contoh: 36.5, 37.8, ...)
# 3. Hitung rata-rata dari suhu_5_pasien menggunakan mean()
# 4. Tampilkan elemen ke-2 dan ke-4 dari suhu_5_pasien
# 5. Buat vektor logical yang menunjukkan pasien mana yang suhunya di atas 37.5

# Tulis jawaban Anda di bawah ini:



# =============================================================================
# KUNCI JAWABAN (cek setelah mencoba sendiri)
# =============================================================================
#
# usia_saya <- 30
#
# suhu_5_pasien <- c(36.5, 37.8, 36.9, 38.2, 36.7)
#
# mean(suhu_5_pasien)
#
# suhu_5_pasien[c(2, 4)]
#
# suhu_5_pasien > 37.5
