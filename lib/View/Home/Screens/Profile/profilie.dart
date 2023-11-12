import 'package:ilearn/Resources/imports.dart';
import 'package:ilearn/View/Home/Screens/Library/Models/icon_button_data.dart';
import 'package:ilearn/View/Home/Screens/Library/Widgets/top_course_button.dart';
import 'package:ilearn/View/Home/Services/courses.dart';

import '../../../../Models/student_model.dart';

class Profile extends StatefulWidget {
  final User user;
  const Profile({super.key,required this.user});

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
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
        ),
        actions: const [
          Icon(
            Icons.favorite_outline,
            size: 30,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Icon(
              Icons.shopping_cart_outlined,size: 30,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 30),
            child: Icon(
              Icons.notifications_none_outlined,
              size: 30,
            ),
          ),
        ],
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30,left: 15,right: 15),
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.black,
                  child: Text(widget.user.name![0].toUpperCase(),style: TextStyle(fontSize: 40,color: Colors.white),),
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
                              widget.user.name!,
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
            SizedBox(height: 10),
            Row(
              children: [
                CategoriesButton(iconButtonData: IconButtonData(title: 'Edit Profile', icon: null, onPressed: (){})),
                CategoriesButton(iconButtonData: IconButtonData(title: 'Teach at iLearn', icon: AllIcons.teachIcon, onPressed: (){}))
              ],
            ),

          ],
        ),
      ),
    );
  }
}
