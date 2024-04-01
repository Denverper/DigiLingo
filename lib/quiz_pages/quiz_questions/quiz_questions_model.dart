import '/flutter_flow/flutter_flow_util.dart';
import 'quiz_questions_widget.dart' show QuizQuestionsWidget;
import 'package:flutter/material.dart';

class QuizQuestionsModel extends FlutterFlowModel<QuizQuestionsWidget> {
  ///  Local state fields for this page.

  String? selectedAnswer;

  bool? answerCorrect;

  bool? answerWrong;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
