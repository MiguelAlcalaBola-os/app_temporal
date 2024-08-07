import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class TelefonoComponenteWidget extends StatefulWidget {
  const TelefonoComponenteWidget({super.key});

  @override
  State<TelefonoComponenteWidget> createState() =>
      _TelefonoComponenteWidgetState();
}

class _TelefonoComponenteWidgetState extends State<TelefonoComponenteWidget> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0, 0),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          width: 300,
          height: 150,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            boxShadow: const [
              BoxShadow(
                blurRadius: 3,
                color: Color(0x33000000),
                offset: Offset(
                  0,
                  1,
                ),
              )
            ],
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              width: 2,
            ),
          ),
          alignment: const AlignmentDirectional(0, 0),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(4),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(12, 8, 12, 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 8, 0),
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.person,
                                    color: Color(0xFF4B39EF),
                                    size: 24,
                                  ),
                                ),
                              ),
                              Text(
                                'Alberto',
                                style: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                      fontFamily: 'Outfit',
                                      letterSpacing: 0,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(12, 0, 12, 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: AutoSizeText(
                              'Correo electrónico:',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .override(
                                    fontFamily: 'Outfit',
                                    letterSpacing: 0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'app@reservatupista.com',
                      style: FlutterFlowTheme.of(context).titleMedium.override(
                            fontFamily: 'Readex Pro',
                            color: FlutterFlowTheme.of(context).primaryText,
                            letterSpacing: 0,
                          ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.94, -0.84),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                  child: FlutterFlowIconButton(
                    borderColor: FlutterFlowTheme.of(context).errorGeneral,
                    borderRadius: 20,
                    borderWidth: 0,
                    buttonSize: 40,
                    fillColor: FlutterFlowTheme.of(context).errorGeneral,
                    icon: Icon(
                      Icons.close,
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      size: 24,
                    ),
                    onPressed: () async {
                      Navigator.pop(context);
                    },
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
