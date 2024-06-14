import 'package:flutter/material.dart';

/// A widget that displays a bank card with a background image, Visa logo, total balance, and card number.
///
/// The [BankCard] widget is a stateless widget that displays information about a bank card,
/// including the card's background image, Visa logo, total balance, and masked card number.
/// The background image changes based on the provided [number].
class BankCard extends StatelessWidget {
  final double number;
  static const String balance = '€ 100000.6754';
  static const String cardNumber = '5431';

  /// Creates a [BankCard] widget.
  ///
  /// The [number] parameter is required and is used to determine the background image.
  const BankCard({
    super.key,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Material(
      child: Container(
        height: height *
            0.23, // Set the height of the card to 30% of the screen height.
        width: width, // Set the width of the card to the full screen width.
        padding: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(
                'assets/images/bg${number.toInt() + 1}.jpg'), // Set the background image based on the number.
            fit: BoxFit.cover,
          ),
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Visa',
              style: TextStyle(
                fontSize: 35,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 60),
            Text(
              'Balance',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  balance,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Text(
                  '***** $cardNumber',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
