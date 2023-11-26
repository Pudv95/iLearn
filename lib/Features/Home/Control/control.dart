import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ilearn/Features/Educator/dashboard.dart';
import '../Screens/dashboard.dart';

class Control{
  final storage = const FlutterSecureStorage();
  bool isWishListed(String courseId,List wishList){
    for(var item in wishList){
      if(item == courseId) return true;
    }
    return false;
  }
  bool inCart(String courseId,List cartList){
    for(var item in cartList){
      if(item == courseId) return true;
    }
    return false;
  }

  switchSide(isLearner,context,user)async{
    if(isLearner){
      await storage.write(key: 'platform', value: 'teacher');
      Navigator.popUntil(context, (route) => route.isFirst);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>TeacherDashboard(user: user)));
    }
    else{
      await storage.write(key: 'platform', value: 'student');
      Navigator.popUntil(context, (route) => route.isFirst);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Dashboard(user: user)));
    }
  }
}