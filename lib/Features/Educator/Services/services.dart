import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class Services{
  final storage = const FlutterSecureStorage();
  final String baseURl = dotenv.get('BaseUrl');

  createCourse(Map<String,dynamic> course) async {
    String? token = await storage.read(key: 'token');
    final img = await MultipartFile.fromFile(
      course['image'].path,
      filename: 'thumbnail',
    );
    //
    //
    // var body = {
    //   'title': course['title'],
    //   'description' : course['description'],
    //   'image': img,
    // };
    FormData data = FormData.fromMap({
      'title': course['title'],
      'category' : course['category'],
      'description' : course['description'],
      'image': img,
    });
    // print(body);
    print('idhar to aa gya yarr mei but aage ni pata kya hoga');
    Dio dio = Dio();
    // dio.options.headers["authorization"] = "token $token";
    var response = await dio.post('$baseURl/create-course', data: data,options: Options(headers: {
      "Authorization":
      "Bearer $token",
    }));
    if(response.statusCode == 200){
      print(response.data);
    }
    else{
      print('error ${response.data}');
    }
  }
}