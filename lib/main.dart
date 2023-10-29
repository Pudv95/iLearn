import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:ilearn/View/Authentication/Screens/Login/login_page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:ilearn/View/splash_screen.dart';



void main()async{
  WidgetsBinding widgetBinding = WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");
  return runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      fontFamily: 'Work Sans',
      textTheme: const  TextTheme(
        displayLarge: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    home: const SplashScreen(),
  ));
}