part of 'check_answer_bloc.dart';

sealed class CheckAnswerEvent {}

class CheckSelectedAnswerEvent extends CheckAnswerEvent {
  final int optionIndex;
  final int selectedIndex;

  CheckSelectedAnswerEvent(
      {required this.optionIndex, required this.selectedIndex});
}
