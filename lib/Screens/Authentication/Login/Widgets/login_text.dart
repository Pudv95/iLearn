import 'package:flutter/material.dart';

class LoginText extends StatelessWidget {
  const LoginText({super.key});


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height*0.20,
      child: const Center(
        child: Text('Login',style: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 40,
        ),),
      ),
    );
  }
}
