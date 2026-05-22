import 'package:flutter/material.dart';
import 'package:monety/data/domain/ui_helper/input_feild_decoration.dart';
import 'package:monety/home_page.dart';
import 'package:monety/login_page.dart';

class SignUpPage extends StatelessWidget {
  TextEditingController nameController= TextEditingController();
  TextEditingController mobNoController= TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: .center,
          children: [
            TextField(
              controller: nameController,
              decoration: mFeildDecor(hint: "Enter your Name!", label: "Name"),
            ),

            SizedBox(height: 15),

            TextField(
              controller: mobNoController,
              keyboardType: TextInputType.phone,
              decoration: mFeildDecor(hint: "Enter your Mobile number!", label: "Mobile Number"),
            ),

            SizedBox(height: 15),

            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: mFeildDecor(hint: "Enter your email!", label: "email"),
            ),

            SizedBox(height: 15),

            TextField(
              controller: passController,
              obscureText: true,
              decoration: mFeildDecor(hint: "Enter your Password!", label: "Password")
            ),

            SizedBox(height: 20),

            TextField(
                controller: confirmPassController,
                obscureText: true,
                decoration: mFeildDecor(hint: "Confirm your Password!", label: "Confirm Password")
            ),

            SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> HomePage()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink.shade100,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: .circular(21)
                  )
                ),
                child: Text("Sign Up"),
              ),
            ),
            SizedBox(height: 5,),
            Center(
              child: InkWell(
                onTap: (){
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(
                      builder: (context)=>LoginPage()
                  ));
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
    );
  }
}