import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

enum FadeInDirection { ltr, rtl, ttb, btt }

class FadeAnimation extends StatefulWidget {
  final Widget child;
  final double delay;
  final double fadeOffset;
  final FadeInDirection fadeInDirection;

  const FadeAnimation({
    super.key,
    required this.child,
    required this.delay,
    required this.fadeOffset,
    required this.fadeInDirection,
  });

  @override
  State<FadeAnimation> createState() => _FadeAnimationState();
}

class _FadeAnimationState extends State<FadeAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> opacityAnimation;
  late Animation<double> inAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: (500 * widget.delay).round()),
    );

    inAnimation = Tween<double>(begin: -widget.fadeOffset, end: 0)
        .animate(animationController)
      ..addListener(
        () {
          setState(() {});
        },
      );

    opacityAnimation =
        Tween<double>(begin: 0, end: 1).animate(animationController)
          ..addListener(
            () {
              setState(() {});
            },
          );

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: () {
        switch (widget.fadeInDirection) {
          case FadeInDirection.ltr:
            return Offset(inAnimation.value, 0);
          case FadeInDirection.rtl:
            return Offset(-inAnimation.value, 0);
          case FadeInDirection.ttb:
            return Offset(0, inAnimation.value);
          case FadeInDirection.btt:
            return Offset(0, -inAnimation.value);
        }
      }(),
      child: Opacity(
        opacity: opacityAnimation.value,
        child: widget.child,
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
