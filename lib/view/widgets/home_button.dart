import 'package:flutter/material.dart';

/// A custom button widget that consists of an icon button and a label.
///
/// The [HomeButton] widget is a reusable component that displays an icon button
/// with a label underneath. It is typically used to represent an action on the
/// home screen of an app.
///
/// The icon button's appearance and behavior can be customized with the provided
/// [label], [iconData], [color], and [onPressed] callback.
class HomeButton extends StatelessWidget {
  final String label;
  final IconData iconData;
  final Color color;
  final VoidCallback onPressed;

  /// Creates a [HomeButton] widget.
  ///
  /// The [label], [iconData], [color], and [onPressed] properties are required.
  const HomeButton({
    super.key,
    required this.label,
    required this.color,
    required this.onPressed,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton.filled(
          onPressed: onPressed, // Execute the provided callback when pressed.
          style: IconButton.styleFrom(
            fixedSize: const Size.fromRadius(32), // Set the size of the button.
            backgroundColor: color
                .withOpacity(0.2), // Set the background color with opacity.
          ),
          color: color, // Set the color of the icon.
          icon: Icon(iconData), // Set the icon to display.
        ),
        const SizedBox(
            height: 10), // Add spacing between the button and the label.
        Text(
          label, // Display the provided label.
          style:
              const TextStyle(fontSize: 12), // Set the font size of the label.
        ),
      ],
    );
  }
}
