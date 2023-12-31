import 'dart:ui';
import 'package:ilearn/Features/Home/Services/courses.dart';
import 'package:ilearn/Resources/imports.dart';
import 'package:ilearn/Features/Home/Control/data_parse.dart';
import 'package:ilearn/Features/Home/Screens/Widgets/bottom_navigation_bar.dart';
import '../../../../Models/student_model.dart';
import '../../Control/control.dart';
import '../../Services/user.dart';

class CourseDescription extends StatefulWidget {
  final User user;
  final PageController pageController;
  final Course course;
  const CourseDescription(
      {super.key, required this.course, required this.pageController, required this.user});

  @override
  State<CourseDescription> createState() => _CourseDescriptionState();
}

class _CourseDescriptionState extends State<CourseDescription> {
  bool isWishListed(){
    String? courseId = widget.course.id;
    for(var item in widget.user.wishlist!){
      if(item == courseId) return true;
    }
    return false;
  }
  Future<void> handleCartSystem(String courseId)async{
    if(Control().inCart(courseId, widget.user.cart!)){
      await UserFunctions().handleCartList(courseId:courseId);
      widget.user.cart!.remove(courseId);
    }
    else{
      await UserFunctions().handleCartList(courseId: courseId,deleting: false);
      widget.user.cart!.add(courseId);
    }
    setState((){

    });
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: size.height * 0.3,
            width: double.maxFinite,
            child: Stack(
              children: [
                Center(child: Image.network( errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
      return const Icon(Icons.broken_image);
      },ParseData().parseUrl(widget.course.thumbnail!)),),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Stack(
                    children: [
                      Positioned(
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.6),
                              shape: BoxShape.circle),
                        ),
                      ),
                      Positioned(
                        top: 2,
                        right: 0,
                        child: IconButton(
                          onPressed: () async {
                            {
                              setState(() async {
                                if(isWishListed()){
                                  await UserFunctions().handleWishList(courseId: widget.course.id!);
                                  widget.user.wishlist!.remove(widget.course.id!);
                                }
                                else{
                                  await UserFunctions().handleWishList(courseId: widget.course.id!,deleting: false);
                                  widget.user.wishlist!.add(widget.course.id!);
                                }
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
                ),
                Positioned(
                  left: 10,
                  top: 10,
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                      )),
                ),
                Positioned(
                    top: 140,
                    left: 30,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 52, sigmaY: 52),
                        blendMode: BlendMode.src,
                        child: Stack(
                          children: [
                            Positioned(
                              top: 10,
                              left: 10,
                              child: Row(
                                children: [
                                  const Text(
                                    'Premium course',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontFamily: 'SF Pro Display',
                                      fontWeight: FontWeight.w200,
                                    ),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.3,
                                  ),
                                  Text(
                                    widget.course.rating.toString(),
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  const Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  )
                                ],
                              ),
                            ),
                            Positioned(
                              top: 30,
                              left: 10,
                              child: Text(
                                widget.course.courseTitle!,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'SF Pro Display',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 55,
                              left: 10,
                              child: Text(
                                widget.course.createdBy!['name'],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontFamily: 'SF Pro Display',
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.3),
                              ),
                              height: size.height * 0.1,
                              width: size.width * 0.8,
                            ),
                          ],
                        ),
                      ),
                    ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Description',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontFamily: 'SF Pro Text',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                RichText(
                    text: TextSpan(
                  text: widget.course.courseDescription,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: 'SF UI Text',
                      fontWeight: FontWeight.w400,
                      wordSpacing: 1.5,
                      height: 1.2),
                )),
                SizedBox(
                  height: size.height * 0.05,
                ),
                Row(
                  children: [
                    AllIcons.learningIcon,
                    SizedBox(
                      width: size.width * 0.03,
                    ),
                    const Text(
                      'Preview this course',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'SF Pro Text',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        const Text(
                          'Course pricing',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Text(
                          '₹${widget.course.price.toString()}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      children: [
                        const Text(
                          'Course duration',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Text(
                          '${widget.course.duration!.toString()} hours',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                CustomLoginButton(onPress: () async {}, data: 'Buy Now',color: const Color(0xFF246E9E),),
                SizedBox(
                  height: size.height * 0.015,
                ),
                SizedBox(
                    height: 45,
                    width: size.width,
                    child: OutlinedButton(
                        style: ButtonStyle(
                            side: MaterialStatePropertyAll<BorderSide>(
                                BorderSide(color: AllColor.primaryFocusColor)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)))),
                        onPressed: () async {
                            handleCartSystem(widget.course.id!);
                        },
                        child: Text(
                          'Add to cart',
                          style: TextStyle(
                            color: AllColor.primaryFocusColor,
                            fontSize: 18,
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w500,
                          ),
                        ))),
                SizedBox(
                  height: size.height * 0.02,
                ),
                const Text(
                  'Educational Plan',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontFamily: 'SF Pro Text',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: size.height * 0.09,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(color: AllColor.primaryFocusColor),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Column(children: [
                          Text(
                            widget.course.totalStudents!.toString(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontFamily: 'SF Pro Display',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Text(
                            'Active learners',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: 'SF Pro Display',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],),
                        VerticalDivider(color: AllColor.primaryFocusColor,thickness: 1,),
                        Expanded(child: Column(children: [
                          Text(
                            widget.course.videos!.length.toString(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontFamily: 'SF Pro Display',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Text(
                            'Lectures',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: 'SF Pro Display',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],)),
                        VerticalDivider(color: AllColor.primaryFocusColor,thickness: 1,),
                        Expanded(child: Column(children: [
                          Text(
                            widget.course.duration.toString(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontFamily: 'SF Pro Display',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Text(
                            'Hours',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: 'SF Pro Display',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],)),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                const Text(
                  'Additional',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontFamily: 'SF Pro Text',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
                const AdditionalTexts(
                    title: 'Certificates: ', content: 'Provided'),
                const AdditionalTexts(
                    title: 'Subtitles: ', content: 'Hindi/English'),
                const AdditionalTexts(
                    title: 'Files: ', content: '10 additional Files'),
                const AdditionalTexts(
                    title: 'Access: ', content: 'LifeTime Access'),
                SizedBox(
                  height: size.height * 0.02,
                ),
                const Text(
                  'Your Tutor',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontFamily: 'SF Pro Text',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Row(
                  children: [
                   const  CircleAvatar(
                      radius: 70,
                      backgroundImage: NetworkImage('https://buffer.com/cdn-cgi/image/w=1000,fit=contain,q=90,f=auto/library/content/images/size/w1200/2023/10/free-images.jpg'),
                    ),
                    const SizedBox(width: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.course.createdBy!['name'],style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                        ),
                            ),
                        const SizedBox(height: 10,),
                        const Text('Software Developer',style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                        ),),
                        const SizedBox(height:  10,),
                        const Text('8+ years of Experience',style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                        ),)
                      ],
                    )
                  ],
                ),
                const SizedBox(height:  10,),
                const Text(
                  'Reviews',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontFamily: 'SF Pro Text',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
                const SizedBox(height:10),
                FutureBuilder(future: GetCourse().getCourseReview(widget.course.id!), builder: (context, snapshot){
                  if(snapshot.connectionState == ConnectionState.done){
                    if(snapshot.hasData){
                      List reviews = snapshot.data as List;
                      ListView.builder(itemCount: reviews.length,itemBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const CircleAvatar(),
                                  Text(reviews[index]['name']),
                                ],
                              ),
                              RichText(text: TextSpan(text : reviews[index]['review'].toString()))
                            ],
                          ),

                        );
                      },);
                    }
                    else{
                      return const Text('No Reviews');
                    }
                  }
                  else{
                    return const Center(child: CircularProgressIndicator(),);
                  }
                  return const Center(child: CircularProgressIndicator(),);
                })
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
          currPage: 0,
          onTap: (ind) {
            widget.pageController.jumpToPage(ind);
            Navigator.pop(context);
          }),
    );
  }
}

class AdditionalTexts extends StatelessWidget {
  final String title;
  final String content;
  const AdditionalTexts(
      {super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const Icon(Icons.add),
          const SizedBox(
            width: 10,
          ),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'SF Pro Text',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: content,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'SF Pro Text',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
