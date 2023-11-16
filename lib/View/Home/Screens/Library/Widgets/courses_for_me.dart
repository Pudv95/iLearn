import 'package:ilearn/Resources/imports.dart';

import '../../Course/course_description.dart';

class CoursesForMeCards extends StatefulWidget {
  final PageController pageController;
  final Course course;
  const CoursesForMeCards({super.key, required this.course, required this.pageController});

  @override
  State<CoursesForMeCards> createState() => _CoursesForMeCardsState();
}

class _CoursesForMeCardsState extends State<CoursesForMeCards> {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      CourseDescription(course: widget.course, pageController: widget.pageController,)));
      },
      child: SizedBox(
        width: size.width * 0.95,
        height: size.height * 0.01,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: (180/size.height)*size.height,
              child: Stack(
                children: [
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Stack(
                      children: [
                        Container(
                          height: (40/size.height)*size.height,
                          width: (40/size.width)*size.width,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.6),
                            shape: BoxShape.circle
                          ),
                        ),
                        Positioned(
                          top: -2,
                          right:-5,
                          child: IconButton(
                            onPressed: () {
                              {
                                setState(() {
                                  if (widget.course.liked != null) {
                                    widget.course.liked = !widget.course.liked!;
                                  }
                                });
                              }
                            },
                            icon: Icon((widget.course.liked!)
                                ? Icons.favorite
                                : Icons.favorite_border),
                            color: AllColor.iconColor,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: (10/size.height)*size.height,
            ),
            Wrap(
              children: [
                Text(
                  widget.course.courseTitle ?? '',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
            Text(
              widget.course.createdBy![0]['name'],
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: 'Sofia Sans',
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
                SizedBox(width: size.width*0.55,),
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
    );
  }
}