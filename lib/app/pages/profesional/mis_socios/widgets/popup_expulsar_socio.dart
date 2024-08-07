import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';

class ExpulsarSocioWidget extends StatefulWidget {
  const ExpulsarSocioWidget({super.key});

  @override
  State<ExpulsarSocioWidget> createState() => _ExpulsarSocioWidgetState();
}

class _ExpulsarSocioWidgetState extends State<ExpulsarSocioWidget> {
  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
      child: Align(
        alignment: const AlignmentDirectional(0, 0),
        child: Container(
          width: 300,
          height: 200,
          decoration: BoxDecoration(
            color: LightModeTheme().secondaryBackground,
            boxShadow: const [
              BoxShadow(
                blurRadius: 5,
                color: Color(0x3B1D2429),
                offset: Offset(
                  0.0,
                  -3,
                ),
              )
            ],
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              width: 2,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Confirmación',
                        style: LightModeTheme().bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            fontSize: 25,
                            letterSpacing: 0,
                            fontWeight: FontWeight.w800,
                            decoration: TextDecoration.none),
                      ),
                      Text(
                        'Ésta acción es irreversible',
                        style: LightModeTheme().bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            fontSize: 18,
                            letterSpacing: 0,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.none),
                      ),
                      FFButtonWidget(
                        onPressed: () {
                          print('Button pressed ...');
                        },
                        text: 'Confirmar',
                        options: FFButtonOptions(
                          height: 40,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24, 0, 24, 0),
                          iconPadding:
                              const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          color: LightModeTheme().successGeneral,
                          textStyle: LightModeTheme().titleSmall.override(
                                fontFamily: 'Readex Pro',
                                color: LightModeTheme().primaryText,
                                fontSize: 18,
                                letterSpacing: 0,
                              ),
                          elevation: 3,
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.94, -0.88),
                  child: FlutterFlowIconButton(
                    borderColor: LightModeTheme().error,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
