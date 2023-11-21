import 'package:ilearn/Features/Home/Screens/Widgets/actions.dart';
import 'package:ilearn/Resources/imports.dart';
import 'package:ilearn/Features/Home/Services/courses.dart';
import '../../../../Models/student_model.dart';
import '../../Control/control.dart';
import '../../Services/user.dart';
import '../Widgets/shimmer_blocks.dart';
import 'Models/icon_button_data.dart';
import 'Widgets/courses_for_me.dart';
import 'Widgets/iconElevatedButton.dart';
import 'Widgets/streak_callendar.dart';
import 'Widgets/top_course_button.dart';
import 'Widgets/top_course_card.dart';
import 'Widgets/top_course_text.dart';

class Library extends StatefulWidget {
  final User user;
  final PageController pageController;
  const Library({super.key, required this.pageController, required this.user});

  @override
  State<Library> createState() => _LibraryState();
}

class _LibraryState extends State<Library> {


  Future<void> handleWishListing(String courseId)async{
        if(Control().isWishListed(courseId, widget.user.wishlist!)){
          await UserFunctions().handleWishList(courseId:courseId);
          widget.user.wishlist!.remove(courseId);
        }
        else{
          await UserFunctions().handleWishList(courseId: courseId,deleting: false);
          widget.user.wishlist!.add(courseId);
        }
        setState((){

        });
  }

  final List<IconButtonData> buttonData = [
    IconButtonData(
        title: 'Your Learnings', icon: AllIcons.learningIcon, onPressed: () {}),
    IconButtonData(
        title: 'Popular', icon: AllIcons.trendingIcon, onPressed: () {}),
    IconButtonData(
        title: 'Teach at iLearn', icon: AllIcons.teachIcon, onPressed: () {}),
  ];
  final List<Widget> categoryList = [
    CategoriesButton(
      iconButtonData: IconButtonData(
          title: 'App Development',
          image: AllIcons.appDevelopment,
          onPressed: () {}),
    ),
    CategoriesButton(
      iconButtonData: IconButtonData(
          title: 'Web Development',
          image: AllIcons.webDevelopment,
          onPressed: () {}),
    ),
    CategoriesButton(
      iconButtonData: IconButtonData(
          title: 'AIML Development',
          image: AllIcons.aimlDevelopment,
          onPressed: () {}),
    ),
    CategoriesButton(
      iconButtonData: IconButtonData(
          title: 'Personality Development',
          image: AllIcons.personalityDevelopment,
          onPressed: () {}),
    ),
    CategoriesButton(
      iconButtonData: IconButtonData(
          title: 'ARVR Development',
          image: AllIcons.arvrDevelopment,
          onPressed: () {}),
    ),
    CategoriesButton(
      iconButtonData: IconButtonData(
          title: 'Photography',
          image: AllIcons.photographyDevelopment,
          onPressed: () {}),
    ),
    CategoriesButton(
      iconButtonData: IconButtonData(
          title: 'Designing',
          image: AllIcons.designingDevelopment,
          onPressed: () {}),
    ),
    CategoriesButton(
      iconButtonData: IconButtonData(
          title: 'DataScience',
          image: AllIcons.dataScienceDevelopment,
          onPressed: () {}),
    ),
    CategoriesButton(
      iconButtonData: IconButtonData(
          title: 'Others',
          image: AllIcons.others,
          onPressed: () {}),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: (80/height)*height,
          elevation: 0,
          backgroundColor: Colors.white,
          title: Padding(
            padding: EdgeInsets.only(left: (15/width)*width, right: (15/width)*width),
            child: const Text(
              'Library',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ),
          actions: ActionBar(context: context, pageIndex: 0, controller: widget.pageController, user: widget.user).actionList(),
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: Padding(
          padding: EdgeInsets.only(left: (20/width)*width, right: (20/width)*width),
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
                            icon: buttonData[index].icon!,
                            onPress: buttonData[index].onPressed,
                          );
                        })),
                  ),
                  SizedBox(
                    height: (5/height)*height,
                  ),
                  const StreakCalendar(
                    streak: 10,
                  ),
                  SizedBox(
                    height: (30/height)*height,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Courses for You',
                        style: Theme.of(context).textTheme.displayMedium,
                      )),
                  SizedBox(
                    height: (20/height)*height,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: (360/height)*height,
                    child: FutureBuilder(future: GetCourse().getCategoryCourse('Python'),
                      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                        if(snapshot.hasData){
                          List<Course> topCourse = snapshot.data;
                          List<Widget> c1 = [];
                          for(var course in topCourse){
                            c1.add(CoursesForMeCards(course: course, pageController: widget.pageController, user: widget.user, onPressed: ()async{handleWishListing(course.id!);},));
                          }
                          // print(topCourse);
                          return SizedBox(
                            height: (250/height)*height,
                            width: (250/width)*width,
                            child: ListView(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              children: c1,
                            ),
                          );
                        }
                        else{
                          return ShimmerBlocks(context: context).coursesForYouShimmer();
                        }
                      },),
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
                    height: (60/height)*height,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: categoryList,
                    ),
                  ),
                  SizedBox(height: (20/height)*height),
                  const TopCourseText(title: 'Python'),
                  SizedBox(height: (20/height)*height),
                  SizedBox(
                      height: (250/height)*height,
                    width: double.maxFinite,
                    child: FutureBuilder(future: GetCourse().getCategoryCourse('Python'),
                      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                          if(snapshot.hasData){
                            List<Course> topCourse = snapshot.data;
                            List<Widget> c1 = [];
                            for(var course in topCourse){
                              c1.add(TopCourseCard(course: course, pageController: widget.pageController, user: widget.user, onPressed: ()async{handleWishListing(course.id!);},));
                            }
                            // print(topCourse);
                            return SizedBox(
                              height: 250,
                              width: 250,
                              child: ListView(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                children: c1,
                              ),
                            );
                          }
                          else{
                            return const CircularProgressIndicator();
                          }
                      },)
                  ),
                  SizedBox(
                    height: (20/height)*height,
                  ),
                  const TopCourseText(title: 'DSA'),
                   SizedBox(
                    height: (20/height)*height,
                  ),
                  SizedBox(
                      height: (250/height)*height,
                      width: (250/width)*width,
                    child: FutureBuilder(future: GetCourse().getCategoryCourse('DSA'),
                      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                        if(snapshot.hasData){
                          List<Course> topCourse = snapshot.data;
                          List<Widget> c1 = [];
                          for(var course in topCourse){
                            c1.add(TopCourseCard(course: course, pageController: widget.pageController, user: widget.user,onPressed: ()async{handleWishListing(course.id!);},));
                          }
                          // print(topCourse);
                          return SizedBox(
                            height: 250,
                            width: 250,
                            child: ListView(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              children: c1,
                            ),
                          );
                        }
                        else{
                          return const CircularProgressIndicator();
                        }
                      },)
                  ),
                  SizedBox(
                    height: (120/height)*height,
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
