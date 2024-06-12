// ignore_for_file: public_member_api_docs, sort_constructors_first
class ListModel {
  String userImage;
  String expenseTitle;
  String accountType;
  String amount;
  ListModel({
    required this.userImage,
    required this.expenseTitle,
    required this.accountType,
    required this.amount,
  });
}

List<ListModel> listModel = [
  ListModel(
      userImage: 'assets/images/bg1.jpg',
      expenseTitle: 'House Expense',
      accountType: 'Main Account',
      amount: '45867.90'),
  ListModel(
      userImage: 'assets/images/bg2.jpg',
      expenseTitle: 'Month Expense',
      accountType: 'Main Account',
      amount: '23475.90'),
  ListModel(
      userImage: 'assets/images/bg3.jpg',
      expenseTitle: 'Daily Expense',
      accountType: 'Second Account',
      amount: '77254.90'),
  ListModel(
      userImage: 'assets/images/bg4.jpg',
      expenseTitle: 'Food Expense',
      accountType: 'Second Account',
      amount: '45867.90'),
  ListModel(
      userImage: 'assets/images/bg5.jpg',
      expenseTitle: 'Internet Expense',
      accountType: 'Main Account',
      amount: '867.90')
];
