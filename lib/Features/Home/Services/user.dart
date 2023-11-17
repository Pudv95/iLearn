import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ilearn/Features/Authentication/Screens/Login/login_page.dart';

class UserFunctions{
  logoutUser(context)async {
    await const FlutterSecureStorage().delete(key: 'token');
    Navigator.pop(context);
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const LoginPage()), (route) => route.isFirst);
  }
}