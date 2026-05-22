import 'package:flutter/material.dart';
import 'package:monety/home_page.dart';

class SignUpPage extends StatelessWidget {
  TextEditingController nameController= TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign Up")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Name",
              ),
            ),

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
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> HomePage()));
              },
              child: Text("Sign Up"),
            )
          ],
        ),
      ),
    );
  }
}