import 'dart:ui';

import 'package:ilearn/Resources/imports.dart';
import 'package:ilearn/Features/Home/Screens/Community/community.dart';
import 'package:ilearn/Features/Home/Screens/Library/library.dart';
import 'package:ilearn/Features/Home/Screens/Search/search.dart';
import 'package:ilearn/Features/Home/Screens/Widgets/bottom_navigation_bar.dart';
import '../../../Models/student_model.dart';
import '../Home/Screens/Profile/profilie.dart';
import 'EducatorHome/educator_home.dart';
import 'UploadCourse/upload_course_steps.dart';

class TeacherDashboard extends StatefulWidget {
  final User user;
  const TeacherDashboard({super.key, required this.user});

  @override
  State<TeacherDashboard> createState() => _TeacherDashboardState();
}

class _TeacherDashboardState extends State<TeacherDashboard> {
  final PageController _pageController = PageController(initialPage: 1);
  int currPage = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: PageView(
          controller: _pageController,
          children: [
            EducatorHome(),
            UploadCourseSteps(user: widget.user,),
            Profile(user: widget.user, pageController: _pageController,learner: false,),
          ],
          onPageChanged: (index) {
            setState(() {
              currPage = index;
            });
          },
        ),
        bottomNavigationBar: SizedBox(
          height: 80,
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: BottomNavigationBar(
                  elevation: 0,
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: AllColor.bottomNavigationBarColor,
                  currentIndex: currPage,
                  onTap: (ind){_pageController.jumpToPage(ind);},
                  selectedIconTheme: IconThemeData(color: AllColor.selectedIconColor),
                  items: [
                    BottomNavigationBarItem(
                      icon: (currPage == 0)?AllIcons.homeSelected:AllIcons.home,
                      label: 'Library',
                    ),
                    BottomNavigationBarItem(icon: (currPage == 1)?AllIcons.uploadSelected:AllIcons.upload, label: 'Search'),
                    BottomNavigationBarItem(icon: (currPage == 2)?AllIcons.profileSelected:AllIcons.profile, label: 'Profile'),
                  ]),
            ),
          ),
        ));
  }
}
