part of 'change_index_bloc.dart';

@immutable
abstract class ChangeIndexEvent {}
class ChangeIndex extends ChangeIndexEvent {
  final int index;

  ChangeIndex(this.index);
}