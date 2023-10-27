import 'package:ilearn/Resources/imports.dart';
import 'package:ilearn/Screens/Authentication/ResetPassword/reset_password.dart';
import 'package:ilearn/Screens/Authentication/Widgets/input_text_field.dart';
import 'package:pinput/pinput.dart';

class SignUP extends StatefulWidget {
  const SignUP({super.key});

  @override
  State<SignUP> createState() => _SignUPState();
}

class _SignUPState extends State<SignUP> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _usernameFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.fromLTRB(width * 0.1, height * 0.03, width * 0.1, 0),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, height * 0.15, 0, 20),
              child: Text(
                'Join Us',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 30,
                ),
              ),
            ),
            Form(
                child: Column(
              children: [
                InputTextField(focusNode: _nameFocusNode, validator: (value){return null;}, data: 'Name', icon: const Icon(Icons.person), textEditingController: _nameController),
                const SizedBox(height: 20,),
                InputTextField(focusNode: _usernameFocusNode, validator: (value){return null;}, data: 'UserName', icon: const Icon(Icons.attachment_rounded), textEditingController: _usernameController),
                const SizedBox(height: 20,),
                InputTextField(focusNode: _emailFocusNode, validator: (value){return null;}, data: 'Email', icon: const Icon(Icons.email_outlined), textEditingController: _emailController),
                const SizedBox(height: 20,),
                InputTextField(focusNode: _passwordFocusNode, validator: (value){return null;}, data: 'Password', icon: const Icon(Icons.lock), textEditingController: _passwordController,isPasswordField: true,),
                const SizedBox(height: 20,),
                PasswordStepper(password: _passwordController.text),
              ],
            )),
            const SizedBox(height:40,),
            LoginButton(formKey: _formKey)
          ],
        ),
      ),
    );
  }
}
