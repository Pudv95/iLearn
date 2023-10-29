import 'package:ilearn/Resources/imports.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../Models/student_model.dart';
import '../Authentication/Screens/Login/login_page.dart';



class MyDashboard extends StatefulWidget {
  final User student;
  const MyDashboard({super.key,required this.student});

  @override
  State<MyDashboard> createState() => _MyDashboardState();
}

class _MyDashboardState extends State<MyDashboard> {
  final storage =  const FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: ()async{
                print(widget.student.toJson());
                await storage.deleteAll();
                if(context.mounted){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const LoginPage()));
                }
              },
              child: const Text('Log Out'),
            ),
          )
        ],
      )

    );
  }
}
