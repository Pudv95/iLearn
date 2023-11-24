import 'dart:convert';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:ilearn/Features/Authentication/Widgets/toast.dart';
import 'package:ilearn/Models/course.dart';

class Services{
  final storage = const FlutterSecureStorage();
  final String baseURl = dotenv.get('BaseUrl');

  createCourse(Map<String,dynamic> course) async {
    String? token = await storage.read(key: 'token');
    final img = await MultipartFile.fromFile(
      course['image'].path,
      filename: 'thumbnail',
    );

    FormData data = FormData.fromMap({
      'title': course['title'],
      'category' : course['category'],
      'description' : course['description'],
      'image': img,
    });
    Dio dio = Dio();
    var response = await dio.post('$baseURl/create-course', data: data,options: Options(headers: {
      "Authorization":
      "Bearer $token",
    }));
    print(response.statusCode);
    print(response.data);
    if(response.statusCode == 201){
      String id = response.data['data']['courseId'];
      print(id);
      Course newCourse = Course(id: id);
      return newCourse;
    }
    else if(response.statusCode == 400){
      myToast(true, 'Please select different course title');
      return null;
    }
    else{
      print('error ${response.data}');
      myToast(false, jsonDecode(response.data)['message']);
    }
  }

  uploadVideos(List<File> lectures,List<PlatformFile> notes)async{
    final List lecturesData = [];
    final List notesData = [];
    
    for(var item in lecturesData){
      final img = await MultipartFile.fromFile(
        item.path,
        filename: 'Lecture',
      );
      lecturesData.add(img);
    }
  }
}