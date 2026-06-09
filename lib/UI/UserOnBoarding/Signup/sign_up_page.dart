import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monety/data/local/models/user_model.dart';
import 'package:monety/UI/Dashboard/home_page.dart';
import 'package:monety/UI/UserOnBoarding/login/login_page.dart';

import '../../../domain/constants/app_routes.dart';
import '../../../domain/ui_helper/input_feild_decoration.dart';
import '../bloc/user/user_bloc.dart';
import '../bloc/user/user_event.dart';
import '../bloc/user/user_state.dart';

class SignUpPage extends StatelessWidget {
  TextEditingController nameController= TextEditingController();
  TextEditingController mobNoController= TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  bool isPassVisible = false;
  bool isConfirmPassVisible= false;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoading= false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                //mainAxisAlignment: .center,
                children: [
          
                  //Name
                  TextFormField(
                    validator: (value) {
                      if(value== null || value.isEmpty){
                        return "Please fill your Name";
                      }
                      else{
                        return null;
                      } //no error
                    },
                    controller: nameController,
                    decoration: mFeildDecor(
                        hint: "Enter your Name!",
                        label: "Name"
                    ),
                  ),
          
                  SizedBox(height: 15),
          
                  // Mobile no
                  TextFormField(
                    validator: (value) {
                      if(value== null || value.isEmpty){
                        return "Please fill your Mobile number";
                      }
                      else if(value.length!= 10){
                        return "Please enter a valid mobile number";
                      }
                      else{
                          return null;
                        } //no error
                    },
                    controller: mobNoController,
                    keyboardType: TextInputType.phone,
                    decoration: mFeildDecor(
                        hint: "Enter your Mobile number!",
                        label: "Mobile Number"
                    ),
                  ),
          
                  SizedBox(height: 15),
          
                  //Email ID
                  TextFormField(
                    validator: (value){
                      RegExp strictEmailRegex = RegExp(
                          r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$'
                      );
                      if(value== null || value.isEmpty){
                        return "Please fill your email";
                      }
                      else if(!strictEmailRegex.hasMatch(value)){
                        return "Please enter a valid email id";
                      }
                      else
                        return null; //no error
                    },
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: mFeildDecor(
                        hint: "Enter your email!",
                        label: "email"
                    ),
                  ),
          
                  SizedBox(height: 15),
          
                  //Password
                  StatefulBuilder(builder: (context, sS){
                    return TextFormField(
                        validator: (value) {
                          RegExp passValid= RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*~]).{8,}$');
                          if(value== null || value.isEmpty){
                            return "Please fill your Password";
                          }
                          else if(!passValid.hasMatch(value)){
                            return "Please must contain one upper case, \none lower case, \none number, \none special character \nand it must be 8 character";
                          }
                          else{
                            return null;
                          } //no error
                        },
                        controller: passController,
                        obscureText: !isPassVisible,
                        decoration: mFeildDecor(
                            isPassField: true,
                            isPassVisible: isPassVisible,
                            callBack: (){
                              isPassVisible= !isPassVisible;
                              sS((){});
                            },
                            hint: "Enter your Password!",
                            label: "Password")
                    );
                  }),
          
                  SizedBox(height: 20),
          
                  //Confirm Password
                  StatefulBuilder(builder: (context, sS){
                    return TextFormField(
                        validator: (value) {
                          if(value== null || value.isEmpty){
                            return "Please confirm your password";
                          }
                          else if(value != passController.text){
                            return "You have not entered same password as above";
                          }
                          else{
                            return null;
                          } //no error
                        },
                        controller: confirmPassController,
                        obscureText: !isConfirmPassVisible,
                        decoration: mFeildDecor(
                            isPassField: true,
                            isPassVisible: isConfirmPassVisible,
                            callBack: (){
                              isConfirmPassVisible = !isConfirmPassVisible;
                              sS((){});
                            },
                            hint: "Confirm your Password!",
                            label: "Confirm Password")
                    );
                  }),
          
                  SizedBox(height: 20),
                  
                  BlocConsumer<UserBloc, UserState>(
                      builder: (context, state) =>SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if(formKey.currentState!.validate()){
                          /// do your work here
                          context.read<UserBloc>().add(
                              SignUpUserEvent(newUser: UserModel(
                                  name: nameController.text,
                                  mobile: mobNoController.text,
                                  email: emailController.text,
                                  password: passController.text,
                                  createdAt: DateTime.now().microsecondsSinceEpoch,
                                  balance: 0,
                                  budget: 0
                              )
                              )
                          );
                          // Navigator.pushNamed(
                          //     context,
                          //     AppRoutes.LOGIN_PAGE
                          // );
                        }

                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink.shade100,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: .circular(21)
                          )
                      ),
                      child: isLoading ? Row(
                        children: [
                          Padding(padding: EdgeInsets.all(7),
                            child: CircularProgressIndicator(color: Colors.white,),
                          ),
                          SizedBox(width: 11,),
                          Text("Signing Up...")
                        ],
                      ) :Text("Sign Up"),
                    ),
                  ),
                      listener: (_, state){
                        if(state is UserLoadingState){
                          isLoading= true;
                        }
                        if(state is UserFailureState){
                          isLoading= false;
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(
                              state.errorMsg
                          ), backgroundColor: Colors.red
                          )
                          );
                        }
                        if(state is UserSuccessState){
                          isLoading= false;
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(
                            "Account created Successfully",),
                            backgroundColor: Colors.green,
                          )
                          );
                          Navigator.pop(context);
                        }
                      }),
                  SizedBox(height: 5,),
                  Center(
                    child: InkWell(
                      onTap: (){
                        Navigator.pushReplacementNamed(
                            context,
                            AppRoutes.LOGIN_PAGE
                        );
                      },
                      child: Text.rich(TextSpan(
                          text: "Already have an account, ",
                          children: [
                            TextSpan(
                                text: "Login",
                                style: TextStyle(
                                  color: Colors.pink.shade200,
                                  fontWeight: FontWeight.bold,
                                )
                            )
                          ]
                      )
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}