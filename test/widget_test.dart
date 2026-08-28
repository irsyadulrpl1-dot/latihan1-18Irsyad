import 'package:flutter_test/flutter_test.dart';
import 'package:latihan1_18irsyad/main.dart';

void main() {
  test('Barang dapat dibuat dengan benar', () {
    // Arrange
    final barang1 = Barang(nama: 'Buku Tulis', harga: 5000, stok: 10);
    final barang2 = Barang(nama: 'Pulpen', harga: 3000, stok: 5);

    // Act
    final List<Barang> listBarang = [
      barang1,
      barang2,
    ];

    // Assert
    expect(listBarang.length, 2);
    expect(listBarang[0].nama, 'Buku Tulis');
    expect(listBarang[0].harga, 5000);
    expect(listBarang[0].stok, 10);
    expect(listBarang[1].nama, 'Pulpen');
    expect(listBarang[1].harga, 3000);
    expect(listBarang[1].stok, 5);
  });
}