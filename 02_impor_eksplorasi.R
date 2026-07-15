# =============================================================================
# WORKSHOP INTRODUCTION TO R
# Sesi 3: Impor & Eksplorasi Data
# =============================================================================
#
# Pastikan working directory Anda adalah folder "Workshop Intro R"
# (RStudio: Session > Set Working Directory > To Source File Location,
# lalu naik satu folder karena script ini ada di dalam folder scripts/)

# -----------------------------------------------------------------------
# A. Membaca file CSV
# -----------------------------------------------------------------------

pasien <- read.csv("data/data_pasien_puskesmas.csv")

# -----------------------------------------------------------------------
# B. Eksplorasi data awal
# -----------------------------------------------------------------------

dim(pasien)             # jumlah baris dan kolom
nrow(pasien)
ncol(pasien)
names(pasien)           # nama-nama kolom

head(pasien)             # 6 baris pertama
head(pasien, 10)         # 10 baris pertama
tail(pasien)              # 6 baris terakhir

str(pasien)               # struktur data: tipe tiap kolom
summary(pasien)            # ringkasan statistik tiap kolom

# -----------------------------------------------------------------------
# C. Mengakses kolom dengan $
# -----------------------------------------------------------------------

pasien$usia
mean(pasien$usia)
range(pasien$usia)

pasien$status_tbc
table(pasien$status_tbc)      # frekuensi tiap kategori

# -----------------------------------------------------------------------
# LATIHAN MANDIRI
# -----------------------------------------------------------------------
# 1. Berapa jumlah baris dan kolom pada data pasien?
# 2. Tampilkan 15 baris pertama data
# 3. Berapa rata-rata dan median tekanan_darah_sistolik?
# 4. Berapa banyak pasien laki-laki dan perempuan? (gunakan table())
# 5. Berapa nilai suhu_tubuh maksimum dan minimum di data ini?

# Tulis jawaban Anda di bawah ini:



# =============================================================================
# KUNCI JAWABAN
# =============================================================================
#
# dim(pasien)
#
# head(pasien, 15)
#
# mean(pasien$tekanan_darah_sistolik)
# median(pasien$tekanan_darah_sistolik)
#
# table(pasien$jenis_kelamin)
#
# max(pasien$suhu_tubuh)
# min(pasien$suhu_tubuh)
