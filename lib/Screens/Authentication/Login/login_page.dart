import 'dart:convert';
import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:ilearn/Resources/imports.dart';
import 'package:ilearn/Screens/Authentication/Widgets/next_button.dart';
import 'package:ilearn/Screens/Home/dashboard.dart';
import 'package:text_divider/text_divider.dart';
import 'package:http/http.dart' as http;

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
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
  }

  LoginUser() async {
    FocusScope.of(context).unfocus();
    String baseURl = dotenv.get('BaseUrl');
    var headers = {
      'Content-Type': 'application/json',
    };

    var url = Uri.parse('$baseURl/sign-in/');

    try {
      http.Response response = await http.post(
        url,
        headers: headers,
        body: jsonEncode({
          "email" : emailController.text,
          "password" : passwordController.text,
        }),
      );
      if (response.statusCode == 201) {
        print(response.body);
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyDashboard()));
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
                    LoginCredentials(emailController: emailController,passwordController: passwordController,),
                    CustomLoginButton(formKey: _formKey, onPress: ()async{
                      if(_formKey.currentState!.validate()){
                        log('Logging in.....................');
                        await LoginUser();
                        print("Logged in Succesfully");
                      }
                    }, data: 'Log In'),
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
