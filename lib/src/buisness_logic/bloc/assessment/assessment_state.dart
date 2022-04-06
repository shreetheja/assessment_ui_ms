import 'package:assesment_ui/src/buisness_logic/data/models/assessment_data.dart';
import 'package:equatable/equatable.dart';

abstract class AssessmentState extends Equatable {}
abstract class Markinganswer extends AssessmentState {}
abstract class Submit extends AssessmentState {}

class AssessmentInitialState extends AssessmentState{
  @override
  List<Object?> get props => [];
}
class AssessmentLoadingState extends AssessmentState{
  @override
  List<Object?> get props => [];
}
class AssessmentLoadedState extends AssessmentState{
  final AssessmentData LoadedAssessmentData;

  AssessmentLoadedState({required this.LoadedAssessmentData});
  @override
  List<Object?> get props=>[];
}
class AssessmentErrorState extends AssessmentState{
  final String message;
  AssessmentErrorState({required this.message});
  @override
  List<Object?> get props=>[];
}

class MarkedAnswerIntialState extends Markinganswer{
  @override
  List<Object?> get props => [];
}
class MarkedAnswerLoadingState extends Markinganswer{
  final int index,markedOption;

  MarkedAnswerLoadingState(this.index, this.markedOption);
  @override
  List<Object?> get props => [];
}
class MarkedAnswerLoadedState extends Markinganswer{
  final int index,markedOption;
  MarkedAnswerLoadedState( this.index, this.markedOption);
  @override
  List<Object?> get props=>[];
}
class MarkedAnswerErrorState extends Markinganswer{
  final String message;
  MarkedAnswerErrorState({required this.message});
  @override
  List<Object?> get props=>[];
}


class SubmitLoadingState extends Submit{
  @override
  List<Object?> get props => [];
}
class SubmitLoaded extends Submit{
  @override
  List<Object?> get props =>[];
}
class SubmitErrorState extends Submit {
  final String message;
  SubmitErrorState({
    required this.message,
  });
  @override
  List<Object?> get props =>[];

}
