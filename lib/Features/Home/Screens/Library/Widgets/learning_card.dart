import 'package:ilearn/Features/Educator/Services/services.dart';
import 'package:ilearn/Features/Home/Control/data_parse.dart';
import 'package:ilearn/Features/Home/Screens/Course/play_course.dart';
import 'package:ilearn/Resources/imports.dart';
import 'package:simple_progress_indicators/simple_progress_indicators.dart';

class LearningsCard extends StatelessWidget {
  final Course course;
  final int completedLecture;
  const LearningsCard({super.key, required this.course, required this.completedLecture});

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: width*0.9,
      height: (150/height)*height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>PlayCourse(course: course,)));
            },
              leading: SizedBox(height:75,width:75,child: ClipRRect(borderRadius:BorderRadius.circular(8),child: Image.network(ParseData().parseUrl(course.thumbnail!)))),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  SizedBox(
                    width: 220,
                    child: Text(course.courseTitle!,style:  const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: 'SF Pro Text',
                      fontWeight: FontWeight.w500,
                    ),),
                  ),
                ],),
                Text(course.createdBy!['name'],style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontFamily: 'SF Pro Text',
                  fontWeight: FontWeight.w400,
                ),)
              ],
            ),
            trailing: AllIcons.playButton,
          ),
          SizedBox(height: 15,),
          Align(
            alignment: Alignment.center,
            child: ProgressBar(
              value: completedLecture/course.videos!.length*100,
              color:AllColor.primaryFocusColor,
              width: (320/width)*width,
              height: 5,
              backgroundColor: Colors.grey,
            ),
          ),
          const SizedBox(height: 15,),
          Text('${(completedLecture/course.videos!.length*100).toString()}%',style: const TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontFamily: 'SF Pro Text',
            fontWeight: FontWeight.w500,
          ),),
          SizedBox(height: 20,)
        ],
      ),
    );
  }
}
