import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monety/UI/UserOnBoarding/bloc/user/user_event.dart';
import 'package:monety/UI/UserOnBoarding/bloc/user/user_state.dart';
import 'package:monety/data/local/helpers/db_helper.dart';

class UserBloc extends Bloc<UserEvent, UserState>{
  DbHelper dbHelper;
  UserBloc({required this.dbHelper}) : super(UserInitialState()){
    on<SignUpUserEvent>((event, emit) async{
      emit(UserLoadingState());
      int checkValue= await dbHelper.signUpUser(newUser: event.newUser);
      if(checkValue==1){
        emit(UserSuccessState());
      }
      else if(checkValue==2){
        emit(UserFailureState(errorMsg: "User email Already exist"));
      }
      else{
        emit(UserFailureState(errorMsg: "Something Went wrong!"));
      }
    });
    on<LoginUserEvent>((event, emit) async{
      emit(UserLoadingState());
      int isValueMatched = await dbHelper.loginUser(email: event.email, password: event.password);
      if(isValueMatched==1){
        emit(UserSuccessState());
      }
      else if(isValueMatched==2){
        emit(UserFailureState(errorMsg: "Incorrect email"));
      }
      else{
        emit(UserFailureState(errorMsg: "Incorrect Password"));
      }
    });
  }
}