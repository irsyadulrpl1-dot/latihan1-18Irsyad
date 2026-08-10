import 'package:flutter_test/flutter_test.dart';

import 'package:latihan1_18irsyad/main.dart'; // Ganti dengan nama package/proyek Anda

void main() {
  testWidgets('Smoke test MyApp', (WidgetTester tester) async {
    await tester.pumpWidget(
      MyApp(
        namaBarang: "Test",
        kategori: "atk",
        lokasiRak: "Rak 1",
        jumlahStok: 10,
        statusTersedia: true,
        anggota: true,
        jumlahBeli: 1,
        hargaDipakai: 3000.0,
        totalBelanja: 3000.0,
        diskon: 0,
        jumlahPotongan: 0,
        hargaAkhir: 3000.0,
        daftarNamaBarang: ["A", "B"],
        daftarHargaBarang: [1000, 2000],
        riwayatPenjualan: ["Terjual 1, sisa stok: 0"],
      ),
    );

    expect(find.text('Transaksi Koperasi'), findsOneWidget);
  });
}