import 'package:ilearn/Resources/imports.dart';
import 'package:email_validator/email_validator.dart';
import 'package:ilearn/Screens/Authentication/ForgotPassword/forgot_passsword.dart';
import 'package:ilearn/Screens/Authentication/Login/Control/input_field.dart';

class LoginCredentials extends StatefulWidget {
  const LoginCredentials({super.key});

  @override
  State<LoginCredentials> createState() => _LoginCredentialsState();
}

class _LoginCredentialsState extends State<LoginCredentials> {

  final FocusNode _emailFieldFocus = FocusNode();
  final FocusNode _passwordFieldFocus = FocusNode();
  final InputField _validators = InputField();

  @override
  void initState() {
    _emailFieldFocus.addListener((){
      if(_emailFieldFocus.hasFocus){
        setState(() {
          print('here');
          _validators.emailColor = AllColor.textFormBoxFocus;
        });
      }else{
        setState(() {
          _validators.emailColor = AllColor.textFormBox;
        });
      }
    });
    _passwordFieldFocus.addListener((){
      if(_passwordFieldFocus.hasFocus){

        setState(() {
          _validators.passwordColor = AllColor.textFormBoxFocus;
        });
      }else{
        setState(() {
          _validators.passwordColor = AllColor.textFormBox;
        });
      }
    });
    super.initState();

  }




  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Email Field
        TextFormField(
          focusNode: _emailFieldFocus,
          decoration: _validators.decoration('Email', const Icon(Icons.email_outlined)),
          cursorColor: AllColor.textFormText,
            validator: (value){
              String? temp;
              setState(() {
                temp = _validators.emailValidator(value);
              });
              return temp;
            }
        ),
        const SizedBox(
          height: 20,
        ),
        TextFormField(
          focusNode: _passwordFieldFocus,
          decoration: _validators.decoration('Password', const Icon(Icons.lock)),
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
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const ForgotPassword()));
            },
            child: const Text('forgot password?'),
          ),
        ),
      ],
    );
  }
}
