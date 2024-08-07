import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/app/pages/profesional/mis_socios/mis_socios_c.dart';
import 'package:reservatu_pista/app/pages/profesional/mis_socios/widgets/popup_expulsar_socio.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_icon_button.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_theme.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_widgets.dart';

import '../socio.dart';

class DatosSocioWidgetPendiente extends GetView<MisSociosController> {
  const DatosSocioWidgetPendiente({super.key});

  @override
  Widget build(BuildContext context) {
    return _DatosSocioWidgetPendienteState();
  }
}

class _DatosSocioWidgetPendienteState extends GetView<MisSociosController> {
  Socio? socio;
  final datos = ["Nombre: ", "Nivel: ", "Partidas jugadas: "];
  List<String> cargarDatos() {
    return [
      socio!.nombre,
      socio!.nivel,
      socio!.partidasJugadas.toString(),
    ];
  }

  Text getTexto(String info) {
    return Text(
      info,
      style: LightModeTheme().bodyMedium.override(
          fontFamily: 'Readex Pro',
          letterSpacing: 0,
          decoration: TextDecoration.none),
    );
  }

  Text getTextoCabecera(String cabecera) {
    var pesoLetrasCabecera = FontWeight.bold;
    return Text(
      cabecera,
      style: LightModeTheme().bodyMedium.override(
          fontFamily: 'Readex Pro',
          letterSpacing: 0,
          fontWeight: pesoLetrasCabecera,
          decoration: TextDecoration.none),
    );
  }

  @override
  Widget build(BuildContext context) {
    socio = controller.socios[controller.socioSeleccionado];
    final datosSubtitulos = cargarDatos();
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      constraints: const BoxConstraints(
                        maxWidth: 700,
                      ),
                      decoration: BoxDecoration(
                        color: LightModeTheme().secondaryBackground,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 12,
                            color: Color(0x33000000),
                            offset: Offset(
                              0,
                              5,
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          width: 2,
                        ),
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(4, 4, 4, 20),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24, 12, 24, 12),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: 70,
                                    height: 70,
                                    decoration: BoxDecoration(
                                      color:
                                          LightModeTheme().secondaryBackground,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(2),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(40),
                                        child: Image.network(
                                          socio!.urlImagen,
                                          width: 100,
                                          height: 100,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              16, 0, 0, 0),
                                      child: Text(
                                        socio!.nick,
                                        style: LightModeTheme()
                                            .headlineLarge
                                            .override(
                                                fontFamily: 'Outfit',
                                                letterSpacing: 0,
                                                decoration:
                                                    TextDecoration.none),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment:
                                        const AlignmentDirectional(1, -1),
                                    child: FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30,
                                      borderWidth: 1,
                                      buttonSize: 44,
                                      fillColor: LightModeTheme().errorGeneral,
                                      icon: Icon(
                                        Icons.close,
                                        color: LightModeTheme()
                                            .secondaryBackground,
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
                            Align(
                              alignment: const AlignmentDirectional(-1, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            24, 12, 10, 12),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0, 0, 0, 20),
                                          child: Text(
                                            'Datos personales:',
                                            style: LightModeTheme()
                                                .headlineSmall
                                                .override(
                                                    fontFamily: 'Outfit',
                                                    letterSpacing: 0,
                                                    decoration:
                                                        TextDecoration.none),
                                          ),
                                        ),
                                        ...List.generate(
                                            datos.length,
                                            ((i) => buildTituloySubtitulo(
                                                datos[i], datosSubtitulos[i]))),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0, 30, 0, 10),
                                            child: Text(
                                              'Observaciones: ',
                                              style: LightModeTheme()
                                                  .bodyMedium
                                                  .override(
                                                      fontFamily: 'Readex Pro',
                                                      letterSpacing: 0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      decoration:
                                                          TextDecoration.none),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Me gustaría unirme a su club deportivo para contribuir con mi entusiasmo y dedicación, comprometiéndome a aprender y mejorar mis habilidades. Agradezco la oportunidad de formar parte de esta comunidad deportiva y espero poder contribuir al éxito del club.',
                                          style: LightModeTheme()
                                              .bodyMedium
                                              .override(
                                                  fontFamily: 'Readex Pro',
                                                  letterSpacing: 0,
                                                  decoration:
                                                      TextDecoration.none),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0, 0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 30, 0, 0),
                                child: buildBoton(
                                    "Mensaje",
                                    const Icon(Icons.message_rounded),
                                    LightModeTheme().successGeneral),
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0, 0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 30, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    buildBoton(
                                        "Admitir",
                                        const Icon(Icons.check),
                                        LightModeTheme().successGeneral),
                                    buildBoton(
                                        "Rechazar",
                                        const Icon(Icons.dangerous_rounded),
                                        LightModeTheme().errorGeneral),
                                  ],
                                ),
                              ),
                            ),
                          ],
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
    );
  }

  Widget buildTituloySubtitulo(String titulo, String subtitulo) {
    return Align(
      alignment: const AlignmentDirectional(-1, 0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(10, 2, 0, 2),
              child: getTextoCabecera(titulo),
            ),
            getTexto(subtitulo),
          ],
        ),
      ),
    );
  }

  Widget buildBoton(String label, Icon icono, Color color) {
    return FFButtonWidget(
      onPressed: () {
        Get.dialog(ExpulsarSocioWidget());
      },
      text: label,
      icon: icono,
      options: FFButtonOptions(
        height: 40,
        width: 150,
        padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
        iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
        color: color,
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
    );
  }
}
