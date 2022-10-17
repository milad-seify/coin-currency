import 'package:http/http.dart' as http;
import 'dart:convert';

class Network {
  Network({required this.uri});
  late String uri;
  Future<dynamic> getHttpData() async {
    http.Response response = await http.get(Uri.parse(uri));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
      throw 'Problem with the get request';
    }
  }
}
