import 'package:flutter/material.dart';
import 'package:login/models/student_model.dart';

//Creates a login provider .. a gateway for authenticating a user
abstract class StudentRepository {
  //creating the repo for authenticating a user
  const StudentRepository();

  // check token of the signed user
  Future<bool> hasToken();

  // copy token to local storage
  Future<void> persistToken({@required Student user});

  // delete token from local storage / logout
  Future<void> deleteToken({@required int id});

  // login with username and password
  Future<Student> authenticate(
      {@required String username, @required String password});

  /*  //registration with username and password
  Future<bool> register(String username, String password);

  // logout
  Future<void> logOut(); */
}
