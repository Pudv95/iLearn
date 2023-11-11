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
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.book),
                  label: 'Library',
                ),
                BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.mode_comment_outlined), label: 'Community'),
                BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
              ]),
        ),
      ),
    );
  }
}
