import 'dart:developer';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';


class Control{

  final imagePicker = ImagePicker();
  FilePickerResult? filePickerResult;

  Future getImageFromGallery() async {
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        File image = File(pickedFile.path);
        return image;
      }
      return null;
  }
  Future getVideoFromGallery() async {
    final pickedFile = await imagePicker.pickMedia();
    if (pickedFile != null) {
      File image = File(pickedFile.path);
      return image;
    }
    return null;
  }

  pickFile(List<PlatformFile> files)async{
    filePickerResult = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: false,
      allowedExtensions: ['pdf', 'ppt', 'jpeg', 'png', 'word'],
    );
    log('fasdkjhfasdkjhfaskjhfasdkjhfaskjhfasdkjhfasdkjfhasdkfhaskjfhaskljhfalhfalhfalhflahdfslkjhaskjhf');
    print(filePickerResult!.files.toString());
    if(filePickerResult!=null){
      files.addAll(filePickerResult!.files);
    }
  }



}