import 'package:monety/data/local/models/user_model.dart';

abstract class UserEvent {}

class SignUpUserEvent extends UserEvent{
  UserModel newUser;
  SignUpUserEvent({required this.newUser});
}

class LoginUserEvent extends UserEvent{
  String email, password;
  LoginUserEvent({required this.email, required this.password});
}