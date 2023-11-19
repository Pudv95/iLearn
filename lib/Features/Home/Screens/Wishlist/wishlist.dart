import 'package:ilearn/Features/Home/Screens/Search/Widgets/search_result.dart';
import 'package:ilearn/Features/Home/Screens/Widgets/bottom_navigation_bar.dart';
import 'package:ilearn/Features/Home/Services/courses.dart';
import 'package:ilearn/Resources/imports.dart';

import '../../../../Models/student_model.dart';
import '../Widgets/actions.dart';

class MyWishlist extends StatefulWidget {
  final int currPage;
  final PageController pageController;
  final User user;
  const MyWishlist({super.key, required this.currPage, required this.pageController, required this.user});

  @override
  State<MyWishlist> createState() => _MyWishlistState();
}

class _MyWishlistState extends State<MyWishlist> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Padding(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Text(
              'Wishlist',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ),
          actions: ActionBar(context: context, pageIndex: 3, controller: widget.pageController, user: widget.user).actionList(),
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: ListView.builder(
          itemCount: widget.user.wishlist!.length,
          itemBuilder: (BuildContext context, int index) {
            return FutureBuilder(future: GetCourse().getCourseById(widget.user.wishlist![index]), builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if(snapshot.connectionState == ConnectionState.done && snapshot.hasData){
                Course course = snapshot.data;
                return SearchResults(course: course, pageController: widget.pageController, user: widget.user);
              }
              else{
                return const CircularProgressIndicator();
              }
            },);
          },),
        bottomNavigationBar: CustomBottomNavigationBar(currPage: widget.currPage, onTap: (ind){
          widget.pageController.jumpToPage(ind);
          Navigator.pop(context);
        })
    ));
  }
}
