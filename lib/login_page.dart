import 'package:flutter/material.dart';
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
              controller: emailController,
              decoration: InputDecoration(
                labelText: "Email",
              ),
            ),

            SizedBox(height: 15),

            TextField(
              controller: passController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
              ),
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => HomePage(),
                  ),
                );
              },
              child: Text("Login"),
            ),

            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => SignUpPage(),
                  ),
                );
              },
              child: Text("Create Account"),
            )
          ],
        ),
      ),
    );
  }
}