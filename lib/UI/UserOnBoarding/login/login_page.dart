import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monety/data/domain/ui_helper/input_feild_decoration.dart';

import '../../../data/domain/constants/app_routes.dart';
import '../../Dashboard/home_page.dart';
import '../bloc/user/user_bloc.dart';
import '../bloc/user/user_event.dart';
import '../bloc/user/user_state.dart';



class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final emailController = TextEditingController();
  final passController = TextEditingController();

  bool isPassVisible = false;
  bool isLoading = false;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              /// Email
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your email";
                  }else{
                    return null;
                  }

                },
                decoration: mFeildDecor(
                  hint: "Enter your email",
                  label: "Email",
                ),
              ),

              const SizedBox(height: 15),

              /// Password
              StatefulBuilder(
                builder: (context, sS) {
                  return TextFormField(
                    controller: passController,
                    obscureText: !isPassVisible,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your password";
                      }
                      else{return null;}
                    },
                    decoration: mFeildDecor(
                      isPassField: true,
                      isPassVisible: isPassVisible,
                      callBack: () {
                        isPassVisible = !isPassVisible;
                        sS(() {});
                      },
                      hint: "Enter your password",
                      label: "Password",
                    ),
                  );
                },
              ),

              const SizedBox(height: 20),

              BlocConsumer<UserBloc, UserState>(
                listener: (_, state){
                  if(state is UserLoadingState){
                    isLoading= true;
                  }
                  if(state is UserFailureState){
                    isLoading= false;
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMsg), backgroundColor: Colors.red,));
                  }
                  if(state is UserSuccessState){
                    isLoading= false;
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Successfully Login!"),
                      backgroundColor: Colors.green,
                    )
                    );
                    Navigator.pushReplacementNamed(
                      context,
                      AppRoutes.HOME_PAGE,
                    );
                  }
                },
                builder: (context, state) {
                  return SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          context.read<UserBloc>().add(
                              LoginUserEvent(
                                  email: emailController.text,
                                  password: passController.text
                              )
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink.shade100,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(21),
                        ),
                      ),
                      child: const Text("Login"),
                    ),
                  );
                }
              ),

              const SizedBox(height: 5),

              InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.SIGN_UP_PAGE,
                  );
                },
                child: Text.rich(
                  TextSpan(
                    text: "Don't have an account, ",
                    children: [
                      TextSpan(
                        text: "Create Account",
                        style: TextStyle(
                          color: Colors.pink.shade200,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}