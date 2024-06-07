import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_finance_app_ui_animation/view/widgets/bank_card.dart';

class SwiperWidget extends StatelessWidget {
  const SwiperWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Swiper(
      itemCount: 5,
      itemWidth: width,
      itemHeight: height * 0.31,
      layout: SwiperLayout.TINDER,
      curve: Curves.decelerate,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Stack(children: [
          Column(
            children: [
              Card(elevation: 8, child: BankCard(number: index.toDouble()))
            ],
          )
        ]);
      },
    );
  }
}
