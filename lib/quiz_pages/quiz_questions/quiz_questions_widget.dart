import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'quiz_questions_model.dart';
export 'quiz_questions_model.dart';

class QuizQuestionsWidget extends StatefulWidget {
  const QuizQuestionsWidget({
    super.key,
    required this.index,
    required this.shortContentRef,
    required this.quizRef,
    required this.quizResultRef,
    required this.numCorrectAnswers,
  });

  final int? index;
  final DocumentReference? shortContentRef;
  final QuizzesRecord? quizRef;
  final QuizResultRecord? quizResultRef;
  final int? numCorrectAnswers;

  @override
  State<QuizQuestionsWidget> createState() => _QuizQuestionsWidgetState();
}

class _QuizQuestionsWidgetState extends State<QuizQuestionsWidget>
    with TickerProviderStateMixin {
  late QuizQuestionsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'textOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 150.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 150.ms,
          duration: 400.ms,
          begin: 0.0,
          end: 1.0,
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 150.ms,
          duration: 400.ms,
          begin: const Offset(0.9, 0.9),
          end: const Offset(1.0, 1.0),
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 150.ms,
          duration: 400.ms,
          begin: const Offset(0.0, 40.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'textOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 175.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 175.ms,
          duration: 400.ms,
          begin: 0.0,
          end: 1.0,
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 175.ms,
          duration: 400.ms,
          begin: const Offset(0.9, 0.9),
          end: const Offset(1.0, 1.0),
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 175.ms,
          duration: 400.ms,
          begin: const Offset(0.0, 40.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 200.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 400.ms,
          begin: 0.0,
          end: 1.0,
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 400.ms,
          begin: const Offset(0.9, 0.9),
          end: const Offset(1.0, 1.0),
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 400.ms,
          begin: const Offset(0.0, 40.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: const Offset(0.0, 20.0),
          end: const Offset(0.0, 0.0),
        ),
        ScaleEffect(
          curve: Curves.bounceOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: const Offset(0.8, 0.8),
          end: const Offset(1.0, 1.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: const Offset(0.0, 20.0),
          end: const Offset(0.0, 0.0),
        ),
        ScaleEffect(
          curve: Curves.bounceOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: const Offset(0.8, 0.8),
          end: const Offset(1.0, 1.0),
        ),
      ],
    ),
    'rowOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: 0.0,
          end: 1.0,
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: const Offset(0.9, 0.9),
          end: const Offset(1.0, 1.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuizQuestionsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.selectedAnswer = 'none';
        _model.answerCorrect = false;
        _model.answerWrong = false;
      });
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<QuestionsRecord>>(
      stream: queryQuestionsRecord(
        queryBuilder: (questionsRecord) => questionsRecord
            .where(
              'questionQuizID',
              isEqualTo: widget.quizRef?.quizID,
            )
            .where(
              'index',
              isEqualTo: widget.index,
            ),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitFadingCube(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 50.0,
                ),
              ),
            ),
          );
        }
        List<QuestionsRecord> quizQuestionsQuestionsRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final quizQuestionsQuestionsRecord =
            quizQuestionsQuestionsRecordList.isNotEmpty
                ? quizQuestionsQuestionsRecordList.first
                : null;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Container(
                  width: double.infinity,
                  constraints: const BoxConstraints(
                    maxWidth: 770.0,
                  ),
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            primary: false,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 4.0, 0.0, 0.0),
                                        child: RichText(
                                          textScaler:
                                              MediaQuery.of(context).textScaler,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  't6yxn8q4' /* Current Question:   */,
                                                ),
                                                style: const TextStyle(),
                                              )
                                            ],
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  fontFamily:
                                                      'Plus Jakarta Sans',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      valueOrDefault<String>(
                                        quizQuestionsQuestionsRecord?.index
                                            .toString(),
                                        '1',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Plus Jakarta Sans',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'kuu74e5i' /*   /   */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Plus Jakarta Sans',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Text(
                                      valueOrDefault<String>(
                                        widget.quizRef?.numQuestions
                                            .toString(),
                                        '1',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Plus Jakarta Sans',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Align(
                                      alignment: const AlignmentDirectional(1.0, 0.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            40.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          valueOrDefault<String>(
                                            widget.numCorrectAnswers
                                                ?.toString(),
                                            '0',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Plus Jakarta Sans',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'fi6ecy3k' /*   correct  */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Plus Jakarta Sans',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ],
                                ),
                                Divider(
                                  height: 32.0,
                                  thickness: 1.0,
                                  color: FlutterFlowTheme.of(context).alternate,
                                ),
                                SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        quizQuestionsQuestionsRecord!.question,
                                        style: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .override(
                                              fontFamily: 'Urbanist',
                                              letterSpacing: 0.0,
                                            ),
                                      ).animateOnPageLoad(animationsMap[
                                          'textOnPageLoadAnimation1']!),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 4.0, 0.0, 0.0),
                                        child: Text(
                                          quizQuestionsQuestionsRecord
                                              .description,
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .override(
                                                fontFamily: 'Plus Jakarta Sans',
                                                letterSpacing: 0.0,
                                              ),
                                        ).animateOnPageLoad(animationsMap[
                                            'textOnPageLoadAnimation2']!),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 12.0, 0.0, 0.0),
                                        child: Builder(
                                          builder: (context) {
                                            final options =
                                                quizQuestionsQuestionsRecord
                                                        .options
                                                        .toList() ??
                                                    [];
                                            return ListView.separated(
                                              padding: EdgeInsets.zero,
                                              primary: false,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount: options.length,
                                              separatorBuilder: (_, __) =>
                                                  const SizedBox(height: 16.0),
                                              itemBuilder:
                                                  (context, optionsIndex) {
                                                final optionsItem =
                                                    options[optionsIndex];
                                                return InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    setState(() {
                                                      _model.selectedAnswer =
                                                          optionsItem
                                                              .optionName;
                                                    });
                                                  },
                                                  child: AnimatedContainer(
                                                    duration: const Duration(
                                                        milliseconds: 200),
                                                    curve: Curves.easeInOut,
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: optionsItem
                                                                  .optionName ==
                                                              _model
                                                                  .selectedAnswer
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .accent1
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                      border: Border.all(
                                                        color: optionsItem
                                                                    .optionName ==
                                                                _model
                                                                    .selectedAnswer
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .primary
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                        width: 2.0,
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(12.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          8.0),
                                                              child: Text(
                                                                optionsItem
                                                                    .optionName,
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Urbanist',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ).animateOnPageLoad(animationsMap[
                                                    'containerOnPageLoadAnimation1']!);
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ].addToEnd(const SizedBox(height: 44.0)),
                                  ),
                                ),
                                if (_model.answerCorrect == true)
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: const Color(0x8820AD5B),
                                      borderRadius: BorderRadius.circular(12.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        width: 2.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 16.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '6obw0ttg' /* Great work!! */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineSmall
                                                      .override(
                                                        fontFamily: 'Urbanist',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 8.0, 0.0, 0.0),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'zapwfju3' /* You answered Correctly!  */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Plus Jakarta Sans',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Icon(
                                            Icons.check_circle_outline_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 32.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ).animateOnPageLoad(animationsMap[
                                      'containerOnPageLoadAnimation2']!),
                                if (_model.answerWrong == true)
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: const Color(0x4DEE6262),
                                      borderRadius: BorderRadius.circular(12.0),
                                      border: Border.all(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 16.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.all(12.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '3crr8efh' /* Ahh no!! */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .headlineSmall
                                                        .override(
                                                          fontFamily:
                                                              'Urbanist',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 8.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '6ey0k4d6' /* Your answer is wrong!! Sorry, ... */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Plus Jakarta Sans',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Icon(
                                            Icons.error_outline_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            size: 32.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ).animateOnPageLoad(animationsMap[
                                      'containerOnPageLoadAnimation3']!),
                              ]
                                  .divide(const SizedBox(height: 4.0))
                                  .addToEnd(const SizedBox(height: 24.0)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 16.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    if (_model.selectedAnswer ==
                                        quizQuestionsQuestionsRecord
                                            .correctOption) {
                                      setState(() {
                                        _model.answerCorrect = true;
                                      });
                                      // updateQuizRef

                                      await widget.quizResultRef!.reference
                                          .update({
                                        ...mapToFirestore(
                                          {
                                            'currentQuestion':
                                                FieldValue.increment(1),
                                            'answers': FieldValue.arrayUnion(
                                                [_model.selectedAnswer]),
                                          },
                                        ),
                                      });
                                      await Future.delayed(
                                          const Duration(milliseconds: 2000));
                                      if (widget.index ==
                                          widget.quizRef?.numQuestions) {
                                        context.pushNamed(
                                          'quizComplete',
                                          queryParameters: {
                                            'numCorrect': serializeParam(
                                              functions.increaseCorrect(
                                                  widget.numCorrectAnswers),
                                              ParamType.int,
                                            ),
                                            'quizResult': serializeParam(
                                              widget.quizResultRef,
                                              ParamType.Document,
                                            ),
                                            'quizRef': serializeParam(
                                              widget.quizRef,
                                              ParamType.Document,
                                            ),
                                            'shortContentTask': serializeParam(
                                              widget.shortContentRef,
                                              ParamType.DocumentReference,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            'quizResult': widget.quizResultRef,
                                            'quizRef': widget.quizRef,
                                          },
                                        );
                                      } else {
                                        context.pushNamed(
                                          'quizQuestions',
                                          queryParameters: {
                                            'index': serializeParam(
                                              functions
                                                  .increaseIndex(widget.index),
                                              ParamType.int,
                                            ),
                                            'shortContentRef': serializeParam(
                                              widget.shortContentRef,
                                              ParamType.DocumentReference,
                                            ),
                                            'quizRef': serializeParam(
                                              widget.quizRef,
                                              ParamType.Document,
                                            ),
                                            'quizResultRef': serializeParam(
                                              widget.quizResultRef,
                                              ParamType.Document,
                                            ),
                                            'numCorrectAnswers': serializeParam(
                                              functions.increaseCorrect(
                                                  widget.numCorrectAnswers),
                                              ParamType.int,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            'quizRef': widget.quizRef,
                                            'quizResultRef':
                                                widget.quizResultRef,
                                            kTransitionInfoKey: const TransitionInfo(
                                              hasTransition: true,
                                              transitionType:
                                                  PageTransitionType.fade,
                                              duration:
                                                  Duration(milliseconds: 0),
                                            ),
                                          },
                                        );
                                      }
                                    } else {
                                      setState(() {
                                        _model.answerWrong = true;
                                      });
                                      // updateQuizRef

                                      await widget.quizResultRef!.reference
                                          .update({
                                        ...mapToFirestore(
                                          {
                                            'currentQuestion':
                                                FieldValue.increment(1),
                                            'answers': FieldValue.arrayUnion(
                                                [_model.selectedAnswer]),
                                          },
                                        ),
                                      });
                                      await Future.delayed(
                                          const Duration(milliseconds: 2000));
                                      if (widget.index ==
                                          widget.quizRef?.numQuestions) {
                                        context.pushNamed(
                                          'quizComplete',
                                          queryParameters: {
                                            'numCorrect': serializeParam(
                                              widget.numCorrectAnswers,
                                              ParamType.int,
                                            ),
                                            'quizResult': serializeParam(
                                              widget.quizResultRef,
                                              ParamType.Document,
                                            ),
                                            'quizRef': serializeParam(
                                              widget.quizRef,
                                              ParamType.Document,
                                            ),
                                            'shortContentTask': serializeParam(
                                              widget.shortContentRef,
                                              ParamType.DocumentReference,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            'quizResult': widget.quizResultRef,
                                            'quizRef': widget.quizRef,
                                          },
                                        );
                                      } else {
                                        context.pushNamed(
                                          'quizQuestions',
                                          queryParameters: {
                                            'index': serializeParam(
                                              functions
                                                  .increaseIndex(widget.index),
                                              ParamType.int,
                                            ),
                                            'shortContentRef': serializeParam(
                                              widget.shortContentRef,
                                              ParamType.DocumentReference,
                                            ),
                                            'quizRef': serializeParam(
                                              widget.quizRef,
                                              ParamType.Document,
                                            ),
                                            'quizResultRef': serializeParam(
                                              widget.quizResultRef,
                                              ParamType.Document,
                                            ),
                                            'numCorrectAnswers': serializeParam(
                                              widget.numCorrectAnswers,
                                              ParamType.int,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            'quizRef': widget.quizRef,
                                            'quizResultRef':
                                                widget.quizResultRef,
                                            kTransitionInfoKey: const TransitionInfo(
                                              hasTransition: true,
                                              transitionType:
                                                  PageTransitionType.fade,
                                              duration:
                                                  Duration(milliseconds: 0),
                                            ),
                                          },
                                        );
                                      }
                                    }
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'zjozq0ul' /* Next */,
                                  ),
                                  options: FFButtonOptions(
                                    height: 40.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Plus Jakarta Sans',
                                          letterSpacing: 0.0,
                                        ),
                                    elevation: 3.0,
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                    hoverColor:
                                        FlutterFlowTheme.of(context).accent1,
                                    hoverBorderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 1.0,
                                    ),
                                    hoverTextColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    hoverElevation: 0.0,
                                  ),
                                ),
                              ),
                            ].divide(const SizedBox(width: 16.0)),
                          ).animateOnPageLoad(
                              animationsMap['rowOnPageLoadAnimation']!),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
