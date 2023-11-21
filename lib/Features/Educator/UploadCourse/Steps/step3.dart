import 'package:ilearn/Resources/imports.dart';

class Step3 extends StatefulWidget {
  const Step3({super.key});

  @override
  State<Step3> createState() => _Step3State();
}

class _Step3State extends State<Step3> {
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
            'Step 3.',
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