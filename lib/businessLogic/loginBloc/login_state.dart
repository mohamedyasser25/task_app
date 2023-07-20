part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}
  class Loading extends LoginState {}
class Loaded extends LoginState {
 final String code;
  Loaded(this.code);
}
class VerifyLoaded extends LoginState {

  VerifyLoaded();
}
