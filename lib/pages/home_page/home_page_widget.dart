import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'textOnPageLoadAnimation1': AnimationInfo(
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
          begin: const Offset(30.0, 0.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'textOnPageLoadAnimation2': AnimationInfo(
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
          begin: const Offset(40.0, 0.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'listViewOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 750.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'textOnPageLoadAnimation3': AnimationInfo(
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
          begin: const Offset(0.0, 40.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'textOnPageLoadAnimation4': AnimationInfo(
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
          begin: const Offset(0.0, 60.0),
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
    'listViewOnPageLoadAnimation3': AnimationInfo(
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
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (currentUserDocument?.lastExcersice != null) {
        await currentUserReference!.update(createUsersRecordData(
          daysSinceLastExcersise: functions.daysBetween(
              currentUserDocument!.lastExcersice!, getCurrentTimestamp),
        ));
        if (valueOrDefault(currentUserDocument?.daysSinceLastExcersise, 0) >
            1) {
          if (valueOrDefault(currentUserDocument?.streak, 0) > 0) {
            await currentUserReference!.update(createUsersRecordData(
              streak: 0,
            ));

            context.pushNamed('streakReset');
          }
        }
      }
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
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: SizedBox(
                height: 500.0,
                child: Stack(
                  alignment: const AlignmentDirectional(0.0, -1.0),
                  children: [
                    if (responsiveVisibility(
                      context: context,
                      phone: false,
                      tablet: false,
                    ))
                      Align(
                        alignment: const AlignmentDirectional(0.0, -1.0),
                        child: Image.network(
                          'https://images.unsplash.com/photo-1454789548928-9efd52dc4031?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyfHxzcGFjZXxlbnwwfHx8fDE3MDA5NDgzNTV8MA&ixlib=rb-4.0.3&q=80&w=1080',
                          width: double.infinity,
                          height: 604.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    if (responsiveVisibility(
                      context: context,
                      tabletLandscape: false,
                      desktop: false,
                    ))
                      Align(
                        alignment: const AlignmentDirectional(0.0, -1.0),
                        child: Image.network(
                          'https://images.unsplash.com/photo-1454789548928-9efd52dc4031?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyfHxzcGFjZXxlbnwwfHx8fDE3MDA5NDgzNTV8MA&ixlib=rb-4.0.3&q=80&w=1080',
                          width: double.infinity,
                          height: 400.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    Container(
                      width: double.infinity,
                      height: 500.0,
                      decoration: const BoxDecoration(
                        color: Color(0x8D090F13),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(1.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 60.0, 16.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        'assets/images/digilingo.png',
                                        width: 110.0,
                                        height: 45.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment:
                                            const AlignmentDirectional(1.0, 0.0),
                                        child: Container(
                                          width: 200.0,
                                          height: 88.0,
                                          decoration: const BoxDecoration(),
                                          child: Align(
                                            alignment:
                                                const AlignmentDirectional(1.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                const Flexible(
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, 0.0),
                                                    child: FaIcon(
                                                      FontAwesomeIcons.fire,
                                                      color: Color(0xFFF38024),
                                                      size: 24.0,
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          1.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(4.0, 0.0,
                                                                0.0, 0.0),
                                                    child: AuthUserStreamWidget(
                                                      builder: (context) =>
                                                          Text(
                                                        valueOrDefault<String>(
                                                          valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.streak,
                                                                  0)
                                                              .toString(),
                                                          '0',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Plus Jakarta Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Flexible(
                                                  child: Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            1.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      child:
                                                          AuthUserStreamWidget(
                                                        builder: (context) =>
                                                            InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            context.pushNamed(
                                                                'profileView');
                                                          },
                                                          child: Container(
                                                            width: 60.0,
                                                            height: 60.0,
                                                            clipBehavior:
                                                                Clip.antiAlias,
                                                            decoration:
                                                                const BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child:
                                                                Image.network(
                                                              valueOrDefault<
                                                                  String>(
                                                                currentUserPhoto,
                                                                'https://i.stack.imgur.com/l60Hf.png',
                                                              ),
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 24.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            '0qeg43sx' /* Hey */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Plus Jakarta Sans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 0.0, 0.0, 0.0),
                                          child: AuthUserStreamWidget(
                                            builder: (context) => Text(
                                              currentUserDisplayName,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'u4m3115x' /* , */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Plus Jakarta Sans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            16.0, 5.0, 16.0, 24.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'muajapnp' /* Lets Jump In. */,
                                          ),
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .displaySmall
                                              .override(
                                                fontFamily: 'Urbanist',
                                                color: Colors.white,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 32.0, 0.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                height: 700.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(0.0),
                                    bottomRight: Radius.circular(0.0),
                                    topLeft: Radius.circular(16.0),
                                    topRight: Radius.circular(16.0),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 0.0, 24.0),
                                  child: SingleChildScrollView(
                                    primary: false,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 16.0, 16.0, 0.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'g80flidl' /* Choose Your Path. */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .headlineMedium
                                                .override(
                                                  fontFamily: 'Urbanist',
                                                  letterSpacing: 0.0,
                                                ),
                                          ).animateOnPageLoad(animationsMap[
                                              'textOnPageLoadAnimation1']!),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 4.0, 16.0, 0.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              '3cku64h0' /* Explore the Digital World */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  fontFamily:
                                                      'Plus Jakarta Sans',
                                                  letterSpacing: 0.0,
                                                ),
                                          ).animateOnPageLoad(animationsMap[
                                              'textOnPageLoadAnimation2']!),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 12.0, 0.0, 0.0),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Container(
                                              height: 200.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                              ),
                                              child: StreamBuilder<
                                                  List<CategoriesRecord>>(
                                                stream: queryCategoriesRecord(),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child:
                                                            SpinKitFadingCube(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 50.0,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<CategoriesRecord>
                                                      listViewCategoriesRecordList =
                                                      snapshot.data!;
                                                  return ListView.builder(
                                                    padding: EdgeInsets.zero,
                                                    primary: false,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemCount:
                                                        listViewCategoriesRecordList
                                                            .length,
                                                    itemBuilder: (context,
                                                        listViewIndex) {
                                                      final listViewCategoriesRecord =
                                                          listViewCategoriesRecordList[
                                                              listViewIndex];
                                                      return Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    8.0,
                                                                    16.0,
                                                                    12.0),
                                                        child: Container(
                                                          width: 150.0,
                                                          height: 100.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            boxShadow: const [
                                                              BoxShadow(
                                                                blurRadius: 8.0,
                                                                color: Color(
                                                                    0x230F1113),
                                                                offset: Offset(
                                                                  0.0,
                                                                  4.0,
                                                                ),
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        0.0,
                                                                        -1.0),
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          20.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      if (listViewCategoriesRecord
                                                                              .categoryName ==
                                                                          'Favorites') {
                                                                        context
                                                                            .pushNamed(
                                                                          'FavoriteCourses',
                                                                          queryParameters:
                                                                              {
                                                                            'categoryRef':
                                                                                serializeParam(
                                                                              listViewCategoriesRecord.reference,
                                                                              ParamType.DocumentReference,
                                                                            ),
                                                                          }.withoutNulls,
                                                                          extra: <String,
                                                                              dynamic>{
                                                                            kTransitionInfoKey:
                                                                                const TransitionInfo(
                                                                              hasTransition: true,
                                                                              transitionType: PageTransitionType.fade,
                                                                            ),
                                                                          },
                                                                        );
                                                                      } else {
                                                                        context
                                                                            .pushNamed(
                                                                          'CourseCategory',
                                                                          queryParameters:
                                                                              {
                                                                            'categoryRef':
                                                                                serializeParam(
                                                                              listViewCategoriesRecord.reference,
                                                                              ParamType.DocumentReference,
                                                                            ),
                                                                          }.withoutNulls,
                                                                          extra: <String,
                                                                              dynamic>{
                                                                            kTransitionInfoKey:
                                                                                const TransitionInfo(
                                                                              hasTransition: true,
                                                                              transitionType: PageTransitionType.fade,
                                                                            ),
                                                                          },
                                                                        );
                                                                      }
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          100.0,
                                                                      height:
                                                                          100.0,
                                                                      clipBehavior:
                                                                          Clip.antiAlias,
                                                                      decoration:
                                                                          const BoxDecoration(
                                                                        shape: BoxShape
                                                                            .circle,
                                                                      ),
                                                                      child: Image
                                                                          .network(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          listViewCategoriesRecord
                                                                              .buttonImage,
                                                                          'https://imgur.com/mnYm0GK',
                                                                        ),
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    listViewCategoriesRecord
                                                                        .categoryName,
                                                                    'N/A',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Plus Jakarta Sans',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
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
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 16.0, 16.0, 0.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              '3nlrqlxc' /* Training Zone */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .headlineMedium
                                                .override(
                                                  fontFamily: 'Urbanist',
                                                  letterSpacing: 0.0,
                                                ),
                                          ).animateOnPageLoad(animationsMap[
                                              'textOnPageLoadAnimation3']!),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 4.0, 16.0, 0.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'eusrqrvm' /* Pick up some quick, impactful ... */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  fontFamily:
                                                      'Plus Jakarta Sans',
                                                  letterSpacing: 0.0,
                                                ),
                                          ).animateOnPageLoad(animationsMap[
                                              'textOnPageLoadAnimation4']!),
                                        ),
                                        if (responsiveVisibility(
                                          context: context,
                                          tabletLandscape: false,
                                          desktop: false,
                                        ))
                                          Container(
                                            decoration: const BoxDecoration(),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 48.0),
                                              child: StreamBuilder<
                                                  List<ShortTasksRecord>>(
                                                stream: queryShortTasksRecord(),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child:
                                                            SpinKitFadingCube(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
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
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        listViewShortTasksRecordList
                                                            .length,
                                                    itemBuilder: (context,
                                                        listViewIndex) {
                                                      final listViewShortTasksRecord =
                                                          listViewShortTasksRecordList[
                                                              listViewIndex];
                                                      return Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    8.0,
                                                                    16.0,
                                                                    8.0),
                                                        child: Container(
                                                          width: 270.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            boxShadow: const [
                                                              BoxShadow(
                                                                blurRadius: 8.0,
                                                                color: Color(
                                                                    0x230F1113),
                                                                offset: Offset(
                                                                  0.0,
                                                                  4.0,
                                                                ),
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  context
                                                                      .pushNamed(
                                                                    'shortTaskLessons',
                                                                    queryParameters:
                                                                        {
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
                                                                  tag: listViewShortTasksRecord
                                                                      .image,
                                                                  transitionOnUserGestures:
                                                                      true,
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        const BorderRadius
                                                                            .only(
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              0.0),
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              0.0),
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              12.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              12.0),
                                                                    ),
                                                                    child: Image
                                                                        .network(
                                                                      listViewShortTasksRecord
                                                                          .image,
                                                                      width: double
                                                                          .infinity,
                                                                      height:
                                                                          200.0,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        12.0,
                                                                        16.0,
                                                                        12.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            listViewShortTasksRecord.taskName,
                                                                            style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                  fontFamily: 'Plus Jakarta Sans',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            listViewShortTasksRecord.description,
                                                                            style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                  fontFamily: 'Plus Jakarta Sans',
                                                                                  letterSpacing: 0.0,
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
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .check_circle,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          size:
                                                                              35.0,
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
                                          ),
                                        if (responsiveVisibility(
                                          context: context,
                                          phone: false,
                                          tablet: false,
                                        ))
                                          Container(
                                            width: double.infinity,
                                            height: 340.0,
                                            decoration: const BoxDecoration(),
                                            child: Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 48.0),
                                                child: StreamBuilder<
                                                    List<ShortTasksRecord>>(
                                                  stream:
                                                      queryShortTasksRecord(),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          child:
                                                              SpinKitFadingCube(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
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
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      itemCount:
                                                          listViewShortTasksRecordList
                                                              .length,
                                                      itemBuilder: (context,
                                                          listViewIndex) {
                                                        final listViewShortTasksRecord =
                                                            listViewShortTasksRecordList[
                                                                listViewIndex];
                                                        return Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      8.0,
                                                                      16.0,
                                                                      8.0),
                                                          child: Container(
                                                            width: 270.0,
                                                            height: 200.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              boxShadow: const [
                                                                BoxShadow(
                                                                  blurRadius:
                                                                      8.0,
                                                                  color: Color(
                                                                      0x230F1113),
                                                                  offset:
                                                                      Offset(
                                                                    0.0,
                                                                    4.0,
                                                                  ),
                                                                )
                                                              ],
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                width: 1.0,
                                                              ),
                                                            ),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    context
                                                                        .pushNamed(
                                                                      'shortTaskLessons',
                                                                      queryParameters:
                                                                          {
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
                                                                    tag: listViewShortTasksRecord
                                                                        .image,
                                                                    transitionOnUserGestures:
                                                                        true,
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          const BorderRadius
                                                                              .only(
                                                                        bottomLeft:
                                                                            Radius.circular(0.0),
                                                                        bottomRight:
                                                                            Radius.circular(0.0),
                                                                        topLeft:
                                                                            Radius.circular(12.0),
                                                                        topRight:
                                                                            Radius.circular(12.0),
                                                                      ),
                                                                      child: Image
                                                                          .network(
                                                                        listViewShortTasksRecord
                                                                            .image,
                                                                        width: double
                                                                            .infinity,
                                                                        height:
                                                                            200.0,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          12.0,
                                                                          16.0,
                                                                          12.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Text(
                                                                              listViewShortTasksRecord.taskName,
                                                                              style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                    fontFamily: 'Plus Jakarta Sans',
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                            Text(
                                                                              listViewShortTasksRecord.description,
                                                                              style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                    fontFamily: 'Plus Jakarta Sans',
                                                                                    letterSpacing: 0.0,
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
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              10.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Icon(
                                                                            Icons.check_circle,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            size:
                                                                                35.0,
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
                                                    ).animateOnPageLoad(
                                                        animationsMap[
                                                            'listViewOnPageLoadAnimation3']!);
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
