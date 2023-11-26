import 'package:ilearn/Features/Educator/Services/services.dart';
import 'package:ilearn/Features/Home/Control/data_parse.dart';
import 'package:ilearn/Features/Home/Screens/Course/play_course.dart';
import 'package:ilearn/Resources/imports.dart';
import 'package:simple_progress_indicators/simple_progress_indicators.dart';

class LearningsCard extends StatelessWidget {
  final Course course;
  const LearningsCard({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    double completed = 0.75;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width*0.9,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>PlayCourse(course: course,)));
            },
              leading: ClipRRect(borderRadius:BorderRadius.circular(8),child: Image.network(ParseData().parseUrl(course.thumbnail!))),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  Text(course.courseTitle!,style:  const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'SF Pro Text',
                    fontWeight: FontWeight.w500,
                  ),),
                  const SizedBox(width: 20,),
                  AllIcons.playButton,
                ],),
                Text(course.createdBy!['name'],style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontFamily: 'SF Pro Text',
                  fontWeight: FontWeight.w400,
                ),)
              ],
            ),
          ),
          SizedBox(height: 15,),
          Align(
            alignment: Alignment.center,
            child: ProgressBar(
              value: completed,
              color:AllColor.primaryFocusColor,
              width: (320/width)*width,
              height: 5,
              backgroundColor: Colors.grey,
            ),
          ),
          const SizedBox(height: 15,),
          Text('${(completed*100).toString()}%',style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontFamily: 'SF Pro Text',
            fontWeight: FontWeight.w500,
          ),)
        ],
      ),
    );
  }
}
