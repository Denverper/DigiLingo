import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'streak_reset_model.dart';
export 'streak_reset_model.dart';

class StreakResetWidget extends StatefulWidget {
  const StreakResetWidget({super.key});

  @override
  State<StreakResetWidget> createState() => _StreakResetWidgetState();
}

class _StreakResetWidgetState extends State<StreakResetWidget> {
  late StreakResetModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StreakResetModel());

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
        backgroundColor: const Color(0x3D000000),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: const AlignmentDirectional(0.0, 1.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              15.0, 0.0, 0.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'bvo9kbmd' /* Oh No... */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Plus Jakarta Sans',
                                  fontSize: 35.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      FFLocalizations.of(context).getText(
                        '58ev1ant' /* Keep Practicing To Get Your St... */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Plus Jakarta Sans',
                            color: const Color(0xFFEFE8E8),
                            letterSpacing: 0.0,
                          ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.0, 1.0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 200.0, 0.0, 50.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            context.pushNamed('homePage');
                          },
                          text: FFLocalizations.of(context).getText(
                            '6h73fhrg' /* Go Home */,
                          ),
                          options: FFButtonOptions(
                            width: 130.0,
                            height: 50.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primaryBtnText,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Plus Jakarta Sans',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
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
                    ),
                  ],
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 200.0),
                  child: Lottie.asset(
                    'assets/lottie_animations/Animation_-_1710283583410.json',
                    width: 300.0,
                    height: 300.0,
                    fit: BoxFit.cover,
                    animate: true,
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 195.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'd4xey6af' /* 0 */,
                    ),
                    style: FlutterFlowTheme.of(context).titleLarge.override(
                          fontFamily: 'Urbanist',
                          color: const Color(0xFFFFFDFD),
                          fontSize: 60.0,
                          letterSpacing: 0.0,
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
