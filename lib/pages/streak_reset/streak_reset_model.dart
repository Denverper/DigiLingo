import '/flutter_flow/flutter_flow_util.dart';
import 'streak_reset_widget.dart' show StreakResetWidget;
import 'package:flutter/material.dart';

class StreakResetModel extends FlutterFlowModel<StreakResetWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
