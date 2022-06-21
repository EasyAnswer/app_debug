import 'dart:convert';
import 'app-utils.dart';
import 'constantes.dart';
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
      return "Utillisateur banni ${data["message"]}";
    } else if (data["reason"] == "USER NOT EXIST") {
      print2logs('Utillisateur non trouvé', "loginUser");
      return "Utillisateur non trouvé";
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
