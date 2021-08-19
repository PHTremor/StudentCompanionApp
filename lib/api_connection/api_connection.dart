import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:login/models/api_model.dart';

final _base = "ServerURL/example.com"; //edit*
final _tokenEndPoint = "/api-token-auth/"; //edit*
final _tokenURL = Uri.parse(_base + _tokenEndPoint);

// this method gets a token for a user or throws an exception if credentials were wrong
Future<Token> getToken(StudentLogin studentLogin) async {
  print(_tokenURL);
  final http.Response response = await http.post(
    _tokenURL,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(studentLogin.toDatabaseJson()),
  );
  if (response.statusCode == 200) {
    return Token.fromJson(json.decode(response.body));
  } else {
    print(jsonDecode(response.body).toString());
    throw Exception(json.decode(response.body));
  }
}
