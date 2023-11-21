import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  final String title;
  const CustomTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 22,
        fontFamily: 'SF Pro Text',
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
