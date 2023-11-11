import 'package:ilearn/Resources/imports.dart';

class Library extends StatefulWidget {
  const Library({super.key});

  @override
  State<Library> createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  final List<IconButtonData> buttonData = [
    IconButtonData(
        title: 'Your Learnings', icon: AllIcons.learningIcon, onPressed: () {}),
    IconButtonData(
        title: 'Popular', icon: AllIcons.trendingIcon, onPressed: () {}),
    IconButtonData(
        title: 'Teach at iLearn', icon: AllIcons.teachIcon, onPressed: () {}),
  ];

  final List<Course> recommendedCourse = [
    Course(
        rating: 4.3,
        tutor: 'Paras Upadhayay',
        courseTitle: 'Learn flutter in 37 hours',
        coursePic: 'assets/Icons/coursePic.png',
        liked: true,
        price: '899',
        courseDescription: ''),
    Course(
        rating: 4.3,
        tutor: 'Prajjwal Tripathi',
        courseTitle: 'Learn flutter in 37 hours {Easy Version}',
        coursePic: 'assets/Icons/coursePic.png',
        liked: false,
        price: '8999',
        courseDescription: ''),
    Course(
        rating: 4.3,
        tutor: 'Manas Jha',
        courseTitle: 'Learn flutter in 37 hours',
        coursePic: 'assets/Icons/coursePic.png',
        liked: true,
        price: '89239',
        courseDescription: ''),
    Course(
        rating: 4.3,
        tutor: 'Lakshya Goel',
        courseTitle: 'Learn flutter in 37 hours',
        coursePic: 'assets/Icons/coursePic.png',
        liked: false,
        price: '8993',
        courseDescription: ''),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 80,
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Padding(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Text(
              'Library',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ),
          actions: const [
            Icon(
              Icons.favorite_outline,
              size: 30,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, right: 35),
              child: Icon(
                Icons.notifications,
                size: 30,
              ),
            ),
          ],
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: ListView(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Wrap(
                        alignment: WrapAlignment.start,
                        children: List.generate(buttonData.length, (index) {
                          return IconElevatedButton(
                            title: buttonData[index].title,
                            icon: buttonData[index].icon,
                            onPress: buttonData[index].onPressed,
                          );
                        })),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const StreakCalendar(
                    streak: 10,
                  ),
                  const SizedBox(
                    height: 56.14,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Courses for You',
                        style: Theme.of(context).textTheme.displayMedium,
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 360,
                    child: ListView(
                      physics: const PageScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children:
                          List.generate(recommendedCourse.length, (index) {
                        return CoursesForMeCards(
                            course: recommendedCourse[index]);
                      }),
                    ),
                  ),
                  Row(
                    children: [
                      const Text(
                        'Categories',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'See All',
                            style:
                                TextStyle(color: AllColor.primaryButtonColor),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 50,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        CategoriesButton(
                            onPressed: () {},
                            title: 'Web Development',
                            icon: const Icon(Icons.add_box)),
                        CategoriesButton(
                            onPressed: () {},
                            title: 'App Development',
                            icon: const Icon(Icons.add_box)),
                        CategoriesButton(
                            onPressed: () {},
                            title: 'Some Random Education',
                            icon: const Icon(Icons.add_box)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const TopCourse(title: 'Figma'),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 250,
                    width: double.maxFinite,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        TopCourseCard(
                          course: recommendedCourse[0],
                        ),
                        TopCourseCard(
                          course: recommendedCourse[0],
                        ),
                        TopCourseCard(
                          course: recommendedCourse[0],
                        ),
                        TopCourseCard(
                          course: recommendedCourse[0],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20,),
                  const TopCourse(title: 'Flutter'),
                  const SizedBox(height: 20,),
                  SizedBox(
                    height: 250,
                    width: double.maxFinite,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        TopCourseCard(
                          course: recommendedCourse[0],
                        ),
                        TopCourseCard(
                          course: recommendedCourse[0],
                        ),
                        TopCourseCard(
                          course: recommendedCourse[0],
                        ),
                        TopCourseCard(
                          course: recommendedCourse[0],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 180,)
                ],
              ),
            ),
          ),
        ));
  }
}

class IconElevatedButton extends StatelessWidget {
  final String title;
  final Image icon;
  final void Function()? onPress;
  const IconElevatedButton(
      {super.key,
      required this.title,
      required this.icon,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SizedBox(
        height: 40,
        child: ElevatedButton.icon(
          onPressed: onPress,
          icon: icon,
          label: Text(
            title,
            style: TextStyle(
                color: AllColor.iconButtonTextColor,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            backgroundColor: AllColor.iconButtonColor,
            elevation: 0,
          ),
        ),
      ),
    );
  }
}

class IconButtonData {
  String title;
  Image icon;
  void Function() onPressed;
  IconButtonData(
      {required this.title, required this.icon, required this.onPressed});
}

class StreakCalendar extends StatelessWidget {
  final int streak;
  const StreakCalendar({super.key, required this.streak});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    print(10 / height);
    double width = MediaQuery.of(context).size.width;
    print(25 / width);
    return Stack(
      children: [
        Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: height * 0.2155,
              width: double.infinity,
              child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: const Color.fromRGBO(225, 243, 255, 1),
                  child: SizedBox(
                    height: height * 0.06928,
                    width: width * 0.24305,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30, top: 10),
                      child: Row(
                        children: [
                          SizedBox(
                            height: height * 0.17784,
                            width: width * 0.34027,
                            child: Wrap(
                              children: [
                                const Text(
                                  'Your Current \nStreak',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    height: 0,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '$streak',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 80),
                                    ),
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    Column(children: [
                                      SizedBox(height: height * 0.05528),
                                      const Text(
                                        'Days',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontFamily: 'SF Pro Text',
                                          fontWeight: FontWeight.w600,
                                          height: 0,
                                        ),
                                      ),
                                    ])
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
            ),
          ],
        ),
        Positioned(
            right: height * 0.023856,
            bottom: width * 0.08076,
            child: AllIcons.calendarImage),
      ],
    );
  }
}

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
      width: size.width * 0.9,
      height: size.height * 0.01,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            widget.course.coursePic ?? '',
            fit: BoxFit.cover,
            scale: 0.88,
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
              IconButton(
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
              )
            ],
          )
        ],
      ),
    );
  }
}

class Course {
  String? coursePic;
  String? courseTitle;
  String? tutor;
  double? rating;
  String? courseDescription;
  String? price;
  bool? liked;
  Course(
      {required this.rating,
      required this.tutor,
      required this.courseTitle,
      required this.coursePic,
      required this.liked,
      required this.price,
      required this.courseDescription});
}

class SpecificCourse extends StatelessWidget {
  final Course course;
  const SpecificCourse({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(
        children: [
          SizedBox(
              height: 50,
              width: 50,
              child: Image.network(course.coursePic ?? '')),
          Column(
            children: [Text(course.courseTitle ?? '')],
          ),
        ],
      ),
    );
  }
}

class CategoriesButton extends StatelessWidget {
  final void Function() onPressed;
  final String title;
  final Icon icon;
  const CategoriesButton(
      {super.key,
      required this.onPressed,
      required this.title,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: icon,
        label: Text(
          title,
          style: const TextStyle(color: Colors.black),
        ),
        style: const ButtonStyle(
          elevation: MaterialStatePropertyAll<double>(0),
          backgroundColor: MaterialStatePropertyAll<Color>(Color(0xFFF1F1F1)),
        ),
      ),
    );
  }
}

class TopCourse extends StatelessWidget {
  final String title;
  const TopCourse({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          const TextSpan(
            text: 'Top Courses in ',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontFamily: 'SF Pro Display',
              fontWeight: FontWeight.w500,
              height: 0,
            ),
          ),
          TextSpan(
            text: title,
            style: const TextStyle(
              color: Color(0xFF246E9E),
              fontSize: 24,
              fontFamily: 'SF Pro Display',
              fontWeight: FontWeight.w500,
              height: 0,
            ),
          ),
        ],
      ),
    );
  }
}

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
