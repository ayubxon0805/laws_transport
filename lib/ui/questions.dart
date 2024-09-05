import 'package:flutter/material.dart';
import 'package:laws_transport/service/hive_service/hive2.dart';
import 'package:laws_transport/service/model/question_model.dart';

import '../service/check_answers/check_answers.dart';

class QuestionsPage extends StatefulWidget {
  const QuestionsPage({super.key});

  @override
  State<QuestionsPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  List<QuestionModel> AllQuestions = HiveBoxes.questionsBox.values.toList();
  int result = 0;
  int currentQuestionIndex = 0;
  List<QuestionModel> questions = [
    QuestionModel(
      question: "What is the capital of France?",
      options: [
        "Paris",
        "London",
        "Berlin",
      ],
      currentIndex: 0,
      uniqueId: 1,
    ),
    QuestionModel(
      question: "What is the capital of Germany?",
      options: [
        "Berlin",
        "Munich",
        "Frankfurt",
      ],
      currentIndex: 0,
      uniqueId: 2,
    ),
    QuestionModel(
      question: "What is the capital of Spain?",
      options: [
        "Valencia",
        "Barcelona",
        "Madrid",
      ],
      currentIndex: 2,
      uniqueId: 3,
    ),
    QuestionModel(
      question: "What is the capital of Turkey?",
      options: [
        "Samarqand",
        "Istanbul",
        "Dushanbe",
      ],
      currentIndex: 1,
      uniqueId: 4,
    ),
  ];
  int _currentIndex = 0;
  bool isAnswered = false;
  Color buttonColor = Colors.blue;
  @override
  Widget build(BuildContext context) {
    for (var question in questions) {
      HiveBoxes.questionsBox.put(question.uniqueId, question);
    }
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue,
        title: const Text(
          "Questions Page",
          style: TextStyle(
              color: Colors.white, fontSize: 27, fontWeight: FontWeight.w700),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
          child: currentQuestionIndex < AllQuestions.length
              ? Container(
                  margin: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromARGB(255, 195, 192, 192),
                            blurRadius: 5,
                            spreadRadius: 5)
                      ],
                      color: Colors.white,
                      border: Border.all(
                          color: const Color.fromARGB(255, 160, 156, 156)),
                      borderRadius: BorderRadius.circular(15)),
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 310,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${currentQuestionIndex + 1}) ${AllQuestions[currentQuestionIndex].question}",
                          style: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(height: 10),
                        ...List.generate(
                            AllQuestions[currentQuestionIndex]
                                    .options
                                    ?.length ??
                                0, (optionIndex) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: ElevatedButton(
                              onPressed: () {
                                isAnswered = true;
                                _currentIndex = optionIndex;
                                print(' vrlvmjgnvintn eneibn $_currentIndex');
                                if (AllQuestions[currentQuestionIndex]
                                        .currentIndex ==
                                    optionIndex) {
                                  result++;
                                }
                                setState(() {});
                                // setState(() {
                                //   currentQuestionIndex++;
                                // });
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                backgroundColor: isAnswered
                                    ? CheckAnswers.checkQuestion(
                                        optionIndex,
                                        AllQuestions[currentQuestionIndex]
                                            .currentIndex,
                                        _currentIndex)
                                    : Colors.blue,
                                minimumSize: const Size(200, 43),
                              ),
                              child: Text(
                                '${AllQuestions[currentQuestionIndex].options?[optionIndex]}',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          );
                        }),
                        ElevatedButton(
                            onPressed: () {
                              setState(() {
                                if (isAnswered == true) {
                                  currentQuestionIndex++;
                                }
                                if (currentQuestionIndex ==
                                    AllQuestions.length) {
                                  isAnswered = true;
                                }
                                isAnswered = false;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                                minimumSize: Size(200, 45),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            child: const Text(
                              'Next',
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ))
                      ],
                    ),
                  ),
                )
              : Container(
                  margin: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromARGB(255, 195, 192, 192),
                            blurRadius: 5,
                            spreadRadius: 5)
                      ],
                      color: Colors.white,
                      border: Border.all(
                          color: const Color.fromARGB(255, 160, 156, 156)),
                      borderRadius: BorderRadius.circular(15)),
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 310,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Your Score: $result",
                          style: const TextStyle(
                              fontSize: 27, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          HiveBoxes.clearAllBoxes();
          HiveBoxes.questionsBox.clear();
          AllQuestions.clear();
        },
        child: Text('delete'),
      ),
    );
  }
}
