import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/blocs/authentication_bloc/bloc.dart';
import 'package:login/blocs/authentication_bloc/events.dart';
import 'package:login/blocs/credentials_bloc/events.dart';
import 'package:login/blocs/credentials_bloc/states.dart';
import 'package:login/repository/student_repository.dart';
import 'package:meta/meta.dart';

// Communicates with the backed to authenticate student
class CredentialsBloc extends Bloc<CredentialsEvent, CredentialsState> {
  // data about the user
  final StudentRepository studentRepository;
  // the AuthenticationBloc taking care of changing pages
  final AuthenticationBloc authenticationBloc;

  //creates a bloc taking care of managing the login state of the app
  CredentialsBloc({
    @required this.authenticationBloc,
    @required this.studentRepository,
  }) : super(const CredentialsInitial());

  @override
  Stream<CredentialsState> mapEventToState(CredentialsEvent event) async* {
    if (event is LoginButtonPressed) {
      yield* _loginPressed(event);
    }
  }

  //this is the login method
  Stream<CredentialsState> _loginPressed(CredentialsEvent event) async* {
    yield const CredentialsLoginLoading();

    //try to authenticate through the repo...
    try {
      final student = await studentRepository.authenticate(
        username: event.username,
        password: event.password,
      );

      authenticationBloc.add(LoggedIn(student: student));
      yield const CredentialsInitial();
    } on PlatformException {
      yield const CredentialsLoginFailure();
    }
  }
}
