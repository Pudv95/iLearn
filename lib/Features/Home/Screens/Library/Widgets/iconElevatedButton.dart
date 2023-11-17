import 'package:ilearn/Resources/imports.dart';

class IconElevatedButton extends StatelessWidget {
  final String title;
  final Image icon;
  final void Function()? onPress;
  const IconElevatedButton(
      {super.key,
        required this.title,
        required this.icon,
        required this.onPress});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SizedBox(
        height: (40/height)*height,
        child: ElevatedButton.icon(
          onPressed: onPress,
          icon: icon,
          label: Text(
            title,
            style: TextStyle(
                color: AllColor.iconButtonTextColor,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          style: ElevatedButton.styleFrom(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            backgroundColor: AllColor.iconButtonColor,
            elevation: 0,
          ),
        ),
      ),
    );
  }
}