import 'package:ilearn/Resources/imports.dart';

class Community extends StatefulWidget {
  final String title;
  const Community({super.key,required this.title});

  @override
  State<Community> createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
    );
  }
}
