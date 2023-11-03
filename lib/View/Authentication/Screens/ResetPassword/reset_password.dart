import 'package:ilearn/Resources/imports.dart';
import '../../Widgets/password_stepper.dart';

class ResetPassword extends StatefulWidget {
  final String token;
  const ResetPassword({super.key, required this.token});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final FocusNode _passwordNode = FocusNode();
  final FocusNode _confirmPasswordNode = FocusNode();

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
              child: Column(
                children: [
                  Text(
                    'Reset Your',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  Text(
                    'Password',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ],
              ),
            ),
            InputTextField(
              focusNode: _passwordNode,
              validator: (value) {
                return Validators().passwordValidator(value);
              },
              onTap: () {
                setState(() {});
              },
              onChanged: (value) {
                setState(() {});
              },
              data: 'Password',
              icon: const Icon(Icons.lock),
              textEditingController: _passwordController,
              isPasswordField: true,
            ),
            const SizedBox(
              height: 20,
            ),
            InputTextField(
              focusNode: _confirmPasswordNode,
              validator: (value) {
                if (_passwordController.text != value) {
                  return "Password doesn't match";
                } else {
                  return Validators().passwordValidator(value);
                }
              },
              onTap: () {
                setState(() {});
              },
              data: 'Confirm Password',
              icon: const Icon(Icons.lock),
              textEditingController: _confirmPasswordController,
              isPasswordField: true,
            ),
            PasswordStepper(
              password: _passwordController.text,
              margin: 10,
            ),
            SizedBox(
              height: height * 0.05,
            ),
            CustomLoginButton(
                onPress: () async {
                  await Authentication()
                      .resetPassword(widget.token, _passwordController.text);
                  if (context.mounted) {
                    Navigator.popUntil(context, (route) => route.isFirst);
                  }
                },
                data: 'Next'),
            SizedBox(
              height: height * 0.2,
            ),
            const SignUpText(),
          ],
        ),
      ),
    );
  }
}
