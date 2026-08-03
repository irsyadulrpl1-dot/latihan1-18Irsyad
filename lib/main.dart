// Program Kasir Koperasi Sekolah
// Materi: Model Data, Variabel, Operator, dan Tipe Data

void main() {
  // Menyimpan nama barang dalam bentuk teks (String)
  String namaBarang = "Buku Tulis";

  // Menyimpan harga anggota menggunakan double
  // karena harga dapat memiliki nilai desimal
  double hargaAnggota = 3000.0;

  // Menyimpan harga umum menggunakan double
  // untuk menjaga ketepatan nilai harga
  double hargaUmum = 3500.0;

  // Menyimpan jumlah stok barang menggunakan int
  // karena jumlah barang berupa bilangan bulat
  int jumlahStok = 40;

  // Menyimpan status ketersediaan barang menggunakan boolean
  // true berarti barang tersedia
  bool tersedia = true;


  // Jumlah barang yang dibeli oleh anggota
  int jumlahBeli = 3;


  // Menghitung total harga anggota
  // Operator * digunakan untuk mengalikan jumlah barang dengan harga
  double totalAnggota = jumlahBeli * hargaAnggota;


  // Menghitung total harga jika menggunakan harga umum
  double totalUmum = jumlahBeli * hargaUmum;


  // Menghitung selisih harga antara pembelian umum dan anggota
  // Operator - digunakan untuk mencari perbedaan nilai
  double selisih = totalUmum - totalAnggota;


  // Menampilkan kartu data barang ke Debug Console
  print("=== KARTU DATA BARANG ===");

  // Menampilkan nama barang
  print("Nama : $namaBarang");

  // Menampilkan harga khusus anggota
  print("Harga Anggota : Rp$hargaAnggota");

  // Menampilkan harga umum
  print("Harga Umum : Rp$hargaUmum");

  // Menampilkan jumlah stok barang
  print("Stok : $jumlahStok");

  // Menampilkan status ketersediaan barang
  print("Tersedia : $tersedia");


  // Menampilkan hasil perhitungan total pembelian anggota
  print("Total (anggota) $jumlahBeli pcs: Rp$totalAnggota");

  // Menampilkan selisih harga dengan harga umum
  print("Selisih vs umum : Rp$selisih");



  // Jawaban:
  // Pemilihan tipe data pada program ini penting karena setiap data memiliki jenis dan fungsi yang berbeda.
  // Penggunaan tipe data yang tepat membantu menjaga keakuratan perhitungan harga, stok barang, dan status ketersediaan.
  // Kesalahan pemilihan tipe data dapat menyebabkan kesalahan dalam proses transaksi kasir koperasi.
}