import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
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
  final CardSwiperController controllerCard = CardSwiperController();

  @override
  void dispose() {
    controllerCard.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.3,
      width: width,
      child: CardSwiper(
        allowedSwipeDirection: const AllowedSwipeDirection.all(),
        onSwipe: _onSwipe,
        onUndo: _onUndo,
        numberOfCardsDisplayed: 3,
        backCardOffset: const Offset(30, 15),
        padding: const EdgeInsets.all(24.0),
        controller: controllerCard,
        cardBuilder: (context, index, horizontalOffsetPercentage,
            verticalOffsetPercentage) {
          return BankCard(number: index.toDouble());
        },
        cardsCount: 5,
      ),
    );

    // Swiper(
    //   itemCount: 5, // Number of items to display in the swiper.
    //   itemWidth: 500, // Width of each item.
    //   itemHeight: 235, // Height of each item set to 31% of screen height.
    //   layout: SwiperLayout.TINDER, // Layout style for the swiper.
    //   curve: Curves.decelerate, // Animation curve for swiping.
    //   scrollDirection: Axis.horizontal, // Direction of scrolling.
    //   itemBuilder: (context, index) {
    //     return BankCard(
    //         number:
    //             index.toDouble()); // Bank card widget with index as the number.
    //   },
    // );
  }

  bool _onSwipe(
    int previousIndex,
    int? currentIndex,
    CardSwiperDirection direction,
  ) {
    debugPrint(
      'The card $previousIndex was swiped to the ${direction.name}. Now the card $currentIndex is on top',
    );
    return true;
  }

  bool _onUndo(
    int? previousIndex,
    int currentIndex,
    CardSwiperDirection direction,
  ) {
    debugPrint(
      'The card $currentIndex was undod from the ${direction.name}',
    );
    return true;
  }
}
