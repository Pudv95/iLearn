import 'package:ilearn/Resources/imports.dart';

class PasswordStepper extends StatefulWidget {
  final String? password;
  final double width;
  final double margin;
  const PasswordStepper(
      {super.key, required this.password, this.width = 60, this.margin = 18});

  @override
  State<PasswordStepper> createState() => _PasswordStepperState();
}

class _PasswordStepperState extends State<PasswordStepper> {
  getPasswordStrength(input) {
    RegExp upperCaseRegex = RegExp(r'[A-Z]');
    RegExp lowerCaseRegex = RegExp(r'[a-z]');
    RegExp digitRegex = RegExp(r'[0-9]');
    RegExp specialCharRegex = RegExp(r'[$@$!%*#?&]');
    int matchCount = 0;
    if (upperCaseRegex.hasMatch(input)) {
      matchCount++;
    }
    if (lowerCaseRegex.hasMatch(input)) {
      matchCount++;
    }
    if (digitRegex.hasMatch(input)) {
      matchCount++;
    }
    if (specialCharRegex.hasMatch(input)) {
      matchCount++;
    }
    switch (matchCount) {
      case 1:
        return 0.15;
      case 2:
        return 0.30;
      case 3:
        return 0.56;
      case 4:
        return 0.78;
      default:
        return 0.0; // No matches
    }
  }

  getStepperColor() {
    if (getPasswordStrength(widget.password) < 0.25) {
      return Colors.red;
    }
    if (getPasswordStrength(widget.password) < 0.50) {
      return Colors.yellow;
    }
    if (getPasswordStrength(widget.password) < 0.75) {
      return Colors.blue;
    }
    if (getPasswordStrength(widget.password) < 1) {
      return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Password Strength'),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                  width: widget.width,
                  height: 4,
                  margin: EdgeInsets.only(right: widget.margin),
                  decoration: BoxDecoration(
                      color: (widget.password!.isNotEmpty)
                          ? getStepperColor()
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(2)),
                ),
                Container(
                  width: widget.width,
                  height: 4,
                  margin: EdgeInsets.only(right: widget.margin),
                  decoration: BoxDecoration(
                      color: (getPasswordStrength(widget.password) > 0.25)
                          ? getStepperColor()
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(2)),
                ),
                Container(
                  width: widget.width,
                  height: 4,
                  margin: EdgeInsets.only(right: widget.margin),
                  decoration: BoxDecoration(
                      color: (getPasswordStrength(widget.password) > 0.5)
                          ? getStepperColor()
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(2)),
                ),
                Container(
                  width: widget.width,
                  height: 4,
                  margin: EdgeInsets.only(right: widget.margin),
                  decoration: BoxDecoration(
                      color: (getPasswordStrength(widget.password) > 0.75)
                          ? getStepperColor()
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(2)),
                ),
              ],
            ),
          ],
        ));
  }
}