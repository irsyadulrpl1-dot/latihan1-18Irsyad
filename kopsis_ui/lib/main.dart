import 'barang_card.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late TextEditingController _controller;
  String kataCari = '';

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final List<Map<String, dynamic>> daftarBarang = const [
    {'nama': 'Buku Tulis', 'anggota': 3000, 'umum': 3500, 'stok': 40},
    {'nama': 'Pulpen', 'anggota': 2500, 'umum': 3000, 'stok': 25},
    {'nama': 'Roti', 'anggota': 5000, 'umum': 5500, 'stok': 15},
    {'nama': 'Air Mineral', 'anggota': 3000, 'umum': 3500, 'stok': 50},
    {'nama': 'Snack Chiki', 'anggota': 8000, 'umum': 10000, 'stok': 30},
    {'nama': 'Penggaris 30cm', 'anggota': 2000, 'umum': 2500, 'stok': 20},
    {'nama': 'Tip-X', 'anggota': 5000, 'umum': 6000, 'stok': 15},
    {'nama': 'Amplop', 'anggota': 1000, 'umum': 1500, 'stok': 100},
  ];

  @override
  Widget build(BuildContext context) {
    final hasilCari = daftarBarang.where((b) => 
      b['nama'].toLowerCase().contains(kataCari.toLowerCase())
    ).toList();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Transaksi Koperasi')),
        body: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Cari barang...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  kataCari = value;
                });
              },
            ),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  int colCount = 1;
                  if (constraints.maxWidth < 600) {
                    colCount = 1;
                  } else if (constraints.maxWidth < 900) {
                    colCount = 2;
                  } else {
                    colCount = 3;
                  }

                  return GridView.builder(
                    itemCount: hasilCari.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: colCount,
                      childAspectRatio: 3,
                    ),
                    itemBuilder: (context, index) {
                      final barang = hasilCari[index];
                      return BarangCard(
                        nama: barang['nama'] as String,
                        hargaAnggota: barang['anggota'] as int,
                        stok: barang['stok'] as int,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}