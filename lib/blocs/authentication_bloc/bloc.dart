import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/blocs/authentication_bloc/events.dart';
import 'package:login/blocs/authentication_bloc/states.dart';
import 'package:login/repository/student_repository.dart';

//determines whether student is authenticated or not (decides if to display the Login form)
class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final StudentRepository studentRepository;

  AuthenticationBloc(this.studentRepository)
      : super(const AuthenticationInit());

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    if (event is LoggedIn) {
      yield const AuthenticationSuccess();
    }
    if (event is LoggedOut) {
      yield const AuthenticationLoading();
      // deletes user(token) from the local storage
      await studentRepository.deleteToken(id: 0);
      yield const AuthenticationRevoked();
    }
  }
}
