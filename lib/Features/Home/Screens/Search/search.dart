import 'dart:async';

import 'package:ilearn/Features/Home/Screens/Course/course_description.dart';
import 'package:ilearn/Features/Home/Services/courses.dart';
import 'package:ilearn/Resources/imports.dart';

import '../../Control/data_parse.dart';
import 'Widgets/search_delegate.dart';

class Search extends StatefulWidget {
  final String title;
  final PageController pageController;
  const Search({super.key, required this.title, required this.pageController});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                showSearch(
                    context: context,
                    delegate: CustomSearchDelegate(
                        pageController: widget.pageController));
              },
              icon: const Icon(Icons.search))
        ],
      ),
    );
  }
}


