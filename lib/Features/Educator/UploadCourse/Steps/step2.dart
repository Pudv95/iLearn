import 'package:file_picker/file_picker.dart';
import 'package:ilearn/Features/Educator/UploadCourse/Steps/step3.dart';
import 'package:ilearn/Features/Educator/UploadCourse/Widgets/headings.dart';
import 'package:ilearn/Resources/imports.dart';
import 'package:ilearn/Features/Educator/Control/control.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../Models/lecture_model.dart';
import '../../../../Models/student_model.dart';
import '../../Services/services.dart';

class Step2 extends StatefulWidget {
  final User user;
  final Course course;
  const Step2({super.key, required this.course, required this.user});

  @override
  State<Step2> createState() => _Step2State();
}

class _Step2State extends State<Step2> {

  final List<LectureModel> lectures = [LectureModel(),];
   @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: (80 / height) * height,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Padding(
          padding: EdgeInsets.only(
              left: (15 / width) * width, right: (15 / width) * width),
          child: const Text(
            'Step 2.',
            style: TextStyle(
                color: Colors.black, fontSize: 34, fontWeight: FontWeight.bold),
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 30, top: 10, right: 50),
        child: ListView(
          children: [
            const SizedBox(
              height: 30,
            ),
            const CustomTitle(title: 'Upload Lectures'),
            const SizedBox(
              height: 10,
            ),
            // if (lectures.isNotEmpty)
            //   SizedBox(
            //     height: (lectures.length.toDouble()) * 70,
            //     child: ListView.builder(
            //       itemCount: lectures.length,
            //       itemBuilder: (BuildContext context, int index) {
            //         return Card(
            //           child: ListTile(
            //             title: Row(
            //               children: [
            //                 const Icon(
            //                   Icons.video_collection_outlined,
            //                   size: 50,
            //                   color: Colors.grey,
            //                 ),
            //                 Text('Lecture ${index + 1}'),
            //                 const Spacer(),
            //                 (lectures[index].notes == null)?IconButton(onPressed: ()async{
            //                   PlatformFile note = await Control().pickFile();
            //                   lectures[index].notes = note;
            //                   setState(() {});
            //                 }, icon: const Icon(Icons.upload)):Container(color: Colors.red,width: 10,height: 10,),
            //               ],
            //             ),
            //             trailing: IconButton(
            //                 onPressed: () {
            //                   setState(() {
            //                     lectures.removeAt(index);
            //                   });
            //                 },
            //                 icon: const Icon(Icons.close)),
            //           ),
            //         );
            //       },
            //     ),
            //   ),
            SizedBox(
              height:240*(lectures.length).toDouble(),
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: lectures.length,
                itemBuilder: (BuildContext context, int index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('Lecture ${index +1}',style: const TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontFamily: 'SF Pro Text',
                        fontWeight: FontWeight.w600,
                        height: 0,
                        )),
                        const Spacer(),
                        if(lectures.length>1)IconButton(onPressed: (){lectures.removeAt(index);setState(() {});}, icon: Icon(Icons.delete))
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () async {
                              XFile lecture = await Control().getVideoFromGallery();
                              lectures[index].lecture = lecture;
                              setState(() {});
                            },
                            child: Container(
                              height: 100,
                              decoration: ShapeDecoration(
                                color: const Color(0xFFF1F1F1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    (lectures[index].lecture == null)?const Icon(
                                      Icons.video_collection_outlined,
                                      size: 55,
                                      color: Colors.grey,
                                    ):const Icon(
                                      Icons.headphones_rounded,
                                      size: 55,
                                      color: Colors.grey,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20,),
                        Expanded(
                          child: InkWell(
                            onTap:()async{
                              PlatformFile note = await Control().pickFile();
                              lectures[index].notes = note;
                            },
                            child: Container(
                            height: 100,
                            decoration: ShapeDecoration(
                              color: const Color(0xFFF1F1F1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child:  Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    (lectures[index].notes == null)?Icons.picture_as_pdf:Icons.select_all,
                                    size: 55,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                            ),
                        ),
                          ),)
                      ],
                    ),
                    const SizedBox(height: 20,),
                    TextFormField(
                      enableInteractiveSelection: false,
                      onChanged: (value) {
                        lectures[index].lectureTitle = value;
                      },
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Lecture Title can\' be empty';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                            const BorderSide(style: BorderStyle.none, width: 0)),
                        fillColor: const Color(0xFFF1F1F1),
                        filled: true,
                        label: const Text('Lecture Title'),
                      ),
                      cursorColor: AllColor.textFormText,
                    ),
                    SizedBox(height: 20,),
                  ],
                );
              },),
            ),
            const SizedBox(height: 20,),
            CustomLoginButton(
              onPress: () async {
                await Services().uploadVideos(lectures,widget.course.id!);
                if (context.mounted) {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Step3(myCourse: widget.course,user: widget.user,)));
                }
              },
              data: 'Next',
              color: AllColor.primaryFocusColor,
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
                height: 45,
                width: double.maxFinite,
                child: OutlinedButton(
                    style: ButtonStyle(
                        side: MaterialStatePropertyAll<BorderSide>(
                            BorderSide(color: AllColor.primaryFocusColor)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)))),
                    onPressed: () {
                      lectures.add(LectureModel());
                      setState(() {

                      });
                    },
                    child: Text(
                      'Upload more lectures',
                      style: TextStyle(
                        color: AllColor.primaryFocusColor,
                        fontSize: 18,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w500,
                      ),
                    ))),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
                height: 45,
                width: double.maxFinite,
                child: OutlinedButton(
                    style: ButtonStyle(
                        side: MaterialStatePropertyAll<BorderSide>(
                            BorderSide(color: AllColor.primaryFocusColor)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)))),
                    onPressed: () {
                      print(lectures[0].notes);
                      lectures.removeAt(0);
                    },
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        color: AllColor.primaryFocusColor,
                        fontSize: 18,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w500,
                      ),
                    ))),
            SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}
