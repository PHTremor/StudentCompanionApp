import 'package:equatable/equatable.dart';

/// states emmited by the [CredentialsBloc]

abstract class CredentialsState extends Equatable {
  //states emitted by [CredentialsBloc] when the form is created
  const CredentialsState();

  @override
  List<Object> get props => [];
}

// actions required (authentication or registration)
class CredentialsInitial extends CredentialsState {
  const CredentialsInitial();
}

//Login request awaiting for a response
class CredentialsLoginLoading extends CredentialsState {
  const CredentialsLoginLoading();
}

// invalid authentication credentials
class CredentialsLoginFailure extends CredentialsState {
  const CredentialsLoginFailure();
}
