import 'package:flutter/material.dart';
import 'package:ilearn/Screens/Authentication/OTP/otp_page.dart';
import '../Control/elevated_button.dart';

class LoginButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const LoginButton({super.key,required this.formKey});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return SizedBox(
        width: double.infinity,
        height: height*0.05,
        child: ElevatedButton(
            onPressed: () async {
              if(formKey.currentState!.validate()){
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Processing Data')),
                );
                FocusScope.of(context).unfocus();
                await Future.delayed(const Duration(seconds: 1));
                Navigator.push(context, MaterialPageRoute(builder: (context)=>OtpPage()));
              }
            },
            style: ElevatedButtonDesign.buttonDesign(),
            child: const Text('Log in')));
  }
}
