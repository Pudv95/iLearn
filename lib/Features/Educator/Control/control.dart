import 'dart:developer';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:ilearn/Models/lecture_model.dart';
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
    final pickedFile = await imagePicker.pickVideo(source: ImageSource.gallery);
    if (pickedFile != null) {
      return pickedFile;
    }
    return null;
  }

  pickFile()async{
    filePickerResult = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: false,
      allowedExtensions: ['pdf', 'ppt', 'jpeg', 'png', 'word'],
    );
    return filePickerResult!.files[0];
  }



}