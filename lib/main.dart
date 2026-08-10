// Menghilangkan peringatan penggunaan print dan dead code
// ignore_for_file: avoid_print, dead_code

import 'package:flutter/material.dart';

// ====================================================================
// HELPER FUNCTION: FORMAT RUPIAH (PEMISAH RIBUAN)
// ====================================================================
String formatRupiah(dynamic number) {
  String strNumber = number.toDouble().toStringAsFixed(0);
  String result = '';
  int count = 0;

  for (int i = strNumber.length - 1; i >= 0; i--) {
    result = strNumber[i] + result;
    count++;
    if (count % 3 == 0 && i != 0) {
      result = '.$result';
    }
  }
  return 'Rp$result';
}

// ====================================================================
// FUNGSI REUSABLE 1: HITUNG TOTAL BELANJA
// ====================================================================
double hitungTotal(int jumlah, double harga) {
  return jumlah * harga;
}

// ====================================================================
// FUNGSI REUSABLE 2: HITUNG HARGA AKHIR SETELAH POTONGAN
// ====================================================================
double hitungHargaAkhir(double total, double persenPotongan) {
  double potongan = total * persenPotongan / 100;
  return total - potongan;
}

// ====================================================================
// RPL-12.2-504: JUSTIFIKASI OOP
// --------------------------------------------------------------------
// PERTANYAAN: 
// "Apa keuntungan memodelkan barang sebagai objek bagi pengembangan 
// sistem koperasi ke depan?"
//
// JAWABAN:
// Memodelkan barang sebagai objek (OOP) membuat kode jauh lebih 
// terstruktur, rapi, dan mudah dikembangkan. Keuntungan utamanya:
// 1. Data Terpusat: Nama, harga, dan stok disatukan dalam satu wadah 
//    (objek), tidak bertebaran di variabel lepas atau list terpisah.
// 2. Mudah Dikembangkan: Kalau ke depan koperasi mau tambah atribut 
//    (misal: tanggal kadaluarsa atau kode barcode), kita cukup 
//    tambahkan di kelas Barang saja, tidak perlu utak-atik kode di 
//    seluruh aplikasi.
// 3. Punya Perilaku (Method): Objek bisa punya fungsi bawaan seperti 
//    isTersedia() atau tampilkan(), sehingga logika bisnis koperasi 
//    jadi lebih rapi dan gampang dipakai ulang.
// ====================================================================
class Barang {
  String nama;
  double harga;
  int stok;

  Barang({required this.nama, required this.harga, required this.stok});

  bool isTersedia() {
    return stok > 0;
  }

  void tampilkan() {
    print("----------------------------");
    print("📦 Nama Barang : $nama");
    print("💰 Harga       : ${formatRupiah(harga)}");
    print("📊 Stok        : $stok pcs");
    print("✅ Status      : ${isTersedia() ? 'Tersedia' : 'Habis'}");
    print("----------------------------");
  }
}


// ====================================================================
// FUNGSI UTAMA (MAIN)
// ====================================================================
void main() {

  // ==============================
  // DATA BARANG (MEMAKAI OBJEK)
  // ==============================
  Barang barang1 = Barang(nama: "Buku Tulis", harga: 3000.0, stok: 100);

  String namaBarang = barang1.nama;
  double hargaAnggota = barang1.harga; 
  double hargaUmum = 3500.0;
  int jumlahStok = barang1.stok;

  // ==============================================================
  // FITUR (RPL-12.2-502 & RPL-12.2-503): LIST OBJEK BARANG
  // ==============================================================
  Barang barang2 = Barang(nama: "Pulpen", harga: 2500.0, stok: 50);
  Barang barang3 = Barang(nama: "Roti", harga: 5000.0, stok: 15);
  
  List<Barang> listBarang = [barang1, barang2, barang3];

  print("=== KARTU BARANG KOPERASI (List Objek) ===");
  for (Barang item in listBarang) {
    item.tampilkan();
  }

  bool tersedia = barang1.isTersedia();
  bool statusTersedia = tersedia;

  String kategori = "atk";

  // ==============================
  // DATA PEMBELI
  // ==============================
  bool anggota = true;
  int jumlahBeli = 80;

  // ==============================
  // MENENTUKAN HARGA BERDASARKAN STATUS ANGGOTA
  // ==============================
  double hargaDipakai;
  if (anggota == true) {
    hargaDipakai = hargaAnggota;
  } else {
    hargaDipakai = hargaUmum;
  }

  // ==============================
  // MENGHITUNG TOTAL BELANJA
  // ==============================
  double totalBelanja = hitungTotal(jumlahBeli, hargaDipakai);

  // ==============================
  // MENENTUKAN DISKON BERTINGKAT
  // ==============================
  double diskon = 0;

  if (totalBelanja < 0) {
    print("ERROR: Transaksi DITOLAK! Total belanja tidak boleh negatif.");
    diskon = 0;
  } else {
    if (anggota == true && totalBelanja > 500000) {
      diskon = 0.15;
    } else if (totalBelanja > 200000) {
      diskon = 0.10;
    } else if (totalBelanja > 100000) {
      diskon = 0.05;
    } else {
      diskon = 0;
    }
  }

  // ==============================
  // MENGHITUNG JUMLAH POTONGAN & HARGA AKHIR
  // ==============================
  double persenPotongan = diskon * 100;
  double jumlahPotongan = totalBelanja * diskon;
  double hargaAkhir = hitungHargaAkhir(totalBelanja, persenPotongan);

  // ==============================
  // MENENTUKAN RAK BARANG (SWITCH-CASE)
  // ==============================
  String lokasiRak;
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
  // FITUR (RPL-12.2-302): PERULANGAN WHILE
  // ================================================================
  int stokBukuTulis = 3;
  List<String> riwayatPenjualan = [];

  print("\n--- Penjualan Buku Tulis ---");

  while (stokBukuTulis > 0) {
    stokBukuTulis--;
    String barisPenjualan = "Terjual 1, sisa stok: $stokBukuTulis";
    riwayatPenjualan.add(barisPenjualan);
    print(barisPenjualan);
  }

  // ==============================
  // OUTPUT DEBUG CONSOLE (TRANSAKSI UTAMA)
  // ==============================
  print("\n=== TRANSAKSI KOPERASI (Berbasis Objek) ===");
  print("Nama Barang : $namaBarang");
  print("Kategori : $kategori");
  print("Lokasi Rak : $lokasiRak");
  print("Jumlah Stok : $jumlahStok pcs");
  print("Status Tersedia : $statusTersedia (Dari method isTersedia())");
  print("Status Anggota : $anggota");
  print("Jumlah Beli : $jumlahBeli pcs");
  print("Harga Satuan : ${formatRupiah(hargaDipakai)}");
  print("Total Belanja : ${formatRupiah(totalBelanja)} (Dihitung via fungsi hitungTotal)");
  print("Diskon : ${diskon * 100}%");
  print("Jumlah Potongan : ${formatRupiah(jumlahPotongan)}");
  print("Harga Akhir : ${formatRupiah(hargaAkhir)} (Dihitung via fungsi hitungHargaAkhir)");

  // ==============================
  // MENJALANKAN APLIKASI FLUTTER
  // ==============================
  runApp(
    MyApp(
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
      listBarang: listBarang,
      riwayatPenjualan: riwayatPenjualan,
    ),
  );
}

// ====================================================================
// WIDGET ROOT APLIKASI (MyApp)
// ====================================================================
class MyApp extends StatelessWidget {
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
  final List<Barang> listBarang;
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
    required this.listBarang,
    required this.riwayatPenjualan,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Koperasi Sekolah",
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'SF Pro Display',
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1565C0)),
      ),
      home: HomePage(
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
        listBarang: listBarang,
        riwayatPenjualan: riwayatPenjualan,
      ),
    );
  }
}

// ====================================================================
// HALAMAN UTAMA (HomePage)
// ====================================================================
class HomePage extends StatefulWidget {
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
  final List<Barang> listBarang;
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
    required this.listBarang,
    required this.riwayatPenjualan,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _slideAnimation = Tween<Offset>(begin: const Offset(0, 0.1), end: Offset.zero)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 60, 24, 40),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF0D47A1), Color(0xFF1565C0)],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Selamat Datang 👋",
                style: TextStyle(color: Colors.white.withValues(alpha: 0.8), fontSize: 14),
              ),
              const SizedBox(height: 8),
              const Text(
                "Koperasi Sekolah",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "Transaksi hari ini",
                style: TextStyle(color: Colors.white.withValues(alpha: 0.6), fontSize: 12),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.store, color: Colors.white, size: 30),
          ),
        ],
      ),
    );
  }

  Widget _buildReceiptRow(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 14,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReceiptCard() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            "KOPERASI SMK",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 1.2),
          ),
          const Text(
            "Digital Receipt",
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
          const SizedBox(height: 16),
          Row(
            children: List.generate(
              40,
              (index) => Expanded(
                child: Container(
                  height: 1,
                  color: index % 2 == 0 ? Colors.grey : Colors.transparent,
                  margin: const EdgeInsets.only(right: 2),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          
          _buildReceiptRow("Nama Barang", widget.namaBarang),
          _buildReceiptRow("Jumlah Beli", "${widget.jumlahBeli} pcs"),
          _buildReceiptRow("Harga Satuan", formatRupiah(widget.hargaDipakai)),
          const SizedBox(height: 8),
          _buildReceiptRow("Total Belanja", formatRupiah(widget.totalBelanja), isBold: true),
          _buildReceiptRow("Diskon", "${widget.diskon * 100}%", isBold: true),
          
          const SizedBox(height: 16),
          Row(
            children: List.generate(
              40,
              (index) => Expanded(
                child: Container(
                  height: 1,
                  color: index % 2 == 0 ? Colors.grey : Colors.transparent,
                  margin: const EdgeInsets.only(right: 2),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF1565C0), Color(0xFFE53935)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFE53935).withValues(alpha: 0.3),
                  blurRadius: 15,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              children: [
                const Text(
                  "TOTAL BAYAR",
                  style: TextStyle(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 8),
                Text(
                  formatRupiah(widget.hargaAkhir),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(int index) {
    Barang barang = widget.listBarang[index];
    
    return StatefulBuilder(
      builder: (context, setState) {
        bool isTapped = false;
        return GestureDetector(
          onTapDown: (_) => setState(() => isTapped = true),
          onTapUp: (_) => setState(() => isTapped = false),
          onTapCancel: () => setState(() => isTapped = false),
          child: AnimatedScale(
            scale: isTapped ? 0.97 : 1.0,
            duration: const Duration(milliseconds: 150),
            child: Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.03),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1565C0).withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.inventory_2, color: Color(0xFF1565C0)),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          barang.nama,
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          barang.isTersedia() ? "🟢 Tersedia" : "🔴 Stok Habis",
                          style: TextStyle(
                            fontSize: 12,
                            color: barang.isTersedia() ? Colors.green : Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE53935).withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      formatRupiah(barang.harga),
                      style: const TextStyle(
                        color: Color(0xFFE53935),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }

  Widget _buildExpandableSection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: const Text("Detail Transaksi & Barang", style: TextStyle(fontWeight: FontWeight.bold)),
          leading: const Icon(Icons.receipt_long, color: Color(0xFF1565C0)),
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          children: [
            _buildReceiptRow("Nama Barang", widget.namaBarang),
            _buildReceiptRow("Kategori", widget.kategori),
            _buildReceiptRow("Lokasi Rak", widget.lokasiRak),
            _buildReceiptRow("Status Anggota", widget.anggota ? "Anggota" : "Umum"),
            const Divider(),
            const Padding(
              padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Daftar Barang Koperasi:", style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.listBarang.length,
              itemBuilder: (context, index) => _buildProductCard(index),
            ),
            const Divider(),
            const Padding(
              padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Riwayat Simulasi Penjualan (While Loop):", style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.riwayatPenjualan.length,
              itemBuilder: (context, index) {
                return ListTile(
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.arrow_circle_right, color: Colors.redAccent, size: 18),
                  title: Text(widget.riwayatPenjualan[index], style: const TextStyle(fontSize: 14)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomMenu() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedItemColor: const Color(0xFF1565C0),
        unselectedItemColor: Colors.grey[400],
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), activeIcon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), activeIcon: Icon(Icons.shopping_cart), label: "Transaksi"),
          BottomNavigationBarItem(icon: Icon(Icons.inventory_2_outlined), activeIcon: Icon(Icons.inventory_2), label: "Barang"),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), activeIcon: Icon(Icons.person), label: "Profil"),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      extendBodyBehindAppBar: true,
      body: SafeArea(
        top: false,
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: SlideTransition(
            position: _slideAnimation,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildHeader(),
                  const SizedBox(height: 16),
                  _buildReceiptCard(),
                  _buildExpandableSection(),
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: const LinearGradient(
            colors: [Color(0xFF1565C0), Color(0xFF0D47A1)],
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF1565C0).withValues(alpha: 0.4),
              blurRadius: 15,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(30),
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.add, color: Colors.white),
                  SizedBox(width: 8),
                  Text(
                    "Tambah Transaksi",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _buildBottomMenu(),
    );
  }
}