import 'package:ilearn/Features/Home/Screens/Library/Widgets/learning_card.dart';
import 'package:ilearn/Features/Home/Services/courses.dart';
import 'package:ilearn/Resources/imports.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../Models/student_model.dart';

class YourLearning extends StatefulWidget {
  final User user;
  const YourLearning({super.key, required this.user});

  @override
  State<YourLearning> createState() => _YourLearningState();
}

class _YourLearningState extends State<YourLearning> {

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(child: Scaffold(appBar: AppBar(
      automaticallyImplyLeading: true,
      toolbarHeight: (80/height)*height,
      elevation: 0,
      backgroundColor: Colors.white,
      title: Padding(
        padding: EdgeInsets.only(left: (15/width)*width, right: (15/width)*width),
        child: const Text(
          'Your Learnings',
          style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
      ),
      iconTheme: const IconThemeData(color: Colors.black),
    ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount:widget.user.wishlist!.length,
          itemBuilder: (BuildContext context, int index) {
            return Row(
              children: [
                FutureBuilder(future: GetCourse().getCourseById(widget.user.wishlist![index]), builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if(snapshot.connectionState == ConnectionState.done && snapshot.hasData){
                    Course ownedCourse = snapshot.data;
                    return LearningsCard(course: ownedCourse,);
                  }
                  else{
                    return SizedBox(height:100,width: width*0.9,child: Shimmer.fromColors(baseColor: Colors.grey.shade300, highlightColor: Colors.grey.shade100, child: LearningsCard(course: Course(id: 'id',thumbnail: '',courseTitle: '',createdBy: {'name':''}))));

                  }
                }, ),
                const SizedBox(width: 20,),
              ],
            );
          },),
      ),
    )
    );
  }
}
