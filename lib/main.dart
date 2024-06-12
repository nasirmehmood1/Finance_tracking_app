import 'dart:ui' show ImageFilter;

import 'package:flutter/material.dart';
import 'package:flutter_finance_app_ui_animation/view/home.dart';
import 'package:flutter_finance_app_ui_animation/view/landing_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LandingWidget(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   MyHomePage({required this.title}) : super();

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   String imageUrl = "assets/images/bg1.jpg";

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: SafeArea(
//         child: Stack(
//           fit: StackFit.expand,
//           children: [
//             Container(
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage("$imageUrl"),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               child: BackdropFilter(
//                 filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
//                 child: Container(
//                   decoration:
//                       BoxDecoration(color: Colors.white.withOpacity(0.0)),
//                 ),
//               ),
//             ),
//             Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   CardStack(
//                     onCardChanged: (url) {
//                       setState(() {
//                         imageUrl = url;
//                       });
//                     },
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class CardStack extends StatefulWidget {
//   final Function onCardChanged;

//   CardStack({required this.onCardChanged});
//   @override
//   _CardStackState createState() => _CardStackState();
// }

// class _CardStackState extends State<CardStack>
//     with SingleTickerProviderStateMixin {
//   var cards = [
//     CardModel(index: 0, bacKgroundImage: "assets/images/bg1.jpg"),
//     CardModel(index: 1, bacKgroundImage: "assets/images/bg2.jpg"),
//     CardModel(index: 2, bacKgroundImage: "assets/images/bg3.jpg"),
//     CardModel(index: 3, bacKgroundImage: "assets/images/bg4.png"),
//     CardModel(index: 4, bacKgroundImage: "assets/images/bg5.jpg"),
//   ];
//   late int currentIndex;
//   late AnimationController controller;
//   late CurvedAnimation curvedAnimation;
//   late Animation<Offset> _translationAnim;
//   late Animation<Offset> _moveAnim;
//   late Animation<double> _scaleAnim;

//   @override
//   void initState() {
//     super.initState();
//     currentIndex = 0;
//     controller = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 150),
//     );
//     curvedAnimation =
//         CurvedAnimation(parent: controller, curve: Curves.easeOut);

//     _translationAnim =
//         Tween(begin: const Offset(0.0, 0.0), end: const Offset(-1000.0, 0.0))
//             .animate(controller)
//           ..addListener(() {
//             setState(() {});
//           });

//     _scaleAnim = Tween(begin: 0.965, end: 1.0).animate(curvedAnimation);
//     _moveAnim =
//         Tween(begin: const Offset(0.0, 0.05), end: const Offset(0.0, 0.0))
//             .animate(curvedAnimation);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//         children: cards.reversed.map((card) {
//       if (cards.indexOf(card) <= 2) {
//         return GestureDetector(
//           onHorizontalDragEnd: _horizontalDragEnd,
//           child: Transform.translate(
//             offset: _getFlickTransformOffset(card),
//             child: FractionalTranslation(
//               translation: _getStackedCardOffset(card),
//               child: Transform.scale(
//                 scale: _getStackedCardScale(card),
//                 child: const Center(child: Card()),
//               ),
//             ),
//           ),
//         );
//       } else {
//         return Container();
//       }
//     }).toList());
//   }

//   Offset _getStackedCardOffset(CardModel card) {
//     int diff = card.index - currentIndex;
//     if (card.index == currentIndex + 1) {
//       return _moveAnim.value;
//     } else if (diff > 0 && diff <= 2) {
//       return Offset(0.0, 0.05 * diff);
//     } else {
//       return const Offset(0.0, 0.0);
//     }
//   }

//   double _getStackedCardScale(CardModel card) {
//     int diff = card.index - currentIndex;
//     if (card.index == currentIndex) {
//       return 1.0;
//     } else if (card.index == currentIndex + 1) {
//       return _scaleAnim.value;
//     } else {
//       return (1 - (0.035 * diff.abs()));
//     }
//   }

//   Offset _getFlickTransformOffset(CardModel card) {
//     if (card.index == currentIndex) {
//       return _translationAnim.value;
//     }
//     return const Offset(0.0, 0.0);
//   }

//   void _horizontalDragEnd(DragEndDetails details) {
//     if (details.primaryVelocity! < 0) {
//       // Swiped Right to Left
//       controller.forward().whenComplete(() {
//         setState(() {
//           controller.reset();
//           CardModel removedCard = cards.removeAt(0);
//           cards.add(removedCard);
//           currentIndex = cards[0].index;
//           if (widget.onCardChanged != null) {
//             widget.onCardChanged(cards[0].bacKgroundImage);
//           }
//         });
//       });
//     }
//   }
// }

// class TouristCard extends StatelessWidget {
//   final int index;
//   final String imageUrl;
//   TouristCard({required this.index, required this.imageUrl});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Padding(
//         padding: const EdgeInsets.only(bottom: 40.0),
//         child: Column(children: [
//           Image.asset(imageUrl),
//           FractionalTranslation(
//             translation: const Offset(1.7, -0.5),
//             child: FloatingActionButton(
//               mini: true,
//               backgroundColor: Colors.yellow,
//               child: const Icon(Icons.star),
//               onPressed: () {},
//             ),
//           ),
//           const Padding(
//             padding: EdgeInsets.all(10.0),
//             child: Text(
//               "Tourist Spot",
//             ),
//           ),
//           const Padding(
//             padding: EdgeInsets.all(10.0),
//             child: Text(
//               "Travel and Recreation",
//             ),
//           ),
//           ElevatedButton(
//             child: const Text(
//               "EXPLORE",
//             ),
//             onPressed: () {},
//           )
//         ]),
//       ),
//     );
//   }
// }
