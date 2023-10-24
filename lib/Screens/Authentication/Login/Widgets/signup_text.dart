import 'package:flutter/material.dart';


class SignUpText extends StatelessWidget {
  const SignUpText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Don\'t have account?',style: TextStyle(letterSpacing: 0.75,fontWeight: FontWeight.w600),),
        TextButton(onPressed: () {}, child: const Text('sign up')),
      ],
    );
  }
}
