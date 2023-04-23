import 'dart:convert' as convert;
import 'package:http/http.dart' as http;


final http.Client client = http.Client();
const String baseUrl = "http://localhost:8080/";


Future<int> searchProductByBarcode(int barcode) async {
  String uri = "$baseUrl/barcode/$barcode/end";
  final response = await client.get(Uri.parse(uri));

  if (response.statusCode == 200) {
    final valorInteger = convert.jsonDecode(response.body);
    print("statusCode=$response.statusCode");
    Map<String, dynamic> decoded = convert.jsonDecode(response.body);
    return valorInteger;
  } else {
    print("statusCode=$response.statusCode");
    throw Exception('Failed to get children');
  }
}

