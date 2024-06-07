import 'package:flutter/material.dart';

class BottomNavCustom extends StatelessWidget {
  const BottomNavCustom({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height * 0.08,
      width: width,
      child: NavigationBar(
        selectedIndex: 0,
        onDestinationSelected: (int index) {},
        indicatorColor: Colors.white,
        destinations: [
          NavigationDestination(
            tooltip: "Home",
            selectedIcon: Icon(
              Icons.home,
              color: Theme.of(context).colorScheme.primary,
            ),
            icon: Icon(
              Icons.home,
              color: Theme.of(context).colorScheme.primary,
            ),
            label: "Home",
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.wallet,
              color: Theme.of(context).colorScheme.primary,
            ),
            icon: Icon(
              Icons.wallet,
              color: Theme.of(context).colorScheme.primary,
            ),
            label: "Wallet",
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.graphic_eq,
              color: Theme.of(context).colorScheme.primary,
            ),
            icon: Icon(
              Icons.graphic_eq,
              color: Theme.of(context).colorScheme.primary,
            ),
            label: "Statistics",
          ),
        ],
      ),
    );
  }
}
