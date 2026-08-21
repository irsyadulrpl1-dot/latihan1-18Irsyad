import 'package:flutter/material.dart';
void main () => runApp(const MyApp());
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Transaksi Koperasi')),
        body: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Text('Buku Tulis'),
              const SizedBox(height: 8),  // ← TAMBAHAN 1: jarak vertikal
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,  // ← TAMBAHAN 2
                children: const [
                  Text('anggota: Rp3.000'),
                  Text('Umum: Rp3.500'),
                ]
              )
            ]
          )
        ),
      ),
    );
  }
}