class Student {
  int id;
  String username;
  String token;

  Student({this.id, this.username, this.token});

  // this method returns the user as a JSON object
  factory Student.fromDatabaseJson(Map<String, dynamic> data) =>
      Student(id: data['id'], username: data['username'], token: data['token']);

  // this method converts incoming JSON object to a database Object
  Map<String, dynamic> toDatabaseJson() =>
      {"id": this.id, "username": this.username, "token": this.token};
}
