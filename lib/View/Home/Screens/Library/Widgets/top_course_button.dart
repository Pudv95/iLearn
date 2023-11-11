import 'package:ilearn/Resources/imports.dart';
import 'package:ilearn/View/Home/Screens/Library/Models/icon_button_data.dart';

class CategoriesButton extends StatelessWidget {
  final IconButtonData iconButtonData;
  const CategoriesButton({
    super.key,
    required this.iconButtonData,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton.icon(
        onPressed: iconButtonData.onPressed,
        icon: iconButtonData.icon,
        label: Text(
          iconButtonData.title,
          style: const TextStyle(color: Colors.black,fontSize: 15),
        ),
        style: ButtonStyle(
            elevation: MaterialStatePropertyAll<double>(0),
            backgroundColor: MaterialStatePropertyAll<Color>(Color(0xFFF1F1F1)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    ))),
      ),
    );
  }
}
