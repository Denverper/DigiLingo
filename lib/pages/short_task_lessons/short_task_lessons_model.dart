import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'short_task_lessons_widget.dart' show ShortTaskLessonsWidget;
import 'package:flutter/material.dart';

class ShortTaskLessonsModel extends FlutterFlowModel<ShortTaskLessonsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  QuizzesRecord? sourcedQuizRef;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  QuizResultRecord? quizResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
