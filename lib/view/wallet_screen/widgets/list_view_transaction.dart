import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_finance_app_ui_animation/model/list_model.dart';
import 'package:flutter_finance_app_ui_animation/view_model/animations/fade_animation.dart';

class ListViewTransaction extends StatefulWidget {
  const ListViewTransaction({super.key});

  @override
  State<ListViewTransaction> createState() => _ListViewTransactionState();
}

class _ListViewTransactionState extends State<ListViewTransaction> {
  List<Color> colours = [
    Colors.red.shade200,
    Colors.green.shade200,
    Colors.yellow.shade200,
    Colors.deepOrange.shade200,
    Colors.grey.shade200,
    Colors.pink.shade200,
    Colors.purple.shade200,
    Colors.teal.shade200
  ];

  Random random = Random();

  int index = 0;

  /// Changes the background color of the list items randomly.
  void changeColour() {
    setState(() {
      index = random.nextInt(3);
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      // Set a definite height for the ListView
      height: height * 0.3,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: listModel.length,
        itemBuilder: (context, index) {
          final contact = listModel[index];
          return FadeAnimation(
            delay: 2.0 + index,
            fadeInDirection: FadeInDirection.ltr,
            fadeOffset: 40,
            child: Container(
              height: height * 0.2,
              width: width * 0.44, // Set a definite width for each item
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 15),
              decoration: BoxDecoration(
                color: colours[index],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: width * 0.04,
                      ),
                      CircleAvatar(
                        maxRadius: 40,
                        foregroundImage: AssetImage(contact.userImage),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        contact.expenseTitle,
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        contact.accountType,
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                    ],
                  ),
                  Text(
                    '\$${contact.amount}',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 18),
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
