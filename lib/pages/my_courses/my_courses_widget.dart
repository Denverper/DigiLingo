import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'my_courses_model.dart';
export 'my_courses_model.dart';

class MyCoursesWidget extends StatefulWidget {
  const MyCoursesWidget({
    super.key,
    this.categoryRef,
  });

  final DocumentReference? categoryRef;

  @override
  State<MyCoursesWidget> createState() => _MyCoursesWidgetState();
}

class _MyCoursesWidgetState extends State<MyCoursesWidget>
    with TickerProviderStateMixin {
  late MyCoursesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'listViewOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(0.0, 80.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'listViewOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(0.0, 80.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyCoursesModel());

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(24.0, 30.0, 0.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'gap785ic' /* Courses */,
                    ),
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily: 'Urbanist',
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            constraints: const BoxConstraints(
                              maxWidth: 570.0,
                            ),
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).alternate,
                                width: 2.0,
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 48.0),
                                    child:
                                        StreamBuilder<List<ShortTasksRecord>>(
                                      stream: queryShortTasksRecord(
                                        queryBuilder: (shortTasksRecord) =>
                                            shortTasksRecord.where(
                                          'categories',
                                          arrayContains: widget.categoryRef,
                                        ),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: SpinKitFadingCube(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 50.0,
                                              ),
                                            ),
                                          );
                                        }
                                        List<ShortTasksRecord>
                                            listViewShortTasksRecordList =
                                            snapshot.data!;
                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              listViewShortTasksRecordList
                                                  .length,
                                          itemBuilder:
                                              (context, listViewIndex) {
                                            final listViewShortTasksRecord =
                                                listViewShortTasksRecordList[
                                                    listViewIndex];
                                            return Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 8.0, 16.0, 8.0),
                                              child: Container(
                                                width: 270.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  boxShadow: const [
                                                    BoxShadow(
                                                      blurRadius: 8.0,
                                                      color: Color(0x230F1113),
                                                      offset: Offset(
                                                        0.0,
                                                        4.0,
                                                      ),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 1.0,
                                                  ),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        context.pushNamed(
                                                          'shortTaskLessons',
                                                          queryParameters: {
                                                            'shortTaskReference':
                                                                serializeParam(
                                                              listViewShortTasksRecord
                                                                  .reference,
                                                              ParamType
                                                                  .DocumentReference,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      },
                                                      child: Hero(
                                                        tag:
                                                            listViewShortTasksRecord
                                                                .image,
                                                        transitionOnUserGestures:
                                                            true,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              const BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    0.0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    0.0),
                                                            topLeft:
                                                                Radius.circular(
                                                                    12.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    12.0),
                                                          ),
                                                          child: Image.network(
                                                            listViewShortTasksRecord
                                                                .image,
                                                            width:
                                                                double.infinity,
                                                            height: 200.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  12.0,
                                                                  16.0,
                                                                  12.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Expanded(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  listViewShortTasksRecord
                                                                      .taskName,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            'Plus Jakarta Sans',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                                Text(
                                                                  listViewShortTasksRecord
                                                                      .description,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Plus Jakarta Sans',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          if (listViewShortTasksRecord
                                                              .usersCompleted
                                                              .contains(
                                                                  currentUserReference))
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Icon(
                                                                Icons
                                                                    .check_circle,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                size: 35.0,
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        ).animateOnPageLoad(animationsMap[
                                            'listViewOnPageLoadAnimation1']!);
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 48.0),
                                  child: StreamBuilder<List<LongTasksRecord>>(
                                    stream: queryLongTasksRecord(
                                      queryBuilder: (longTasksRecord) =>
                                          longTasksRecord.where(
                                        'categories',
                                        arrayContains: widget.categoryRef,
                                      ),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: SpinKitFadingCube(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 50.0,
                                            ),
                                          ),
                                        );
                                      }
                                      List<LongTasksRecord>
                                          listViewLongTasksRecordList =
                                          snapshot.data!;
                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount:
                                            listViewLongTasksRecordList.length,
                                        itemBuilder: (context, listViewIndex) {
                                          final listViewLongTasksRecord =
                                              listViewLongTasksRecordList[
                                                  listViewIndex];
                                          return Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 8.0, 16.0, 8.0),
                                            child: Container(
                                              width: 270.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                boxShadow: const [
                                                  BoxShadow(
                                                    blurRadius: 8.0,
                                                    color: Color(0x230F1113),
                                                    offset: Offset(
                                                      0.0,
                                                      4.0,
                                                    ),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 1.0,
                                                ),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      context.pushNamed(
                                                        'longTasksLessons',
                                                        queryParameters: {
                                                          'longTaskReference':
                                                              serializeParam(
                                                            listViewLongTasksRecord
                                                                .reference,
                                                            ParamType
                                                                .DocumentReference,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    },
                                                    child: Hero(
                                                      tag:
                                                          listViewLongTasksRecord
                                                              .image,
                                                      transitionOnUserGestures:
                                                          true,
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            const BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  0.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  0.0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  12.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  12.0),
                                                        ),
                                                        child: Image.network(
                                                          listViewLongTasksRecord
                                                              .image,
                                                          width:
                                                              double.infinity,
                                                          height: 200.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                16.0,
                                                                12.0,
                                                                16.0,
                                                                12.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Expanded(
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                listViewLongTasksRecord
                                                                    .taskName,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Plus Jakarta Sans',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                              Text(
                                                                listViewLongTasksRecord
                                                                    .description,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Plus Jakarta Sans',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ).animateOnPageLoad(animationsMap[
                                          'listViewOnPageLoadAnimation2']!);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ].divide(const SizedBox(height: 12.0)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
