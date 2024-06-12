import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_finance_app_ui_animation/view/wallet_screen/widgets/list_view_transaction.dart';
import 'package:flutter_finance_app_ui_animation/view/wallet_screen/widgets/secondary_cards.dart';
import 'package:flutter_finance_app_ui_animation/view/wallet_screen/widgets/wallet_card.dart';
import 'package:flutter_finance_app_ui_animation/view_model/animations/fade_animation.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height,
      width: width,
      child: ListView(
        dragStartBehavior: DragStartBehavior.down,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          const FadeAnimation(
              delay: 2,
              fadeInDirection: FadeInDirection.ltr,
              fadeOffset: 40,
              child: WalletCard()),
          SizedBox(
            height: height * 0.02,
          ),
          FadeAnimation(
            delay: 4,
            fadeInDirection: FadeInDirection.ltr,
            fadeOffset: 40,
            child: Row(
              children: [
                SizedBox(
                  width: width * 0.06,
                ),
                const Text(
                  'Recent Activities',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          const Row(
            children: [
              FadeAnimation(
                delay: 4,
                fadeInDirection: FadeInDirection.ltr,
                fadeOffset: 40,
                child: SecondaryCards(
                    amountText: '908765.09', descriptionText: 'Net Income'),
              ),
              FadeAnimation(
                delay: 5,
                fadeInDirection: FadeInDirection.ltr,
                fadeOffset: 40,
                child: SecondaryCards(
                    amountText: '65430.0', descriptionText: 'Total Expenses'),
              )
            ],
          ),
          FadeAnimation(
            delay: 5,
            fadeInDirection: FadeInDirection.ltr,
            fadeOffset: 40,
            child: Row(
              children: [
                SizedBox(
                  width: width * 0.06,
                ),
                const Text(
                  'Recent Transactions',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          const Padding(
            padding: const EdgeInsets.only(left: 20),
            child: const ListViewTransaction(),
          ),
        ],
      ),
    );
  }
}
