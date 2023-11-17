import 'package:ilearn/Resources/imports.dart';

import '../../../Control/data_parse.dart';
import '../../Course/course_description.dart';

class SearchResults extends StatelessWidget {
  final PageController pageController;
  final Course course;
  const SearchResults(
      {super.key, required this.course, required this.pageController});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CourseDescription(
                        course: course, pageController: pageController)));
          },
          child: SizedBox(
            width: double.maxFinite,
            height: (130 / height) * height,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: (30 / width) * width,
                ),
                Image.network(ParseData().parseUrl(course.thumbnail!)),
                SizedBox(
                  width: (30 / width) * width,
                ),
                SizedBox(
                  height: (120/height)*height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        course.courseTitle!,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: 'SF Pro Text',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 25,
                        width: width-130,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(course.createdBy!['name']),
                            Spacer(),
                            IconButton(onPressed: (){}, icon: Icon(Icons.favorite,size:25,color: AllColor.iconColor,))
                          ],
                        ),
                      ),
                      SizedBox(height: 5,),
                      Row(
                        children: [
                          Text(course.rating!.toString()),
                          const Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 18,
                          )
                        ],
                      ),
                      SizedBox(height: 15,),
                      Text(
                        '₹${course.price!}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 17.69,
                          fontFamily: 'SF Pro Text',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 10,right: 10),
          child: Divider(),
        ),
      ],
    );
  }
}
