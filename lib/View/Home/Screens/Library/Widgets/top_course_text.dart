import 'package:ilearn/Resources/imports.dart';

class TopCourseText extends StatelessWidget {
  final String title;
  const TopCourseText({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          const TextSpan(
            text: 'Top Courses in ',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontFamily: 'SF Pro Display',
              fontWeight: FontWeight.w500,
              height: 0,
            ),
          ),
          TextSpan(
            text: title,
            style: const TextStyle(
              color: Color(0xFF246E9E),
              fontSize: 24,
              fontFamily: 'SF Pro Display',
              fontWeight: FontWeight.w500,
              height: 0,
            ),
          ),
        ],
      ),
    );
  }
}