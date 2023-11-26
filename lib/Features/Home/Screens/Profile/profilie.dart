import 'dart:developer';
import 'package:ilearn/Features/Home/Screens/Widgets/actions.dart';
import 'package:ilearn/Features/Home/Control/control.dart';
import 'package:ilearn/Features/Home/Services/user.dart';
import 'package:ilearn/Resources/imports.dart';
import 'package:ilearn/Features/Home/Screens/Library/Models/icon_button_data.dart';
import 'package:ilearn/Features/Home/Screens/Library/Widgets/top_course_button.dart';
import '../../../../Models/student_model.dart';

class Profile extends StatefulWidget {
  final PageController pageController;
  final User user;
  final bool learner;
  const Profile(
      {super.key,
      required this.user,
      required this.pageController,
      this.learner = true});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Padding(
          padding: EdgeInsets.only(left: 15, right: 15),
          child: Text(
            'Profile',
            style: TextStyle(
                color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        actions: ActionBar(
                context: context,
                pageIndex: 3,
                controller: widget.pageController,
                user: widget.user)
            .actionList(),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
        child: ListView(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.black,
                  child: Text(
                    widget.user.name![0].toUpperCase(),
                    style: const TextStyle(fontSize: 40, color: Colors.white),
                  ),
                ),
                const SizedBox(width: 15),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.user.name!.toUpperCase(),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w600,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          '@${widget.user.username!}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 11),
                    Text(
                      widget.user.email!,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                CategoriesButton(
                    iconButtonData: IconButtonData(
                        title: 'Edit Profile',
                        icon: null,
                        onPressed: () async {})),
                CategoriesButton(
                    iconButtonData: IconButtonData(
                        title: widget.learner
                            ? 'Teach at iLearn'
                            : 'Back to Learner',
                        icon: AllIcons.teachIcon,
                        onPressed:()async{
                          await Control().switchSide(widget.learner, context, widget.user);
                        }))
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Your Certificates',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontFamily: 'SF Pro Text',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
            ),
            (widget.user.completeCourse!.isNotEmpty)
                ? SizedBox(
                    height: 100,
                    width: double.maxFinite,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.user.completeCourse!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container();
                      },
                    ),
                  )
                : const Text(
                    'You don\'t have any certificates',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'SF Pro Text',
                      fontWeight: FontWeight.w400,
                      height: 2,
                    ),
                  ),
            ProfileButton(label: 'Your Learnings', onTap: () {}),
            ProfileButton(label: 'Wishlist', onTap: () {}),
            ProfileButton(label: 'Your Cart', onTap: () {}),
            ProfileButton(label: 'Notification', onTap: () {}),
            ProfileButton(label: 'Help', onTap: () {}),
            ProfileButton(
              label: 'Log Out',
              onTap: () async {
                await UserFunctions().logoutUser(context);
              },
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileButton extends StatelessWidget {
  final String label;
  final void Function() onTap;
  final Color? color;
  const ProfileButton(
      {super.key,
      required this.label,
      required this.onTap,
      this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton(
          onPressed: onTap,
          child: Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 18,
              fontFamily: 'SF Pro Text',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const Divider(),
      ],
    );
  }
}
