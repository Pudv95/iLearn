import 'package:ilearn/Resources/imports.dart';
import 'Models/icon_button_data.dart';
import 'Widgets/courses_for_me.dart';
import 'Widgets/iconElevatedButton.dart';
import 'Widgets/streak_callendar.dart';
import 'Widgets/top_course_button.dart';
import 'Widgets/top_course_card.dart';
import 'Widgets/top_course_text.dart';

class Library extends StatefulWidget {
  final PageController pageController;
  const Library({super.key, required this.pageController});

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
        courseDescription:
            'By the end of the cone you witho create simple and complex 20 3D animation You will learn the programer Effects am how to work with shapes, keyframes, etc. You! be able to animate characters logos infographics and typography You wil work such soft products Adobe A Media Encoder, Trapcode and others '),
    Course(
        rating: 4.3,
        tutor: 'Prajjwal Tripathi',
        courseTitle: 'Learn flutter in 37 hours {Easy Version}',
        coursePic: 'assets/Icons/coursePic.png',
        liked: false,
        price: '8999',
        courseDescription:
            'By the end of the cone you witho create simple and complex 20 3D animation You will learn the programer Effects am how to work with shapes, keyframes, etc. You! be able to animate characters logos infographics and typography You wil work such soft products Adobe A Media Encoder, Trapcode and others '),
    Course(
        rating: 4.3,
        tutor: 'Manas Jha',
        courseTitle: 'Learn flutter in 37 hours',
        coursePic: 'assets/Icons/coursePic.png',
        liked: true,
        price: '89239',
        courseDescription:
            'By the end of the cone you witho create simple and complex 20 3D animation You will learn the programer Effects am how to work with shapes, keyframes, etc. You! be able to animate characters logos infographics and typography You wil work such soft products Adobe A Media Encoder, Trapcode and others '),
    Course(
        rating: 4.3,
        tutor: 'Lakshya Goel',
        courseTitle: 'Learn flutter in 37 hours',
        coursePic: 'assets/Icons/coursePic.png',
        liked: false,
        price: '8993',
        courseDescription:
            'By the end of the cone you witho create simple and complex 20 3D animation You will learn the programer Effects am how to work with shapes, keyframes, etc. You! be able to animate characters logos infographics and typography You wil work such soft products Adobe A Media Encoder, Trapcode and others '),
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
                    height: 30,
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
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children:
                          List.generate(recommendedCourse.length, (index) {
                        return CoursesForMeCards(
                          course: recommendedCourse[index],
                          pageController: widget.pageController,
                        );
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
                    height: 60,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        CategoriesButton(
                          iconButtonData: IconButtonData(
                              title: 'App Development',
                              icon: AllIcons.learningIcon,
                              onPressed: () {}),
                        ),
                        CategoriesButton(
                          iconButtonData: IconButtonData(
                              title: 'App Development',
                              icon: AllIcons.learningIcon,
                              onPressed: () {}),
                        ),
                        CategoriesButton(
                          iconButtonData: IconButtonData(
                              title: 'App Development',
                              icon: AllIcons.learningIcon,
                              onPressed: () {}),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const TopCourseText(title: 'Figma'),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 250,
                    width: double.maxFinite,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        TopCourseCard(
                          course: recommendedCourse[0],
                          pageController: widget.pageController,
                        ),
                        TopCourseCard(
                          course: recommendedCourse[0],
                          pageController: widget.pageController,
                        ),
                        TopCourseCard(
                          course: recommendedCourse[0],
                          pageController: widget.pageController,
                        ),
                        TopCourseCard(
                          course: recommendedCourse[0],
                          pageController: widget.pageController,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const TopCourseText(title: 'Flutter'),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 250,
                    width: double.maxFinite,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        TopCourseCard(
                          course: recommendedCourse[0],
                          pageController: widget.pageController,
                        ),
                        TopCourseCard(
                          course: recommendedCourse[0],
                          pageController: widget.pageController,
                        ),
                        TopCourseCard(
                          course: recommendedCourse[0],
                          pageController: widget.pageController,
                        ),
                        TopCourseCard(
                          course: recommendedCourse[0],
                          pageController: widget.pageController,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 120,
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
