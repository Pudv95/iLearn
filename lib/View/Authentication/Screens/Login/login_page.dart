import 'package:ilearn/Resources/imports.dart';
import 'package:text_divider/text_divider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const Svg('assets/Icons/background.svg'),
              fit: BoxFit.fill,
              colorFilter: ColorFilter.mode(
                  Colors.blue.withOpacity(0.20),BlendMode.modulate),
            ),
          ),
          child: Padding(
            padding:
                EdgeInsets.fromLTRB(width * 0.1, height * 0.1, width * 0.1, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: height * 0.20,
                  child: Center(
                    child: Text(
                      'Login',
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      LoginCredentials(
                        emailController: emailController,
                        passwordController: passwordController,
                      ),
                      CustomLoginButton(
                          formKey: _formKey,
                          onPress: () async {
                            if (_formKey.currentState!.validate()) {
                              await Authentication().loginUser(
                                  context,
                                  emailController.text,
                                  passwordController.text);
                            }
                          },
                          data: 'Log In'),
                      TextDivider.horizontal(
                          text: const Text('Or continue with'),
                          thickness: 1.5,
                          size: height * 0.1),
                      const GoogleLoginButton(),
                      const SignUpText(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
