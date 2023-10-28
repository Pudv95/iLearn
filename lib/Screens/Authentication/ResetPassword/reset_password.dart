import 'package:ilearn/Resources/imports.dart';
import 'package:ilearn/Screens/Authentication/Login/Control/input_field.dart';
import 'package:ilearn/Screens/Authentication/Widgets/input_text_field.dart';


import '../Widgets/next_button.dart';
import '../Widgets/password_stepper.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final InputField _validators = InputField();
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
            InputTextField(
              focusNode: _passwordNode,
              validator: (value) {
                return null;
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
              validator: (value){
                return null;
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
            SizedBox(height: height*0.05,),
            CustomLoginButton(onPress: (){}, data: 'Next'),
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


