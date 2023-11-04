import 'package:ilearn/Resources/imports.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ilearn/View/Home/Screens/dashboard.dart';
import '../../../Models/student_model.dart';
import '../../Authentication/Screens/Login/login_page.dart';



class MyDashboard extends StatefulWidget {
  final User user;
  const MyDashboard({super.key,required this.user});

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
        appBar: AppBar(
          title: const Text('User Profile'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'User Details',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                UserProfileItem(label: 'Username', value: widget.user.username ?? ''),
                UserProfileItem(label: 'Name', value: widget.user.name ?? ''),
                UserProfileItem(label: 'Email', value: widget.user.email ?? ''),
                UserProfileItem(label: 'Role', value: widget.user.role ?? ''),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: ()async{
                    print(widget.user.toJson());
                    await storage.deleteAll();
                    if(context.mounted){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const LoginPage()));
                    }
                  },
                  child: const Text('Logout'),
                ),
                ElevatedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Dashboard()));}, child: Text('dashboard'))
              ],
            ),
          ),
        ),
      );
  }
}

class UserProfileItem extends StatelessWidget {
  final String label;
  final String value;

  const UserProfileItem({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label:',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(value),
        const SizedBox(height: 8),
      ],
    );
  }
}
