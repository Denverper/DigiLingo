import '/flutter_flow/flutter_flow_util.dart';
import 'long_tasks_lessons_widget.dart' show LongTasksLessonsWidget;
import 'package:flutter/material.dart';

class LongTasksLessonsModel extends FlutterFlowModel<LongTasksLessonsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
