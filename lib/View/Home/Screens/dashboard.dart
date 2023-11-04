import 'package:ilearn/Resources/imports.dart';
import 'package:ilearn/View/Home/Screens/Community/community.dart';
import 'package:ilearn/View/Home/Screens/Library/library.dart';
import 'package:ilearn/View/Home/Screens/Search/search.dart';

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
      body: PageView(
        controller: _pageController,
        children: const [
          Library(

          ),
          Search(
            title: 'Search',
          ),
          Community(
            title: 'Community',
          ),
          Profile(
            title: 'Profile',
          ),
        ],
        onPageChanged: (index) {
          setState(() {
            currPage = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          currentIndex: currPage,
          onTap: (ind) {
            _pageController.jumpToPage(ind);
          },
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedIconTheme: IconThemeData(color: AllColor.selectedIconColor),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: '',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.mode_comment_outlined), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
          ]),
    );
  }
}
