import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<dynamic>> getSubjectData(var index) async{
  var url = "https://script.google.com/macros/s/AKfycbzKoJSY6DXaD4py1toh3xpdud9IOw22xzyWxQ0fJE9j_JruzCvLoTlzp8zhTc9S_35iHg/exec?weekday=$index";
  Uri _uri = Uri.parse(url);
  final response = await http.get(_uri);
  Map<String,dynamic> info = json.decode(utf8.decode(response.bodyBytes));
  return info['table'];
}
