import 'package:ilearn/Resources/imports.dart';

class InputTextField extends StatefulWidget {
  final FocusNode focusNode;
  final String? Function(String?) validator;
  final String data;
  final Icon icon;
  final bool isPasswordField;
  final bool hasError;
  final void Function()? onTap;
  final TextEditingController textEditingController;
  const InputTextField(
      {super.key,
      required this.focusNode,
      required this.validator,
      required this.data,
      required this.icon,
      this.isPasswordField = false,
      this.onTap,
      this.hasError = false,
      required this.textEditingController});

  @override
  State<InputTextField> createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {
  bool showPassword = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        onTap: widget.onTap,
        controller: widget.textEditingController,
        focusNode: widget.focusNode,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          prefixIcon: widget.icon,
          prefixIconColor: Colors.grey,
          suffixIcon: (!widget.isPasswordField)
              ? const SizedBox()
              : IconButton(
                  onPressed: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                  icon: (!showPassword)
                      ? const Icon(Icons.visibility)
                      : const Icon(Icons.visibility_off),
                ),
          suffixIconColor: Colors.grey,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(style: BorderStyle.none, width: 0)),
          fillColor: (widget.hasError)
              ? AllColor.errorRed
              : (!widget.focusNode.hasFocus)
                  ? AllColor.textFormBox
                  : AllColor.textFormBoxFocus,
          filled: true,
          label: Text(widget.data),
          focusColor: AllColor.textFormBoxFocus,
        ),
        obscureText: (showPassword && widget.isPasswordField) ? true : false,
        cursorColor: AllColor.textFormText,
        validator: (value) {
          return widget.validator(value);
        });
  }
}
