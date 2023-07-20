import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'change_index_event.dart';
part 'change_index_state.dart';

class ChangeIndexBloc extends Bloc<ChangeIndexEvent, ChangeIndexState> {
  ChangeIndexBloc() : super(ChangeIndexInitial()) {
    on<ChangeIndexEvent>((event, emit) async{
     if(event is ChangeIndex){
       await changeIndex(event.index,emit);
     }
    });
  }

  changeIndex(int index, Emitter<ChangeIndexState> emit) {
    int newIndex=index;
    emit(ChangeState(newIndex));
  }
}
