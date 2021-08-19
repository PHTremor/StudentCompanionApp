//events for the Authentication block (LoggedIn & LoggedOut)
import 'package:equatable/equatable.dart';
import 'package:login/models/student_model.dart';
import 'package:meta/meta.dart';

abstract class AuthenticationEvent extends Equatable {
  //this is the base class is fired by [AuthenticationBloc]
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

/// user has logged in (success)
class LoggedIn extends AuthenticationEvent {
  final Student student;

  const LoggedIn({@required this.student});

  @override
  List<Object> get props => [student];

  @override
  String toString() => 'LoggedIn { user: $student.username.toString() }';
}

///user requested to logout
class LoggedOut extends AuthenticationEvent {
  const LoggedOut();
}
