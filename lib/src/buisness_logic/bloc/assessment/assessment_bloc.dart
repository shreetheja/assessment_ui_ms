import 'package:assesment_ui/src/buisness_logic/bloc/assessment/assessment_event.dart';
import 'package:assesment_ui/src/buisness_logic/bloc/assessment/assessment_state.dart';
import 'package:assesment_ui/src/buisness_logic/data/models/api-response.dart';
import 'package:assesment_ui/src/buisness_logic/data/models/assessment_data.dart';
import 'package:assesment_ui/src/buisness_logic/data/repository/assessment_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AssessmentBloc extends Bloc<AssessmentEvent, AssessmentState> {
  AssessmentRepo repository;
  AssessmentBloc(this.repository) : super(AssessmentInitialState()) {
    
    on<FetchAssessmentEvent>((event, emit)async {
      emit( AssessmentLoadingState());
      try {
        ('Block ${event.aid} and ${event.uid}');
        ApiResponse<AssessmentData> data = await repository.login(event.aid,event.uid);
        (data.statusCode);
        if (data.error || data.statusCode != 200) {
          emit( AssessmentErrorState(message: data.errorMessage!));
          return;
        }
        emit( AssessmentLoadedState(LoadedAssessmentData: data.data!));
       
      } catch (e) {
        emit( AssessmentErrorState(message: e.toString()));
      }
    });

    on<MarkAnswerEvent>((event, emit)async {
      int questionIndex = event.questionIndex;
      int answer = event.answer==null?-1:event.answer!;
      emit(MarkedAnswerLoadingState(questionIndex,answer));
      try {
        ApiResponse<bool> data = await repository.markAnswer(event.aid,event.uid,questionIndex,answer);
        (data.statusCode);
        if (data.error || data.statusCode != 200 || !data.data!) {
          emit(MarkedAnswerErrorState(message: data.errorMessage!));
          return;
        }
        emit( MarkedAnswerLoadedState(event.questionIndex,event.answer!));
       
      } catch (e) {
        emit(MarkedAnswerErrorState(message: e.toString()));
      }
    });

     on<SubmitAssessmentEvent>((event, emit)async {
      emit(SubmitLoadingState());
      try {
        ApiResponse<bool> data = await repository.submit(event.aid,event.uid);
        (data);
        if (data.error || data.statusCode != 200) {
          emit(SubmitErrorState(message: data.errorMessage!));
          return;
        }
        emit(SubmitLoaded());
       
      } catch (e) {
        emit(SubmitErrorState(message: e.toString()));
      }
    });

  }

  // Stream<AssessmentState> FetcheEvent<FetchAssessmentEvent>(AssessmentEvent event)async* {
  //
  // }

}
