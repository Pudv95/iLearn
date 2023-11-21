import 'package:ilearn/Features/Educator/UploadCourse/Steps/step1.dart';
import 'package:ilearn/Features/Educator/UploadCourse/Steps/step2.dart';
import 'package:ilearn/Features/Educator/UploadCourse/Steps/step3.dart';
import 'package:ilearn/Resources/imports.dart';

class UploadCourse extends StatefulWidget {
  const UploadCourse({super.key});

  @override
  State<UploadCourse> createState() => _UploadCourseState();
}

class _UploadCourseState extends State<UploadCourse> {
  final PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    List<Widget> steps = [const Step1(),const Step2(),const Step3()];
    return PageView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
      controller: pageController,
      itemBuilder: (BuildContext context, int index) {
        return steps[index];
      },
    );
  }
}

