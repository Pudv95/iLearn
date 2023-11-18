import 'package:ilearn/Features/Home/Control/data_parse.dart';
import 'package:ilearn/Resources/imports.dart';
import 'package:ilearn/Features/Home/Services/courses.dart';
import 'package:video_player/video_player.dart';

class PlayCourse extends StatefulWidget {
  const PlayCourse({super.key});

  @override
  State<PlayCourse> createState() => _PlayCourseState();
}

class _PlayCourseState extends State<PlayCourse> {


  VideoPlayerController? controller;

  getVideos()async{
    Course selectedCourse = await GetCourse().getCourseById('6555a594dcf558cbd03ea5e6');
    String videoLink = selectedCourse.videos![0]['videoUrl'];
    videoLink = videoLink.replaceAll('public', 'https://udemy-nx1v.onrender.com');
    controller = VideoPlayerController.networkUrl(Uri.parse(
        videoLink));
    controller!.addListener(() {
      setState(() {});
    });
    controller!.initialize().then((_) => setState(() {}));
    controller!.play();
  }

  @override
  void initState() {
    super.initState();
    getVideos();

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: (controller != null)?SizedBox(
            height: 320,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                controller!.value.isInitialized
                    ? AspectRatio(
                        aspectRatio: controller!.value.aspectRatio,
                        child: VideoPlayer(controller!),
                      )
                    : const LinearProgressIndicator(),
                _ControlsOverlay(controller: controller!),
              ],
            ),
          ):Container()),
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
              child: Text('${controller.value.captionOffset.inMilliseconds}ms',style: const TextStyle(color: Colors.white),),
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
              child: Text('${controller.value.playbackSpeed}x',style: const TextStyle(color: Colors.white),),
            ),
          ),
        ),
      ],
    );
  }
}
