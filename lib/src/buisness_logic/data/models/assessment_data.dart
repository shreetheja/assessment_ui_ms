import 'dart:convert';
import 'package:assesment_ui/src/buisness_logic/data/models/question_data.dart';
class AssessmentData{
  Map<String,dynamic> markedAnswers = new Map();
  double timeRemaining = -1;
  bool isReconnecting;
  List<QuestionData> questionData;
  AssessmentData(this.markedAnswers,this.timeRemaining,this.isReconnecting,this.questionData);


  static AssessmentData fromJson(Map<String,dynamic> jsonData){
    Map<String,dynamic> markedAns = jsonData['marked_answers'];
    double timeRem = jsonData['time_remaining'];
    bool isRecon = jsonData['is_reconnection'];
    List ques = jsonData['questions'];
    List<QuestionData> listQuestions =[];
    for(int i = 0;i<ques.length;i++) {
        QuestionData obj = QuestionData.fromJson(ques[i],i);
        listQuestions.add(obj);
    }
    return AssessmentData(markedAns, timeRem, isRecon, listQuestions);
  }

  static String toStringJson(AssessmentData data){
      Map map = new Map();

      map['marked_answers'] = data.markedAnswers;
      map['time_remaining'] = data.timeRemaining;
      map['is_reconnection'] = data.isReconnecting;
      map['questions'] = [];
      for (var question in data.questionData) {
        Map quesData = {
          "question":question.question,
          "ans_type":question.ansType,
          "options":question.options
        };
        map['questions'].add(quesData);
      }

      return json.encode(map);
  }
}