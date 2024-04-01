import '/flutter_flow/flutter_flow_util.dart';
import 'streak_increase_widget.dart' show StreakIncreaseWidget;
import 'package:flutter/material.dart';

class StreakIncreaseModel extends FlutterFlowModel<StreakIncreaseWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
