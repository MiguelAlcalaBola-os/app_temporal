import 'package:reservatu_pista/backend/schema/enums/enums.dart';
import 'package:reservatu_pista/components/navbar_y_appbar_profesional.dart';
import 'package:reservatu_pista/components/navbar_y_appbar_usuario.dart';
import 'package:reservatu_pista/utils/responsive_web.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';

class ComprarBonosWidget extends StatelessWidget {
  const ComprarBonosWidget(this.isProveedor, {super.key});
  final bool isProveedor;
  @override
  Widget build(BuildContext context) {
    if (isProveedor) {
      return NavbarYAppbarProfesional(
          title: 'Comprar Bonos',
          page: TypePage.None,
          child: Expanded(child: buildComprarBonos(context)));
    }
    return NavbarYAppbarUsuario(
        title: 'Comprar Bonos',
        page: TypePage.None,
        child: Expanded(child: buildComprarBonos(context)));
  }

  Widget buildComprarBonos(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        buildTitle(),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
          child: Text(
            'Bonos disponibles:',
            style: LightModeTheme().bodyMedium.override(
                  fontFamily: 'Readex Pro',
                  fontSize: 20,
                  letterSpacing: 0,
                ),
          ),
        ),
        ResponsiveWeb(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 150,
                height: 125,
                decoration: BoxDecoration(
                  color: LightModeTheme().secondaryBackground,
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 4,
                      color: Color(0x33000000),
                      offset: Offset(
                        0,
                        2,
                      ),
                    )
                  ],
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: LightModeTheme().usuario,
                    width: 2,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                      child: Text(
                        'Descuento:',
                        style: LightModeTheme().bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    Text(
                      '10+1',
                      style: LightModeTheme().bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            fontSize: 40,
                            letterSpacing: 0,
                          ),
                    ),
                    Container(
                      height: 30,
                      decoration: BoxDecoration(
                        color: LightModeTheme().usuario,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                '20€',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      fontSize: 18,
                                      letterSpacing: 0,
                                    ),
                              ),
                              FFButtonWidget(
                                onPressed: () {
                                  print('Button pressed ...');
                                },
                                text: 'Comprar',
                                options: FFButtonOptions(
                                  height: 20,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 10, 0),
                                  iconPadding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 0),
                                  color: FlutterFlowTheme.of(context)
                                      .successGeneral,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 14,
                                        letterSpacing: 0,
                                      ),
                                  elevation: 3,
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 150,
                height: 125,
                decoration: BoxDecoration(
                  color: LightModeTheme().secondaryBackground,
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 4,
                      color: Color(0x33000000),
                      offset: Offset(
                        0,
                        2,
                      ),
                    )
                  ],
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: LightModeTheme().usuario,
                    width: 2,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                          child: Text(
                            'Bono:',
                            style: LightModeTheme().bodyMedium.override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(4, 5, 3, 20),
                          child: Text(
                            'Bono 10 partidas por las mañanas',
                            textAlign: TextAlign.center,
                            style: LightModeTheme().bodyMedium.override(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 14,
                                  letterSpacing: 0,
                                ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 30,
                      decoration: BoxDecoration(
                        color: LightModeTheme().usuario,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(0, 0),
                            child: Text(
                              '20€',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    fontSize: 18,
                                    letterSpacing: 0,
                                  ),
                            ),
                          ),
                          FFButtonWidget(
                            onPressed: () {
                              print('Button pressed ...');
                            },
                            text: 'Comprar',
                            options: FFButtonOptions(
                              height: 20,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  10, 0, 10, 0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 0, 0),
                              color: LightModeTheme().successGeneral,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 14,
                                    letterSpacing: 0,
                                  ),
                              elevation: 3,
                              borderSide: BorderSide(
                                color: LightModeTheme().primaryText,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
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
      ],
    );
  }

  Widget buildTitle() {
    return ResponsiveWeb(
      child: Container(
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: const DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    'https://images.unsplash.com/photo-1601646761285-65bfa67cd7a3?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw0fHxwYWRlbHxlbnwwfHx8fDE3MTE5MzE1NDB8MA&ixlib=rb-4.0.3&q=80&w=400',
                  ))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Ayto Riolobos',
                style: LightModeTheme().displaySmall.override(
                      fontFamily: 'Outfit',
                      color: Colors.white,
                      fontSize: 25,
                      letterSpacing: 0,
                    ),
              ),
              Text(
                'Riolobos',
                style: LightModeTheme().displaySmall.override(
                      fontFamily: 'Outfit',
                      color: Colors.white,
                      fontSize: 25,
                      letterSpacing: 0,
                    ),
              ),
            ],
          )),
    );
  }
}
