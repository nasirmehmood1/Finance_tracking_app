import 'package:flutter/material.dart';

/// A custom bottom navigation bar widget that uses the [NavigationBar] widget.
///
/// The [BottomNavCustom] widget displays a navigation bar with three destinations:
/// Home, Wallet, and Statistics. It takes the entire width of the screen and
/// occupies 8% of the screen height.
///
/// This widget is designed to be used as a bottom navigation bar in an application,
/// providing a way for users to navigate between different sections of the app.
class BottomNavCustom extends StatelessWidget {
  const BottomNavCustom({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the height and width of the screen using MediaQuery.
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SizedBox(
      // Set the height of the bottom navigation bar to 8% of the screen height.
      height: height * 0.08,
      // Set the width of the bottom navigation bar to the full width of the screen.
      width: width,
      child: NavigationBar(
        selectedIndex: 0, // Set the initial selected index to 0 (Home).
        onDestinationSelected: (int index) {}, // Handle destination selection.
        indicatorColor: Colors.white, // Set the indicator color to white.
        destinations: [
          // Define the Home destination.
          NavigationDestination(
            tooltip: "Home", // Tooltip for the Home destination.
            selectedIcon: Icon(
              Icons.home,
              color: Theme.of(context)
                  .colorScheme
                  .primary, // Color for the selected icon.
            ),
            icon: Icon(
              Icons.home,
              color: Theme.of(context)
                  .colorScheme
                  .primary, // Color for the unselected icon.
            ),
            label: "Home", // Label for the Home destination.
          ),
          // Define the Wallet destination.
          NavigationDestination(
            selectedIcon: Icon(
              Icons.wallet,
              color: Theme.of(context)
                  .colorScheme
                  .primary, // Color for the selected icon.
            ),
            icon: Icon(
              Icons.wallet,
              color: Theme.of(context)
                  .colorScheme
                  .primary, // Color for the unselected icon.
            ),
            label: "Wallet", // Label for the Wallet destination.
          ),
          // Define the Statistics destination.
          NavigationDestination(
            selectedIcon: Icon(
              Icons.graphic_eq,
              color: Theme.of(context)
                  .colorScheme
                  .primary, // Color for the selected icon.
            ),
            icon: Icon(
              Icons.graphic_eq,
              color: Theme.of(context)
                  .colorScheme
                  .primary, // Color for the unselected icon.
            ),
            label: "Statistics", // Label for the Statistics destination.
          ),
        ],
      ),
    );
  }
}
