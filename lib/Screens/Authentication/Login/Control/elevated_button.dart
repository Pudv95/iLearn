import 'package:ilearn/Resources/imports.dart';

class ElevatedButtonDesign {

  static ButtonStyle buttonDesign() {
    return ButtonStyle(
        backgroundColor: MaterialStateProperty.all(AllColor.primaryButtonColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                )));
  }
}
