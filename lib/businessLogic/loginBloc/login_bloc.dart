import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:magdsoft_task/data/repository/loginRepository.dart';

import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
 final LoginRepository loginRepository;
  LoginBloc(this.loginRepository) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async{
if(event is Login){
  await login(event.name,event.number,emit);
}else if(event is VerifyCode){
  await verifyCode(event.first,event.second,event.third,event.ford,emit);
}
    });
  }

  login(String name, String number, Emitter<LoginState> emit)async {
    emit(Loading());
   await loginRepository.login(name,number).then((value) {
     print('ss${value.status}');
      if(value.status==200){
      emit(Loaded(value.code!));}

    });
  }

 Future verifyCode(String first, String second, String third, String ford, Emitter<LoginState> emit)async {
   emit(Loading());
    await loginRepository.verifyCode(first,second,third,ford).then((value) {if(value.status==200){
        emit(VerifyLoaded());}});
  }
}
