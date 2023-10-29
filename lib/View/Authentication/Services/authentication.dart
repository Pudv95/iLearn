import 'dart:convert';
import 'dart:developer';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../Models/user_model.dart';
import '../../../Resources/imports.dart';

class Authentication{

  final storage = const FlutterSecureStorage();
  final String baseURl = dotenv.get('BaseUrl');

// SignUP Functions
  signUpUser(UserModel userModel) async {

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
      if (response.statusCode == 201) {
        print(response.body);
        return true;
      }
      else {
        print('Failed with status: ${response.statusCode}');
        print('Reason: ${response.reasonPhrase}');
        return false;
      }
    } catch (error) {
      print('Error: $error');
    }
  }

// Login Functions
  loginUser(context,email,password) async {
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
        print(response.body);
        await storage.write(key: "token", value: jsonDecode(response.body)['data']['token']);
        log(jsonDecode(response.body)['data']['token']);
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyDashboard()));
        return true;
      }
      else {
        print('Failed with status: ${response.statusCode}');
        print('Reason: ${response.reasonPhrase}');
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

      if (response.statusCode == 200) {
        print(response.body);
        return true;
      } else {
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

      if (response.statusCode == 200) {
        print(response.body);
        return jsonDecode(response.body)['data']['token'];
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

      if (response.statusCode == 200) {
        print(response.body);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('OTP is sent')));
      }
    } catch (error) {
      print('Error: $error');
      return false;
    }
  }

// Forget Password Functions
  forgotPassword(email)async{
    String baseURl = dotenv.get('BaseUrl');
    var url = Uri.parse('$baseURl/forget-password');
    var body = {'email': email};

    try {
      var response = await http.post(url, body: body);

      if (response.statusCode == 200) {
        print(response.body);
        return true;
      } else {
        print(response.reasonPhrase);
        return false;
      }
    } catch (e) {
      print('Error: $e');
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

      if (response.statusCode == 200) {
        print(response.body);
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print('Error: $e');
    }
  }

}