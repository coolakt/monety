import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monety/data/domain/constants/app_routes.dart';
import 'package:monety/data/local/helpers/db_helper.dart';
import 'package:monety/UI/Splash/splash_screen.dart';
import 'package:path/path.dart';

import 'UI/UserOnBoarding/bloc/user/user_bloc.dart';

void main() {
  runApp(
      BlocProvider(
      create: (context)=> UserBloc(
          dbHelper: DbHelper.getInstance()
      ),
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Monety',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: AppRoutes.SPLASH_SCREEN,
      routes: AppRoutes.mRoutes(),
    );
  }
}

