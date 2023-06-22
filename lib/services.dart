import 'dart:convert';
import 'package:http/http.dart' as http;

class getData{
 static Future fetchPost() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/photos');

    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      print(jsonResponse);
      return jsonResponse;
    } else {
      print('Request failed with status: ${response.statusCode}');
      return null;
    }
  }
}

