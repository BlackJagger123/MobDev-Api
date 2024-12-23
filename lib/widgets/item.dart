import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  final Map<String, dynamic> crypto;

  const Item({required this.crypto});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: Image.network(
          crypto['image'],
          width: 40,
          height: 40,
        ),
        title: Text(
          crypto['name'],
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        subtitle: Text('Symbol: ${crypto['symbol'].toUpperCase()}'),
        trailing: Text(
          '\$${crypto['current_price'].toStringAsFixed(2)}',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 16, color: Colors.green),
        ),
      ),
    );
  }
}
