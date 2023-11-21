import 'package:ilearn/Features/Educator/UploadCourse/Widgets/headings.dart';
import 'package:ilearn/Resources/imports.dart';

class Step1 extends StatefulWidget {
  const Step1({super.key});

  @override
  State<Step1> createState() => _Step1State();
}

class _Step1State extends State<Step1> {
  @override
  Widget build(BuildContext context) {
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
            'Step 1.',
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
            const CustomTitle(title: 'Upload a Thumbnail'),
            const SizedBox(height: 30,),
            Container(
              width: double.maxFinite,
              height: 182,
              decoration: ShapeDecoration(
                color: const Color(0xFFF1F1F1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.image_rounded,size: 50,color: Colors.grey,),
                  Text('Choose a file',style: TextStyle(color: Colors.grey),),
                ],
              ),
            ),
            const SizedBox(height: 30,),
            const CustomTitle(title: 'Course Title'),
            const SizedBox(height: 10,),
            TextFormField(
              enableInteractiveSelection: false,
              onTap: () {},
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(style: BorderStyle.none, width: 0)),
                fillColor: const Color(0xFFF1F1F1),
                filled: true,
                label: const Text('  Choose a catchy title'),
              ),
              cursorColor: AllColor.textFormText,
            ),
            const SizedBox(height: 30,),
            const CustomTitle(title: 'Course Description'),
            const SizedBox(height: 10,),
            TextFormField(
              enableInteractiveSelection: false,
              minLines: 8,
              maxLines: 8,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(style: BorderStyle.none, width: 0)),
                fillColor: const Color(0xFFF1F1F1),
                filled: true,
                hintText: 'Describe your course'
                // label: const Text('Describe Your Course'),
              ),
              cursorColor: AllColor.textFormText,
            ),
            const SizedBox(height: 30,),
            const CustomTitle(title: 'Course Category'),
            const SizedBox(height: 10,),
            const DropDown(),
            const SizedBox(height: 30,),
            CustomLoginButton(onPress: ()async{}, data: 'Next',color: AllColor.primaryFocusColor,),
            const SizedBox(height: 15,),
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
                    onPressed: () {},
                    child: Text(
                      'Cancel',
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

class DropDown extends StatefulWidget {
  const DropDown({super.key});

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
          hintText: 'Describe your course'
        // label: const Text('Describe Your Course'),
      ),
      hint: _dropDownValue == null
          ? const Text('Dropdown')
          : Text(
        _dropDownValue!,
      ),
      isExpanded: true,
      iconSize: 30.0,
      items: ['Flutter', 'Web', 'C++',"Design"].map(
            (val) {
          return DropdownMenuItem<String>(
            value: val,
            child: Text(val),
          );
        },
      ).toList(),
      onChanged: (val) {
        setState(
              () {
            _dropDownValue = val;
          },
        );
      },
    );
  }
}

