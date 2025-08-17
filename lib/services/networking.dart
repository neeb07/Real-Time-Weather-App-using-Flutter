import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper {
  NetworkHelper({required this.urls});

  final String urls;

  Future getData() async {
    var url = Uri.parse(urls);

    http.Response response = await http.get(url);
    // print(response.body);

    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);
      return decodedData;
    } else {
      print(response.statusCode);
    }
  }
}
