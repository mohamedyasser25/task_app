part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}
class Login extends LoginEvent {
  final String name,number;

  Login(this.name, this.number);
}
class VerifyCode extends LoginEvent {
  final String first,second,third,ford;

  VerifyCode(this.first, this.second, this.third, this.ford);
}