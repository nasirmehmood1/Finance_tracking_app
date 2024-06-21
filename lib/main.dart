import 'package:flutter/material.dart';
import 'package:flutter_finance_app_ui_animation/view/introduction_screen/welcom_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WelcomScreen(),
    );
  }
}
