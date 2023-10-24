import 'package:flutter/material.dart';
import '../../../../Resources/icons.dart';

class GoogleLoginButton extends StatelessWidget {
  const GoogleLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10)),
        child: IconButton(onPressed: () {}, icon: AllIcons.googleIcon));
  }
}
