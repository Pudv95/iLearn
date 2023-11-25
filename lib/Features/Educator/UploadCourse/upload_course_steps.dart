import 'package:ilearn/Features/Educator/UploadCourse/upload_course.dart';
import 'package:ilearn/Resources/imports.dart';

import '../../../Models/student_model.dart';

class UploadCourseSteps extends StatelessWidget {
  final User user;
  const UploadCourseSteps({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.fromLTRB(40, (50/height)*height, 40, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Upload a course and reach\nmillions',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 34,
                  fontFamily: 'SF Pro Text',
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: (20/height)*height,),
              CustomLoginButton(onPress: ()async{Navigator.push(context, MaterialPageRoute(builder: (context)=>UploadCourse(user: user)));}, data: 'Upload a Course',color: AllColor.primaryFocusColor,),
              SizedBox(height: (60/height)*height,),
              const Text(
                'Publish courses in a 3 step process',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontFamily: 'SF Pro Text',
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  Column(
                    children: [SizedBox(height: (50/height)*height,),
                      const Steps(step: 1, data: 'Upload Basic Details about Your Coursse'),
                      SizedBox(height: (30/height)*height,),
                      const Steps(step: 2, data: 'Upload lecture files'),
                      SizedBox(height: (30/height)*height,),
                      const Steps(step: 3, data: 'Set Price and Duration for your course'),],
                  ),
                  SizedBox(width: (70/width)*width,),
                  AllIcons.uploadVector,
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}

class Steps extends StatelessWidget {
  final int step;
  final String data;
  const Steps({super.key, required this.step, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Step $step.',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontFamily: 'SF Pro Text',
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: 230,
          child: Text(
            data,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: 'SF Pro Text',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}

