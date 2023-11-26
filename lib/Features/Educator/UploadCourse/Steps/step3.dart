import 'package:ilearn/Features/Educator/Services/services.dart';
import 'package:ilearn/Features/Educator/UploadCourse/Steps/course_published.dart';
import 'package:ilearn/Resources/imports.dart';
import '../../../../Models/student_model.dart';
import '../Widgets/headings.dart';

class Step3 extends StatefulWidget {
  final User user;
  final Course myCourse;
  const Step3({super.key, required this.myCourse, required this.user});

  @override
  State<Step3> createState() => _Step3State();
}

class _Step3State extends State<Step3> {
  @override
  Widget build(BuildContext context) {
    print(widget.myCourse);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: (80/height)*height,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Padding(
          padding: EdgeInsets.only(left: (15/width)*width, right: (15/width)*width),
          child: const Text(
            'Step 3.',
            style: TextStyle(
                color: Colors.black,
                fontSize: 34,
                fontWeight: FontWeight.bold),
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 30,top: 10,right: 50),
        child: ListView(
          children: [
            const SizedBox(height: 30,),
            const CustomTitle(title: 'Set Course Price'),
            const SizedBox(height: 10,),
            TextFormField(
              keyboardType: TextInputType.number,
              enableInteractiveSelection: false,
              onChanged: (value){
                widget.myCourse.price = value;
              },
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(style: BorderStyle.none, width: 0)),
                fillColor: const Color(0xFFF1F1F1),
                filled: true,
                label: const Text('Enter Price in INR'),
              ),
              cursorColor: AllColor.textFormText,
            ),
            const SizedBox(height: 30,),
            const CustomTitle(title: 'Set Course Duration'),
            const SizedBox(height: 10,),
            TextFormField(
              enableInteractiveSelection: false,
              onChanged: (value){
                widget.myCourse.duration = value;
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(

                floatingLabelBehavior: FloatingLabelBehavior.never,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(style: BorderStyle.none, width: 0)),
                fillColor: const Color(0xFFF1F1F1),
                filled: true,
                label: const Text(' Enter Duration in hours'),
              ),
              cursorColor: AllColor.textFormText,
            ),
            const SizedBox(height: 30,),
            CustomLoginButton(onPress: ()async{
              await Services().publishCourse(widget.myCourse);
              myToast(false, 'Course published Successfully');
              if (context.mounted) {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>PublishedCourseScreen(user:  widget.user,)));
              }
            }, data: 'Publish Course',color: AllColor.primaryFocusColor,),
            const SizedBox(height: 10,),
            SizedBox(
                height: 45,
                width: double.maxFinite,
                child: OutlinedButton(
                    style: ButtonStyle(
                        side: MaterialStatePropertyAll<BorderSide>(
                            BorderSide(color: AllColor.primaryFocusColor)),
                        shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)))),
                    onPressed: () {Navigator.pop(context);},
                    child: Text(
                      'Previous Step',
                      style: TextStyle(
                        color: AllColor.primaryFocusColor,
                        fontSize: 18,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w500,
                      ),
                    ))),
          ],
        ),
      ),
    );
  }
}