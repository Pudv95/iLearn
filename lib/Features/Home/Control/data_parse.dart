
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../Models/course.dart';
import '../Services/courses.dart';

class ParseData{
  final String baseUrl = dotenv.get('BaseUrl');


  String parseUrl(String thumbnail) {
    // String actualURI = thumbnail.replaceAll('public', '');
    Uri url = Uri.parse('$baseUrl/$thumbnail');
    return url.toString();
  }

  Future<List<Course>> parseCourses(Map<String, dynamic> jsonData) async {
    final List coursesJson = jsonData['data']['courses'];
    List<Course> courses = [];
    for (var courseJson in coursesJson) {
      Map<String,dynamic> course = courseJson;
      String? id = course['_id'];
      Course c = await GetCourse().getCourseById(id!);
      courses.add(c);
    }
    return courses;
  }

  double parseHours(List videos){
    double seconds = 0;
    for(var video in videos){
      seconds += video['videoDuration'];
    }
    seconds /= (60*60);
    double hours = double.parse(seconds.toStringAsFixed(3));
    return hours;
  }
}