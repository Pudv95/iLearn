import 'package:ilearn/Resources/imports.dart';
import 'package:ilearn/Screens/Authentication/Login/Control/input_field.dart';
import 'package:password_stepper/view_password_stepper.dart';
import 'package:password_strength/password_strength.dart';
import 'package:pinput/pinput.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController _textEditingController = TextEditingController();
  final InputField _validators = InputField();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding:
            EdgeInsets.fromLTRB(width * 0.1, height * 0.08, width * 0.1, 0),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, height * 0.15, 0, 20),
              child: const Column(
                children: [
                   Text(
                    'Reset Your',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    'Password',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            ),
            TextFormField(
                controller: _textEditingController,
                onChanged: (value) {
                  setState(() {});
                },
                decoration:
                    _validators.decoration('Password', const Icon(Icons.lock)),
                cursorColor: AllColor.textFormText,
                validator: (value) {
                  String? temp;
                  setState(() {
                    temp = _validators.passwordValidator(value);
                  });
                  return temp;
                }),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
                decoration: _validators.decoration(
                    'Confirm Password', const Icon(Icons.lock)),
                cursorColor: AllColor.textFormText,
                obscureText: _validators.showPassword,
                validator: (value) {
                  String? temp;
                  setState(() {
                    temp = _validators.passwordValidator(value);
                  });
                  return temp;
                }),
            PasswordStepper(
              password: _textEditingController.text,
              margin: 10,
            ),
            SizedBox(
              height: height * 0.3,
            ),
            const SignUpText(),
          ],
        ),
      ),
    );
  }
}

class PasswordStepper extends StatefulWidget {
  final String? password;
  final double width;
  final double margin;
  const PasswordStepper(
      {super.key, required this.password, this.width = 60, this.margin = 18});

  @override
  State<PasswordStepper> createState() => _PasswordStepperState();
}

class _PasswordStepperState extends State<PasswordStepper> {
  getPasswordStrength(password) {
    return estimatePasswordStrength(password);
  }

  getStepperColor() {
    if (getPasswordStrength(widget.password) < 0.25) {
      return Colors.red;
    }
    if (getPasswordStrength(widget.password) < 0.50) {
      return Colors.yellow;
    }
    if (getPasswordStrength(widget.password) < 0.75) {
      return Colors.blue;
    }
    if (getPasswordStrength(widget.password) < 1) {
      return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Password Strength'),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                  width: widget.width,
                  height: 4,
                  margin: EdgeInsets.only(right: widget.margin),
                  decoration: BoxDecoration(
                      color: (widget.password!.isNotEmpty)
                          ? getStepperColor()
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(2)),
                ),
                Container(
                  width: widget.width,
                  height: 4,
                  margin: EdgeInsets.only(right: widget.margin),
                  decoration: BoxDecoration(
                      color: (getPasswordStrength(widget.password) > 0.25)
                          ? getStepperColor()
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(2)),
                ),
                Container(
                  width: widget.width,
                  height: 4,
                  margin: EdgeInsets.only(right: widget.margin),
                  decoration: BoxDecoration(
                      color: (getPasswordStrength(widget.password) > 0.5)
                          ? getStepperColor()
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(2)),
                ),
                Container(
                  width: widget.width,
                  height: 4,
                  margin: EdgeInsets.only(right: widget.margin),
                  decoration: BoxDecoration(
                      color: (getPasswordStrength(widget.password) > 0.75)
                          ? getStepperColor()
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(2)),
                ),
              ],
            ),
          ],
        ));
  }
}
