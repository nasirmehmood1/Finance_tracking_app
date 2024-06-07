import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_finance_app_ui_animation/model/contact.dart';
import 'package:flutter_finance_app_ui_animation/view_model/animations/fade_animation.dart';

class ListViewWidget extends StatefulWidget {
  ListViewWidget({super.key});

  @override
  State<ListViewWidget> createState() => _ListViewWidgetState();
}

class _ListViewWidgetState extends State<ListViewWidget> {
  List colours = [
    Colors.red.shade200,
    Colors.green.shade200,
    Colors.yellow.shade200
  ];

  Random random = Random();

  int index = 0;

  void changeColour() {
    setState(() {
      index = random.nextInt(3);
    });
  }

  final contactsList = [
    Contact(
      color: Colors.red.withOpacity(0.1),
      name: 'Toya Smith',
      amount: '50.60',
      profileAsset: 'assets/images/nasir.jpeg',
    ),
    Contact(
      color: Colors.teal.withOpacity(0.1),
      name: 'Tom Hardy',
      amount: '80.20',
      profileAsset: 'assets/images/nasir.jpeg',
    ),
    Contact(
      color: Colors.purple.withOpacity(0.1),
      name: 'John Wick',
      amount: '200.90',
      profileAsset: 'assets/images/nasir.jpeg',
    ),
    Contact(
      color: Colors.orange.withOpacity(0.1),
      name: 'Brad Smith',
      amount: '60.70',
      profileAsset: 'assets/images/nasir.jpeg',
    ),
    Contact(
      color: Colors.orange.withOpacity(0.1),
      name: 'Brad Smith',
      amount: '60.70',
      profileAsset: 'assets/images/nasir.jpeg',
    ),
    Contact(
      color: Colors.orange.withOpacity(0.1),
      name: 'Brad Smith',
      amount: '60.70',
      profileAsset: 'assets/images/nasir.jpeg',
    ),
    Contact(
      color: Colors.orange.withOpacity(0.1),
      name: 'Brad Smith',
      amount: '60.70',
      profileAsset: 'assets/images/nasir.jpeg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height * 0.22, // Provide a definite height for the ListView
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: contactsList.length,
        itemBuilder: (context, index) {
          final contact = contactsList[index];
          return FadeAnimation(
            delay: 2.0 + index,
            fadeInDirection: FadeInDirection.ltr,
            fadeOffset: 40,
            child: Container(
              height: height * 0.2,
              width: width * 0.4, // Provide a definite width for each item
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 15),
              decoration: BoxDecoration(
                color: colours[index],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    maxRadius: 40,
                    foregroundImage: AssetImage(contact.profileAsset),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    contact.name,
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '\$${contact.amount}',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 15),
      ),
    );
  }
}
