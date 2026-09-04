import 'barang_card.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // 1. BUKTI KEUNGGULAN: Nambah 5 barang baru di bagian data doang
  final List<Map<String, dynamic>> daftarBarang = const [
    {'nama': 'Buku Tulis', 'anggota': 3000, 'umum': 3500, 'stok': 40},
    {'nama': 'Pulpen', 'anggota': 2500, 'umum': 3000, 'stok': 25},
    {'nama': 'Roti', 'anggota': 5000, 'umum': 5500, 'stok': 15},
    // --- 5 BARANG BARU DI BAWAH INI ---
    {'nama': 'Air Mineral', 'anggota': 3000, 'umum': 3500, 'stok': 50},
    {'nama': 'Snack Chiki', 'anggota': 8000, 'umum': 10000, 'stok': 30},
    {'nama': 'Penggaris 30cm', 'anggota': 2000, 'umum': 2500, 'stok': 20},
    {'nama': 'Tip-X', 'anggota': 5000, 'umum': 6000, 'stok': 15},
    {'nama': 'Amplop', 'anggota': 1000, 'umum': 1500, 'stok': 100},
  ];

  // 2. BAGIAN TAMPILAN: Nggak ada yang diubah sama sekali (sesuai instruksi)
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Transaksi Koperasi')),
        body: ListView.builder(
          itemCount: daftarBarang.length,
          itemBuilder: (context, index) {
            final barang = daftarBarang[index];
            return BarangCard(
              nama: barang['nama'],
              hargaAnggota: barang['anggota'],
              stok: barang['stok'],
            );
          },
        ),
      ),
    );
  }
}