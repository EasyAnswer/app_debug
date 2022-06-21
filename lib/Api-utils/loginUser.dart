import 'dart:convert';
import '../app-utils.dart';
import '../constantes.dart';
import 'package:http/http.dart' as http;

void loginUser(context) async {
  var vartemp = await _loginUser();
}

Future<String?> _loginUser() async {
  var response = await http.post(Uri.parse("${apiurl}login/user"), body: {
    "username": "delta",
    "password": "deltatech",
  });
  var data = json.decode(response.body);
  if (data["status"] == "error") {
    if (data["reason"] == "USER BANNED") {
      print2logs('Utillisateur banni ${data["message"]}', "loginUser");
      return "Utillisateur banni:\n${data["message"]}";
    } else if (data["reason"] == "USER NOT EXIST") {
      print2logs('Utillisateur non trouvé', "loginUser");
      return "Utillisateur non trouvé";
    } else if (data["reason"] == "INCORRECT CREDENTIAL") {
      print2logs(data['reason'], "loginUser");
      return "Identifiant ou mot de passe incorrect";
    } else {
      print2logs("Erreur inconnue", "loginUser");
      return "Erreur inconnue";
    }
  } else {
    userID = data["userID"];
    accessToken = data["accessToken"];
    print2logs(
        'accessToken Saved: $accessToken\nuserID Saved: $userID', "loginUser");
    return "Connexion réussie";
  }
}
