import 'package:equatable/equatable.dart';

/// states emmited by [AuthencticationBloc]

abstract class AuthenticationState extends Equatable {
  /// base class emmitted by AuthenticationBloc
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

/// app just opened, login or register actions required
class AuthenticationInit extends AuthenticationState {
  const AuthenticationInit();
}

///Login made with success
class AuthenticationSuccess extends AuthenticationState {
  const AuthenticationSuccess();
}

/// logout state
class AuthenticationRevoked extends AuthenticationState {
  const AuthenticationRevoked();
}

/// loading (awaiting for registration / authentication)
class AuthenticationLoading extends AuthenticationState {
  const AuthenticationLoading();
}
