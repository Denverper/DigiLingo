import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'streak_increase_model.dart';
export 'streak_increase_model.dart';

class StreakIncreaseWidget extends StatefulWidget {
  const StreakIncreaseWidget({super.key});

  @override
  State<StreakIncreaseWidget> createState() => _StreakIncreaseWidgetState();
}

class _StreakIncreaseWidgetState extends State<StreakIncreaseWidget> {
  late StreakIncreaseModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StreakIncreaseModel());

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
        backgroundColor: const Color(0xEBC7D5E1),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 40.0),
                            child: Lottie.asset(
                              'assets/lottie_animations/Animation_-_1710284855271.json',
                              width: 120.0,
                              height: 120.0,
                              fit: BoxFit.cover,
                              frameRate: FrameRate(60.0),
                              animate: true,
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
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Flexible(
                        child: Align(
                          alignment: const AlignmentDirectional(1.0, 0.0),
                          child: AuthUserStreamWidget(
                            builder: (context) => Text(
                              valueOrDefault(currentUserDocument?.streak, 0).toString(),
                              style: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .override(
                                    fontFamily: 'Urbanist',
                                    color: Colors.black,
                                    fontSize: 40.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Lottie.asset(
                            'assets/lottie_animations/up-arrow.json',
                            width: 60.0,
                            height: 60.0,
                            fit: BoxFit.cover,
                            frameRate: FrameRate(60.0),
                            repeat: false,
                            animate: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                FFLocalizations.of(context).getText(
                  '5li3og3s' /* Keep it up! */,
                ),
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Urbanist',
                      color: Colors.black,
                      fontSize: 32.0,
                      letterSpacing: 0.0,
                    ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 44.0, 0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    context.pushNamed('homePage');
                  },
                  text: FFLocalizations.of(context).getText(
                    'kgatxg6w' /* Go Home */,
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
