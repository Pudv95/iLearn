import 'package:flutter/material.dart';
import 'package:ilearn/Resources/colors.dart';

class CustomLoginButton extends StatefulWidget {
  final GlobalKey<FormState>? formKey;
  final Future<void> Function() onPress;
  final String data;

  const CustomLoginButton({
    Key? key,
    this.formKey,
    required this.onPress,
    required this.data,
  }) : super(key: key);

  @override
  State<CustomLoginButton> createState() => _CustomLoginButtonState();
}

class _CustomLoginButtonState extends State<CustomLoginButton> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return SizedBox(
      width: double.infinity,
      height: height * 0.05,
      child: ElevatedButton(
        onPressed: _isLoading ? (){} : () => _handlePress(),
        style: ButtonStyle(
          backgroundColor: (!_isLoading)?MaterialStateProperty.all(AllColor.primaryButtonColor):MaterialStateProperty.all(AllColor.primaryButtonColorDisabled),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
        child: _isLoading
            ? const SizedBox(
              height: 30,
              width: 30,
              child: CircularProgressIndicator(
          color: Colors.white,
        ),
            )
            : Text(widget.data),
      ),
    );
  }

  Future<void> _handlePress() async {
    setState(() {
      _isLoading = true;
    });
    try {
      await widget.onPress();
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
}
