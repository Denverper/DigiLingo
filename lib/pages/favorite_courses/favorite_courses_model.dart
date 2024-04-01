import '/flutter_flow/flutter_flow_util.dart';
import 'favorite_courses_widget.dart' show FavoriteCoursesWidget;
import 'package:flutter/material.dart';

class FavoriteCoursesModel extends FlutterFlowModel<FavoriteCoursesWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
