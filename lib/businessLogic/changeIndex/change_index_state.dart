part of 'change_index_bloc.dart';

@immutable
abstract class ChangeIndexState {}

class ChangeIndexInitial extends ChangeIndexState {}
class ChangeState extends ChangeIndexState {
  final int index;

  ChangeState(this.index);
}