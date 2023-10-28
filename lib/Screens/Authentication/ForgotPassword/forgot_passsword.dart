import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:ilearn/Resources/imports.dart';
import 'package:ilearn/Screens/Authentication/OTP/otp_page.dart';
import 'package:ilearn/Screens/Authentication/Widgets/next_button.dart';
import '../Login/Control/input_field.dart';
import 'package:http/http.dart' as http;
import '../Widgets/input_text_field.dart';


class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {


  forgotPassword()async{
    String baseURl = dotenv.get('BaseUrl');
    var url = Uri.parse('$baseURl/forget-password');
    var body = {'email': _emailController.text};

    try {
      var response = await http.post(url, body: body);

      if (response.statusCode == 200) {
        print(response.body);
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print('Error: $e');
    }
  }


  final TextEditingController _emailController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  bool emailHasError = false;

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
              child:  InputTextField(
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
                  textEditingController: _emailController),
            ),
            CustomLoginButton(onPress: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> OtpPage(email: _emailController.text, passwordResetting: true,)));
            }, data: 'Next'),
          ],
        ),
      )
    );
  }
}
