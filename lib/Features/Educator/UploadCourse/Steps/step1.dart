import 'package:ilearn/Features/Educator/Control/control.dart';
import 'package:ilearn/Features/Educator/Services/services.dart';
import 'package:ilearn/Features/Educator/UploadCourse/Steps/step2.dart';
import 'package:ilearn/Features/Educator/UploadCourse/Widgets/headings.dart';
import 'package:ilearn/Resources/imports.dart';
import 'dart:io';
import '../../../../Models/student_model.dart';

class Step1 extends StatefulWidget {
  final User user;
  const Step1({super.key,required  this.user});

  @override
  State<Step1> createState() => _Step1State();
}

class _Step1State extends State<Step1> {
  GlobalKey<FormState> key = GlobalKey<FormState>();
  File? image;
  Map<String, dynamic> newCourse = {};
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
            'Step 1.',
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
            const CustomTitle(title: 'Upload a Thumbnail'),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () async {
                image = await Control().getImageFromGallery();
                newCourse['image'] = image;
                setState(() {});
              },
              child: Container(
                width: double.maxFinite,
                height: 182,
                decoration: ShapeDecoration(
                  color: const Color(0xFFF1F1F1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: (image == null)
                    ? const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.image_rounded,
                            size: 50,
                            color: Colors.grey,
                          ),
                          Text(
                            'Choose a file',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      )
                    : Stack(
                        children: [
                          Positioned(
                              child: SizedBox(
                                  height: double.maxFinite,
                                  width: double.maxFinite,
                                  child: Image.file(
                                    image!,
                                    fit: BoxFit.cover,
                                  ))),
                          Positioned(
                              bottom: 10,
                              right: 10,
                              child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      image = null;
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  )))
                        ],
                      ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Form(
              key: key,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomTitle(title: 'Course Title'),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    enableInteractiveSelection: false,
                    onChanged: (value) {
                      newCourse['title'] = value;
                    },
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Title cannot be empty';
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
                      label: const Text('  Choose a catchy title'),
                    ),
                    cursorColor: AllColor.textFormText,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const CustomTitle(title: 'Course Description'),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    textInputAction: TextInputAction.done,
                    enableInteractiveSelection: false,
                    minLines: 3,
                    maxLines: 8,
                    validator: (value) {
                      if (value!.length < 10) {
                        return 'At least 10 character required';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      newCourse['description'] = value;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(style: BorderStyle.none, width: 0),
                      ),
                      fillColor: const Color(0xFFF1F1F1),
                      filled: true,
                      hintText: 'Describe your course',
                    ),
                    cursorColor: AllColor.textFormText,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const CustomTitle(title: 'Course Category'),
                  const SizedBox(
                    height: 10,
                  ),
                  DropDown(
                    data: newCourse,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            CustomLoginButton(
              onPress: () async {
                if(key.currentState!.validate()){
                  Course myCourse = await Services().createCourse(newCourse);
                  myCourse.category = newCourse['category'];
                  if (context.mounted) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Step2(
                              user: widget.user,
                              course: myCourse,
                            )));
                  }
                }
              },
              data: 'Next',
              color: AllColor.primaryFocusColor,
            ),
            const SizedBox(
              height: 15,
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
                      Navigator.pop(context);
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
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}

class DropDown extends StatefulWidget {
  final Map<String, dynamic> data;
  const DropDown({super.key, required this.data});

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  String? _dropDownValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(style: BorderStyle.none, width: 0)),
          fillColor: const Color(0xFFF1F1F1),
          filled: true,
          ),
      hint: _dropDownValue == null
          ? const Text('Select Category')
          : Text(
              _dropDownValue!,
            ),
      isExpanded: true,
      iconSize: 30.0,
      items: [
        "Web Development",
        "App Development",
        "DSA",
        "UI/UX",
        "AI/ML",
        "Data Science",
        "AR/VR",
        "Personality Development",
        "Photography",
        "Others"
      ].map(
        (val) {
          return DropdownMenuItem<String>(
            value: val,
            child: Text(val),
          );
        },
      ).toList(),
      validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please select an option';
      }
      return null;
    },
      onChanged: (val) {
        setState(
          () {
            widget.data['category'] = val;
            _dropDownValue = val;
          },
        );
      },
    );
  }
}
