import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_finance_app_ui_animation/view/home_screen/widgets/bank_card.dart';

/// A widget that displays a swiper with bank cards.
///
/// The [SwiperWidget] uses the `card_swiper` package to create a horizontally scrolling
/// swiper of [BankCard] widgets. Each bank card is displayed with a swipeable animation
/// using the TINDER layout.
class SwiperWidget extends StatelessWidget {
  const SwiperWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Swiper(
      itemCount: 5, // Number of items to display in the swiper.
      itemWidth: width, // Width of each item.
      itemHeight:
          height * 0.31, // Height of each item set to 31% of screen height.
      layout: SwiperLayout.TINDER, // Layout style for the swiper.
      curve: Curves.decelerate, // Animation curve for swiping.
      scrollDirection: Axis.horizontal, // Direction of scrolling.
      itemBuilder: (context, index) {
        return Stack(
          children: [
            Column(
              children: [
                Card(
                  elevation: 8, // Elevation for the card shadow effect.
                  child: BankCard(
                      number: index
                          .toDouble()), // Bank card widget with index as the number.
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
