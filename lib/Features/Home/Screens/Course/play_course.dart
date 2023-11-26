import 'dart:math';
import 'package:ilearn/Features/Home/Control/data_parse.dart';
import 'package:ilearn/Features/Home/Screens/Widgets/review_card.dart';
import 'package:ilearn/Features/Home/Screens/Widgets/up_next_card.dart';
import 'package:ilearn/Features/Home/Services/courses.dart';
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
    double courseCompleted = 0.75;
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VideoPlayerWidget(videoUrl: ParseData().parseVideoUrl(widget.course.videos![0]['video']['videoUrl']),),
            const SizedBox(height: 25,),
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
                  const SizedBox(height: 5,),
                  Text(widget.course.createdBy!['name'],style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'SF Pro Text',
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1.1
                  ),),
                  const SizedBox(height: 15,),
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
                  ),),
                  const SizedBox(height: 20,),
                  FutureBuilder(future: GetCourse().getCourseReview(widget.course.id!), builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if(snapshot.connectionState == ConnectionState.done){
                      if(snapshot.hasData){
                        return ListView.builder(itemBuilder: (BuildContext context, int index) {
                          List<Map<String,dynamic>> reviews = snapshot.data;
                          return ReviewCard(review: reviews[index]);
                        },);
                      }
                      else{
                        return Text('No Reviews yet',style: TextStyle(fontSize: 30),);
                      }
                    }
                    else{
                      return const CircularProgressIndicator();
                    }
                  }, )
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

class VideoPlayerWidget extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerWidget({super.key, required this.videoUrl});

  @override
  State <VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
    _initializeVideoPlayerFuture = _controller.initialize().then((value) {
      setState(() {
        print('initialization is done');
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
    _initializeVideoPlayerFuture = _controller.initialize().then((value) {
      setState(() {
      });
    });
    return SizedBox(
      height: (220 / MediaQuery.of(context).size.height) * MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  VideoPlayer(_controller),
                  _ControlsOverlay(controller: _controller),
                  VideoProgressIndicator(_controller, allowScrubbing: false)
                ],
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

