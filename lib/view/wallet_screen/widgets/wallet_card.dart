import 'package:flutter/material.dart';
import 'package:flutter_finance_app_ui_animation/view_model/animations/fade_animation.dart';

class WalletCard extends StatelessWidget {
  const WalletCard({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(
          height: height * 0.05,
        ),
        SizedBox(
          height: height * 0.2,
          child: Card(
            color: Colors.green.shade200,
            clipBehavior: Clip.hardEdge,
            shadowColor: Colors.black,
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.02,
                ),
                FadeAnimation(
                  delay: 2,
                  fadeInDirection: FadeInDirection.ttb,
                  fadeOffset: 40,
                  child: Row(
                    children: [
                      SizedBox(
                        width: width * 0.04,
                      ),
                      const Text(
                        'Hellow Nasir',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: width * 0.4,
                      ),
                      CircleAvatar(
                        maxRadius: 30,
                        backgroundColor: Colors.deepPurple.shade100,
                        backgroundImage: const AssetImage(
                          'assets/images/nasir.jpeg',
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                FadeAnimation(
                  delay: 2.5,
                  fadeInDirection: FadeInDirection.ltr,
                  fadeOffset: 40,
                  child: Row(
                    children: [
                      SizedBox(
                        width: width * 0.04,
                      ),
                      const Text(
                        '23459689.789',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.003,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: width * 0.05,
                    ),
                    Text('Total Amount ')
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
