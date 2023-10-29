import 'dart:developer';

import 'package:ilearn/Resources/imports.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _emailController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  bool emailHasError = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.fromLTRB(width * 0.1, height * 0.08, width * 0.1, 0),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, height * 0.15, 0, 20),
            child: Center(
              child: Text(
                'Forgot Password?',
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                    style: TextStyle(color: Colors.black, fontSize: 15),
                    text:
                        'Log in to your account by providing your account email below.')),
          ),
          Padding(
            padding: EdgeInsets.only(top: height * 0.05, bottom: height * 0.05),
            child: InputTextField(
                hasError: emailHasError,
                focusNode: _emailFocusNode,
                validator: (value) {
                  if (Validators().emailValidator(value) != null) {
                    setState(() {
                      emailHasError = true;
                    });
                    return Validators().emailValidator(value);
                  }
                  return null;
                },
                onTap: () {
                  setState(() {
                    emailHasError = false;
                  });
                },
                data: 'Email',
                icon: const Icon(Icons.email_outlined),
                textEditingController: _emailController),
          ),
          CustomLoginButton(
              onPress: () async {
                if (await Authentication()
                    .forgotPassword(_emailController.text)) {
                  if (context.mounted) {
                    log('Forgot password started');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OtpPage(
                                  email: _emailController.text,
                                  passwordResetting: true,
                                )));
                  }
                }
              },
              data: 'Next'),
        ],
      ),
    ));
  }
}
