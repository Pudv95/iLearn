import 'package:ilearn/Resources/imports.dart';

class CustomLoginButton extends StatefulWidget {
  final GlobalKey<FormState>? formKey;
  final Function onPress;
  final String data;
  const CustomLoginButton(
      {super.key, this.formKey, required this.onPress, required this.data});

  @override
  State<CustomLoginButton> createState() => _CustomLoginButtonState();
}

class _CustomLoginButtonState extends State<CustomLoginButton> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return SizedBox(
        width: double.infinity,
        height: height * 0.05,
        child: ElevatedButton(
            onPressed: () async {
              setState(() {
                loading = true;
              });
              await widget.onPress();
            },
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(AllColor.primaryButtonColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ))),
            child: (!loading)
                ? Text(widget.data)
                : const SizedBox(height: 25,width: 25,child: CircularProgressIndicator(),)
        ));
  }
}
