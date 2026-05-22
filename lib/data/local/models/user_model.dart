import 'package:monety/data/local/helpers/db_helper.dart';

class UserModel {
  int? id;
  int createdAt;
  String name, mobile, email, password;
  num balance, budget;
  UserModel({
     this.id,
     required this.name,
     required this.mobile,
     required this.email,
     required this.password,
     required this.createdAt,
     required this.balance,
     required this.budget
  });
  ///from Map
  factory UserModel.fromMap(Map<String, dynamic> map){
    return UserModel(
    id: map[DbHelper.COLUMN_USER_ID],
    name: map[DbHelper.COLUMN_USER_NAME],
    mobile: map[DbHelper.COLUMN_USER_MOB_NO],
    email: map[DbHelper.COLUMN_USER_EMAIL],
    password: map[DbHelper.COLUMN_USER_PASSWORD],
    createdAt: int.parse(map[DbHelper.COLUMN_CREATED_AT]),
    balance: map[DbHelper.COLUMN_USER_BALANCE],
    budget: map[DbHelper.COLUMN_USER_BUDGET]
    );
  }
 ///to Map
  Map<String, dynamic> toMap() {
    return {
      DbHelper.COLUMN_USER_ID: id,
      DbHelper.COLUMN_USER_NAME: name,
      DbHelper.COLUMN_USER_MOB_NO: mobile,
      DbHelper.COLUMN_USER_EMAIL: email,
      DbHelper.COLUMN_USER_PASSWORD: password,
      DbHelper.COLUMN_CREATED_AT: createdAt.toString(),
      DbHelper.COLUMN_USER_BALANCE: balance,
      DbHelper.COLUMN_USER_BUDGET: budget,
    };
  }
}