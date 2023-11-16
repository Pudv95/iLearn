import 'dart:convert';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ilearn/Models/student_model.dart';
import 'package:ilearn/View/Authentication/Screens/Login/login_page.dart';
import 'package:ilearn/View/Home/Screens/dashboard.dart';
import '../../../Models/user_model.dart';
import '../../../Resources/imports.dart';

class Authentication{

  final storage = const FlutterSecureStorage();
  final String baseURl = dotenv.get('BaseUrl');
  Future<bool> hasNetwork() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

// SignUP Functions
  signUpUser(context,UserModel userModel) async {

    var headers = {
      'Content-Type': 'application/json',
    };

    var url = Uri.parse('$baseURl/sign-up');

    try {
      http.Response response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(userModel.toJson()),
      );
      bool success = true;
      String message = jsonDecode(response.body)['message'];
      if (response.statusCode == 201) {
        myToast(success, message);
        return true;
      }
      else {
        success = false;
        myToast(success, message);
        return false;
      }
    } catch (error) {

      print('Error: $error');
    }
  }

// Login Functions
  loginUser(context,email,password) async {

    if(!(await hasNetwork())){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('No Internet Access')));
      return;
    }
    
    FocusScope.of(context).unfocus();
    var headers = {
      'Content-Type': 'application/json',
    };

    var url = Uri.parse('$baseURl/sign-in');

    try {
      http.Response response = await http.post(
        url,
        headers: headers,
        body: jsonEncode({
          "email" : email,
          "password" : password,
        }),
      );
      if (response.statusCode == 200) {
        String message = jsonDecode(response.body)['message'];
        await storage.write(key: "token", value: jsonDecode(response.body)['data']['token']);
        String token = (jsonDecode(response.body)['data']['token']);
        print(response.body);
        await getUserData(context, token);
        myToast(true, message);
        return true;
      }
      else {
        myToast(false, jsonDecode(response.body)['message']);
        return false;
      }
    } catch (error) {
      print('Error: $error');
    }
  }

// OTP Functions
  verifyEmail(otp,email) async {
    var headers = {
      'Content-Type': 'application/json',
    };

    var url = Uri.parse('$baseURl/verify-email');

    try {
      http.Response response = await http.post(
        url,
        headers: headers,
        body: jsonEncode({
          "email": email,
          "otp": otp,
        }),
      );
      bool success = true;
      String message = jsonDecode(response.body)['message'];
      if (response.statusCode == 200) {
        myToast(success, message);
        return true;
      } else {
        success = false;
        myToast(success, message);
        return false;
      }
    } catch (error) {
      print('Error: $error');
      return false;
    }
  }

  verifyOTP(otp,email) async {
    var headers = {
      'Content-Type': 'application/json',
    };

    var url = Uri.parse('$baseURl/verify-otp');

    try {
      http.Response response = await http.post(
        url,
        headers: headers,
        body: jsonEncode({
          "email": email,
          "otp": otp,
        }),
      );
      bool success = true;
      String message = jsonDecode(response.body)['message'];
      if (response.statusCode == 200) {
        myToast(success, message);
        return jsonDecode(response.body)['data']['token'];
      }
      else{
        success = false;
        myToast(success, message);
      }
    } catch (error) {
      print('Error: $error');
      return false;
    }
  }

  resendOTP(context,email) async {
    var headers = {
      'Content-Type': 'application/json',
    };

    var url = Uri.parse('$baseURl/resend-otp');

    try {
      http.Response response = await http.post(
        url,
        headers: headers,
        body: jsonEncode({
          "email": email,
        }),
      );
      bool success = true;
      String message = jsonDecode(response.body)['message'];
      if (response.statusCode == 200) {
        myToast(success, message);
      }
      else{
        success = false;
        myToast(success, message);
      }
    } catch (error) {
      print('Error: $error');
      return false;
    }
  }

// Forget Password Functions
  forgotPassword(context,email)async{
    String baseURl = dotenv.get('BaseUrl');
    var url = Uri.parse('$baseURl/forget-password');
    var body = {'email': email};

    try {
      var response = await http.post(url, body: body);
      bool success = true;
      String message = jsonDecode(response.body)['message'];
      if (response.statusCode == 200) {
        myToast(success, message);
        return true;
      } else {
        success = false;
        myToast(success, message);
        return false;
      }
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }

// Reset Password Functions
  resetPassword(token,password)async{
    var headers = {
      'Authorization':
      'Bearer $token'
    };
    var url = Uri.parse('$baseURl/change-password');
    var body = {'password': password};

    try {
      var response = await http.post(url, headers: headers, body: body);

      bool success = true;
      String message = jsonDecode(response.body)['message'];
      if (response.statusCode == 200) {
        myToast(success, message);
        return true;
      } else {
        success = false;
        myToast(success, message);
        return false;
      }
    } catch (e) {
      print('Error: $e');
    }
  }
  
// Get UserData Function

  getUserData(context,token)async{
    var headers = {
      'Authorization': 'Bearer $token'
    };

    try {
      var url = Uri.parse('$baseURl/');
      var response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        User user = User.fromJson(jsonDecode(response.body)['user']);
        print(user.toJson());
        if(context.mounted){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Dashboard(user: user)));
        }
      } else if(response.statusCode == 401){
        myToast(false,"Login expired");
        if(context.mounted){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const LoginPage()));
        }
      }
    } on Exception catch (e) {
      print(e.toString());
    }
  }

}