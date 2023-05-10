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

Future<Map<String, dynamic>> searchByName(String name) async {
  String uri = "$baseUrl/name/$name/end";
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

void setLanguageServer(String language) async {
  String uri = "$baseUrl/language/$language/end";
  final response = await client.get(Uri.parse(uri));

  if (response.statusCode != 200) {
    print("statusCode=$response.statusCode");
    throw Exception('Failed to get children');
  }
}

Future<Map<String, dynamic>> getPreferences() async {
  String uri = "$baseUrl/restrictionsList/end";
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

Future<Map<String, dynamic>> getReccomendations(String listPreferences) async {
  String uri = "$baseUrl/restrictions/$listPreferences/end";
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

Future<Map<String, dynamic>> getRefresh() async {
  String uri = "$baseUrl/refresh/end";
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
  data = textTransformer(data);
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

String textTransformer(String data) {
  data = data.replaceAll("Ã±", 'ñ');
  data = data.replaceAll("Ã©", 'é');
  data = data.replaceAll("Ã¨", 'è');
  data = data.replaceAll("lÂ·l", 'l·l');
  data = data.replaceAll("Ã¡", 'á');
  data = data.replaceAll("Ã¤", 'ä');
  data = data.replaceAll("Ã¨", 'è');
  data = data.replaceAll("Ã©", 'é');
  data = data.replaceAll("Ã«", 'ë');
  data = data.replaceAll("Ã²", 'ò');
  data = data.replaceAll("Ã³", 'ó');
  data = data.replaceAll("Ã¶", 'ö');
  data = data.replaceAll("Ã¬", 'ì');
  data = data.replaceAll("Ã­", 'í');
  data = data.replaceAll("Ã¯", 'ï');
  data = data.replaceAll("Ã¹", 'ù');
  data = data.replaceAll("Ãº", 'ú');
  data = data.replaceAll("Ã¼", 'ü');
  data = data.replaceAll("Ã", 'à');
  return data;
}

