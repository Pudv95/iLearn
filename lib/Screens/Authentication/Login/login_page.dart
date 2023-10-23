import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:ilearn/Resources/imports.dart';


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
    print('andar aa gya');
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: const Text('hello'),),
    );
  }
}
