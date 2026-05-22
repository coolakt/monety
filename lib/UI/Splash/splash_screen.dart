import 'package:flutter/material.dart';
import 'package:monety/data/domain/constants/app_constants.dart';
import 'package:monety/data/domain/constants/app_routes.dart';
import 'package:monety/data/local/helpers/db_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  void checkLogin() async {
    final prefs = await SharedPreferences.getInstance();

    int? userId = prefs.getInt(AppConstants.PREF_USER_ID);

    Future.delayed(const Duration(seconds: 3), () {
      if (userId != null) {
        Navigator.pushReplacementNamed(
          context,
          AppRoutes.HOME_PAGE,
        );
      } else {
        Navigator.pushReplacementNamed(
          context,
          AppRoutes.LOGIN_PAGE,
        );
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(

        child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.all(11),
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                    child: Container(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/logo/img.png"),
                          SizedBox(width: 8,),
                          Text(
                              "Monety",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 28
                          ),
                          ),
                        ],
                      ),
                    )
                ),
                Expanded(
                  flex: 6,
                    child: Image.asset("assets/logo/img_1.png")
                ),
                Expanded(
                  flex: 2,
                    child: Container(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          FittedBox(
                            child: Text(
                                "Easy way to monitor",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 50,
                                ),
                            ),
                          ),
                          FittedBox(
                            child: Text(
                                "your Expenses",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 50,
                              )
                            ),
                          )
                        ],
                      ),
                    )
                ),
                Expanded(
                  flex: 2,
                    child: Container(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Text("Safe your future by managing your", style: TextStyle(
                            color: Colors.grey
                          ),
                          ),
                          Text("expense right now",
                            style: TextStyle(
                                color: Colors.grey
                            ),
                          )
                        ],
                      ),
                    )
                )
              ],
            ),
          ),
        )
    );
  }
}
