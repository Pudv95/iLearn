import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ilearn/Resources/imports.dart';
import 'package:ilearn/View/Authentication/Screens/Login/login_page.dart';
import 'package:ilearn/View/Home/dashboard.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final storage  = const FlutterSecureStorage();

  @override
  void initState() {
    _isLoggedIn();
    super.initState();
  }

  _isLoggedIn() async {

    // await Future.delayed(const Duration(seconds: 2));

    String? token = await storage.read(key: 'token');
    if(context.mounted) {
      if (token != null) {
        await Authentication().getUserData(context, token);
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginPage()));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/Icons/iLearn.png',scale: 5,),
            const Padding(
              padding: EdgeInsets.only(left: 30,right: 20),
              child: LinearProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }
}
