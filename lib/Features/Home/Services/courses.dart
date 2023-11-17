import 'dart:convert';
import 'dart:developer';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:ilearn/Resources/imports.dart';
import 'package:ilearn/Features/Home/Control/data_parse.dart';

class GetCourse {
  final storage = const FlutterSecureStorage();
  final String baseURl = dotenv.get('BaseUrl');

  getCategoryCourse(String category) async {
    String? token = await storage.read(key: 'token');

    var headers = {'Authorization': 'Bearer $token'};

    var response = await http.get(
      Uri.parse('$baseURl/getCourse?page=1&pagesize=5'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = json.decode(response.body);
      List<Course> courses = await ParseData().parseCourses(jsonData);
      return courses;
    } else {
      print('Error: ${response.reasonPhrase}');
    }
  }

  getCourseById(String courseId) async {
    String? token = await storage.read(key: 'token');
    var headers = {'Authorization': 'Bearer $token'};

    var response = await http.get(Uri.parse('$baseURl/getCourseById/$courseId'),
        headers: headers);

    if (response.statusCode == 200) {
      Map<String, dynamic> courseJSON =
          jsonDecode(response.body)['data']['course'];
      Course course = Course.fromJson(courseJSON);
      return course;
    } else {
      myToast(true, 'Couldn\'t fetch course');
    }
  }

  searchCourse(String query) async {
    String? token = await storage.read(key: 'token');
    var headers = {'Authorization': 'Bearer $token'};
    query = query.toLowerCase();
    try {
      var response = await http.get(
          Uri.parse(
              '$baseURl/search-course/?coursetitle=$query&page=1&pagesize=2'),
          // https://udemy-nx1v.onrender.com/search-course/?coursetitle=fl&page=1&pagesize=2
          headers: headers);
      // print(response.body);
      if (response.statusCode == 200) {
        Map<String, dynamic> course = jsonDecode(response.body);
        return ParseData().parseCourses(course);
      } else {
        myToast(true, 'Couldn\'t fetch courses');
        print('${response.statusCode} :=> ${response.body}');
        return [];
      }
    } on Exception catch (e) {
      myToast(true, 'Couldn\'t fetch courses');
      print(e.toString());
      return [];
    }
  }
}
