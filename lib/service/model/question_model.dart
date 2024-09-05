import 'package:hive/hive.dart';
import 'package:laws_transport/service/hive_service/hive.dart';

part 'question_model.g.dart';

@HiveType(typeId: 1, adapterName: HiveAdapters.questionAdapter)
class QuestionModel extends HiveObject {
  @HiveField(0)
  String? question;
  @HiveField(1)
  List<String>? options;
  @HiveField(2)
  int? currentIndex;
  @HiveField(3)
  int? uniqueId;

  QuestionModel({
    this.question,
    this.options,
    this.currentIndex,
    this.uniqueId,
  });

  QuestionModel.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    options = List<String>.from(json['options']);
    currentIndex = json['currentIndex'];
    uniqueId = json['uniqueId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['question'] = question;
    data['options'] = options;
    data['currentIndex'] = currentIndex;
    data['uniqueId'] = uniqueId;

    return data;
  }
}
