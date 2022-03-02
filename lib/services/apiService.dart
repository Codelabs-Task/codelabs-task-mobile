import 'package:http/http.dart' as http;
import 'dart:async';

class ApiService{

  late String _data;

  String get data => _data;


  Future getData(String uri) async {
    final completer = Completer();

    final client = http.Client();
    try {
      final url = Uri.parse(uri);
      final response = await client.get(url);
      completer.complete(response.body);
    } catch (e) {
      completer.completeError(e);
    }
    return completer.future;
  }
}