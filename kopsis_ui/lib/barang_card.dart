import 'keranjang-item.dart';
import 'package:flutter/material.dart';

// UBAH: Dari StatelessWidget jadi StatefulWidget
class BarangCard extends StatefulWidget {
  final String nama;
  final int hargaAnggota;
  final int stok;

  const BarangCard({
    super.key,
    required this.nama,
    required this.hargaAnggota,
    required this.stok,
  });

  @override
  State<BarangCard> createState() => _BarangCardState();
}

class _BarangCardState extends State<BarangCard> {
  // TAMBAHAN: Bikin variabel lokal biar stoknya bisa berubah saat di-run
  late int stokSekarang;

  @override
  void initState() {
    super.initState();
    stokSekarang = widget.stok; // Ambil stok awal dari parameter
  }

  @override
  Widget build(BuildContext context) {
    var keranjangItem = KeranjangItem(
          onTambah: () {
            setState(() {
              if (stokSekarang > 0) {
                stokSekarang--;
              }
            });
          },
        );
    return Card(
      margin: const EdgeInsets.all(8),
      child: ListTile(
        leading: const Icon(Icons.inventory_2),
        title: Text(widget.nama),
        subtitle: Text('Anggota Rp' + widget.hargaAnggota.toString() + ' | Stok: ' + stokSekarang.toString()),
        trailing: keranjangItem,
      ),
    );
  }
}