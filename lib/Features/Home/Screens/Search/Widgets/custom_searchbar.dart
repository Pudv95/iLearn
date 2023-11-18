import 'package:ilearn/Resources/imports.dart';
import 'package:ilearn/Features/Home/Screens/Search/Widgets/search_delegate.dart';

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