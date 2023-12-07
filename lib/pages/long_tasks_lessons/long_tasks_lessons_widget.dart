import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'long_tasks_lessons_model.dart';
export 'long_tasks_lessons_model.dart';

class LongTasksLessonsWidget extends StatefulWidget {
  const LongTasksLessonsWidget({
    super.key,
    required this.longTaskReference,
  });

  final DocumentReference? longTaskReference;

  @override
  _LongTasksLessonsWidgetState createState() => _LongTasksLessonsWidgetState();
}

class _LongTasksLessonsWidgetState extends State<LongTasksLessonsWidget> {
  late LongTasksLessonsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LongTasksLessonsModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: StreamBuilder<LongTasksRecord>(
            stream: LongTasksRecord.getDocument(widget.longTaskReference!),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                );
              }
              final textLongTasksRecord = snapshot.data!;
              return Text(
                textLongTasksRecord.taskName,
                style: FlutterFlowTheme.of(context).titleMedium,
              );
            },
          ),
          actions: const [],
          flexibleSpace: FlexibleSpaceBar(
            background: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                'https://images.unsplash.com/photo-1436891620584-47fd0e565afb?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxM3x8c2t5fGVufDB8fHx8MTcwMTQ1MjI5NHww&ixlib=rb-4.0.3&q=80&w=1080',
                fit: BoxFit.cover,
                alignment: const Alignment(0.00, 0.24),
              ),
            ),
          ),
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: StreamBuilder<List<LongTaskLessonsRecord>>(
                  stream: queryLongTaskLessonsRecord(
                    queryBuilder: (longTaskLessonsRecord) =>
                        longTaskLessonsRecord
                            .where(
                              'longTaskRef',
                              isEqualTo: widget.longTaskReference,
                            )
                            .orderBy('number'),
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }
                    List<LongTaskLessonsRecord>
                        listViewLongTaskLessonsRecordList = snapshot.data!;
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewLongTaskLessonsRecordList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewLongTaskLessonsRecord =
                            listViewLongTaskLessonsRecordList[listViewIndex];
                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 0.0),
                              child: FlutterFlowIconButton(
                                borderRadius: 20.0,
                                borderWidth: 1.0,
                                buttonSize: 40.0,
                                disabledColor: const Color(0xB10C621E),
                                disabledIconColor:
                                    FlutterFlowTheme.of(context).info,
                                icon: Icon(
                                  Icons.adjust,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                                onPressed:
                                    listViewLongTaskLessonsRecord.isCompleted
                                        ? null
                                        : () {
                                            print('IconButton pressed ...');
                                          },
                              ),
                            ),
                            Text(
                              listViewLongTaskLessonsRecord.name,
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
