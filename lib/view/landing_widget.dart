import 'package:flutter/material.dart';
import 'package:flutter_finance_app_ui_animation/view/home_screen/home.dart';
import 'package:flutter_finance_app_ui_animation/view/statistics_screen/statistics_screen.dart';
import 'package:flutter_finance_app_ui_animation/view/wallet_screen/wallet_screen.dart';

class LandingWidget extends StatefulWidget {
  const LandingWidget({super.key});

  @override
  State<LandingWidget> createState() => _LandingWidgetState();
}

class _LandingWidgetState extends State<LandingWidget> {
  int selectedIndex = 0;
  List<Widget> bottomNav = [
    const MyHomePage(),
    const WalletScreen(),
    StatisticsPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        selectedIndex:
            selectedIndex, // Set the initial selected index to 0 (Home).
        onDestinationSelected: (int index) {
          setState(() {
            selectedIndex = index;
          });
        }, // Handle destination selection.
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
      body: bottomNav[selectedIndex],
    );
  }
}
