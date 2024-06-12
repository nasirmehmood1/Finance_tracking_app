import 'package:flutter/material.dart';

class SecondaryCards extends StatelessWidget {
  const SecondaryCards(
      {super.key, required this.amountText, required this.descriptionText});
  final String amountText;
  final String descriptionText;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height * 0.19,
      width: width * 0.44,
      child: Card.filled(
        color: Colors.deepOrange.shade300,
        margin: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              amountText,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              descriptionText,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
