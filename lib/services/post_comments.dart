import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:task/services/comments.dart';

class PostComments{

static  Future postData(String title) async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/photos/1');
    var headers = {'Content-type': 'application/json; charset=UTF-8'};
    var body = jsonEncode({
      'id': 1,
      'title': title,
      'thumbnailUrl': 'https://google.com'
    });

    var response = await http.put(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      Comments.comments.add(jsonResponse);
      print(jsonResponse);
    } else {
      print('Request failed with status: ${response.statusCode}');
    }
  }
}