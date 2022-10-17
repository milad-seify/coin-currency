import 'package:flutter/material.dart';

class ShowCurrency extends StatelessWidget {
  const ShowCurrency({
    Key? key,
    required this.selectCoin,
    required this.price,
    required this.selectCurrency,
  }) : super(key: key);

  final String selectCoin;
  final String? price;
  final String selectCurrency;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueGrey,
      elevation: 10.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
        child: Text(
          '1 $selectCoin = $price $selectCurrency',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
