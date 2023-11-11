import 'package:ilearn/Resources/imports.dart';
import 'package:ilearn/View/Home/Screens/Community/community.dart';
import 'package:ilearn/View/Home/Screens/Course/course_description.dart';
import 'package:ilearn/View/Home/Screens/Library/library.dart';
import 'package:ilearn/View/Home/Screens/Search/search.dart';
import 'package:ilearn/View/Home/Screens/bottom_navigation_bar.dart';
import 'dart:ui';
import 'Profile/profilie.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final PageController _pageController = PageController();
  int currPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PageView(
        controller: _pageController,
        children:  [
          Library(pageController: _pageController,),
          const Search(
            title: 'Search',
          ),
          const Community(
            title: 'Community',
          ),
          const Profile(
            title: 'Profile',
          ),
        ],
        onPageChanged: (index) {
          setState(() {
            currPage = index;
          });
        },
      ),
      bottomNavigationBar: CustomBottomNavigationBar(currPage: currPage, pageController: _pageController, onTap: (ind) { _pageController.jumpToPage(ind); },)
    );
  }
}
