import 'dart:convert';
import '../constantes.dart';
import 'package:http/http.dart' as http;
import '../app-utils.dart';

void connectWithIP(context) async {
  var vartemp = await _connectWithIP();
}

Future<String?> _connectWithIP() async {
  var response = await http.post(Uri.parse("${apiurl}login/ip"));
  var data = json.decode(response.body);
  if (data["status"] == "error") {
    print2logs(data.toString(), "connectWithIP");
    return "Erreur lors de la connexion par IP";
  } else {
    accessToken = data["token"];
    print2logs('token Saved: $accessToken', "connectWithIP");
    return "Connexion réussie";
  }
}
