import 'package:ilearn/Features/Home/Screens/Widgets/actions.dart';
import 'package:ilearn/Resources/imports.dart';
import '../../../../Models/student_model.dart';
import 'Widgets/custom_searchbar.dart';
import 'Widgets/popular_search_tile.dart';


class Search extends StatefulWidget {
  final User user;

  final String title;
  final PageController pageController;
  const Search({super.key, required this.title, required this.pageController, required this.user});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: (80 / height) * height,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Padding(
          padding: EdgeInsets.only(
              left: (15 / width) * width, right: (15 / width) * width),
          child: const Text(
            'Search',
            style: TextStyle(
                color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        actions: ActionBar(context: context, pageIndex: 1, controller: widget.pageController).actionList(),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: ListView(
          children: [
            CustomSearchBar(
              pageController: widget.pageController, user: widget.user,
            ),
            const SizedBox(
              height: 50,
            ),
            const Row(
              children: [
                Icon(Icons.electric_bolt_outlined),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Popular Searches',
                  style: TextStyle(
                    color: Color(0xFF040C17),
                    fontSize: 16,
                    fontFamily: 'SF Pro Text',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            const PopularSearch(title: 'Flutter Course'),
            const PopularSearch(title: 'Figma Course'),
            const PopularSearch(title: 'Best course for Pixel art'),
            const PopularSearch(title: 'How to get in SI probation'),
            const PopularSearch(title: 'How to get placed from AKGEC'),
          ],
        ),
      ),
    );
  }
}



