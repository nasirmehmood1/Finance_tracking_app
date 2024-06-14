import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// Enumeration to define the direction of the fade-in animation.
enum FadeInDirection { ltr, rtl, ttb, btt }

/// A widget that applies a fade and translation animation to its child.
///
/// The [FadeAnimation] widget takes a [child] widget and animates its opacity
/// and position from an offset to its original position. The direction and
/// magnitude of the offset are controlled by the [fadeInDirection] and [fadeOffset]
/// properties. The [delay] property specifies the duration of the animation.
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

    // Initialize the animation controller with a duration based on the delay property.
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: (500 * widget.delay).round()),
    );

    // Initialize the translation animation based on the fadeOffset property.
    inAnimation = Tween<double>(begin: -widget.fadeOffset, end: 0)
        .animate(animationController)
      ..addListener(
        () {
          setState(() {});
        },
      );

    // Initialize the opacity animation from transparent to fully opaque.
    opacityAnimation =
        Tween<double>(begin: 0.5, end: 1).animate(animationController)
          ..addListener(
            () {
              setState(() {});
            },
          );

    // Start the animations.
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
