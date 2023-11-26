import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

class LectureModel{
  XFile? lecture;
  String? lectureTitle;
  PlatformFile? notes;

  LectureModel({this.lecture,this.notes,this.lectureTitle});

}