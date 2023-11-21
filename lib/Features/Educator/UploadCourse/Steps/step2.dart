import 'package:ilearn/Resources/imports.dart';

class Step2 extends StatefulWidget {
  const Step2({super.key});

  @override
  State<Step2> createState() => _Step2State();
}

class _Step2State extends State<Step2> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: (80/height)*height,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Padding(
          padding: EdgeInsets.only(left: (15/width)*width, right: (15/width)*width),
          child: const Text(
            'Step 2.',
            style: TextStyle(
                color: Colors.black,
                fontSize: 34,
                fontWeight: FontWeight.bold),
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
    );
  }
}