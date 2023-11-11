import 'package:ilearn/Resources/imports.dart';

class TopCourseCard extends StatefulWidget {
  final Course course;
  const TopCourseCard({super.key, required this.course});

  @override
  State<TopCourseCard> createState() => _TopCourseCardState();
}

class _TopCourseCardState extends State<TopCourseCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: AllColor.iconButtonColor)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.asset(
                    widget.course.coursePic!,
                    scale: 1.5,
                  ),
                  Positioned(
                      right: 4,
                      top: 4,
                      child: Container(
                        height: 37,
                        width: 37,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: Colors.white.withOpacity(0.40000000298023224),),
                        child: IconButton(
                          icon: (widget.course.liked!)?const Icon(Icons.favorite):const Icon(Icons.favorite_outline),
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
              const SizedBox(height: 10),
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
                widget.course.tutor!,
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
    );
  }
}