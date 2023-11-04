import 'package:ilearn/Resources/imports.dart';

class Profile extends StatefulWidget {
  final String title;
  const Profile({super.key,required this.title});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
    );
  }
}
