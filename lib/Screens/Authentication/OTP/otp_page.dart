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
      body:Padding(
        padding: EdgeInsets.fromLTRB(width * 0.1, height * 0.1, width * 0.1, 0),
        child: Column(
          children: [
          Text('Verify Yourself',style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 34,
          ),),
            const Text('We\'ve sent a 6 digit code to',style: TextStyle(height: 0),),
            TextButton(onPressed: (){}, child: const Text('Sample@gmail.com',style: TextStyle(height: 0),)),
            Form(
              key: key,
              child: Pinput(

                focusNode: focusNode,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                length: 6,
                validator: (value){
                  if(value?.length == 6){
                    return null;
                  }
                  return 'Invalid OTP';
                },

              ),
            ),
            TextButton(onPressed: (){}, child: const Text('Sample@gmail.com')),
            SizedBox(
              width: double.infinity,
              height: height*0.05,
              child: ElevatedButton(onPressed: (){
                focusNode.unfocus();
                key.currentState!.validate();
              },style: ElevatedButtonDesign.buttonDesign(), child: const Text('NEXT'),),
            ),
            const Text('Didn\'t recieve OTP'),
            TextButton(onPressed: (){}, child: const Text('Check your Spam Folder')),
          ],
        ),
      ),
    );
  }
}
