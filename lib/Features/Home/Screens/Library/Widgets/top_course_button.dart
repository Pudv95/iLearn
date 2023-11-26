import 'package:ilearn/Resources/imports.dart';
import 'package:ilearn/Features/Home/Screens/Library/Models/icon_button_data.dart';

class CategoriesButton extends StatelessWidget {
  final IconButtonData iconButtonData;
  const CategoriesButton({
    super.key,
    required this.iconButtonData,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.all((8.0/MediaQuery.sizeOf(context).height)*MediaQuery.of(context).size.height),
      child: ElevatedButton.icon(
        onPressed: ()=>iconButtonData.onPressed,
        icon: (iconButtonData.icon != null)
            ? iconButtonData.icon ?? const Icon(Icons.edit)
            : iconButtonData.image ??
                const Icon(
                  Icons.edit,
                  color: Colors.blueGrey,
                ),
        label: Text(
          iconButtonData.title,
          style: const TextStyle(color: Colors.black, fontSize: 15),
        ),
        style: ButtonStyle(
            elevation: const MaterialStatePropertyAll<double>(0),
            backgroundColor: const MaterialStatePropertyAll<Color>(Color(0xFFF1F1F1)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ))),
      ),
    );
  }
}
