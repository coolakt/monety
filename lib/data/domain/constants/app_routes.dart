import 'package:flutter/material.dart';
import 'package:monety/data/profile_page.dart';
import 'package:monety/UI/Splash/splash_screen.dart';
import 'package:path/path.dart';

import '../../../UI/Dashboard/home_page.dart';
import '../../../UI/UserOnBoarding/login/login_page.dart';
import '../../../UI/UserOnBoarding/Signup/sign_up_page.dart';
import '../../../UI/Dashboard/statistic.dart';

class AppRoutes {
  static const String SPLASH_SCREEN = "/";
  static const String LOGIN_PAGE = "/login_page";
  static const String SIGN_UP_PAGE = "/sign_up_page";
  static const String HOME_PAGE = "/home_page";
  static const String STATISTC_PAGE = "/statistic_page";
  static const String PROFILE_PAGE = "/profile_page";

  static Map<String, WidgetBuilder> mRoutes() => {
    SPLASH_SCREEN: (context) => SplashScreen(),
    LOGIN_PAGE: (context) => LoginPage(),
    SIGN_UP_PAGE: (context) => SignUpPage(),
    HOME_PAGE: (context) => HomePage(),
    STATISTC_PAGE: (context) => Statistic(),
    PROFILE_PAGE: (context) => ProfilePage(),
  };
}

