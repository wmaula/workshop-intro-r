# =============================================================================
# WORKSHOP INTRODUCTION TO R
# Sesi 4: Manipulasi Data Dasar
# =============================================================================

pasien <- read.csv("data/data_pasien_puskesmas.csv")

# -----------------------------------------------------------------------
# A. Subsetting baris dan kolom dengan [ ]
# -----------------------------------------------------------------------

pasien[1, ]                        # baris pertama, semua kolom
pasien[1:5, ]                      # baris 1 sampai 5
pasien[, c("id_pasien", "usia")]   # semua baris, kolom tertentu

# -----------------------------------------------------------------------
# B. Filtering baris berdasarkan kondisi
# -----------------------------------------------------------------------

pasien[pasien$usia > 60, ]                       # pasien berusia di atas 60 tahun
pasien[pasien$status_tbc == "Positif", ]         # pasien dengan status TBC positif

# atau memakai subset(), sintaksnya lebih mudah dibaca
subset(pasien, usia > 60)
subset(pasien, status_tbc == "Positif" & jenis_kelamin == "Perempuan")

# -----------------------------------------------------------------------
# C. Membuat kolom baru dengan ifelse()
# -----------------------------------------------------------------------

pasien$kategori_usia <- ifelse(pasien$usia < 18, "Anak-remaja",
                          ifelse(pasien$usia < 60, "Dewasa", "Lansia"))
table(pasien$kategori_usia)

# -----------------------------------------------------------------------
# D. Tabulasi silang dengan table()
# -----------------------------------------------------------------------

table(pasien$status_tbc, pasien$jenis_kelamin)
table(pasien$status_tbc, pasien$kategori_usia)

# proporsi dari tabulasi silang (margin = 2 artinya proporsi dihitung per kolom)
prop.table(table(pasien$status_tbc, pasien$jenis_kelamin), margin = 2)

# -----------------------------------------------------------------------
# E. Agregasi dengan aggregate()
# -----------------------------------------------------------------------

# rata-rata tekanan darah sistolik per kecamatan
aggregate(tekanan_darah_sistolik ~ kecamatan, data = pasien, FUN = mean)

# rata-rata usia per status TBC
aggregate(usia ~ status_tbc, data = pasien, FUN = mean)

# -----------------------------------------------------------------------
# F. Mengurutkan data dengan order()
# -----------------------------------------------------------------------

pasien_urut_usia <- pasien[order(pasien$usia, decreasing = TRUE), ]
head(pasien_urut_usia)

# -----------------------------------------------------------------------
# LATIHAN MANDIRI
# -----------------------------------------------------------------------
# 1. Tampilkan seluruh data pasien dari Kecamatan Melati saja
# 2. Buat subset pasien dengan gejala_batuk == "Ya" DAN status_tbc == "Positif"
# 3. Buat kolom baru tekanan_tinggi berisi "Ya" jika tekanan_darah_sistolik >= 140,
#    selain itu "Tidak"
# 4. Hitung rata-rata suhu_tubuh per status_ekonomi menggunakan aggregate()
# 5. Urutkan data pasien berdasarkan tekanan_darah_sistolik dari yang tertinggi

# Tulis jawaban Anda di bawah ini:



# =============================================================================
# KUNCI JAWABAN
# =============================================================================
#
# subset(pasien, kecamatan == "Kecamatan Melati")
#
# subset(pasien, gejala_batuk == "Ya" & status_tbc == "Positif")
#
# pasien$tekanan_tinggi <- ifelse(pasien$tekanan_darah_sistolik >= 140, "Ya", "Tidak")
#
# aggregate(suhu_tubuh ~ status_ekonomi, data = pasien, FUN = mean)
#
# pasien[order(pasien$tekanan_darah_sistolik, decreasing = TRUE), ]
