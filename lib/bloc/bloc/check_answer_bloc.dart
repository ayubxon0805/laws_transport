import 'package:flutter_bloc/flutter_bloc.dart';

part 'check_answer_event.dart';
part 'check_answer_state.dart';

class CheckAnswerBloc extends Bloc<CheckAnswerEvent, CheckAnswerState> {
  CheckAnswerBloc() : super(CheckAnswerInitial()) {
    on<CheckSelectedAnswerEvent>(checkTrueAnswer);
  }

  Future<void> checkTrueAnswer(
    CheckSelectedAnswerEvent event,
    Emitter<CheckAnswerState> emit,
  ) async {
    try {
      final selectedAnswer = event.selectedIndex;
      final correctAnswer = event.optionIndex;
      if (selectedAnswer == correctAnswer) {
        emit(ChechSelectedAnswerState(isChanged: true));
      }
////
    } catch (e) {
      print('ierror boldi ==$e');
    }
  }
}
