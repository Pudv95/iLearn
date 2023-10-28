import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:ilearn/Screens/Authentication/Login/login_page.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';



void main()async{
  WidgetsBinding widgetBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetBinding);

  await dotenv.load(fileName: ".env");
  return runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      fontFamily: 'Work Sans',
      textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.grey)
    ),
    home: await isLoggedIn()?const Placeholder(): const LoginPage(),
  ));
}

Future<bool> isLoggedIn()async{
  log('Loading....');
  await Future.delayed(const Duration(seconds: 0));
  return false;
}