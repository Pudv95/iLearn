import 'package:ilearn/Features/Educator/dashboard.dart';
import 'package:ilearn/Resources/imports.dart';
import '../../../../Models/student_model.dart';

class PublishedCourseScreen extends StatelessWidget {
  final User user;
  const PublishedCourseScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: SingleChildScrollView(
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height:50),
              AllIcons.coursePublished,
              const SizedBox(height: 20),
              const Text(
                'Course published successfully',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontFamily: 'SF Pro Text',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 100),
              CustomLoginButton(onPress: () async {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>TeacherDashboard(user: user)));
              }, data: 'Done',color: AllColor.primaryFocusColor,),
              const SizedBox(height:220),
            ],
          ),
        ),
      ),
    ));
  }
}
