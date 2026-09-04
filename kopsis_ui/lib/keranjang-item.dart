// ignore: file_names
import 'package:flutter/material.dart';

class KeranjangItem extends StatefulWidget {
  // TAMBAHAN: Bikin varibel callback buat nangkap event tombol +
  final VoidCallback? onTambah;

  // TAMBAHAN: Masukin onTambah ke constructor
  const KeranjangItem({super.key, this.onTambah});

  @override
  State<KeranjangItem> createState() => _KeranjangItemState();
}

class _KeranjangItemState extends State<KeranjangItem> {
  int jumlah = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: const Icon(Icons.remove),
          onPressed: () {
            setState(() {
              if (jumlah > 1) jumlah--;
            });
          },
        ),
        Text(jumlah.toString()),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            setState(() {
              jumlah++;
            });
            widget.onTambah?.call(); 
          },
        ),
      ],
    );
  }
}