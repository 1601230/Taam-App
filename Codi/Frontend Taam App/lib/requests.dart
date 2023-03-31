import 'dart:convert';
import 'package:http/http.dart' as http;

final http.Client client = http.Client();
const String baseUrl = "http://localhost:8080";


Future<int> methodName(int n) async {
  String uri = "$baseUrl/language/english/name/salmon ahumado/end";
  final response = await client.get(Uri.parse(uri));

  if (response.statusCode == 200) {
    final valorInteger = jsonDecode(response.body);
    print("statusCode=$response.statusCode");
    return valorInteger;
  } else {
    print("statusCode=$response.statusCode");
    throw Exception('Failed to get children');
  }
}

