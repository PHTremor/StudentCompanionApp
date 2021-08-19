//this class gets username and password from the user
//and sends it to the sever
//kutumiza username & password, kulandira token ...."schema"

class StudentLogin {
  String username;
  String password;

  StudentLogin({this.username, this.password});

  Map<String, dynamic> toDatabaseJson() =>
      {"username": this.username, "password": this.password};
}

// Token class gets the result and gives us the string from
// the JSON object we receive from the server. The Token
class Token {
  String token;

  Token({this.token});

  // receives token as JSON object, add to field token
  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(token: json['token']);
  }
}
