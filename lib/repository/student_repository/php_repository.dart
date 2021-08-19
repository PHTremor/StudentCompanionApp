// this is the actual authentication repository
//extending StudentRespository

import 'package:flutter/material.dart';
import 'package:login/api_connection/api_connection.dart';
import 'package:login/dao/student_dao.dart';
import 'package:login/models/api_model.dart';
import 'package:login/models/student_model.dart';
import 'package:login/repository/student_repository.dart';

class PhpStudentRepository extends StudentRepository {
  final userDao = StudentDao();

  // Auth Repo..
  PhpStudentRepository();

  // login/ authenticating
  @override
  Future<Student> authenticate(
      {@required String username, @required String password}) async {
    // UserLogin model instance
    // sends the data to the server
    // to get a token
    // StudentLogin type in api_model.dart
    StudentLogin userLogin = StudentLogin(
      username: username,
      password: password,
    );

    // creating an instance of the Token model
    Token token = await getToken(userLogin);

    // User model,
    Student student = Student(
      id: 0,
      username: username,
      token: token.token, //token
    );

    // return to authBloc
    return student;
  }

  // deleting the user from the DB
  @override
  Future<void> deleteToken({@required int id}) async {
    await userDao.deleteUser(id);
  }

  // checking if user exists
  @override
  Future<bool> hasToken() async {
    bool result = await userDao.checkUser(0);
    return result;
  }

  // writing user to database
  @override
  Future<void> persistToken({@required Student user}) async {
    await userDao.createUser(user);
  }
}
