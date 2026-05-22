import 'package:flutter/material.dart';

import 'domain/constants/app_routes.dart';
import 'local/helpers/db_helper.dart';
import 'local/models/user_model.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  UserModel? user;

  @override
  void initState() {
    super.initState();
    loadUser();
  }

  void loadUser() async {
    user = await DbHelper.getInstance().getLoggedInUser();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (user == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Hi, ${user!.name}"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    Image.asset("assets/logo/img_2.png"),
                    Text(
                      user!.name,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      user!.email,
                      style: const TextStyle(
                          fontSize: 18,
                          color: Colors.grey
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              Card(
                color: Colors.grey.shade100,
                child: ListTile(
                  leading: Icon(Icons.phone_outlined),
                  title: Text(user!.mobile),
                ),
              ),
              Card(
                color: Colors.grey.shade100,
                child: ListTile(
                  leading: Icon(Icons.account_balance_wallet_outlined),
                  title: Text("₹${user!.balance}"),
                ),
              ),
              Card(
                color: Colors.grey.shade100,
                child: ListTile(
                  leading: Icon(Icons.pie_chart_outline),
                  title: Text("₹${user!.budget}"),
                ),
              ),
              Spacer(),
              SizedBox(
                width: double.infinity,
                  child: ElevatedButton(
                      onPressed: (){
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          AppRoutes.LOGIN_PAGE,
                              (route) => false,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade100,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.logout_outlined, color: Colors.red.shade400,),
                          SizedBox(width: 5,),
                          Text(
                              "Logout",
                            style: TextStyle(color: Colors.red. shade400),
                          ),
                        ],
                      )
                  )
              )
            ],
          ),
        ),

      ),
    );
  }
}