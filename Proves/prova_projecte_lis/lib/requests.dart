import 'dart:convert';
import 'package:http/http.dart' as http;

final http.Client client = http.Client();
const String baseUrl = "http://79.153.202.24:8080";


Future<int> calculateNumber(int n) async {
  String uri = "$baseUrl/$n";
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