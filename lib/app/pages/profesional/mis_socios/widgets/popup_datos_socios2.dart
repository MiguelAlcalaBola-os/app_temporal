import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../socio.dart';
import '../mis_socios_c.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';

class DatosSocio2Widget extends GetView<MisSociosController> {
  const DatosSocio2Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return _DatosSocio2WidgetState();
  }
}

class _DatosSocio2WidgetState extends GetView<MisSociosController> {
  Socio? socio;
  final datos = [
    "Nombre: ",
    "Nivel: ",
    "DNI: ",
    "Dirección: ",
    "Partidas jugadas: ",
    "Posición: ",
    "Horario: ",
    "Email: ",
    "Teléfono: ",
    "Fecha de alta: ",
  ];

  List<String> cargarDatos() {
    return [
      socio!.nombre,
      socio!.nivel,
      socio!.dni,
      socio!.direccion,
      socio!.partidasJugadas.toString(),
      socio!.posicion,
      socio!.horario,
      socio!.email,
      socio!.telefono,
      socio!.fechaAlta
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
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: const AlignmentDirectional(0, 0),
            child: Container(
              width: 500,
              height: 700,
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
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  width: 2,
                ),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(4, 4, 4, 20),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10, 12, 10, 12),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              color: LightModeTheme().secondaryBackground,
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
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16, 0, 0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    socio!.nick,
                                    style: LightModeTheme()
                                        .headlineLarge
                                        .override(
                                            fontFamily: 'Outfit',
                                            letterSpacing: 0,
                                            decoration: TextDecoration.none),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(1, -1),
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30,
                              borderWidth: 1,
                              buttonSize: 44,
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
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(-1, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    10, 12, 0, 12),
                                child: Text(
                                  'Datos personales:',
                                  style: LightModeTheme()
                                      .headlineSmall
                                      .override(
                                          fontFamily: 'Outfit',
                                          letterSpacing: 0,
                                          decoration: TextDecoration.none),
                                ),
                              ),
                            ],
                          ),
                        ),
                        ...List.generate(
                            datos.length,
                            ((i) => buildTituloySubtitulo(
                                datos[i], datosSubtitulos[i]))),
                        Align(
                          alignment: const AlignmentDirectional(-1, 0),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      10, 2, 0, 2),
                                  child: getTextoCabecera("Le quedan: "),
                                ),
                                Text(
                                  socio!.tiempoRestante.toString(),
                                  style: LightModeTheme().bodyMedium.override(
                                      fontFamily: 'Readex Pro',
                                      color: socio!.tiempoRestante < 30
                                          ? const Color(0xFFE62310)
                                          : const Color.fromARGB(255, 0, 0, 0),
                                      letterSpacing: 0,
                                      decoration: TextDecoration.none),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  10, 5, 0, 2),
                              child: getTextoCabecera("Bonos: "),
                            ),
                          ],
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              buildBono("Descuento:", "3€"),
                              buildBono("Descuento:", "5%"),
                              buildBono("Partidas:", "3"),
                              buildBono("Descuento", "5€"),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0, 0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            buildBoton(
                                "Mensaje",
                                const Icon(
                                  Icons.message_rounded,
                                  size: 15,
                                ),
                                LightModeTheme().successGeneral),
                            buildBoton(
                                "Email",
                                const Icon(
                                  Icons.email_rounded,
                                  size: 15,
                                ),
                                LightModeTheme().successGeneral)
                          ],
                        ),
                      ),
                    ),
                    Builder(
                      builder: (context) => Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: buildBoton(
                              "Expulsar",
                              const Icon(
                                Icons.dangerous,
                                size: 15,
                              ),
                              LightModeTheme().errorGeneral)),
                    ),
                  ],
                ),
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

  Widget buildBono(String tipo, String digito) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
      child: Material(
        color: Colors.transparent,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        child: Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: LightModeTheme().secondaryBackground,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: LightModeTheme().primaryText,
              width: 2,
            ),
          ),
          child: Align(
            alignment: const AlignmentDirectional(0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
                  child: Text(
                    tipo,
                    style: LightModeTheme().bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          fontSize: 10,
                          letterSpacing: 0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                Text(
                  digito,
                  style: LightModeTheme().bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        fontSize: 20,
                        letterSpacing: 0,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildBoton(String label, Icon icono, Color color) {
    return FFButtonWidget(
      onPressed: () {
        print('Button pressed ...');
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
