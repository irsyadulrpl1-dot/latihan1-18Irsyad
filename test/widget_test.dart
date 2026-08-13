import 'package:flutter_test/flutter_test.dart';
import 'package:latihan1_18irsyad/main.dart'; // Ganti dengan nama package/proyek Anda

void main() {
  testWidgets('Smoke test MyApp', (WidgetTester tester) async {
    List<Barang> dummyList = [
      Barang(nama: "Test A", harga: 1000.0, stok: 5),
    ];

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
        listBarang: dummyList,
        riwayatPenjualan: ["Terjual 1, sisa stok: 0"],
        notifikasiDemo: "✅ Notifikasi: Berhasil", // Tambahkan ini
      ),
    );

    expect(find.text('Transaksi Koperasi'), findsOneWidget);
  });
}