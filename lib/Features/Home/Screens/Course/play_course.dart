import 'dart:math';

import 'package:ilearn/Features/Home/Screens/Widgets/review_card.dart';
import 'package:ilearn/Features/Home/Screens/Widgets/up_next_card.dart';
import 'package:ilearn/Resources/imports.dart';
import 'package:simple_progress_indicators/simple_progress_indicators.dart';
import 'package:video_player/video_player.dart';

class PlayCourse extends StatefulWidget {
  final Course course;
  const PlayCourse({super.key, required this.course});

  @override
  State<PlayCourse> createState() => _PlayCourseState();
}

class _PlayCourseState extends State<PlayCourse> {
  @override
  Widget build(BuildContext context) {
    final review = {
      "user": {
        "_id": "653f8d0fa37347ad22d32777",
        "username": "AVtheking",
        "name": "AnkitOP",
        "profileimg": "thumbnail/1700972907009.jpg"
      },
      "rating": "4",
      'comment' : "The review of this course is that it is bad!!",
      "_id": "6562ecc8537cf5cea5cc0652"
    };
    double courseCompleted = 0.75;
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: (220 / height) * height,
              width: width,
              child: Placeholder(),
            ),
            SizedBox(height: 25,),
            Padding(
              padding: const EdgeInsets.only(left: 30,right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.course.courseTitle!,style: const TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontFamily: 'SF Pro Text',
                    fontWeight: FontWeight.w600,
                  ),),
                  SizedBox(height: 5,),
                  Text(widget.course.createdBy!['name'],style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'SF Pro Text',
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1.1
                  ),),
                  SizedBox(height: 15,),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: ProgressBar(
                      value: courseCompleted,
                      color:AllColor.primaryFocusColor,
                      width: (320/width)*width,
                      height: 5,
                      backgroundColor: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 7,),
                  Text('${(courseCompleted*100).toString()}% complete',style: const TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontFamily: 'SF Pro Text',
                    fontWeight: FontWeight.w500,
                  ),),
                  const SizedBox(height: 45,),
                  const Text('Up Next',style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'SF Pro Text',
                    fontWeight: FontWeight.w600,
                    height: 0.07,
                  ),),
                  const SizedBox(height: 20,),
                  SizedBox(
                    height: min(height/2,widget.course.videos!.length*55),
                    child: ListView.builder(itemCount: widget.course.videos!.length,itemBuilder: (BuildContext context, int index) {
                        return UpNextCard(video: widget.course.videos![index]);
                    },),
                  ),
                  const SizedBox(height: 50,),
                  const Text('Reviews',style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'SF Pro Text',
                    fontWeight: FontWeight.w600,
                    height: 0.07,
                  ),),
                  const SizedBox(height: 20,),
                  ReviewCard(review: review),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _ControlsOverlay extends StatelessWidget {
  const _ControlsOverlay({required this.controller});

  static const List<Duration> _exampleCaptionOffsets = <Duration>[
    Duration(seconds: -10),
    Duration(seconds: -3),
    Duration(seconds: -1, milliseconds: -500),
    Duration(milliseconds: -250),
    Duration.zero,
    Duration(milliseconds: 250),
    Duration(seconds: 1, milliseconds: 500),
    Duration(seconds: 3),
    Duration(seconds: 10),
  ];
  static const List<double> _examplePlaybackRates = <double>[
    0.25,
    0.5,
    1.0,
    1.5,
    2.0,
    3.0,
    5.0,
    10.0,
  ];

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 50),
          reverseDuration: const Duration(milliseconds: 200),
          child: controller.value.isPlaying
              ? const SizedBox.shrink()
              : Container(
                  color: Colors.black26,
                  child: const Center(
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 100.0,
                      semanticLabel: 'Play',
                    ),
                  ),
                ),
        ),
        GestureDetector(
          onTap: () {
            controller.value.isPlaying ? controller.pause() : controller.play();
          },
        ),
        Align(
          alignment: Alignment.topLeft,
          child: PopupMenuButton<Duration>(
            initialValue: controller.value.captionOffset,
            tooltip: 'Caption Offset',
            onSelected: (Duration delay) {
              controller.setCaptionOffset(delay);
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<Duration>>[
                for (final Duration offsetDuration in _exampleCaptionOffsets)
                  PopupMenuItem<Duration>(
                    value: offsetDuration,
                    child: Text('${offsetDuration.inMilliseconds}ms'),
                  )
              ];
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 16,
              ),
              child: Text(
                '${controller.value.captionOffset.inMilliseconds}ms',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: PopupMenuButton<double>(
            initialValue: controller.value.playbackSpeed,
            tooltip: 'Playback speed',
            onSelected: (double speed) {
              controller.setPlaybackSpeed(speed);
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<double>>[
                for (final double speed in _examplePlaybackRates)
                  PopupMenuItem<double>(
                    value: speed,
                    child: Text('${speed}x'),
                  )
              ];
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 16,
              ),
              child: Text(
                '${controller.value.playbackSpeed}x',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
