import 'dart:developer';
import 'dart:io';
import 'package:image_picker/image_picker.dart';


class Control{

  final picker = ImagePicker();

  Future getImageFromGallery() async {
    log('heyy');
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        File image = File(pickedFile.path);
        return image;
      }
      return null;
  }


}