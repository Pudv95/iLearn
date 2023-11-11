import 'package:ilearn/Resources/imports.dart';

class CoursesForMeCards extends StatefulWidget {
  final Course course;
  const CoursesForMeCards({super.key, required this.course});

  @override
  State<CoursesForMeCards> createState() => _CoursesForMeCardsState();
}

class _CoursesForMeCardsState extends State<CoursesForMeCards> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.95,
      height: size.height * 0.01,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset(
                widget.course.coursePic ?? '',
                fit: BoxFit.cover,
                scale: 0.88,
              ),
              Positioned(
                top: 10,
                right: 10,
                child: Stack(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
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
          const SizedBox(
            height: 10,
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
            widget.course.tutor ?? '',
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
    );
  }
}