import 'package:email_validator/email_validator.dart';
import 'package:ilearn/Resources/imports.dart';

class InputField {

  Color? emailColor = AllColor.textFormBox;
  Color? passwordColor = AllColor.textFormBox;
  bool showPassword = false;

  String? emailValidator(email) {
    if (!(EmailValidator.validate(email))) {
      emailColor = AllColor.errorRed;
      if (email.length == 0) return 'This field is required';
      return 'Enter valid email';
    }
    return null;
  }

  String? passwordValidator(password) {
    if (password.length < 6) {
      passwordColor = AllColor.errorRed;
      if (password.length == 0) return 'This field is required';
      return 'Enter valid password';
    }
    return null;
  }

  String? nameValidator(name) {
    if (name.length < 3) {
      passwordColor = AllColor.errorRed;
      if (name.length == 0) return 'This field is required';
      return 'Enter valid name';
    }
    return null;
  }

  String? usernameValidator(username) {
    if (username.length < 3) {
      passwordColor = AllColor.errorRed;
      if (username.length == 0) return 'This field is required';
      return 'Enter valid username';
    }
    return null;
  }

  InputDecoration decoration(String label, Icon icon) {
    return InputDecoration(
      floatingLabelBehavior: FloatingLabelBehavior.never,
      prefixIcon: icon,
      prefixIconColor: Colors.grey,
      suffixIcon: (label != 'Password')
          ? const SizedBox()
          : IconButton(
              onPressed: () {
                showPassword = !showPassword;
              },
              icon: const Icon(Icons.remove_red_eye),
            ),
      suffixIconColor: Colors.grey,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(style: BorderStyle.none, width: 0)),
      fillColor: (label == 'Email') ? emailColor : passwordColor,
      filled: true,
      label: Text(label),
      focusColor: AllColor.textFormBoxFocus,
    );
  }
}
