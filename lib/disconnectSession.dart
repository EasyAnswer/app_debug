import 'dart:convert';
import 'app-utils.dart';
import 'constantes.dart';
import 'package:http/http.dart' as http;

void disconnectSession(context) async {
  var vartemp = await _disconnectSession();
}

Future<String?> _disconnectSession() async {
  var response = await http.post(Uri.parse("${apiurl}login/user"), body: {
    "token": token,
  });
  var data = json.decode(response.body);
  if (data["status"] == "error") {
    if (data["reason"] == "INVALID TOKEN") {
      print2logs('Votre autorisation à expiré', "loginUser");
      return "Votre autorisation à expiré";
    } else {
      print2logs(data['reason'], "loginUser");
      return data['reason'];
    }
  } else {
    userID = data["userID"];
    token = data["token"];
    print2logs('token Saved: $token\nuserID Saved: $userID', "loginUser");
    return "Success";
  }
}
