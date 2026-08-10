// Menghilangkan peringatan penggunaan print karena print digunakan untuk kebutuhan tugas
// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

// ====================================================================
// HELPER FUNCTION: FORMAT RUPIAH (PEMISAH RIBUAN)
// RPL-12.2-1S2: Petugas ingin harga tampil dengan pemisah ribuan (mis. Rp12.500).
// Cara memformatnya: Kita membuat fungsi manual yang memisahkan angka 
// menjadi ribuan menggunakan titik (.) tanpa package tambahan.
// Sumber Referensi: Dart String Manipulation (https://dart.dev/guides/language/numbers)
// ====================================================================
String formatRupiah(dynamic number) {
  // Mengubah angka (double/int) menjadi string tanpa angka di belakang koma
  String strNumber = number.toDouble().toStringAsFixed(0);
  
  String result = '';
  int count = 0;

  // Melakukan perulangan dari belakang untuk menyisipkan titik setiap 3 digit
  for (int i = strNumber.length - 1; i >= 0; i--) {
    result = strNumber[i] + result;
    count++;
    
    // Jika count kelipatan 3 dan bukan digit terakhir, tambahkan titik
    if (count % 3 == 0 && i != 0) {
      result = '.$result';
    }
  }
  
  return 'Rp$result';
}


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

  // ==============================================================
  // FITUR (RPL-12.2-1S1): TIPE DATA BOOLEAN
  // ==============================================================
  // Rancang: bila stok = 0, bagaimana seharusnya nilai "tersedia"?
  // Jawaban: Jika stok = 0, maka barang tidak bisa dijual, sehingga
  // nilai "tersedia" harus menjadi false (tidak tersedia / habis).
  // Tampilkan status memakai kondisi if/else di bawah ini.
  
  bool tersedia;
  if (jumlahStok == 0) {
    tersedia = false; // Stok habis, maka tidak tersedia
  } else {
    tersedia = true;  // Stok masih ada, maka tersedia
  }

  // Status apakah barang masih tersedia (true) atau habis (false)
  // Menggunakan nilai dari variabel 'tersedia' yang sudah dirancang di atas
  bool statusTersedia = tersedia;
  // ==============================================================

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

  // ---------------------------------------------------------
  // RPL-12.2-2S1 (HOTS-1): ATURAN DISKON BARU
  // Koperasi menambah aturan: anggota dengan total > 500rb dapat potongan 15%.
  // Sisipkan aturan ini di urutan paling atas (sebelum aturan lama) agar 
  // kondisi yang lebih spesifik (anggota & >500rb) dicek lebih dulu.
  // ---------------------------------------------------------
  // UJI & BUKTI TIDAK MERUSAK LOGIKA LAMA:
  // Data saat ini: anggota = true, totalBelanja = 240.000
  // Karena 240.000 TIDAK LEBIH DARI 500.000, maka aturan baru diskon 15% DILEWATI.
  // Program akan mengecek aturan lama: 240.000 > 200.000 (BENAR) -> Diskon 10%.
  // Terbukti aturan lama (diskon 10%) tetap berjalan sempurna tanpa rusak.
  // ---------------------------------------------------------

  if (anggota == true && totalBelanja > 500000) {
    // ATURAN BARU: Anggota & belanja > 500rb -> Diskon 15%
    diskon = 0.15;
  } else if (totalBelanja > 200000) {
    // ATURAN LAMA: Total > 200000 -> Diskon 10%
    diskon = 0.10;
  } else if (totalBelanja > 100000) {
    // ATURAN LAMA: Total > 100000 -> Diskon 5%
    diskon = 0.05;
  } else {
    // ATURAN LAMA: Selain itu -> Tidak ada diskon
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
  print("Status Tersedia : $statusTersedia (Dari kondisi bool tersedia)");
  print("Status Anggota : $anggota");
  print("Jumlah Beli : $jumlahBeli pcs");
  
  // Menggunakan formatRupiah untuk pemisah ribuan
  print("Harga Satuan : ${formatRupiah(hargaDipakai)}");
  print("Total Belanja : ${formatRupiah(totalBelanja)}");
  print("Diskon : ${diskon * 100}%");
  print("Jumlah Potongan : ${formatRupiah(jumlahPotongan)}");
  print("Harga Akhir : ${formatRupiah(hargaAkhir)}");

  // Output daftar barang ke Debug Console menggunakan perulangan for
  print("\n=== DAFTAR BARANG KOPERASI ===");
  for (int i = 0; i < daftarNamaBarang.length; i++) {
    print("${i + 1}. ${daftarNamaBarang[i]} - ${formatRupiah(daftarHargaBarang[i])}");
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
      theme: ThemeData(
        primaryColor: Colors.blue[800],
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue[800]!),
        useMaterial3: true,
      ),
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
// di browser / layar aplikasi dengan UI/UX yang modern.
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

  // Helper method untuk membuat baris informasi di dalam card
  Widget _buildInfoRow(IconData icon, String label, String value, {Color? valueColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.blueGrey),
          const SizedBox(width: 12),
          Text(label, style: TextStyle(fontSize: 14, color: Colors.grey[600])),
          const Spacer(),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: valueColor ?? Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  // Helper method untuk membuat judul pada section card
  Widget _buildSectionTitle(String title, IconData icon) {
    return Row(
      children: [
        Icon(icon, color: Colors.blue[800], size: 24),
        const SizedBox(width: 8),
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.blue[800],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // Latar belakang abu-abu muda
      appBar: AppBar(
        elevation: 1, // Elevation ringan
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue[800],
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Koperasi Sekolah",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(
              "Sistem Informasi Transaksi",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.store, size: 28),
          ),
        ],
      ),
      
      // SafeArea & SingleChildScrollView agar responsif di berbagai layar
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // ======================================================
              // KARTU 1: INFORMASI BARANG
              // ======================================================
              Card(
                elevation: 2,
                shadowColor: Colors.black12,
                color: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSectionTitle("Informasi Barang", Icons.inventory),
                      const Divider(height: 24, thickness: 1),
                      _buildInfoRow(Icons.inventory_2, "Nama Barang", namaBarang),
                      _buildInfoRow(Icons.category, "Kategori", kategori),
                      _buildInfoRow(Icons.location_on, "Lokasi Rak", lokasiRak),
                      // Tampilkan status memakai kondisi (warna dan teks berubah otomatis)
                      _buildInfoRow(
                        Icons.check_circle,
                        "Status Tersedia",
                        statusTersedia ? "Tersedia" : "Habis",
                        valueColor: statusTersedia ? Colors.green : Colors.red,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // ======================================================
              // KARTU 2: INFORMASI PEMBELI
              // ======================================================
              Card(
                elevation: 2,
                shadowColor: Colors.black12,
                color: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSectionTitle("Informasi Pembeli", Icons.person),
                      const Divider(height: 24, thickness: 1),
                      _buildInfoRow(
                        Icons.card_membership,
                        "Status Anggota",
                        anggota ? "Anggota" : "Umum",
                        valueColor: anggota ? Colors.blue[800] : Colors.orange,
                      ),
                      _buildInfoRow(Icons.shopping_cart, "Jumlah Beli", "$jumlahBeli pcs"),
                      // Menggunakan formatRupiah untuk pemisah ribuan
                      _buildInfoRow(Icons.payments, "Harga Satuan", formatRupiah(hargaDipakai)),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // ======================================================
              // KARTU 3: RINGKASAN TRANSAKSI
              // ======================================================
              Card(
                elevation: 4,
                shadowColor: Colors.blue.withValues(alpha: 0.2),
                color: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSectionTitle("Ringkasan Transaksi", Icons.receipt_long),
                      const Divider(height: 24, thickness: 1),
                      // Menggunakan formatRupiah untuk pemisah ribuan
                      _buildInfoRow(Icons.calculate, "Total Belanja", formatRupiah(totalBelanja)),
                      _buildInfoRow(
                        Icons.discount,
                        "Diskon",
                        "${diskon * 100}%",
                        valueColor: Colors.redAccent,
                      ),
                      _buildInfoRow(Icons.money_off, "Jumlah Potongan", formatRupiah(jumlahPotongan)),
                      const SizedBox(height: 12),
                      // Harga Akhir dibuat paling menonjol
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.blue[50],
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.blue[100]!),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Harga Akhir",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey,
                              ),
                            ),
                            // Menggunakan formatRupiah untuk pemisah ribuan
                            Text(
                              formatRupiah(hargaAkhir),
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.red[700], // Aksen merah
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // ======================================================
              // KARTU 4: DAFTAR BARANG (LIST VIEW BUILDER)
              // ======================================================
              Card(
                elevation: 2,
                shadowColor: Colors.black12,
                color: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSectionTitle("Daftar Barang Koperasi", Icons.list_alt),
                      const Divider(height: 24, thickness: 1),
                      // Menggunakan ListView.builder untuk efisiien
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: daftarNamaBarang.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              ListTile(
                                contentPadding: EdgeInsets.zero,
                                leading: CircleAvatar(
                                  backgroundColor: Colors.blue[50],
                                  child: Text(
                                    "${index + 1}",
                                    style: TextStyle(
                                      color: Colors.blue[800],
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                title: Text(
                                  daftarNamaBarang[index],
                                  style: const TextStyle(fontWeight: FontWeight.w500),
                                ),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(Icons.inventory, size: 16, color: Colors.grey),
                                    const SizedBox(width: 4),
                                    // Menggunakan formatRupiah untuk pemisah ribuan
                                    Text(
                                      formatRupiah(daftarHargaBarang[index]),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if (index < daftarNamaBarang.length - 1)
                                const Divider(height: 1, thickness: 1),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // ======================================================
              // KARTU 5: RIWAYAT PENJUALAN WHILE LOOP
              // ======================================================
              Card(
                elevation: 2,
                shadowColor: Colors.black12,
                color: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSectionTitle("Simulasi Penjualan (While Loop)", Icons.sync),
                      const Divider(height: 24, thickness: 1),
                      // Menampilkan riwayat penjualan dari while loop
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: riwayatPenjualan.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            contentPadding: const EdgeInsets.symmetric(vertical: 2.0),
                            dense: true,
                            leading: const Icon(Icons.arrow_circle_right, color: Colors.redAccent, size: 20),
                            title: Text(
                              riwayatPenjualan[index],
                              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),
              
              // Footer kecil
              Center(
                child: Text(
                  "Koperasi Sekolah © 2024",
                  style: TextStyle(color: Colors.grey[400], fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}