
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import '../../../Models/course.dart';

class GetCourse{
  final storage = const FlutterSecureStorage();
  final String baseURl = dotenv.get('BaseUrl');

  List<Course> parseCourses(Map<String, dynamic> jsonData) {
    final List coursesJson = jsonData['data']['courses'];
    List<Course> courses = [];
    for (var courseJson in coursesJson) {
      courses.add(Course.fromJson(courseJson));
    }

    return courses;
  }


  getCategoryCourse(String category) async {

    String? token = await storage.read(key: 'token');

    var headers = {
      'Authorization':
      'Bearer $token'
    };

    var response = await http.get(
      Uri.parse('$baseURl/getCourseBycategory/$category'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = json.decode(response.body);
      List<Course> courses = parseCourses(jsonData);
      return courses;
    } else {
      print('Error: ${response.reasonPhrase}');
    }
  }

}