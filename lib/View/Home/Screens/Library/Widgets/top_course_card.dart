import 'package:ilearn/Resources/imports.dart';
import 'package:ilearn/View/Home/Control/data_parse.dart';
import 'package:ilearn/View/Home/Screens/Course/course_description.dart';

class TopCourseCard extends StatefulWidget {
  final PageController pageController;
  final Course course;

  const TopCourseCard({super.key, required this.course, required this.pageController});

  @override
  State<TopCourseCard> createState() => _TopCourseCardState();
}

class _TopCourseCardState extends State<TopCourseCard> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    CourseDescription(course: widget.course, pageController: widget.pageController,)));
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.5,
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(color: AllColor.iconButtonColor)),
          child: Padding(
            padding: EdgeInsets.all((10.0/height)*height),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: (140/height)*height,
                  width: double.maxFinite,
                  child: Stack(
                    children: [
                      Positioned(child: Center(child: Image.network(ParseData().parseUrl(widget.course.thumbnail!)))),
                      Positioned(
                          right: 4,
                          top: 4,
                          child: Container(
                            height: (37/height)*height,
                            width: (37/width)*width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color:
                                  Colors.white.withOpacity(0.40000000298023224),
                            ),
                            child: IconButton(
                              icon: (widget.course.liked!)
                                  ? const Icon(Icons.favorite)
                                  : const Icon(Icons.favorite_outline),
                              color: AllColor.iconColor,
                              onPressed: () {
                                setState(() {
                                  widget.course.liked = !widget.course.liked!;
                                });
                              },
                            ),
                          )),
                    ],
                  ),
                ),
                SizedBox(height: (10/height)*height),
                Text(
                  widget.course.courseTitle!,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  widget.course.createdBy!['name'],
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Row(
                  children: [
                    Text(widget.course.rating.toString(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w400,
                        )),
                    Icon(
                      Icons.star,
                      color: AllColor.iconColor,
                    ),
                    const Spacer(),
                    Text(
                      '₹${widget.course.price.toString()}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
