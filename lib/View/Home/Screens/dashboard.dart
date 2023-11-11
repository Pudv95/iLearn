import 'package:ilearn/Resources/imports.dart';
import 'package:ilearn/View/Home/Screens/Community/community.dart';
import 'package:ilearn/View/Home/Screens/Library/library.dart';
import 'package:ilearn/View/Home/Screens/Search/search.dart';
import 'package:ilearn/View/Home/Screens/bottom_navigation_bar.dart';
import '../../../Models/student_model.dart';
import 'Profile/profilie.dart';

class Dashboard extends StatefulWidget {
  final User user;
  const Dashboard({super.key, required this.user});

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
          Profile(user: widget.user),
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
