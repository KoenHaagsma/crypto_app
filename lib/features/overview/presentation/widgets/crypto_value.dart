import 'package:flutter/material.dart';

class CryptoValue extends StatelessWidget {
  final double value;

  const CryptoValue({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '\$${value >= 9.9 ? value.toStringAsFixed(2) : value.toStringAsFixed(6)}',
      style: TextStyle(
        color: Colors.white,
        fontSize: ModalRoute.of(context)!.canPop ? 24 : 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
