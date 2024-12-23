import 'package:flutter/material.dart';
import 'item.dart';

class CList extends StatelessWidget {
  final List<dynamic> cryptoData;

  const CList({required this.cryptoData});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cryptoData.length,
      itemBuilder: (context, index) {
        return Item(crypto: cryptoData[index]);
      },
    );
  }
}
