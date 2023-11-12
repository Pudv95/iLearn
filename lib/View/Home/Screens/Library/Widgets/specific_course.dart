import 'package:ilearn/Resources/imports.dart';

class SpecificCourse extends StatelessWidget {
  final Course course;
  const SpecificCourse({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(
        children: [
          SizedBox(
              height: 50,
              width: 50,
              ),
          Column(
            children: [Text(course.courseTitle ?? '')],
          ),
        ],
      ),
    );
  }
}