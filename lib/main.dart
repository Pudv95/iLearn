import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:ilearn/Features/splash_screen.dart';


class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

void main()async{
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(

    statusBarColor: Colors.white,
  ));
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky, overlays: [ SystemUiOverlay.top ]);
  await dotenv.load(fileName: ".env");
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  return runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      appBarTheme: const AppBarTheme(elevation: 0.0),
      fontFamily: 'Work Sans',
      textTheme: const  TextTheme(
        displayMedium: TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontFamily: 'SF Pro Display',
          fontWeight: FontWeight.w600,
        ),
        displayLarge: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 30,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),

    ),
    home: const SplashScreen(),
  ));
}