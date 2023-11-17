import 'package:ilearn/Features/Home/Screens/Search/Widgets/search_result.dart';
import 'package:ilearn/Resources/imports.dart';

import '../../../Services/courses.dart';

class CustomSearchDelegate extends SearchDelegate {
  final PageController pageController;
  List<String> searchTerms = ["Flutter", "Python", "C", "C++", "Web"];
  List<String> searchResults = [];

  CustomSearchDelegate({required this.pageController});

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith();
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear, color: Colors.grey),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back, color: Colors.grey),
    );
  }

  void _runSearch(String query) {
    List<String> matchQuery = [];
    for (var course in searchTerms) {
      if (course.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(course);
      }
    }
    searchResults = matchQuery;
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
      future: GetCourse().searchCourse(query),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List? course = snapshot.data as List?;
          return ListView.builder(
            itemCount: course?.length,
            itemBuilder: (BuildContext context, int index) {
              return SearchResults(
                course: course![index],
                pageController: pageController,
              );
            },
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(const Duration(milliseconds: 500), () {
        _runSearch(query);
      }),
      builder: (context, snapshot) {
        return ListView(
          children: searchResults
              .map((result) => ListTile(
            title: Text(result),
            onTap: () {
              query = result;
            },
          ))
              .toList(),
        );
      },
    );
  }
}
