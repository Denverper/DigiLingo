import '/flutter_flow/flutter_flow_util.dart';
import 'short_content_section_widget.dart' show ShortContentSectionWidget;
import 'package:flutter/material.dart';

class ShortContentSectionModel
    extends FlutterFlowModel<ShortContentSectionWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
