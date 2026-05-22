import '../helpers/db_helper.dart';

class ExpenseModel {
  int? expenseId;
  int userId;
  String title;
  String desc;
  int catId;
  String createdAt;
  int type;
  num amount;

  ExpenseModel({
    this.expenseId,
    required this.userId,
    required this.title,
    required this.desc,
    required this.catId,
    required this.createdAt,
    required this.type,
    required this.amount
  });

  ///fromMap
  factory ExpenseModel.fromMap(Map<String, dynamic> map){
    return ExpenseModel(
      expenseId: map[DbHelper.COLUMN_EXPENSE_ID],
      userId: map[DbHelper.COLUMN_USER_ID],
      title: map[DbHelper.COLUMN_EXPENSE_TITLE],
      desc: map[DbHelper.COLUMN_EXPENSE_DESC],
      catId: map[DbHelper.COLUMN_EXPENSE_CAT_ID],
      createdAt: map[DbHelper.COLUMN_EXPENSE_CREATED_AT],
      type: map[DbHelper.COLUMN_EXPENSE_TYPE],
      amount: map[DbHelper.COLUMN_EXPENSE_AMOUNT],
    );
  }

  ///toMap
  Map<String, dynamic> toMap() {
    return {
      DbHelper.COLUMN_EXPENSE_ID: expenseId,
      DbHelper.COLUMN_USER_ID: userId,
      DbHelper.COLUMN_EXPENSE_TITLE: title,
      DbHelper.COLUMN_EXPENSE_DESC: desc,
      DbHelper.COLUMN_EXPENSE_CAT_ID: catId,
      DbHelper.COLUMN_EXPENSE_CREATED_AT: createdAt,
      DbHelper.COLUMN_EXPENSE_TYPE: type,
      DbHelper.COLUMN_EXPENSE_AMOUNT: amount,
    };
  }
}