import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'quiz_complete_model.dart';
export 'quiz_complete_model.dart';

class QuizCompleteWidget extends StatefulWidget {
  const QuizCompleteWidget({
    super.key,
    required this.numCorrect,
    required this.quizResult,
    required this.quizRef,
    required this.shortContentTask,
  });

  final int? numCorrect;
  final QuizResultRecord? quizResult;
  final QuizzesRecord? quizRef;
  final DocumentReference? shortContentTask;

  @override
  State<QuizCompleteWidget> createState() => _QuizCompleteWidgetState();
}

class _QuizCompleteWidgetState extends State<QuizCompleteWidget> {
  late QuizCompleteModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuizCompleteModel());

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
        backgroundColor: const Color(0x4D4A966A),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.network(
                      'https://assets10.lottiefiles.com/packages/lf20_xlkxtmul.json',
                      width: 200.0,
                      height: 200.0,
                      fit: BoxFit.cover,
                      frameRate: FrameRate(60.0),
                      repeat: false,
                      animate: true,
                    ),
                  ],
                ),
              ),
              Text(
                FFLocalizations.of(context).getText(
                  'k64qcscm' /* Congrats! */,
                ),
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Urbanist',
                      color: Colors.white,
                      fontSize: 32.0,
                      letterSpacing: 0.0,
                    ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(32.0, 12.0, 32.0, 12.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    '9i388bfn' /* Thanks for taking the quiz.  */,
                  ),
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Plus Jakarta Sans',
                        color: const Color(0xFFF8F8F8),
                        fontSize: 20.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w300,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(32.0, 12.0, 32.0, 12.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 12.0, 0.0, 12.0),
                        child: Text(
                          formatNumber(
                            functions.calculatePercentCorrect(
                                widget.quizRef!.numQuestions,
                                widget.numCorrect!),
                            formatType: FormatType.percent,
                          ),
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: const Color(0xFFF3F3F3),
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'liehd1s3' /*   correct  */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Plus Jakarta Sans',
                              color: const Color(0xFFF5F5F5),
                              fontSize: 20.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w300,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              if (widget.numCorrect != widget.quizRef?.numQuestions)
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(32.0, 12.0, 32.0, 12.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'j8ds47sn' /* Get 100% to increase your stre... */,
                    ),
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Plus Jakarta Sans',
                          color: const Color(0xFFF8F8F8),
                          fontSize: 15.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w100,
                        ),
                  ),
                ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 44.0, 0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    var shouldSetState = false;
                    await widget.quizResult!.reference.delete();
                    if (widget.numCorrect == widget.quizRef?.numQuestions) {
                      _model.shortContent =
                          await ShortTasksContentRecord.getDocumentOnce(
                              widget.shortContentTask!);
                      shouldSetState = true;

                      await _model.shortContent!.shortTaskRef!.update({
                        ...mapToFirestore(
                          {
                            'usersCompleted':
                                FieldValue.arrayUnion([currentUserReference]),
                          },
                        ),
                      });
                      if (valueOrDefault(currentUserDocument?.streak, 0) == 0) {
                        await currentUserReference!
                            .update(createUsersRecordData(
                          streak: functions.increaseStreak(
                              valueOrDefault(currentUserDocument?.streak, 0)),
                          lastExcersice: getCurrentTimestamp,
                        ));

                        context.pushNamed('streakIncrease');

                        if (shouldSetState) setState(() {});
                        return;
                      } else {
                        if (currentUserDocument?.lastExcersice != null) {
                          await currentUserReference!
                              .update(createUsersRecordData(
                            daysSinceLastExcersise: functions.daysBetween(
                                currentUserDocument!.lastExcersice!,
                                getCurrentTimestamp),
                          ));
                          if (valueOrDefault(
                                  currentUserDocument?.daysSinceLastExcersise,
                                  0) ==
                              1) {
                            await currentUserReference!
                                .update(createUsersRecordData(
                              streak: functions.increaseStreak(valueOrDefault(
                                  currentUserDocument?.streak, 0)),
                              lastExcersice: getCurrentTimestamp,
                            ));

                            context.pushNamed('streakIncrease');

                            if (shouldSetState) setState(() {});
                            return;
                          } else {
                            if (valueOrDefault(
                                    currentUserDocument?.daysSinceLastExcersise,
                                    0) >
                                1) {
                              if (valueOrDefault(
                                      currentUserDocument?.streak, 0) >
                                  0) {
                                await currentUserReference!
                                    .update(createUsersRecordData(
                                  streak: 0,
                                  lastExcersice: getCurrentTimestamp,
                                ));

                                context.pushNamed('streakReset');
                              }
                            }
                          }
                        } else {
                          await currentUserReference!
                              .update(createUsersRecordData(
                            lastExcersice: getCurrentTimestamp,
                          ));

                          await currentUserReference!
                              .update(createUsersRecordData(
                            streak: functions.increaseStreak(
                                valueOrDefault(currentUserDocument?.streak, 0)),
                          ));

                          context.pushNamed('streakIncrease');

                          if (shouldSetState) setState(() {});
                          return;
                        }
                      }
                    }

                    context.pushNamed(
                      'homePage',
                      extra: <String, dynamic>{
                        kTransitionInfoKey: const TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.scale,
                          alignment: Alignment.bottomCenter,
                          duration: Duration(milliseconds: 250),
                        ),
                      },
                    );

                    if (shouldSetState) setState(() {});
                  },
                  text: FFLocalizations.of(context).getText(
                    'fu30dtbf' /* Go Home */,
                  ),
                  options: FFButtonOptions(
                    width: 130.0,
                    height: 50.0,
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primaryBtnText,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Plus Jakarta Sans',
                          color: FlutterFlowTheme.of(context).primaryText,
                          letterSpacing: 0.0,
                        ),
                    elevation: 3.0,
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
