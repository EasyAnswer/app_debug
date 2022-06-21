import 'dart:convert';
import 'app-utils.dart';
import 'constantes.dart';
import 'package:http/http.dart' as http;

void disconnectSession(context) async {
  var vartemp = await _disconnectSession();
}

Future<String?> _disconnectSession() async {
  var response =
      await http.post(Uri.parse("${apiurl}session/disconnect"), body: {
    "token": token,
  });
  var data = json.decode(response.body);
  if ((data["status"] == "error") && (data["reason"] == "INVALID TOKEN")) {
    print2logs('Votre autorisation à expiré', "loginUser");
    return "Votre autorisation à expiré";
  } else {
    print2logs("Déconnexion", "loginUser");
    return "disconnected";
  }
}
