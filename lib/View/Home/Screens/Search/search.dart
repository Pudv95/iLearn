import 'package:ilearn/Resources/imports.dart';

class Search extends StatefulWidget {
  final String title;
  const Search({super.key,required this.title});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
    );
  }
}
