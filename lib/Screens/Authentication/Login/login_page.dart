import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:ilearn/Resources/imports.dart';
import 'package:ilearn/Screens/Authentication/Widgets/next_button.dart';
import 'package:text_divider/text_divider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding:
              EdgeInsets.fromLTRB(width * 0.1, height * 0.1, width * 0.1, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const LoginText(),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const LoginCredentials(),
                    CustomLoginButton(formKey: _formKey, onPress: (){}, data: 'Log In'),
                    TextDivider.horizontal(
                        text: const Text('Or continue with'), thickness: 1.5,size: height*0.1),
                    const GoogleLoginButton(),
                    const SignUpText(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
