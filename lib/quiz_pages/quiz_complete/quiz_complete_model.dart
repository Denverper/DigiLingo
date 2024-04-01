import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'quiz_complete_widget.dart' show QuizCompleteWidget;
import 'package:flutter/material.dart';

class QuizCompleteModel extends FlutterFlowModel<QuizCompleteWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  ShortTasksContentRecord? shortContent;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
