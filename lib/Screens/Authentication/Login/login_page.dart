import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:ilearn/Resources/imports.dart';
import 'package:text_divider/text_divider.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FlutterNativeSplash.remove();

  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return  SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.fromLTRB(width*0.1, height*0.2, width*0.1, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Login'),
              Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFormField(),
                      TextFormField(),
                      Align(alignment: Alignment.centerRight,child: TextButton(onPressed: (){},child: Text('forgot password'),),),
                      SizedBox(width:double.infinity,child: ElevatedButton(onPressed: (){}, child: Text('Log in'))),
                      TextDivider.horizontal(text: const Text('Or continue with'),thickness: 1.5),
                      IconButton(onPressed: (){}, icon: Icon(Icons.login)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Don\'t have account?'),
                          TextButton(onPressed: (){}, child: Text('sign up')),
                        ],
                      )

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
