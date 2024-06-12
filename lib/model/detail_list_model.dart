// ignore_for_file: public_member_api_docs, sort_constructors_first
class DetailListModel {
  String shopingPlaceName;
  double amountExpenses;
  String dateAndTime;
  DetailListModel({
    required this.shopingPlaceName,
    required this.amountExpenses,
    required this.dateAndTime,
  });
}

List<DetailListModel> listOfDetailShoping = [
  DetailListModel(
      shopingPlaceName: 'Iphone Store',
      amountExpenses: 239475,
      dateAndTime: '8:20 pm '),
  DetailListModel(
      shopingPlaceName: 'Grocery Store',
      amountExpenses: 568475,
      dateAndTime: '8:20 pm '),
  DetailListModel(
      shopingPlaceName: 'Medical Store',
      amountExpenses: 998375,
      dateAndTime: '8:20 pm '),
  DetailListModel(
      shopingPlaceName: 'Treveling Expense',
      amountExpenses: 9273655,
      dateAndTime: '8:20 pm '),
  DetailListModel(
      shopingPlaceName: 'Universidty Fee',
      amountExpenses: 62540855,
      dateAndTime: '8:20 pm '),
  DetailListModel(
      shopingPlaceName: 'House Expense',
      amountExpenses: 74676593,
      dateAndTime: '8:20 pm '),
  DetailListModel(
      shopingPlaceName: 'Iphone Store',
      amountExpenses: 993847562,
      dateAndTime: '8:20 pm ')
];
