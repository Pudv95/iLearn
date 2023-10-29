import 'package:email_validator/email_validator.dart';
import 'package:ilearn/Resources/imports.dart';

class Validators {

  Color? emailColor = AllColor.textFormBox;
  Color? passwordColor = AllColor.textFormBox;

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
}
