import 'package:ilearn/Models/user_model.dart';
import 'package:ilearn/Resources/imports.dart';
import 'package:ilearn/View/Authentication/Services/authentication.dart';
import '../../Widgets/password_stepper.dart';

class SignUP extends StatefulWidget {
  const SignUP({super.key});

  @override
  State<SignUP> createState() => _SignUPState();
}

class _SignUPState extends State<SignUP> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _usernameFocusNode = FocusNode();

  bool emailHasError = false;
  bool passHasError = false;
  bool nameHasError = false;
  bool usernameHasError = false;

  createModel() {
    UserModel userModel = UserModel(
        userName: _usernameController.text,
        name: _nameController.text,
        email: _emailController.text,
        password: _passwordController.text);
    return userModel;
  }

  @override
  Widget build(BuildContext context) {
    bool isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double myPadding = isKeyboard?height*0.05:height*0.15;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding:
            EdgeInsets.fromLTRB(width * 0.1, height*0.03, width * 0.1, 0),
        child: Column(
          children: [
            AnimatedPadding(
              padding: EdgeInsets.fromLTRB(0, myPadding, 0, 20),
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeIn,
              child: Text(
                'Join Us',
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(height:MediaQuery.of(context).viewInsets.top),
                    InputTextField(
                        hasError: nameHasError,
                        focusNode: _nameFocusNode,
                        onTap: () {
                          setState(() {
                            nameHasError = false;
                          });
                        },
                        validator: (value) {
                          if (Validators().nameValidator(value) != null) {
                            setState(() {
                              nameHasError = true;
                            });
                            return Validators().nameValidator(value);
                          }
                          return null;
                        },
                        data: 'Name',
                        icon: const Icon(Icons.person),
                        textEditingController: _nameController),
                    const SizedBox(
                      height: 20,
                    ),
                    InputTextField(
                        hasError: usernameHasError,
                        focusNode: _usernameFocusNode,
                        validator: (value) {
                          if (Validators().usernameValidator(value) != null) {
                            setState(() {
                              usernameHasError = true;
                            });
                            return Validators().usernameValidator(value);
                          }
                          return null;
                        },
                        onTap: () {
                          setState(() {
                            usernameHasError = false;
                          });
                        },
                        data: 'UserName',
                        icon: const Icon(Icons.attachment_rounded),
                        textEditingController: _usernameController),
                    const SizedBox(
                      height: 20,
                    ),
                    InputTextField(
                        hasError: emailHasError,
                        focusNode: _emailFocusNode,
                        validator: (value) {
                          if (Validators().emailValidator(value) != null) {
                            setState(() {
                              emailHasError = true;
                            });
                            return Validators().emailValidator(value);
                          }
                          return null;
                        },
                        onTap: () {
                          setState(() {
                            emailHasError = false;
                          });
                        },
                        data: 'Email',
                        icon: const Icon(Icons.email_outlined),
                        textEditingController: _emailController),
                    const SizedBox(
                      height: 20,
                    ),
                    InputTextField(
                      hasError: passHasError,
                      focusNode: _passwordFocusNode,
                      onChanged: (value){setState(() {});},
                      validator: (value) {
                        if (Validators().passwordValidator(value) != null) {
                          setState(() {
                            passHasError = true;
                          });
                          return Validators().passwordValidator(value);
                        }
                        return null;
                      },
                      data: 'Password',
                      onTap: () {
                        setState(() {
                          passHasError = false;
                        });
                      },
                      icon: const Icon(Icons.lock),
                      textEditingController: _passwordController,
                      isPasswordField: true,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    PasswordStepper(password: _passwordController.text),
                  ],
                )),
            const SizedBox(
              height: 40,
            ),
            CustomLoginButton(
                formKey: _formKey,
                onPress: () async {
                  if (_formKey.currentState!.validate()) {
                    if (await Authentication().signUpUser(context,createModel())) {
                      if (context.mounted) {
                        await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OtpPage(
                                      email: _emailController.text,
                                      passwordResetting: false,
                                    )));
                      }
                    }
                  }
                },
                data: 'Next'),
            SizedBox(
              height: height * 0.05,
            ),
          ],
        ),
      ),
    );
  }
}
