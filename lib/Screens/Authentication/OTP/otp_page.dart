import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:ilearn/Resources/colors.dart';
import 'package:ilearn/Screens/Authentication/ResetPassword/reset_password.dart';
import 'package:ilearn/Screens/Authentication/Widgets/next_button.dart';
import 'package:http/http.dart' as http;
import 'package:pinput/pinput.dart';

class OtpPage extends StatefulWidget {
  final String email;
  final bool passwordResetting;
  const OtpPage({
    super.key,
    required this.email,
    required this.passwordResetting,
  });

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final TextEditingController _otpController = TextEditingController();

  verifyEmail(otp) async {
    String baseURl = dotenv.get('BaseUrl');
    var headers = {
      'Content-Type': 'application/json',
    };

    var url = Uri.parse('$baseURl/verify-email');

    try {
      http.Response response = await http.post(
        url,
        headers: headers,
        body: jsonEncode({
          "email": widget.email,
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

  verifyOTP(otp) async {
    String baseURl = dotenv.get('BaseUrl');
    var headers = {
      'Content-Type': 'application/json',
    };

    var url = Uri.parse('$baseURl/verify-otp');

    try {
      http.Response response = await http.post(
        url,
        headers: headers,
        body: jsonEncode({
          "email": widget.email,
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

  resendOTP() async {
    String baseURl = dotenv.get('BaseUrl');
    var headers = {
      'Content-Type': 'application/json',
    };

    var url = Uri.parse('$baseURl/resend-otp');

    try {
      http.Response response = await http.post(
        url,
        headers: headers,
        body: jsonEncode({
          "email": widget.email,
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

  final focusNode = FocusNode();
  final _pinKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding:
            EdgeInsets.fromLTRB(width * 0.1, height * 0.08, width * 0.1, 0),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, height * 0.15, 0, 20),
              child: const Center(
                child: Text(
                  'Verify Yourself',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 34,
                  ),
                ),
              ),
            ),
            const Text('We\'ve sent a 4 digit code to'),
            SizedBox(
                height: 32,
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      widget.email,
                      style: const TextStyle(
                          fontSize: 13, decoration: TextDecoration.underline),
                    ))),
            Padding(
              padding:
                  EdgeInsets.only(top: height * 0.07, bottom: height * 0.05),
              child: Form(
                key: _pinKey,
                child: Pinput(
                  controller: _otpController,
                  defaultPinTheme: PinTheme(
                    textStyle: TextStyle(
                        color: AllColor.textFormText,
                        fontWeight: FontWeight.bold),
                    decoration: BoxDecoration(
                        color: AllColor.textFormBox,
                        borderRadius: BorderRadius.circular(8)),
                    height: 50,
                    width: 50,
                  ),
                  focusNode: focusNode,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  length: 4,
                  validator: (value) {
                    if (value!.length != 4) {
                      return "Enter the OTP";
                    }
                    return null;
                  },
                  errorPinTheme: PinTheme(
                    textStyle: const TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                    decoration: BoxDecoration(
                        color: AllColor.errorRed,
                        borderRadius: BorderRadius.circular(8)),
                    height: 50,
                    width: 50,
                  ),
                ),
              ),
            ),
            TextButton(
                onPressed: () async {
                  await resendOTP();
                },
                child: const Text(
                  'Resend Code',
                  style: TextStyle(decoration: TextDecoration.underline),
                )),
            CustomLoginButton(
                onPress: () async {
                  if (_pinKey.currentState!.validate()) {
                    if (widget.passwordResetting) {
                      String token = await verifyOTP(_otpController.text);
                      if (context.mounted) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ResetPassword(token: token)));
                      }
                    }

                    if (await verifyEmail(_otpController) &&
                        !widget.passwordResetting) {
                      if (context.mounted) {
                        Navigator.popUntil(context, (route) => route.isFirst);
                      }
                    } else {
                      if (context.mounted) {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('OTP is NOT Valid'),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('Try Again')),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.popUntil(
                                            context, (route) => route.isFirst);
                                      },
                                      child: Text('Login')),
                                ],
                              );
                            });
                      }
                    }
                  }
                },
                data: 'Next'),
            SizedBox(
              height: height * 0.20,
            ),
            const Text('Didn\'t recieve OTP'),
            TextButton(
                onPressed: () {},
                child: const Text(
                  'Check your Spam Folder',
                  style: TextStyle(decoration: TextDecoration.underline),
                )),
          ],
        ),
      ),
    );
  }
}
