import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CorreoComponenteWidget extends StatefulWidget {
  const CorreoComponenteWidget({super.key});

  @override
  State<CorreoComponenteWidget> createState() => _CorreoComponenteWidgetState();
}

class _CorreoComponenteWidgetState extends State<CorreoComponenteWidget> {
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
            color: LightModeTheme().secondaryBackground,
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
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(-1, 0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(12, 8, 12, 8),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
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
                                      color: LightModeTheme().primaryBackground,
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
                                  style: LightModeTheme().titleLarge.override(
                                        fontFamily: 'Outfit',
                                        letterSpacing: 0,
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(12, 0, 12, 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Align(
                              alignment: const AlignmentDirectional(-1, 0),
                              child: AutoSizeText(
                                'Correo electrónico:',
                                textAlign: TextAlign.center,
                                style: LightModeTheme().titleLarge.override(
                                      fontFamily: 'Outfit',
                                      letterSpacing: 0,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'app@reservatupista.com',
                      style: LightModeTheme().titleMedium.override(
                            fontFamily: 'Readex Pro',
                            color: LightModeTheme().primaryText,
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
                    borderColor: LightModeTheme().errorGeneral,
                    borderRadius: 20,
                    borderWidth: 0,
                    buttonSize: 40,
                    fillColor: LightModeTheme().errorGeneral,
                    icon: Icon(
                      Icons.close,
                      color: LightModeTheme().secondaryBackground,
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
