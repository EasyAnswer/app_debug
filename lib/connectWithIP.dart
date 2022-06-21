import 'dart:convert';
import 'constantes.dart';
import 'package:http/http.dart' as http;
import 'app-utils.dart';

void connectWithIP(context) async {
  var vartemp = await _connectWithIP();
}

Future<String?> _connectWithIP() async {
  var response = await http.post(Uri.parse("${apiurl}login/ip"));
  var data = json.decode(response.body);
  if (data["status"] == "error") {
    print2logs(data.toString(), "connectWithIP");
    return "Error";
  } else {
    token = data["token"];
    print2logs('token Saved: $token', "connectWithIP");
    return "Success";
  }
}
