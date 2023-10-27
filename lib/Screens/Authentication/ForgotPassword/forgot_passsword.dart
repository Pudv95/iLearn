import 'package:ilearn/Resources/imports.dart';

import '../Login/Control/elevated_button.dart';
import '../Login/Control/input_field.dart';


class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  final InputField _validators = InputField();
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
              child: const Center(
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8,right: 8),
              child: RichText(textAlign: TextAlign.center,text: const TextSpan(style: TextStyle(color: Colors.black,fontSize: 15),text: 'Log in to your account by providing your account email below.')),
            ),
            Padding(
              padding:  EdgeInsets.only(top: height*0.05,bottom: height*0.05),
              child: TextFormField(
                  decoration: _validators.decoration('Enter email address', const Icon(Icons.email_outlined)),
                  cursorColor: AllColor.textFormText,
                  obscureText: _validators.showPassword,
                  validator: (value){
                    String? temp;
                    setState(() {
                      temp = _validators.passwordValidator(value);
                    });
                    return temp;
                  }
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: height * 0.05,
              child: ElevatedButton(
                onPressed: (){},
                style: ElevatedButtonDesign.buttonDesign(),
                child: const Text('NEXT'),
              ),
            ),
          ],
        ),
      )
    );
  }
}
