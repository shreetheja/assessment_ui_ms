class QuestionData {
  int id;
  String question;
  AnsTypes ansType;
  List<String> options;
  QuestionData({
    required this.id,
    required this.question,
    required this.ansType,
    required this.options,
  });

  static QuestionData fromJson(Map<String, dynamic> json,int id) {
    var question = json['question'];
    var ansType = QuestionData.getEnum(json['ans_type']);
    var options = json['options'].cast<String>();
    return QuestionData(id: id, question: question, ansType: ansType, options: options);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['question'] = this.question;
    data['ans_type'] = this.ansType.toString();
    data['options'] = this.options;
    return data;
  }

  static AnsTypes getEnum(json) {
    if(answerTypes.containsKey(json))
      return answerTypes[json]!;
    return AnsTypes.UNKOWN;
  }
}

enum AnsTypes { MCQ_4, MCQ_3, MCQ_5, MCQ_2, CODE, TEXT_250, UNKOWN }
Map<String,AnsTypes> answerTypes ={
  "MCQ_2":AnsTypes.MCQ_2,
  "MCQ_4":AnsTypes.MCQ_4,
  "MCQ_3":AnsTypes.MCQ_3,
  "MCQ_5":AnsTypes.MCQ_5,
  "CODE":AnsTypes.CODE,
  "TEXT_250":AnsTypes.TEXT_250
};