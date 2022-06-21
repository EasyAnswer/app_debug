import 'dart:convert';
import '../app-utils.dart';
import '../constantes.dart';
import 'package:http/http.dart' as http;

void getUserData(context) async {
  var vartemp = await _getUserData();
}

Future<String?> _getUserData() async {
  var response = await http.post(Uri.parse("${apiurl}user/getdata"), body: {
    "token": accessToken,
    "userID": userID.toString(),
  });
  var data = json.decode(response.body);
  if (data["status"] == "error") {
    if (data["reason"] == "INVALID TOKEN") {
      print2logs('le token est invalide', "loginUser");
      return "Votre autorisation à expiré relancez la connexion";
    } else if (data["reason"] == "USER NOT EXIST") {
      print2logs("Le compte n'existe pas", "loginUser");
      return "Votre compte n'existe pas";
    } else {
      print2logs("Erreur inconnue", "loginUser");
      return "Erreur inconnue";
    }
  } else {
    username = data["username"];
    userID = data["userID"];
    userEmail = data["email"];
    userType = data["status"];
    print2logs("""
        Donnée de l'utillisateur=$username,\n
        id=$userID,\n
        email=$userEmail,\n
        usertype=$userType
        """, "loginUser");
    return "Connecté";
  }
}
