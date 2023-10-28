import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:ilearn/Resources/imports.dart';
import 'package:ilearn/Screens/Authentication/Login/Control/input_field.dart';
import 'package:ilearn/Screens/Authentication/Widgets/input_text_field.dart';
import 'package:http/http.dart' as http;

import '../Widgets/next_button.dart';
import '../Widgets/password_stepper.dart';

class ResetPassword extends StatefulWidget {
  final String token;
  const ResetPassword({super.key,required this.token});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final FocusNode _passwordNode = FocusNode();
  final FocusNode _confirmPasswordNode = FocusNode();

  resetPassword()async{
    var headers = {
      'Authorization':
      'Bearer ${widget.token}'
    };
    String baseURl = dotenv.get('BaseUrl');
    var url = Uri.parse('$baseURl/change-password');
    var body = {'newPassword': _passwordController.text};

    try {
      var response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        print(response.body);
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print('Error: $e');
    }
  }

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
            CustomLoginButton(onPress: ()async{
                await resetPassword();
                if(context.mounted){
                  Navigator.popUntil(context, (route) => route.isFirst);
                }
            }, data: 'Next'),
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


