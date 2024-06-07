import 'package:flutter/material.dart';
import 'package:flutter_finance_app_ui_animation/model/card_model.dart';

class CustomAnimation extends StatefulWidget {
  const CustomAnimation({
    super.key,
  });

  @override
  State<CustomAnimation> createState() => _FadeAnimationState();
}

class _FadeAnimationState extends State<CustomAnimation>
    with SingleTickerProviderStateMixin {
  int? currentIndex;
  late AnimationController animationController;
  late CurvedAnimation curveAnimation;
  late Animation<Offset> transAnimation;
  late Animation<Offset> moveInAnimation;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();
    currentIndex = 0;
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2500));
    curveAnimation =
        CurvedAnimation(parent: animationController, curve: Curves.decelerate);
    transAnimation =
        Tween(begin: const Offset(0, 0), end: const Offset(-1000, 0))
            .animate(animationController)
          ..addListener(
            () {
              setState(() {});
            },
          );
    moveInAnimation =
        Tween(begin: const Offset(0.0, 0.5), end: const Offset(0, 0))
            .animate(curveAnimation);
    scaleAnimation = Tween(begin: 0.9, end: 1.0).animate(curveAnimation);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: listOfImages.reversed.map((card) {
      if (listOfImages.indexOf(card) <= 1) {
        return GestureDetector(
          onHorizontalDragEnd: _horizontalDragEnd,
          child: Transform.translate(
            offset: _getFlickTransformOffset(card),
            child: FractionalTranslation(
              translation: _getStackedCardOffset(card),
              child: Transform.scale(
                scale: _getStackedCardScale(card),
                child: Center(
                    child: Container(
                  height: 300,
                  color: Colors.amber,
                )),
              ),
            ),
          ),
        );
      } else {
        return Container();
      }
    }).toList());
  }

  Offset _getStackedCardOffset(CardModel card) {
    int diff = card.index - currentIndex!;
    if (card.index == currentIndex! + 1) {
      return moveInAnimation.value;
    } else if (diff > 0 && diff <= 2) {
      return Offset(0.0, 0.05 * diff);
    } else {
      return const Offset(0.0, 0.0);
    }
  }

  double _getStackedCardScale(CardModel card) {
    int diff = card.index - currentIndex!;
    if (card.index == currentIndex) {
      return 1.0;
    } else if (card.index == currentIndex! + 1) {
      return scaleAnimation.value;
    } else {
      return (1 - (0.035 * diff.abs()));
    }
  }

  Offset _getFlickTransformOffset(CardModel card) {
    if (card.index == currentIndex) {
      return transAnimation.value;
    }
    return const Offset(0.0, 0.0);
  }

  void _horizontalDragEnd(DragEndDetails details) {
    if (details.primaryVelocity! < 0) {
      // Swiped Right to Left
      animationController.forward().whenComplete(() {
        setState(() {
          animationController.reset();
          CardModel removedCard = listOfImages.removeAt(0);
          listOfImages.add(removedCard);
          currentIndex = listOfImages[0].index;
          // if (widget.onCardChanged != null) {
          //   widget.onCardChanged(listOfImages[0].bacKgroundImage);
          // }
        }); 
      });
    }
  }
}
