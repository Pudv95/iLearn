import 'package:flutter/material.dart';
import 'dart:math' as math;
class PopularSearch extends StatelessWidget {
  final String title;
  const PopularSearch({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){},
      leading: Text(
        title,
        style: const TextStyle(
          color: Color(0xFF040C17),
          fontSize: 16,
          fontFamily: 'Work Sans',
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Transform.rotate(
        angle: 45 * math.pi / 180,
        child: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
      ),
    );
  }
}