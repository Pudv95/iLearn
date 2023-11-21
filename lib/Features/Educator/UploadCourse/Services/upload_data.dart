import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart'as http;

class UploadCourse{
  final storage = const FlutterSecureStorage();
  final String baseURl = dotenv.get('BaseUrl');

  createCourse()async{
    String? token = await storage.read(key: 'token');
    var headers = {
      'Authorization':
      'Bearer $token'
    };

    var url = '$baseURl/create-course';

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: {
        'title': 'Web dev part 9',
        'description': '100 days of code',
        'category': 'Web Development',
      },
    );

    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print(response.reasonPhrase);
    }
  }
}