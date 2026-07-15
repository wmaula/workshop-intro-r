# =============================================================================
# WORKSHOP INTRODUCTION TO R
# Sesi 6: Studi Kasus Mini - Surveilans TBC Antar Kabupaten
# =============================================================================
#
# Data ini adalah data SIMULASI agregat bulanan jumlah kasus baru TBC
# di 5 kabupaten/kota fiktif sepanjang tahun 2025.
# Tujuan: menggabungkan seluruh keterampilan Sesi 1-5 dalam satu alur analisis.

surveilans <- read.csv("data/data_surveilans_tbc_kabupaten.csv")

# -----------------------------------------------------------------------
# Langkah 1: Eksplorasi data
# -----------------------------------------------------------------------

str(surveilans)
summary(surveilans)
unique(surveilans$kabupaten_kota)

# -----------------------------------------------------------------------
# Langkah 2: Hitung insidensi per 100.000 penduduk (kolom baru)
# -----------------------------------------------------------------------

surveilans$insidensi_per100rb <- surveilans$jumlah_kasus_baru / surveilans$jumlah_penduduk * 100000
head(surveilans)

# -----------------------------------------------------------------------
# Langkah 3: Rata-rata insidensi per kabupaten sepanjang tahun
# -----------------------------------------------------------------------

rata_insidensi_kabupaten <- aggregate(insidensi_per100rb ~ kabupaten_kota, data = surveilans, FUN = mean)
rata_insidensi_kabupaten <- rata_insidensi_kabupaten[order(rata_insidensi_kabupaten$insidensi_per100rb, decreasing = TRUE), ]
rata_insidensi_kabupaten

# kabupaten dengan insidensi rata-rata tertinggi
rata_insidensi_kabupaten[1, ]

# -----------------------------------------------------------------------
# Langkah 4: Total kasus baru per kabupaten sepanjang tahun
# -----------------------------------------------------------------------

total_kasus_kabupaten <- aggregate(jumlah_kasus_baru ~ kabupaten_kota, data = surveilans, FUN = sum)
total_kasus_kabupaten[order(total_kasus_kabupaten$jumlah_kasus_baru, decreasing = TRUE), ]

# -----------------------------------------------------------------------
# Langkah 5: Visualisasi - barplot rata-rata insidensi per kabupaten
# -----------------------------------------------------------------------

par(mar = c(8, 4, 4, 1) + 0.1)  # tambah margin bawah agar label panjang tidak terpotong
barplot(rata_insidensi_kabupaten$insidensi_per100rb,
        names.arg = rata_insidensi_kabupaten$kabupaten_kota,
        main = "Rata-rata Insidensi TBC per 100.000 Penduduk (2025)",
        ylab = "Insidensi per 100.000 penduduk",
        col = "darkred", las = 2, cex.names = 0.8)
par(mar = c(5, 4, 4, 2) + 0.1)  # kembalikan margin default

# -----------------------------------------------------------------------
# Langkah 6: Visualisasi - tren bulanan tiap kabupaten
# -----------------------------------------------------------------------

kabupaten_list <- unique(surveilans$kabupaten_kota)
warna <- c("darkred", "steelblue", "darkgreen", "orange", "purple")

# siapkan area plot kosong dulu, dengan skala sumbu yang cukup untuk semua garis
plot(NULL, type = "n",
     xlim = c(1, 12), ylim = range(surveilans$jumlah_kasus_baru),
     main = "Tren Kasus Baru TBC per Bulan (2025)",
     xlab = "Bulan ke-", ylab = "Jumlah Kasus Baru")

for (i in seq_along(kabupaten_list)) {
  data_k <- subset(surveilans, kabupaten_kota == kabupaten_list[i])
  data_k <- data_k[order(data_k$bulan_ke), ]
  lines(data_k$bulan_ke, data_k$jumlah_kasus_baru, col = warna[i], lwd = 2)
}
legend("topleft", legend = kabupaten_list, col = warna, lwd = 2, cex = 0.7)

# -----------------------------------------------------------------------
# Langkah 7: Ringkasan cakupan pengobatan
# -----------------------------------------------------------------------

aggregate(cakupan_pengobatan_persen ~ kabupaten_kota, data = surveilans, FUN = mean)

# -----------------------------------------------------------------------
# LATIHAN MANDIRI
# -----------------------------------------------------------------------
# 1. Kabupaten/kota mana yang memiliki total kasus baru PALING SEDIKIT sepanjang 2025?
# 2. Bulan ke berapa yang secara keseluruhan memiliki jumlah kasus baru tertinggi
#    jika dijumlahkan dari semua kabupaten? (gunakan aggregate() dengan formula
#    jumlah_kasus_baru ~ bulan_ke)
# 3. Buat boxplot cakupan_pengobatan_persen menurut kabupaten_kota
# 4. Menurut Anda, kabupaten/kota mana yang paling perlu menjadi prioritas intervensi
#    jika mempertimbangkan insidensi DAN cakupan pengobatan sekaligus? Tulis alasannya
#    sebagai komentar di bawah ini.

# Tulis jawaban Anda di bawah ini:



# =============================================================================
# KUNCI JAWABAN
# =============================================================================
#
# total_kasus_kabupaten[order(total_kasus_kabupaten$jumlah_kasus_baru), ][1, ]
#
# total_per_bulan <- aggregate(jumlah_kasus_baru ~ bulan_ke, data = surveilans, FUN = sum)
# total_per_bulan[order(total_per_bulan$jumlah_kasus_baru, decreasing = TRUE), ][1, ]
#
# boxplot(cakupan_pengobatan_persen ~ kabupaten_kota, data = surveilans,
#         las = 2, cex.axis = 0.7)
#
# # No. 4 bersifat interpretatif: kabupaten dengan insidensi tinggi TAPI cakupan
# # pengobatan rendah umumnya menjadi prioritas, diskusikan bersama fasilitator.
