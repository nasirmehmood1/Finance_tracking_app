import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_finance_app_ui_animation/model/detail_list_model.dart';
import 'package:flutter_finance_app_ui_animation/view_model/animations/fade_animation.dart';

class DetailListView extends StatefulWidget {
  const DetailListView({super.key});

  @override
  State<DetailListView> createState() => _DetailListViewState();
}

class _DetailListViewState extends State<DetailListView> {
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
        scrollDirection: Axis.vertical,
        itemCount: listOfDetailShoping.length,
        itemBuilder: (context, index) {
          final contact = listOfDetailShoping[index];
          return FadeAnimation(
            delay: 2.0 + index,
            fadeInDirection: FadeInDirection.btt,
            fadeOffset: 40,
            child: Container(
                height: height * 0.15,
                width: width * 0.44, // Set a definite width for each item
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                decoration: BoxDecoration(
                  color: colours[index],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Card(
                  margin: const EdgeInsets.symmetric(vertical: 4.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: colours[index],
                      child: const Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    title: Text(
                      contact.shopingPlaceName,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(contact.dateAndTime),
                    trailing: Text(
                      contact.amountExpenses.toString(),
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                )),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 15),
      ),
    );
  }
}
