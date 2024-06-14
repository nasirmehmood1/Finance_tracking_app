import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_finance_app_ui_animation/view/home_screen/widgets/bank_card.dart';

/// A widget that displays a swiper with bank cards.
///
/// The [SwiperWidget] uses the `card_swiper` package to create a horizontally scrolling
/// swiper of [BankCard] widgets. Each bank card is displayed with a swipeable animation
/// using the TINDER layout.
class SwiperWidget extends StatefulWidget {
  const SwiperWidget({super.key});

  @override
  State<SwiperWidget> createState() => _SwiperWidgetState();
}

class _SwiperWidgetState extends State<SwiperWidget> {
  final controller = SwiperController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Swiper(
      itemCount: 5, // Number of items to display in the swiper.
      itemWidth: 500, // Width of each item.
      itemHeight: 235, // Height of each item set to 31% of screen height.
      layout: SwiperLayout.TINDER, // Layout style for the swiper.
      curve: Curves.decelerate, // Animation curve for swiping.
      scrollDirection: Axis.horizontal, // Direction of scrolling.
      itemBuilder: (context, index) {
        return BankCard(
            number:
                index.toDouble()); // Bank card widget with index as the number.
      },
    );
  }
}
