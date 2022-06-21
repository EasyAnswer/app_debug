import 'dart:convert';
import '../app-utils.dart';
import '../constantes.dart';
import 'package:http/http.dart' as http;

void getQuestionsList(topicID, context) async {
  var vartemp = await _getQuestionsList(topicID);
}

Future<String?> _getQuestionsList(topicID) async {
  var response = await http.post(Uri.parse("${apiurl}topic/getlist"), body: {
    "token": accessToken,
  });
  var data = json.decode(response.body);
  if (data["status"] == "error") {
    if ((data["status"] == "error") && (data["reason"] == "INVALID TOKEN")) {
      print2logs('Votre autorisation à expiré', "loginUser");
      return "Votre autorisation à expiré";
    } else {
      print2logs("Erreur inconnue", "loginUser");
      return "Erreur inconnue";
    }
  } else {
    topics = data["data"];
    print2logs("Questions récupéré:\n${questions.toString()}", "loginUser");
    return "Connecté";
  }
}
