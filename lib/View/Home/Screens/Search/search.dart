import 'package:ilearn/Resources/imports.dart';

class Search extends StatefulWidget {
  final String title;
  const Search({super.key, required this.title});

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
                showSearch(context: context, delegate: CustomSearchDelegate());
              },
              icon: const Icon(Icons.search))
        ],
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerms = ["Flutter", "Python", "C", "C++"];

  @override
  ThemeData appBarTheme(BuildContext context){
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(

    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear,color: Colors.grey,))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
     return IconButton(onPressed: (){
       close(context, null);
     }, icon: const Icon(Icons.arrow_back,color: Colors.grey,));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for(var course in searchTerms){
      if(course.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(course);
      }
    }
    return ListView.builder(itemCount: matchQuery.length,itemBuilder: (BuildContext context, int index) {
      return ListTile(title: Text(matchQuery[index]),);
    },);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for(var course in searchTerms){
      if(course.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(course);
      }
    }
    return ListView.builder(itemCount: matchQuery.length,itemBuilder: (BuildContext context, int index) {
      return ListTile(title: Text(matchQuery[index]),);
    },);
  }
}
