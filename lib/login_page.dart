import 'package:flutter/material.dart';
import 'package:monety/data/domain/ui_helper/input_feild_decoration.dart';
import 'package:monety/sign_up_page.dart';

import 'home_page.dart';



class LoginPage extends StatelessWidget {
  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            TextField(
                keyboardType: TextInputType.emailAddress,
              controller: emailController,
              decoration: mFeildDecor(hint: "Enter your email", label: "email")
            ),

            SizedBox(height: 15),

            TextField(
              controller: passController,
              obscureText: true,
              decoration: mFeildDecor(hint: "Enter your password here!", label: "Password")
            ),

            SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => HomePage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink.shade100,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(21)
                  )
                ),
                child: Text("Login"),
              ),
            ),

            SizedBox(height: 5),
            
            InkWell(
              onTap: (){
                Navigator.pushReplacement(
                    context, MaterialPageRoute(
                    builder: (context)=>SignUpPage()
                ));
              },
              child: Text.rich(TextSpan(
                text: "Don't have an account, ",
                children: [
                  TextSpan(
                      text: "Create Account",
                      style: TextStyle(
                        color: Colors.pink.shade200,
                        fontWeight: FontWeight.bold,
                      )
                  )
                ]
              )
              ),
            )
          ],
        ),
      ),
    );
  }
}