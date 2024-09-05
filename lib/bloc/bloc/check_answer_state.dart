part of 'check_answer_bloc.dart';

sealed class CheckAnswerState {}

final class CheckAnswerInitial extends CheckAnswerState {}

class ChechSelectedAnswerState extends CheckAnswerState {
  final bool isChanged;

  ChechSelectedAnswerState({required this.isChanged});
}
