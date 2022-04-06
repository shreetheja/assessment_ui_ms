
import 'package:equatable/equatable.dart';
abstract class AssessmentEvent extends Equatable {}

class FetchAssessmentEvent extends AssessmentEvent {
  final String uid;
  final String aid;
  FetchAssessmentEvent({
    required this.aid,
    required this.uid
  });

  @override
  List<Object?> get props => throw UnimplementedError();
}
class MarkAnswerEvent extends AssessmentEvent {
  final String uid;
  final String aid;
  final int questionIndex;
  final int? answer;
  MarkAnswerEvent({
    required this.uid,required this.questionIndex, this.answer,required this.aid
  });
  @override
  List<Object?> get props => throw UnimplementedError();
}
class SubmitAssessmentEvent extends AssessmentEvent{
  final String uid;
  final String aid;
  SubmitAssessmentEvent(this.uid,this.aid);
  @override
  List<Object?> get props => throw UnimplementedError();
}