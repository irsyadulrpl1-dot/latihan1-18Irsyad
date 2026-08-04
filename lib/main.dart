// Menghilangkan peringatan penggunaan print karena print digunakan untuk kebutuhan tugas
// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

// ====================================================================
// FUNGSI UTAMA (MAIN)
// Di sinilah program pertama kali dijalankan.
// Semua data, logika, dan output Debug Console berada di sini.
// ====================================================================
void main() {

  // ==============================
  // DATA BARANG
  // ==============================

  String namaBarang = "Buku Tulis";
  double hargaAnggota = 3000.0;
  double hargaUmum = 3500.0;

  // Jumlah stok barang di koperasi
  int jumlahStok = 100;

  // Status apakah barang masih tersedia (true) atau habis (false)
  bool statusTersedia = true;

  // Kategori barang
  // Pilihan: atk, makanan, minuman
  String kategori = "atk";


  // ==============================
  // DATA PEMBELI
  // ==============================

  // true = anggota koperasi
  // false = umum
  bool anggota = true;

  int jumlahBeli = 80;


  // ==============================
  // MENENTUKAN HARGA BERDASARKAN STATUS ANGGOTA
  // ==============================

  double hargaDipakai;

  // JIKA anggota
  // MAKA gunakan harga anggota
  // JIKA bukan anggota
  // MAKA gunakan harga umum
  if (anggota == true) {
    hargaDipakai = hargaAnggota;
  } else {
    hargaDipakai = hargaUmum;
  }


  // ==============================
  // MENGHITUNG TOTAL BELANJA
  // ==============================

  double totalBelanja = jumlahBeli * hargaDipakai;


  // ==============================
  // MENENTUKAN DISKON BERTINGKAT
  // ==============================

  double diskon = 0;

  // JIKA total > 200000
  // MAKA diskon 10%
  //
  // JIKA total > 100000
  // MAKA diskon 5%
  //
  // SELAIN ITU
  // MAKA tidak ada diskon
  if (totalBelanja > 200000) {
    diskon = 0.10;
  } else if (totalBelanja > 100000) {
    diskon = 0.05;
  } else {
    diskon = 0;
  }


  // ==============================
  // MENGHITUNG JUMLAH POTONGAN & HARGA AKHIR
  // ==============================

  double jumlahPotongan = totalBelanja * diskon;
  double hargaAkhir = totalBelanja - jumlahPotongan;


  // ==============================
  // MENENTUKAN RAK BARANG (SWITCH-CASE)
  // ==============================

  String lokasiRak;

  // Switch digunakan karena kategori memiliki pilihan nilai yang tetap.
  // Dibandingkan banyak if, switch lebih rapi karena setiap pilihan kategori
  // langsung memiliki tujuan rak masing-masing sehingga kode lebih mudah dibaca.
  switch (kategori) {
    case "atk":
      lokasiRak = "Rak 1";
      break;

    case "makanan":
      lokasiRak = "Rak 2";
      break;

    case "minuman":
      lokasiRak = "Rak 3";
      break;

    default:
      lokasiRak = "Rak lain";
  }


  // ================================================================
  // FITUR (RPL-12.2-301): DAFTAR BARANG MENGGUNAKAN LIST & FOR
  // ================================================================

  // List berisi nama-nama barang di koperasi (minimal 4 barang)
  List<String> daftarNamaBarang = [
    "Buku Tulis",
    "Pulpen",
    "Penghapus",
    "Roti",
  ];

  // List berisi harga yang sesuai untuk setiap barang
  List<int> daftarHargaBarang = [
    3000,
    2500,
    1500,
    5000,
  ];


  // ================================================================
  // FITUR (RPL-12.2-302): PERULANGAN WHILE
  // Simulasi penjualan Buku Tulis sampai stok habis.
  // ================================================================

  // --------------------------------------------------------
  // RPL-12.2-303: JUSTIFIKASI (JAWABAN TUGAS DALAM KOMENTAR)
  // --------------------------------------------------------
  // PERTANYAAN:
  // "Bahaya apa yang muncul bila kondisi berhenti pada while keliru, 
  // dan bagaimana cara untuk memastikan koperasi tidak menjual melebihi stok?"
  //
  // JAWABAN:
  // 1. Bahaya jika kondisi berhenti while keliru:
  //    - Infinite Loop (Perulangan Tak Terhingga): Jika kondisi tidak pernah 
  //      bernilai false (misal: lupa mengurangi stok di dalam loop), program 
  //      akan berjalan terus-menerus. Aplikasi akan macet (hang), memakan 
  //      seluruh memori/CPU, dan akhirnya force close (crash).
  //    - Stok Minus (Negatif): Jika kondisi while keliru (misal: while (stok > -5)), 
  //      koperasi akan terus menjual barang padahal stok sudah habis. Ini merusak 
  //      data inventaris dan merugikan koperasi secara finansial.
  //
  // 2. Cara memastikan koperasi tidak menjual melebihi stok:
  //    - Gunakan kondisi while yang tepat, yaitu `while (stok > 0)`. Ini memastikan 
  //      perulangan berhenti tepat saat stok mencapai angka 0.
  //    - Pastikan ada operasi pengurangan stok di dalam blok while (stok--), agar 
  //      nilai stok terus mendekati 0 dan kondisi akhirnya tercapai.
  //    - (Tambahan) Sebelum perulangan, selalu lakukan validasi menggunakan if, 
  //      misalnya: if (jumlahBeli > stok) maka tolak transaksi.
  // --------------------------------------------------------

  // Stok awal untuk simulasi (sesuai instruksi: 3)
  int stokBukuTulis = 3;

  // List untuk menyimpan riwayat penjualan agar bisa ditampilkan di layar
  List<String> riwayatPenjualan = [];

  print("\n--- Penjualan Buku Tulis ---");

  // Perulangan while: akan terus berjalan selama stok masih lebih dari 0
  while (stokBukuTulis > 0) {
    // Setiap kali terjual, stok berkurang 1
    stokBukuTulis--;

    // Menyusun teks hasil penjualan
    String barisPenjualan = "Terjual 1, sisa stok: $stokBukuTulis";

    // Menyimpan ke dalam list untuk ditampilkan di UI
    riwayatPenjualan.add(barisPenjualan);

    // Menampilkan di Debug Console
    print(barisPenjualan);
  }


  // ==============================
  // OUTPUT DEBUG CONSOLE (TRANSAKSI UTAMA)
  // ==============================

  print("\n=== TRANSAKSI KOPERASI ===");
  print("Nama Barang : $namaBarang");
  print("Kategori : $kategori");
  print("Lokasi Rak : $lokasiRak");
  print("Jumlah Stok : $jumlahStok pcs");
  print("Status Tersedia : $statusTersedia");
  print("Status Anggota : $anggota");
  print("Jumlah Beli : $jumlahBeli pcs");
  print("Harga Satuan : Rp$hargaDipakai");
  print("Total Belanja : Rp$totalBelanja");
  print("Diskon : ${diskon * 100}%");
  print("Jumlah Potongan : Rp$jumlahPotongan");
  print("Harga Akhir : Rp$hargaAkhir");

  // Output daftar barang ke Debug Console menggunakan perulangan for
  print("\n=== DAFTAR BARANG KOPERASI ===");
  for (int i = 0; i < daftarNamaBarang.length; i++) {
    print("${i + 1}. ${daftarNamaBarang[i]} - Rp${daftarHargaBarang[i]}");
  }


  // ==============================
  // MENJALANKAN APLIKASI FLUTTER
  // ==============================
  runApp(
    MyApp(
      // Mengirim semua data ke widget agar bisa ditampilkan di browser/layar
      namaBarang: namaBarang,
      kategori: kategori,
      lokasiRak: lokasiRak,
      jumlahStok: jumlahStok,
      statusTersedia: statusTersedia,
      anggota: anggota,
      jumlahBeli: jumlahBeli,
      hargaDipakai: hargaDipakai,
      totalBelanja: totalBelanja,
      diskon: diskon,
      jumlahPotongan: jumlahPotongan,
      hargaAkhir: hargaAkhir,
      daftarNamaBarang: daftarNamaBarang,
      daftarHargaBarang: daftarHargaBarang,
      riwayatPenjualan: riwayatPenjualan, // Mengirim data while loop
    ),
  );
}


// ====================================================================
// WIDGET ROOT APLIKASI (MyApp)
// Widget ini menjadi induk dari seluruh tampilan aplikasi.
// ====================================================================
class MyApp extends StatelessWidget {
  // Variabel untuk menerima data dari main()
  final String namaBarang;
  final String kategori;
  final String lokasiRak;
  final int jumlahStok;
  final bool statusTersedia;
  final bool anggota;
  final int jumlahBeli;
  final double hargaDipakai;
  final double totalBelanja;
  final double diskon;
  final double jumlahPotongan;
  final double hargaAkhir;
  final List<String> daftarNamaBarang;
  final List<int> daftarHargaBarang;
  final List<String> riwayatPenjualan;

  const MyApp({
    super.key,
    required this.namaBarang,
    required this.kategori,
    required this.lokasiRak,
    required this.jumlahStok,
    required this.statusTersedia,
    required this.anggota,
    required this.jumlahBeli,
    required this.hargaDipakai,
    required this.totalBelanja,
    required this.diskon,
    required this.jumlahPotongan,
    required this.hargaAkhir,
    required this.daftarNamaBarang,
    required this.daftarHargaBarang,
    required this.riwayatPenjualan,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Koperasi Sekolah",
      home: HomePage(
        // Meneruskan data ke HomePage
        namaBarang: namaBarang,
        kategori: kategori,
        lokasiRak: lokasiRak,
        jumlahStok: jumlahStok,
        statusTersedia: statusTersedia,
        anggota: anggota,
        jumlahBeli: jumlahBeli,
        hargaDipakai: hargaDipakai,
        totalBelanja: totalBelanja,
        diskon: diskon,
        jumlahPotongan: jumlahPotongan,
        hargaAkhir: hargaAkhir,
        daftarNamaBarang: daftarNamaBarang,
        daftarHargaBarang: daftarHargaBarang,
        riwayatPenjualan: riwayatPenjualan,
      ),
    );
  }
}


// ====================================================================
// HALAMAN UTAMA (HomePage)
// Widget ini menampilkan semua hasil transaksi dan daftar barang
// di browser / layar aplikasi.
// ====================================================================
class HomePage extends StatelessWidget {
  // Variabel untuk menerima data dari MyApp
  final String namaBarang;
  final String kategori;
  final String lokasiRak;
  final int jumlahStok;
  final bool statusTersedia;
  final bool anggota;
  final int jumlahBeli;
  final double hargaDipakai;
  final double totalBelanja;
  final double diskon;
  final double jumlahPotongan;
  final double hargaAkhir;
  final List<String> daftarNamaBarang;
  final List<int> daftarHargaBarang;
  final List<String> riwayatPenjualan;

  const HomePage({
    super.key,
    required this.namaBarang,
    required this.kategori,
    required this.lokasiRak,
    required this.jumlahStok,
    required this.statusTersedia,
    required this.anggota,
    required this.jumlahBeli,
    required this.hargaDipakai,
    required this.totalBelanja,
    required this.diskon,
    required this.jumlahPotongan,
    required this.hargaAkhir,
    required this.daftarNamaBarang,
    required this.daftarHargaBarang,
    required this.riwayatPenjualan,
  });

  @override
  Widget build(BuildContext context) {
    // ============================================================
    // MEMBANGUN DAFTAR BARANG MENGGUNAKAN PERULANGAN FOR
    // Hasilnya berupa List<Widget> yang akan ditampilkan di layar
    // ============================================================
    List<Widget> daftarBarangWidget = [];

    for (int i = 0; i < daftarNamaBarang.length; i++) {
      daftarBarangWidget.add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Text(
            "${i + 1}. ${daftarNamaBarang[i]} - Rp${daftarHargaBarang[i]}",
            style: const TextStyle(fontSize: 16),
          ),
        ),
      );
    }

    // ============================================================
    // MEMBANGUN RIWAYAT PENJUALAN WHILE LOOP UNTUK DITAMPILKAN DI LAYAR
    // ============================================================
    List<Widget> riwayatPenjualanWidget = [];

    for (String penjualan in riwayatPenjualan) {
      riwayatPenjualanWidget.add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0),
          child: Text(
            penjualan,
            style: const TextStyle(fontSize: 16, color: Colors.black87),
          ),
        ),
      );
    }

    // ============================================================
    // TAMPILAN UTAMA (UI)
    // ============================================================
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transaksi Koperasi"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      // Menggunakan SingleChildScrollView agar bisa di-scroll jika layar sempit
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // ======================================================
              // KARTU 1: HASIL TRANSAKSI
              // ======================================================
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "=== TRANSAKSI KOPERASI ===",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text("Nama Barang : $namaBarang"),
                      Text("Kategori : $kategori"),
                      Text("Lokasi Rak : $lokasiRak"),
                      Text("Jumlah Stok : $jumlahStok pcs"),
                      Text("Status Tersedia : $statusTersedia"),
                      Text("Status Anggota : $anggota"),
                      Text("Jumlah Beli : $jumlahBeli pcs"),
                      Text("Harga Satuan : Rp$hargaDipakai"),
                      Text("Total Belanja : Rp$totalBelanja"),
                      Text("Diskon : ${diskon * 100}%"),
                      Text("Jumlah Potongan : Rp$jumlahPotongan"),
                      const Divider(),
                      Text(
                        "Harga Akhir : Rp$hargaAkhir",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // ======================================================
              // KARTU 2: DAFTAR BARANG (RPL-12.2-301)
              // Menampilkan daftar barang menggunakan List & for
              // ======================================================
              Card(
                elevation: 4,
                color: Colors.green.shade50,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "=== DAFTAR BARANG KOPERASI ===",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      // Menampilkan seluruh widget daftar barang
                      ...daftarBarangWidget,
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // ======================================================
              // KARTU 3: PENJUALAN WHILE LOOP (RPL-12.2-302)
              // Menampilkan simulasi penjualan sampai stok habis
              // ======================================================
              Card(
                elevation: 4,
                color: Colors.red.shade50,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "--- Penjualan Buku Tulis ---",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      // Menampilkan riwayat penjualan dari while loop
                      ...riwayatPenjualanWidget,
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // ======================================================
              // KARTU 4: KETERANGAN
              // Memberi penjelasan singkat untuk siswa
              // ======================================================
              Card(
                elevation: 2,
                color: Colors.amber.shade50,
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "Catatan:\n"
                    "• Data barang menggunakan List & perulangan for.\n"
                    "• Simulasi penjualan menggunakan perulangan while (stok berkurang sampai 0).\n"
                    "• Hasil transaksi muncul di Debug Console dan layar.",
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}