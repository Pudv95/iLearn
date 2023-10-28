import 'package:ilearn/Resources/imports.dart';
import 'package:password_strength/password_strength.dart';

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
  getPasswordStrength(password) {
    return estimatePasswordStrength(password);
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