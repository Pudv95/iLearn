import 'package:ilearn/Features/Home/Services/user.dart';
import 'package:ilearn/Resources/imports.dart';

import '../../../../../Models/student_model.dart';
import '../../../Control/data_parse.dart';
import '../../Course/course_description.dart';

class CoursesForMeCards extends StatefulWidget {
  final User user;
  final PageController pageController;
  final Course course;
  const CoursesForMeCards({super.key, required this.course, required this.pageController, required this.user});

  @override
  State<CoursesForMeCards> createState() => _CoursesForMeCardsState();
}

class _CoursesForMeCardsState extends State<CoursesForMeCards> {

  bool isWishListed(){
    String? courseId = widget.course.id;
    for(var item in widget.user.wishlist!){
      if(item == courseId) return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      CourseDescription(course: widget.course, pageController: widget.pageController, user: widget.user,)));
      },
      child: SizedBox(
        width: size.width * 0.90,
        height: size.height * 0.01,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: (180/size.height)*size.height,
              child: Stack(
                children: [
                  Center(child: Image.network(
                    ParseData().parseUrl(widget.course.thumbnail!,),
                    fit: BoxFit.cover,scale: 0.5,
                      errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                        return const Icon(Icons.broken_image);
                      },
                  ),),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Stack(
                      children: [
                        Container(
                          height: (40/size.height)*size.height,
                          width: (40/size.width)*size.width,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.6),
                            shape: BoxShape.circle
                          ),
                        ),
                        Positioned(
                          top: -2,
                          right:-5,
                          child: IconButton(
                            onPressed: () async {
                              {
                                if(isWishListed()){
                                  await UserFunctions().handleWishList(courseId: widget.course.id!);
                                  widget.user.wishlist!.remove(widget.course.id!);
                                }
                                else{
                                  await UserFunctions().handleWishList(courseId: widget.course.id!,deleting: false);
                                  widget.user.wishlist!.add(widget.course.id!);
                                }
                                setState((){

                                });
                              }
                            },
                            icon: Icon((isWishListed())
                                ? Icons.favorite
                                : Icons.favorite_border),
                            color: AllColor.iconColor,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: (10/size.height)*size.height,
            ),
            Wrap(
              children: [
                Text(
                  widget.course.courseTitle ?? '',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
            Text(
              widget.course.createdBy!['name'],
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: 'Sofia Sans',
                fontWeight: FontWeight.w400,
              ),
            ),
            Row(
              children: [
                Text(widget.course.rating.toString(),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w400,
                    )),
                Icon(
                  Icons.star,
                  color: AllColor.iconColor,
                ),
                SizedBox(width: size.width*0.55,),
                Text(
                  '₹${widget.course.price.toString()}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}