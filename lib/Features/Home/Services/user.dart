import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ilearn/Features/Authentication/Screens/Login/login_page.dart';
import 'package:ilearn/Features/Authentication/Widgets/toast.dart';

class UserFunctions{

  final storage = const FlutterSecureStorage();
  final String baseURl = dotenv.get('BaseUrl');

  logoutUser(context)async {
    await const FlutterSecureStorage().delete(key: 'token');
    Navigator.pop(context);
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const LoginPage()), (route) => route.isFirst);
  }

  handleWishList({bool deleting = true,required String courseId})async{
    String? token = await storage.read(key: 'token');
    var headers = {'Authorization': 'Bearer $token'};
    String task = "delete-wishlist";
    if(!deleting) {
      task = "add-wishlist";
    }
    http.Response response;
    log('$baseURl/$task/$courseId');
    if(deleting){
      response = await http.delete(
        Uri.parse('$baseURl/$task/$courseId'),
        headers: headers,
      );
    }
    else{
      response = await http.post(
        Uri.parse('$baseURl/$task/$courseId'),
        headers: headers,
      );
    }

    if(response.statusCode == 200){
      print(jsonDecode(response.body));
    }else{
      myToast(false, 'Please try again');
    }
  }
}