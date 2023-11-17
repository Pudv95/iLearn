import 'dart:ui';

import 'package:ilearn/Resources/imports.dart';


class CustomBottomNavigationBar extends StatelessWidget {
  final int currPage;
  final PageController pageController;
  final void Function(int)? onTap;
  const CustomBottomNavigationBar({super.key, required this.currPage, required this.pageController, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: BottomNavigationBar(
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              backgroundColor: AllColor.bottomNavigationBarColor,
              currentIndex: currPage,
              onTap: onTap,
              selectedIconTheme: IconThemeData(color: AllColor.selectedIconColor),
              items: [
                BottomNavigationBarItem(
                  icon: (currPage == 0)?AllIcons.librarySelected:AllIcons.library,
                  label: 'Library',
                ),
                BottomNavigationBarItem(icon: (currPage == 1)?AllIcons.searchSelected:AllIcons.search, label: 'Search'),
                BottomNavigationBarItem(
                    icon: (currPage == 2)?AllIcons.communitySelected:AllIcons.community, label: 'Community'),
                BottomNavigationBarItem(icon: (currPage == 3)?AllIcons.profileSelected:AllIcons.profile, label: 'Profile'),
              ]),
        ),
      ),
    );
  }
}
