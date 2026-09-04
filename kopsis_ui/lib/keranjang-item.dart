// ignore: file_names
import 'package:flutter/material.dart';

class KeranjangItem extends StatefulWidget {
  const KeranjangItem({super.key, required Null Function() onTambah});

  @override
  State<KeranjangItem> createState() => _KeranjangItemState();
}

class _KeranjangItemState extends State<KeranjangItem> {
  int jumlah = 1;

  @override
  void initState() {
    super.initState();
    print('initState dipanggil');
  }

  @override
  void dispose() {
    print('dispose dipanggil');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('build dipanggil');
    
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
          },
        ),
      ],
    );
  }
}