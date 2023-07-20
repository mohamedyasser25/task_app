import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:magdsoft_task/data/models/helpResponse.dart';
import 'package:magdsoft_task/data/repository/helpRepository.dart';

import 'package:meta/meta.dart';

part 'help_event.dart';
part 'help_state.dart';

class HelpBloc extends Bloc<HelpEvent, HelpState> {
 final HelpRepository helpRepository;

  HelpBloc(this.helpRepository) : super(HelpInitial()) {
    on<HelpEvent>((event, emit) async{
      if(event is GetHelpEvent){
        await getHelp(emit);
      }
    });
  }

  getHelp(Emitter<HelpState> emit) async{
    emit(Loading());
    await helpRepository.getHelp().then((value) => emit(GetHelpState(value)));
  }
}
