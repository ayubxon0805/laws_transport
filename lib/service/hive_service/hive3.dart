import 'package:hive/hive.dart';
import 'package:laws_transport/service/hive_service/hive2.dart';
import 'package:laws_transport/service/model/question_model.dart';
import 'package:path_provider/path_provider.dart' as pp;

class HiveService {
  const HiveService._();
  static Future<void> init() async {
    final dir = await pp.getApplicationSupportDirectory();

    Hive.init(dir.path);
    Hive.registerAdapter(QuestionModelAdapter());
    await Hive.openBox<QuestionModel>(HiveBoxNames.questions);
  }
}
