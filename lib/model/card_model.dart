// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CardModel {
  String bacKgroundImage;
  int index;
  CardModel({
    required this.bacKgroundImage,
    required this.index,
  });
}

List<CardModel> listOfImages = [
  CardModel(bacKgroundImage: 'assets/images/bg1.jpg', index: 0),
  CardModel(bacKgroundImage: 'assets/images/bg2.jpg', index: 1),
  CardModel(bacKgroundImage: 'assets/images/bg3.jpg', index: 2),
  CardModel(bacKgroundImage: 'assets/images/bg4.png', index: 3),
  CardModel(bacKgroundImage: 'assets/images/bg5.jpg', index: 4)
];
