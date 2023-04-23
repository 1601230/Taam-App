import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;


final http.Client client = http.Client();
const String baseUrl = "http://172.29.176.1:8080";


Future<Map<String, dynamic>> searchProductByBarcode(int barcode) async {
  String uri = "$baseUrl/barcode/$barcode/end";
  final response = await client.get(Uri.parse(uri));

  if (response.statusCode == 200) {
    String data = response.body;

    Map<String, dynamic> map = stringToMap(data);
    return map;
  } else {
    print("statusCode=$response.statusCode");
    throw Exception('Failed to get children');
  }
}

Map<String, dynamic> stringToMap(String data) {
  var map = <String, dynamic>{};
  if (data.trim().startsWith('{') && data.trim().endsWith('}')) {
    data = data.substring(1, data.length - 1);
    if (data.endsWith(',')) {
      data = data.substring(0, data.length - 1);
    }
    data.split('|').forEach((element) {
      var keyValue = element.split('=');
      if (keyValue.length == 2) {
        var key = keyValue[0].trim();
        var value = keyValue[1].trim();
        if (value.endsWith(',')) {
          value = value.substring(0, value.length - 1);
        }
        if (value.endsWith('}')) {
          value = value.substring(0, value.length - 1);
        }
        map[key] = value;
      }
    });
  }
  return map;
}

