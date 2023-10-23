import 'package:flutter/material.dart';
import 'package:ilearn/Screens/Authentication/Login/login_page.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';


void main()async{
  WidgetsBinding widgetBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetBinding);
  return runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(),
    home: await isLoggedIn()?const Placeholder(): const LoginPage(),
  ));
}

Future<bool> isLoggedIn()async{
  print('here');
  await Future.delayed(const Duration(seconds: 1));
  print('here');
  await Future.delayed(const Duration(seconds: 1));
  return false;
}