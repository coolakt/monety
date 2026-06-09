import 'dart:io';

import 'package:monety/data/local/models/user_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

import '../../../domain/constants/app_constants.dart';


class DbHelper {
  DbHelper._();
  static DbHelper getInstance() => DbHelper._();

  Database? mDb;
  static const String DB_NAME = 'expenseDB.db';
  static const String TABLE_USER = 'user';

  static const String COLUMN_USER_ID = 'user_id';
  static const String COLUMN_USER_NAME = 'user_name';
  static const String COLUMN_USER_MOB_NO = 'user_mob_no';
  static const String COLUMN_USER_EMAIL = 'user_email';
  static const String COLUMN_USER_PASSWORD = 'user_password';
  static const String COLUMN_CREATED_AT = 'user_created_at';
  static const String COLUMN_USER_BALANCE = 'user_balance';
  static const String COLUMN_USER_BUDGET = 'user_budget';

  static const String TABLE_EXPENSE = 'expense';

  static const String COLUMN_EXPENSE_ID = 'expense_id';
  static const String COLUMN_EXPENSE_TITLE = 'expense_title';
  static const String COLUMN_EXPENSE_DESC = 'expense_desc';
  static const String COLUMN_EXPENSE_CAT_ID = 'expense_cat_id';
  static const String COLUMN_EXPENSE_CREATED_AT = 'expense_created_at';
  static const String COLUMN_EXPENSE_TYPE = 'expense_type';
  static const String COLUMN_EXPENSE_AMOUNT = 'expense_amount';



  Future<Database> initDb() async{
    mDb ??= await openDb();
    return mDb!;
  }

  Future<Database> openDb() async{
    Directory appDir = await getApplicationDocumentsDirectory();
    String dbPath = join(appDir.path, DB_NAME);
    return await openDatabase(dbPath, version: 1, onCreate: (db, version){
      db.execute('''
        create table $TABLE_USER(
          $COLUMN_USER_ID INTEGER PRIMARY KEY AUTOINCREMENT,
          $COLUMN_USER_NAME TEXT,
          $COLUMN_USER_EMAIL TEXT,
          $COLUMN_USER_MOB_NO TEXT,
          $COLUMN_USER_PASSWORD TEXT,
          $COLUMN_CREATED_AT TEXT,
          $COLUMN_USER_BALANCE REAL,
          $COLUMN_USER_BUDGET REAL
        )
      ''');
      db.execute('''
        CREATE TABLE $TABLE_EXPENSE(
          $COLUMN_EXPENSE_ID INTEGER PRIMARY KEY AUTOINCREMENT,
          $COLUMN_USER_ID INTEGER,
          $COLUMN_EXPENSE_TITLE TEXT,
          $COLUMN_EXPENSE_DESC TEXT,
          $COLUMN_EXPENSE_CAT_ID INTEGER,
          $COLUMN_EXPENSE_CREATED_AT TEXT,
          $COLUMN_EXPENSE_TYPE INTEGER,
          $COLUMN_EXPENSE_AMOUNT REAL
        )
      ''');
    });
  }

  ///signup user
  ///1-> User not exist
  ///2-> User already exist
  ///3-> Can't created user
  Future<int> signUpUser({required UserModel newUser}) async{
    Database db= await initDb();
    bool isUserExist= await isEmailExist(email: newUser.email);
    if(isUserExist){
      return 2;
    }
    else{
      int rowsEffected = await db.insert(TABLE_USER, newUser.toMap());
       if(rowsEffected>0){
         return 1;
      }
       else{
         return 3;
       }
    }

  }
  ///check if user exist
  Future<bool> isEmailExist({required String email}) async{
    Database db= await initDb();
    List<Map<String, dynamic>> result= await db.query(
      TABLE_USER,
      where: "$COLUMN_USER_EMAIL = ?",
      whereArgs: [email]
    );
    return result.isNotEmpty;
  }

  ///login
  ///1-> success
  ///2-> incorrect email
  ///3-> incorrect password
  Future<int> loginUser({required String email, required String password}) async{
    Database db = await initDb();
    bool isEmailCorrect= await isEmailExist(email: email);
    if(!isEmailCorrect){
      return 2;
    }
    List<Map<String, dynamic>> result = await db.query(
        TABLE_USER,
        where: "$COLUMN_USER_EMAIL = ? and $COLUMN_USER_PASSWORD = ?",
        whereArgs: [email, password]
    );
    if(result.isNotEmpty){
      int userID= result[0][COLUMN_USER_ID];
      SharedPreferences pref= await SharedPreferences.getInstance();
      pref.setInt(AppConstants.PREF_USER_ID, userID);
      return 1;
    }
    else{
      return 3;
    }
  }
  Future<UserModel?> getLoggedInUser() async {

    SharedPreferences pref = await SharedPreferences.getInstance();
    int? userId = pref.getInt(AppConstants.PREF_USER_ID);
    if(userId == null) return null;

    Database db = await initDb();
    List<Map<String, dynamic>> result = await db.query(
      TABLE_USER,
      where: "$COLUMN_USER_ID = ?",
      whereArgs: [userId],
    );
    if (result.isNotEmpty) {
      return UserModel.fromMap(result.first);
    }
    return null;
  }


}