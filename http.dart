import 'package:http/http.dart' as http;
import 'dart:convert';

class RequestResult {
  bool ok;
  dynamic data;
  RequestResult(this.ok, this.data);
}

//FOR localhost
const prototol = "http";
const domain = "192.168.100.240:8000";
const route = "";

Future<RequestResult> http_post(String route, [dynamic data]) async {
  //var url ="http://192.168.100.240:8000";
  var url = "$prototol://$domain/$route";
  var dataStr = jsonEncode(data);
  var result = await http.post(Uri.parse(url),
      body: dataStr, headers: {"Content-Type": "application/json"});
  return RequestResult(true, jsonDecode(result.body));
}
