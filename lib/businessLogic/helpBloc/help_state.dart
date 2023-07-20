part of 'help_bloc.dart';

@immutable
abstract class HelpState {}

class HelpInitial extends HelpState {}
class GetHelpState extends HelpState {
 final HelpResponse helpResponse;
  GetHelpState(this.helpResponse);
}
class Loading extends HelpState {}