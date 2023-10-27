import 'package:flutter/material.dart';
import 'package:ilearn/Resources/colors.dart';
import 'package:ilearn/Screens/Authentication/Login/Control/elevated_button.dart';
import 'package:pinput/pinput.dart';

class OtpPage extends StatefulWidget {
  OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final focusNode = FocusNode();
  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
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
            const Text('We\'ve sent a 6 digit code to'),
            SizedBox(
                height: 32,
                child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Sample@gmail.com',
                      style: TextStyle(
                          fontSize: 13, decoration: TextDecoration.underline),
                    ))),
            Padding(
              padding:
                  EdgeInsets.only(top: height * 0.07, bottom: height * 0.05),
              child: Form(
                key: key,
                child: Pinput(
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
                    if (value?.length == 6) {
                      return null;
                    }
                    return 'Invalid OTP';
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
                onPressed: () {},
                child: const Text(
                  'Resend Code',
                  style: TextStyle(decoration: TextDecoration.underline),
                )),
            SizedBox(
              width: double.infinity,
              height: height * 0.05,
              child: ElevatedButton(
                onPressed: () {
                  focusNode.unfocus();
                  key.currentState!.validate();
                },
                style: ElevatedButtonDesign.buttonDesign(),
                child: const Text('NEXT'),
              ),
            ),
            SizedBox(
              height: height * 0.25,
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
