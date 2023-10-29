import 'package:ilearn/Resources/imports.dart';


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
              if(Validators().emailValidator(value) != null){
                setState(() {
                  emailHasError = true;
                });
                return Validators().emailValidator(value);
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
            if(Validators().passwordValidator(value) != null){
              setState(() {
                passHasError = true;
              });
              return Validators().passwordValidator(value);
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
