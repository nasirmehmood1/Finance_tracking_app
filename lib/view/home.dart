import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_finance_app_ui_animation/view/widgets/bottom_nav_custom.dart';
import 'package:flutter_finance_app_ui_animation/view/widgets/home_button.dart';
import 'package:flutter_finance_app_ui_animation/view/widgets/list_view.dart';
import 'package:flutter_finance_app_ui_animation/view/widgets/swiper.dart';
import 'package:flutter_finance_app_ui_animation/view_model/animations/fade_animation.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: const BottomNavCustom(),
        body: SizedBox(
          width: width,
          height: height,
          child: ListView(
            dragStartBehavior: DragStartBehavior.down,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            children: [
              FadeAnimation(
                delay: 2,
                fadeInDirection: FadeInDirection.ttb,
                fadeOffset: 40,
                child: Row(
                  children: [
                    SizedBox(
                      width: width * 0.02,
                    ),
                    const Text(
                      'Welcome back',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: width * 0.47,
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
              const FadeAnimation(
                delay: 2,
                fadeInDirection: FadeInDirection.ltr,
                fadeOffset: 40,
                child: const Text(
                  'Hi, Nasir',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              const FadeAnimation(
                  delay: 3.5,
                  fadeInDirection: FadeInDirection.ltr,
                  fadeOffset: 40,
                  child: SwiperWidget()),
              SizedBox(
                height: height * 0.05,
              ),
              FadeAnimation(
                  delay: 3.5,
                  fadeInDirection: FadeInDirection.ltr,
                  fadeOffset: 40,
                  child: _buildHomeButtons()),
              SizedBox(
                height: height * 0.02,
              ),
              ListViewWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

Row _buildHomeButtons() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      HomeButton(
        label: "Transfer",
        iconData: Icons.transfer_within_a_station,
        color: Colors.teal,
        onPressed: () {},
      ),
      HomeButton(
        label: "Voucher",
        iconData: Icons.dark_mode,
        color: Colors.orange,
        onPressed: () {},
      ),
      HomeButton(
        label: "Bill",
        iconData: Icons.payment_outlined,
        color: Colors.purpleAccent.shade100,
        onPressed: () {},
      ),
      HomeButton(
        label: "Send",
        iconData: Icons.send,
        color: Colors.teal,
        onPressed: () {},
      ),
      HomeButton(
        label: "More",
        iconData: Icons.more_vert,
        color: Colors.red,
        onPressed: () {},
      ),
    ],
  );
}
