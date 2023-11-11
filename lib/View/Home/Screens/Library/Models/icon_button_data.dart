import 'package:flutter_svg/svg.dart';
import 'package:ilearn/Resources/imports.dart';

class IconButtonData {
  String title;
  Image? icon;
  SvgPicture? image;
  void Function() onPressed;
  IconButtonData(
      {required this.title, this.icon, this.image ,required this.onPressed});
}