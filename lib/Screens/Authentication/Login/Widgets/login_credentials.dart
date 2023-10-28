import 'package:ilearn/Resources/imports.dart';
import 'package:ilearn/Screens/Authentication/ForgotPassword/forgot_passsword.dart';
import 'package:ilearn/Screens/Authentication/Login/Control/input_field.dart';
import 'package:ilearn/Screens/Authentication/Widgets/input_text_field.dart';

class LoginCredentials extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  const LoginCredentials({super.key,required this.passwordController,required this.emailController});

  @override
  State<LoginCredentials> createState() => _LoginCredentialsState();
}

class _LoginCredentialsState extends State<LoginCredentials> {

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  bool emailHasError = false;
  bool passHasError = false;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        InputTextField(
            hasError: emailHasError,
            focusNode: _emailFocusNode,
            validator: (value) {
              if(InputField().emailValidator(value) != null){
                setState(() {
                  emailHasError = true;
                });
                return InputField().emailValidator(value);
              }
              return null;
            },
            onTap: (){
              setState(() {
                emailHasError = false;
              });
            },
            data: 'Email',
            icon: const Icon(Icons.email_outlined),
            textEditingController: widget.emailController),
        //Email Field
        const SizedBox(
          height: 20,
        ),
        InputTextField(
          hasError: passHasError,
          focusNode: _passwordFocusNode,
          validator: (value) {
            if(InputField().passwordValidator(value) != null){
              setState(() {
                passHasError = true;
              });
              return InputField().passwordValidator(value);
            }
            return null;
          },
          data: 'Password',
          onTap: (){
            setState(() {
              passHasError = false;
            });
          },
          icon: const Icon(Icons.lock),
          textEditingController: widget.passwordController,
          isPasswordField: true,
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
