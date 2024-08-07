import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:reservatu_pista/app/pages/usuario/hazte_socio/hazte_socio_c.dart';
import 'package:reservatu_pista/backend/schema/enums/enums.dart';
import 'package:reservatu_pista/components/navbar_y_appbar_profesional.dart';
import 'package:reservatu_pista/components/navbar_y_appbar_usuario.dart';
import 'package:reservatu_pista/utils/responsive_web.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HazteSocioWidget extends GetView<HazteSocioController> {
  const HazteSocioWidget(this.isProveedor, {super.key});
  final bool isProveedor;

  @override
  Widget build(BuildContext context) {
    if (isProveedor) {
      return NavbarYAppbarProfesional(
          title: 'Hazte Socio',
          page: TypePage.None,
          child: Expanded(child: _HazteSocioWidgetState()));
    }
    return NavbarYAppbarUsuario(
        title: 'Hazte Socio',
        page: TypePage.None,
        child: Expanded(child: _HazteSocioWidgetState()));
  }
}

class _HazteSocioWidgetState extends GetView<HazteSocioController> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: LightModeTheme().primaryBackground,
      body: SingleChildScrollView(
        child: ResponsiveWeb(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height * 0.25,
                decoration: BoxDecoration(
                  color: LightModeTheme().secondaryBackground,
                ),
                child: ClipRRect(
                  child: Image.network(
                    'https://cdn.getcrowder.com/images/676406fd-df95-40db-9662-ab9cb4012f06-1920x720---ticketmaster-banner.jpg',
                    width: 300,
                    height: 200,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 20),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.circle_rounded,
                          color: LightModeTheme().primaryText,
                          size: 10,
                        ),
                        Text(
                          'Descuentos en torneos y ligas',
                          style: LightModeTheme().bodyMedium.override(
                                fontFamily: 'Readex Pro',
                                fontSize: 20,
                                letterSpacing: 0,
                              ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.circle_rounded,
                          color: LightModeTheme().primaryText,
                          size: 10,
                        ),
                        Text(
                          'Descuentos en clases',
                          style: LightModeTheme().bodyMedium.override(
                                fontFamily: 'Readex Pro',
                                fontSize: 20,
                                letterSpacing: 0,
                              ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.circle_rounded,
                          color: LightModeTheme().primaryText,
                          size: 10,
                        ),
                        Text(
                          '10% descuento en deportes base',
                          style: LightModeTheme().bodyMedium.override(
                                fontFamily: 'Readex Pro',
                                fontSize: 20,
                                letterSpacing: 0,
                              ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.circle_rounded,
                          color: LightModeTheme().primaryText,
                          size: 10,
                        ),
                        Text(
                          'Reserva con  7 días de antelacion',
                          style: LightModeTheme().bodyMedium.override(
                                fontFamily: 'Readex Pro',
                                fontSize: 20,
                                letterSpacing: 0,
                              ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.circle_rounded,
                          color: LightModeTheme().primaryText,
                          size: 10,
                        ),
                        Text(
                          'Cancela con más tiempo',
                          style: LightModeTheme().bodyMedium.override(
                                fontFamily: 'Readex Pro',
                                fontSize: 20,
                                letterSpacing: 0,
                              ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.circle_rounded,
                          color: LightModeTheme().primaryText,
                          size: 10,
                        ),
                        Text(
                          'Y mucho más',
                          style: LightModeTheme().bodyMedium.override(
                                fontFamily: 'Readex Pro',
                                fontSize: 20,
                                letterSpacing: 0,
                              ),
                        ),
                      ],
                    ),
                  ].divide(const SizedBox(height: 15)),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, 1),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                      child: TextFormField(
                        autofocus: false,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelStyle: LightModeTheme().labelMedium.override(
                                fontFamily: 'Readex Pro',
                                letterSpacing: 0,
                              ),
                          hintText: 'Escribe un comentario al club',
                          hintStyle: LightModeTheme().labelMedium.override(
                                fontFamily: 'Readex Pro',
                                fontSize: 15,
                                letterSpacing: 0,
                              ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: LightModeTheme().usuario,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: LightModeTheme().primary,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: LightModeTheme().error,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: LightModeTheme().error,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        style: LightModeTheme().bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0,
                            ),
                        maxLines: 3,
                        maxLength: 100,
                        maxLengthEnforcement: MaxLengthEnforcement.none,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                    ),
                    FFButtonWidget(
                      onPressed: () {
                        print('Button pressed ...');
                      },
                      text: 'Pagar 120€',
                      options: FFButtonOptions(
                        height: 40,
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        color: LightModeTheme().successGeneral,
                        textStyle: LightModeTheme().titleSmall.override(
                              fontFamily: 'Readex Pro',
                              color: LightModeTheme().primaryText,
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
            ],
          ),
        ),
      ),
    );
  }
}
