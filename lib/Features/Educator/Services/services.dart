import 'dart:convert';
import 'dart:developer';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:ilearn/Features/Authentication/Widgets/toast.dart';
import 'package:ilearn/Models/course.dart';
import 'package:http_parser/http_parser.dart';
import '../../../Models/lecture_model.dart';
import 'package:http/http.dart' as http;

class Services{
  final storage = const FlutterSecureStorage();
  Dio dio = Dio();
  final String baseURl = dotenv.get('BaseUrl');

  createCourse(Map<String,dynamic> course) async {
    String? token = await storage.read(key: 'token');
    print(token);
    final img = await MultipartFile.fromFile(
      course['image'].path,
      filename: 'thumbnail.jpg',
      contentType: MediaType('image','jpeg')
    );
    FormData data = FormData.fromMap({
      'title': course['title'],
      'category' : course['category'],
      'description' : course['description'],
      'image': img,
    });
    var response = await dio.post('$baseURl/create-course', data: data,options: Options(headers: {
      "Authorization":
      "Bearer $token",
    }));

    if(response.statusCode == 201){
      String id = response.data['data']['courseId'];
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

  uploadVideos(List<LectureModel> lectures,String courseId) async {
    String? token = await storage.read(key: 'token');
    for (int i = 0; i < lectures.length; i++) {
      LectureModel lecture = lectures[i];
      FormData formData;
      print(lecture.lectureTitle);
      if (lecture.notes != null) {
        formData = FormData.fromMap({
          'video': await MultipartFile.fromFile(lecture.lecture.path,filename: lecture.lectureTitle),
          'videoTitle' : 'title',
          'notes': await MultipartFile.fromFile(lecture.notes!.path!,filename: lecture.notes!.name)
        });
      }
      else{
        formData = FormData.fromMap({
          'video': await MultipartFile.fromFile(lecture.lecture.path,filename: lecture.lectureTitle),
          'videoTitle' : 'title 1'
        });
      }
      try {
        Response response = await dio.post(
          '$baseURl/upload-video/$courseId',
          data: formData,
          options: Options(headers: {
            "Authorization":
            "Bearer $token",
          })
        );

        if(response.statusCode == 200){
          var data = response.data;
          print(data);
          myToast(true, '${lecture.lectureTitle} uploaded successfully');
        }
        print('Response for lecture $i: ${response.data}');
      } catch (e) {
        print('Error uploading lecture $i: $e');
      }
    }
  }

  publishCourse(Course course)async{
    print(course.id);
    String? token = await storage.read(key: 'token');
    print(token);
    var url = Uri.parse('$baseURl/publish-course/${course.id}');
    var headers = {'Authorization': 'Bearer $token'};
    var body = {
      'price':course.id,
      'category':course.category,
      'duration':course.duration
    };
    var response = await http.post(url,headers: headers,body: body);
    print(response.body);
    print('abcdef');
    if(response.statusCode == 200){
      myToast(false, 'Course published successfully');
    }
    else{
      myToast(true, 'errrr..... error');
    }
  }


}