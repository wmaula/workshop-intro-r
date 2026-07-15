# =============================================================================
# WORKSHOP INTRODUCTION TO R
# Sesi 5: Visualisasi Dasar dengan Base R
# =============================================================================

pasien <- read.csv("data/data_pasien_puskesmas.csv")

# -----------------------------------------------------------------------
# A. Histogram: melihat distribusi satu variabel numerik
# -----------------------------------------------------------------------

hist(pasien$usia,
     main = "Distribusi Usia Pasien",
     xlab = "Usia (tahun)",
     ylab = "Jumlah Pasien",
     col = "steelblue")

hist(pasien$tekanan_darah_sistolik,
     main = "Distribusi Tekanan Darah Sistolik",
     xlab = "Sistolik (mmHg)",
     col = "steelblue",
     breaks = 15)

# -----------------------------------------------------------------------
# B. Boxplot: membandingkan distribusi numerik antar kategori
# -----------------------------------------------------------------------

boxplot(tekanan_darah_sistolik ~ status_tbc, data = pasien,
        main = "Tekanan Darah Sistolik menurut Status TBC",
        xlab = "Status TBC", ylab = "Sistolik (mmHg)",
        col = c("lightgreen", "salmon"))

boxplot(usia ~ status_ekonomi, data = pasien,
        main = "Usia Pasien menurut Status Ekonomi",
        xlab = "Status Ekonomi", ylab = "Usia (tahun)",
        col = "lightblue")

# -----------------------------------------------------------------------
# C. Barplot: jumlah kategori
# -----------------------------------------------------------------------

jumlah_per_kecamatan <- table(pasien$kecamatan)
par(mar = c(8, 4, 4, 1) + 0.1)  # tambah margin bawah agar label panjang tidak terpotong
barplot(jumlah_per_kecamatan,
        main = "Jumlah Pasien per Kecamatan",
        ylab = "Jumlah Pasien",
        col = "steelblue",
        las = 2)               # las = 2 memutar label sumbu x agar tidak tumpang tindih
par(mar = c(5, 4, 4, 2) + 0.1)  # kembalikan margin default

barplot(table(pasien$status_tbc),
        main = "Jumlah Pasien menurut Status TBC",
        col = c("lightgreen", "salmon"))

# -----------------------------------------------------------------------
# D. Scatter plot: hubungan dua variabel numerik
# -----------------------------------------------------------------------

plot(pasien$tekanan_darah_sistolik, pasien$tekanan_darah_diastolik,
     main = "Hubungan Tekanan Sistolik dan Diastolik",
     xlab = "Sistolik (mmHg)", ylab = "Diastolik (mmHg)",
     pch = 19, col = "darkblue")

plot(pasien$usia, pasien$tekanan_darah_sistolik,
     main = "Hubungan Usia dan Tekanan Sistolik",
     xlab = "Usia (tahun)", ylab = "Sistolik (mmHg)",
     pch = 19, col = "darkorange")

# -----------------------------------------------------------------------
# LATIHAN MANDIRI
# -----------------------------------------------------------------------
# 1. Buat histogram untuk suhu_tubuh, beri judul dan label sumbu yang sesuai
# 2. Buat boxplot tekanan_darah_diastolik menurut jenis_kelamin
# 3. Buat barplot jumlah pasien menurut status_ekonomi
# 4. Buat scatter plot antara usia dan suhu_tubuh, apakah ada pola hubungan?

# Tulis jawaban Anda di bawah ini:



# =============================================================================
# KUNCI JAWABAN
# =============================================================================
#
# hist(pasien$suhu_tubuh, main = "Distribusi Suhu Tubuh Pasien",
#      xlab = "Suhu (Celsius)", col = "steelblue")
#
# boxplot(tekanan_darah_diastolik ~ jenis_kelamin, data = pasien,
#         main = "Tekanan Diastolik menurut Jenis Kelamin",
#         xlab = "Jenis Kelamin", ylab = "Diastolik (mmHg)")
#
# barplot(table(pasien$status_ekonomi),
#         main = "Jumlah Pasien menurut Status Ekonomi", col = "steelblue")
#
# plot(pasien$usia, pasien$suhu_tubuh,
#      main = "Hubungan Usia dan Suhu Tubuh",
#      xlab = "Usia (tahun)", ylab = "Suhu (Celsius)", pch = 19)
