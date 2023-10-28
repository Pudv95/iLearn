import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:ilearn/Models/user_model.dart';
import 'package:ilearn/Resources/imports.dart';
import 'package:ilearn/Screens/Authentication/OTP/otp_page.dart';
import 'package:ilearn/Screens/Authentication/Widgets/input_text_field.dart';
import 'package:ilearn/Screens/Authentication/Widgets/next_button.dart';
import 'package:http/http.dart' as http;

import '../Widgets/password_stepper.dart';

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

  createModel() {
    UserModel userModel = UserModel(
        userName: _usernameController.text,
        name: _nameController.text,
        email: _emailController.text,
        password: _passwordController.text);
    return userModel;
  }

  signUpUser() async {
    // print("Called !!!!!!!!!!!!!!!!!!!!!!!!!!!/!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    UserModel userModel = createModel();
    String baseURl = dotenv.get('BaseUrl');
    // print(baseURl);
    var headers = {
      'Content-Type': 'application/json',
    };

    var url = Uri.parse('$baseURl/sign-up/');

    try {
      http.Response response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(userModel.toJson()),
      );
      if (response.statusCode == 201) {
        print("IM am aherererererererererrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr");
        print(response.body);
        return true;
      }
      else {
        print('Failed with status: ${response.statusCode}');
        print('Reason: ${response.reasonPhrase}');
        return false;
      }
    } catch (error) {
      print('Error: $error');
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
            EdgeInsets.fromLTRB(width * 0.1, height * 0.03, width * 0.1, 0),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, height * 0.15, 0, 20),
              child: const Text(
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
                InputTextField(
                    focusNode: _nameFocusNode,
                    validator: (value) {
                      return null;
                    },
                    data: 'Name',
                    icon: const Icon(Icons.person),
                    textEditingController: _nameController),
                const SizedBox(
                  height: 20,
                ),
                InputTextField(
                    focusNode: _usernameFocusNode,
                    validator: (value) {
                      return null;
                    },
                    data: 'UserName',
                    icon: const Icon(Icons.attachment_rounded),
                    textEditingController: _usernameController),
                const SizedBox(
                  height: 20,
                ),
                InputTextField(
                    focusNode: _emailFocusNode,
                    validator: (value) {
                      return null;
                    },
                    data: 'Email',
                    icon: const Icon(Icons.email_outlined),
                    textEditingController: _emailController),
                const SizedBox(
                  height: 20,
                ),
                InputTextField(
                  focusNode: _passwordFocusNode,
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
                PasswordStepper(password: _passwordController.text),
              ],
            )),
            const SizedBox(
              height: 40,
            ),
            CustomLoginButton(
                formKey: _formKey,
                onPress: () async {
                  if(await signUpUser()) {
                    if (context.mounted) {
                      await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OtpPage(
                                    email: _emailController.text,
                                  )));
                    }
                  }
                },
                data: 'Next'),
            SizedBox(height: height*0.05,),
          ],
        ),
      ),
    );
  }
}
