import 'package:ilearn/Resources/imports.dart';

class IconButtonData {
  String title;
  Image icon;
  void Function() onPressed;
  IconButtonData(
      {required this.title, required this.icon, required this.onPressed});
}