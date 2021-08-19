// events for the [CredentialsBloc] bloc
// login && register not required(else add states..)

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class CredentialsEvent extends Equatable {
  /// the username
  final String username;

  ///password
  final String password;

  /// events firef by [CredentialsBloc] when a button is pressed. It
  /// provide information from the form
  const CredentialsEvent(this.username, this.password);

  @override
  List<Object> get props => [username, password];
}

/// event fired when the login Button is tapped
class LoginButtonPressed extends CredentialsEvent {
  const LoginButtonPressed({
    @required String username,
    @required String password,
  }) : super(username, password);
}

// /// event fired when the register Button is tapped
// class RegisterButtonPressed extends CredentialsEvent {
//   const RegisterButtonPressed({
//     @required String username,
//     @required String password,
//   }) : super(username, password);
// }
