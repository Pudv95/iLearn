import 'package:ilearn/Resources/imports.dart';
import 'package:ilearn/View/Home/Services/courses.dart';
import 'package:video_player/video_player.dart';

class PlayCourse extends StatefulWidget {
  const PlayCourse({super.key});

  @override
  State<PlayCourse> createState() => _PlayCourseState();
}

class _PlayCourseState extends State<PlayCourse> {
  // late VideoPlayerController _controller;
  
  void getCourse()async{
    Course myCourse = await GetCourse().getCourseById('65536c4a16ec3a1331a444c0');
    print(myCourse.videos?[0].toString());
  }

  @override
  void initState() {
    getCourse();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    getCourse();
    return const Placeholder();
  }
}
