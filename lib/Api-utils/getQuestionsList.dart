import 'dart:convert';
import '../app-utils.dart';
import '../constantes.dart';
import 'package:http/http.dart' as http;

void getQuestionsList(topicID, context) async {
  var vartemp = await _getQuestionsList(topicID);
}

Future<String?> _getQuestionsList(topicID) async {
  var response = await http.post(Uri.parse("${apiurl}question/getlist"), body: {
    "token": accessToken,
    "topicID ": topicID.toString(),
  });
  var data = json.decode(response.body);
  if (data["status"] == "error") {
    if (data["reason"] == "INVALID TOKEN") {
      print2logs('token invalide', "loginUser");
      return "Votre autorisation à expiré relancez la connexion";
    } else if (data["reason"] == "TOPIC NOT EXIST") {
      print2logs("Le topic demander n'existe pas", "loginUser");
      return "Le topic demander n'existe pas";
    } else {
      print2logs("Erreur inconnue", "loginUser");
      return "Erreur inconnue";
    }
  } else {
    questions = data["data"];
    print2logs("Questions récupéré:\n${questions.toString()}", "loginUser");
    return "Connecté";
  }
}
