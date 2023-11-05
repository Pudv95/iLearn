import 'package:ilearn/Resources/imports.dart';

class Library extends StatefulWidget {
  const Library({super.key});

  @override
  State<Library> createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  final List<IconButtonData> buttonData = [
    IconButtonData(title: 'Your Learnings', icon: AllIcons.learningIcon, onPressed: () {}),
    IconButtonData(title: 'Popular', icon: AllIcons.trendingIcon, onPressed: () {}),
    IconButtonData(title: 'Teach at iLearn', icon: AllIcons.teachIcon, onPressed: () {}),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25),
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            toolbarHeight: 80,
            elevation: 0,
            backgroundColor: Colors.white,
            title: const Text(
              'Library',
              style: TextStyle(color: Colors.black, fontSize: 24,fontWeight: FontWeight.bold),
            ),
            actions: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.favorite_outline,
                  size: 30,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.notifications,
                  size: 30,
                ),
              ),
            ],
            iconTheme: const IconThemeData(color: Colors.black),
          ),
          body: Column(
            children: [
              Wrap(
                  children: List.generate(buttonData.length, (index) {
                return IconElevatedButton(
                  title: buttonData[index].title,
                  icon: buttonData[index].icon,
                  onPress: buttonData[index].onPressed,
                );
              })),
              const SizedBox(height: 40,),
              const StreakCalendar(streak: 10,),
            ],
          )),
    );
  }
}

class IconElevatedButton extends StatelessWidget {
  final String title;
  final Image icon;
  final void Function()? onPress;
  const IconElevatedButton(
      {super.key,
      required this.title,
      required this.icon,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SizedBox(
        height: 40,
        child: ElevatedButton.icon(
          onPressed: onPress,
          icon: icon,
          label: Text(
            title,
            style: TextStyle(color: AllColor.iconButtonTextColor,fontSize: 16,fontWeight: FontWeight.bold),
          ),
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            backgroundColor: AllColor.iconButtonColor,
            elevation: 0,
          ),
        ),
      ),
    );
  }
}

class IconButtonData {
  String title;
  Image icon;
  void Function() onPressed;
  IconButtonData(
      {required this.title, required this.icon, required this.onPressed});
}

class StreakCalendar extends StatelessWidget {
  final int streak;
  const StreakCalendar({super.key, required this.streak});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    print(10/height);
    double width = MediaQuery.of(context).size.width;
    print(25/width);
    return Stack(
      children: [
        Column(
          children: [
            const SizedBox(height: 20,),
            SizedBox(
              height: height*0.20155,
              width: width*0.82881,
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                color: const Color.fromRGBO(225, 243, 255, 1),
                child:  SizedBox(
                  height: height*0.05928,
                  width: width*0.24305,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      children: [
                        SizedBox(
                          height: height*0.17784,width: width*0.34027,
                          child: Wrap(
                            children: [
                              const Text(
                                'Your Current \nStreak',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  height: 0,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('$streak',style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 80),),
                                  const SizedBox(width: 10,),
                                  Column(children: [
                                    SizedBox(height: height*0.05928),
                                    const Text('Days',style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontFamily: 'SF Pro Text',
                                      fontWeight: FontWeight.w600,
                                      height: 0,
                                    ),),
                                  ])
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ),
            ),
          ],
        ),
        Positioned(right:height*0.011856,bottom: width*0.06076,child: AllIcons.calendarImage),
      ],
    );
  }
}



