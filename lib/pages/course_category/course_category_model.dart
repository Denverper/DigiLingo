import '/flutter_flow/flutter_flow_util.dart';
import 'course_category_widget.dart' show CourseCategoryWidget;
import 'package:flutter/material.dart';

class CourseCategoryModel extends FlutterFlowModel<CourseCategoryWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
