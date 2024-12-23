aplikasi penganalisis yang digunakan untuk menampilkan daftar crypto dan harga terkini. App ini mengambil data kripto melalui API eksternal dan menampilkannya dalam bentuk daftar yang bisa dicari berdasarkan nama kripto. app dapat melakukan pencarian dengan mengetikkan kata kunci di kolom pencarian, dan aplikasi akan memfilter daftar kripto yang ditampilkan sesuai dengan query yang dimasukkan. App ini memiliki tampilan yang terdiri dari AppBar, kolom pencarian, dan daftar kripto yang ditampilkan menggunakan ListView.builder. Setiap item di daftar menampilkan gambar kripto, nama, dan harga terkini. ada tombol floating action button yang berfungsi untuk me-refresh data dengan memuat ulang informasi kripto dari API. Saat data sedang dimuat, aplikasi akan menampilkan indikator loading, dan jika terjadi kesalahan saat pengambilan data, aplikasi akan menampilkan dialog error. Semua interaksi seperti pencarian dan refresh data dikelola menggunakan setState untuk memperbarui tampilan secara dinamis.


![image](https://github.com/user-attachments/assets/e1139e83-f809-43a1-8d45-1801ffe24164)

API yang digunakan (https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd)
