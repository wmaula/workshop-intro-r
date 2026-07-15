# =============================================================================
# WORKSHOP INTRODUCTION TO R
# Penutup: Preview Tidyverse
# =============================================================================
#
# Bagian ini hanya GAMBARAN UMUM, bukan pengajaran mendalam.
# Tujuannya menunjukkan bahwa konsep base R yang baru dipelajari
# (filtering, membuat kolom baru, agregasi, visualisasi) tetap sama,
# hanya sintaksnya berbeda saat memakai tidyverse.
#
# Jalankan install.packages(c("dplyr", "ggplot2")) sekali saja jika paket ini
# belum terpasang di komputer Anda.

library(dplyr)
library(ggplot2)

pasien <- read.csv("data/data_pasien_puskesmas.csv")

# -----------------------------------------------------------------------
# Perbandingan 1: Filtering baris
# -----------------------------------------------------------------------

# base R
subset(pasien, usia > 60 & status_tbc == "Positif")

# dplyr
pasien %>%
  filter(usia > 60, status_tbc == "Positif")

# -----------------------------------------------------------------------
# Perbandingan 2: Membuat kolom baru
# -----------------------------------------------------------------------

# base R
pasien$kategori_usia <- ifelse(pasien$usia < 18, "Anak-remaja",
                          ifelse(pasien$usia < 60, "Dewasa", "Lansia"))

# dplyr
pasien <- pasien %>%
  mutate(kategori_usia = case_when(
    usia < 18 ~ "Anak-remaja",
    usia < 60 ~ "Dewasa",
    TRUE ~ "Lansia"
  ))

# -----------------------------------------------------------------------
# Perbandingan 3: Agregasi
# -----------------------------------------------------------------------

# base R
aggregate(tekanan_darah_sistolik ~ kecamatan, data = pasien, FUN = mean)

# dplyr
pasien %>%
  group_by(kecamatan) %>%
  summarise(rata_sistolik = mean(tekanan_darah_sistolik))

# -----------------------------------------------------------------------
# Perbandingan 4: Visualisasi
# -----------------------------------------------------------------------

# base R
boxplot(tekanan_darah_sistolik ~ status_tbc, data = pasien,
        col = c("lightgreen", "salmon"))

# ggplot2
ggplot(pasien, aes(x = status_tbc, y = tekanan_darah_sistolik, fill = status_tbc)) +
  geom_boxplot() +
  scale_fill_manual(values = c("Negatif" = "lightgreen", "Positif" = "salmon")) +
  labs(title = "Tekanan Darah Sistolik menurut Status TBC",
       x = "Status TBC", y = "Sistolik (mmHg)") +
  theme_minimal() +
  theme(legend.position = "none")

# -----------------------------------------------------------------------
# Langkah belajar lanjutan yang disarankan
# -----------------------------------------------------------------------
# 1. dplyr: filter(), select(), mutate(), group_by(), summarise(), arrange()
# 2. ggplot2: grammar of graphics, geom_point(), geom_bar(), geom_line(), facet_wrap()
# 3. tidyr: pivot_longer(), pivot_wider() untuk merapikan bentuk data
# 4. Quarto (.qmd): menulis laporan analisis yang reproducible
