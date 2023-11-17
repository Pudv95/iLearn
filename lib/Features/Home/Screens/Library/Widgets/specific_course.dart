import 'package:ilearn/Resources/imports.dart';

class SpecificCourse extends StatelessWidget {
  final Course course;
  const SpecificCourse({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return SizedBox(
      height: 200,
      child: Row(
        children: [
          SizedBox(
              height: (50/height)*height,
              width: (50/width)*width,
              ),
          Column(
            children: [Text(course.courseTitle ?? '')],
          ),
        ],
      ),
    );
  }
}