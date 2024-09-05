import 'package:hive/hive.dart';
import 'package:laws_transport/service/model/question_model.dart';

class HiveBoxes {
  const HiveBoxes._();
  static final Box<QuestionModel> questionsBox =
      Hive.box<QuestionModel>(HiveBoxNames.questions);

  /// It clears all the boxes
  static Future<void> clearAllBoxes() async {
    await Future.wait([
      questionsBox.clear(),
    ]);
  }
}

class HiveBoxNames {
  static const String questions = 'AllQuestions';
}
