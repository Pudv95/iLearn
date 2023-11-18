import 'package:ilearn/Resources/imports.dart';
import 'Widgets/search_delegate.dart';
import 'dart:math' as math;

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
        actions: const [
          Icon(
            Icons.favorite_outline,
            size: 30,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Icon(
              Icons.shopping_cart_outlined,
              size: 30,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 30),
            child: Icon(
              Icons.notifications_none_outlined,
              size: 30,
            ),
          ),
        ],
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: ListView(
          children: [
            CustomSearchBar(
              pageController: widget.pageController,
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
            const PopularSearch(title: 'Flutter course'),
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

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}

class CustomSearchBar extends StatelessWidget {
  final PageController pageController;
  const CustomSearchBar({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enableInteractiveSelection: false,
      onTap: () {
        showSearch(
            context: context,
            delegate: CustomSearchDelegate(pageController: pageController));
      },
      focusNode: AlwaysDisabledFocusNode(),
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        prefixIcon: const Icon(Icons.search),
        prefixIconColor: Colors.grey,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(style: BorderStyle.none, width: 0)),
        fillColor: AllColor.textFormBox,
        filled: true,
        label: const Text('What do you want to learn'),
        focusColor: AllColor.textFormBoxFocus,
      ),
      cursorColor: AllColor.textFormText,
    );
  }
}

class PopularSearch extends StatelessWidget {
  final String title;
  const PopularSearch({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){},
      leading: Text(
        title,
        style: const TextStyle(
          color: Color(0xFF040C17),
          fontSize: 16,
          fontFamily: 'Work Sans',
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Transform.rotate(
        angle: 45 * math.pi / 180,
        child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
      ),
    );
  }
}
