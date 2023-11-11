import 'package:ilearn/Resources/imports.dart';
class StreakCalendar extends StatelessWidget {
  final int streak;
  const StreakCalendar({super.key, required this.streak});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: height * 0.2155,
              width: double.infinity,
              child: Card(
                elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: const Color.fromRGBO(225, 243, 255, 1),
                  child: SizedBox(
                    height: height * 0.06928,
                    width: width * 0.24305,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30, top: 10),
                      child: Row(
                        children: [
                          SizedBox(
                            height: height * 0.17784,
                            width: width * 0.34027,
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
                                    Text(
                                      '$streak',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 80),
                                    ),
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    Column(children: [
                                      SizedBox(height: height * 0.05528),
                                      const Text(
                                        'Days',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontFamily: 'SF Pro Text',
                                          fontWeight: FontWeight.w600,
                                          height: 0,
                                        ),
                                      ),
                                    ])
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
            ),
          ],
        ),
        Positioned(
            right: height * 0.023856,
            bottom: width * 0.08076,
            child: AllIcons.calendarImage),
      ],
    );
  }
}