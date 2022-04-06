import 'package:assesment_ui/src/views/login/login.dart';
import 'package:assesment_ui/src/views/question/mcq/question.dart';
import 'package:assesment_ui/src/views/routing/app-state.dart';
import 'package:assesment_ui/src/views/submit/submitted.dart';
import 'package:assesment_ui/src/views/waitPage/wait_page_start.dart';
import 'package:flutter/material.dart';
class App extends StatefulWidget {
  const App({ Key? key }) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  
  
  void ReloadState(){
    setState(() {
      
    });
  }
  @override
  Widget build(BuildContext context) {
    WebAppState.setAppStateFunctions = ReloadState;
    WebAppState webStateInstance = WebAppState.getInstance;
    return MaterialApp(
      home: Navigator(
        pages: [
          MaterialPage(
            child: LoginPage()
          ),
          if(webStateInstance.currentState==AppStates.loggedIn)
            MaterialPage(
            child: WaitPageStart()
          ),
          if(webStateInstance.currentState==AppStates.infoDone)
            MaterialPage(
            child: QuestionPage(uid: webStateInstance.loginStateInfo.loggedInData.userInfo.uid,aid:webStateInstance.loginStateInfo.loggedInData.assessmentInfo.aId ,)
          ),
          if(webStateInstance.currentState==AppStates.questionDone)
            MaterialPage(
              child: Submitted()
            )
        ],
        onPopPage: (route,result){
          return route.didPop(result);
        },

      ),
    );
  }
}