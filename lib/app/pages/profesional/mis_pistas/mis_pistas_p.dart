import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/app/data/models/mis_pistas_model.dart';
import 'package:reservatu_pista/app/data/models/mis_reservas_usuario_model.dart';
import 'package:reservatu_pista/app/data/models/reservas_usuario_model.dart';
import 'package:reservatu_pista/app/data/provider/datos_server.dart';
import 'package:reservatu_pista/app/global_widgets/imagenes_pista.dart';
import 'package:reservatu_pista/constants.dart';
import './widgets/detalles_reserva.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_animations.dart';
import 'package:reservatu_pista/utils/btn_icon.dart';
import 'package:reservatu_pista/utils/colores.dart';
import 'package:reservatu_pista/utils/loader/color_loader.dart';
import 'package:reservatu_pista/utils/responsive_web.dart';
import 'package:reservatu_pista/utils/sizer.dart';
import 'package:reservatu_pista/utils/state_getx/state_mixin_demo.dart';
import '../../../../backend/schema/enums/enums.dart';
import '../../../../components/navbar_y_appbar_profesional.dart';
import '../../../../flutter_flow/flutter_flow_theme.dart';
import 'mis_pistas_c.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'widgets/build_usuarios.dart';
import 'package:http/http.dart' as http;

class MisPistasPage extends GetView<MisPistasController> {
  MisPistasPage({super.key});
  MisPistasController get self => controller;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return NavbarYAppbarProfesional(
        title: 'Reservas',
        page: TypePage.MisReservas,
        child: Expanded(
          child: ResponsiveWeb(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Obx(buildPageFecha),
                      5.0.sh,
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Obx(buildPageDeportes)),
                    ],
                  ),
                  5.0.sh,
                  Obx(() => self.changeReservas.value
                      ? buildReservas()
                      : buildPistas()),
                ],
              ),
            ),
          ),
        ));
  }

  Widget buildPageDeportes() => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: buildListDeportes())
            .animateOnPageLoad(self.animationPistaDeporte),
      );

  Widget buildPageFecha() {
    return SizedBox(
      height: 50,
      child: PageView(
        controller: self.pageViewController ??= PageController(initialPage: 1),
        physics: const NeverScrollableScrollPhysics(),
        children: buildListFecha(),
      ),
    );
  }

  List<Widget> buildListFecha() {
    return [buildFecha(), buildFecha(), buildFecha()];
  }

  Widget buildFecha() => Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BtnIcon(
            onPressed: self.previousPageBool,
            icon: const Icon(
              Icons.arrow_back,
              size: 25,
              color: Colors.white,
            ),
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 13),
            fillColor: LightModeTheme().primary,
            borderRadius: 8,
          ),
          Expanded(
              child: Text(
            self.fecha.formatFecha,
            textAlign: TextAlign.center,
            style: LightModeTheme().bodyMedium.override(
                  fontFamily: 'Readex Pro',
                  fontSize: 16,
                  letterSpacing: 0,
                  fontWeight: FontWeight.bold,
                ),
          )),
          BtnIcon(
            onPressed: self.nextPageBool,
            icon: const Icon(
              Icons.arrow_forward,
              size: 25,
              color: Colors.white,
            ),
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 13),
            fillColor: LightModeTheme().primary,
            borderRadius: 8,
          ),
        ],
      );

  /// Build LIsta deportes
  List<Widget> buildListDeportes() {
    final imagenes = {
      'Pádel': 'padel',
      'Tenis': 'tenis',
      'Badminton': 'badminton',
      'P. climatizada': 'p.climatizada',
      'Piscina': 'piscina',
      'Baloncesto': 'baloncesto',
      'Futbol sala': 'futbolsala',
      'Futbol 7': 'futbol7',
      'Futbol 11': 'futbol11',
      'Pickleball': 'pickleball',
      'Squash': 'squash',
      'Tenis de mesa': 'tenisdemesa',
      'Fronton': 'fronton',
      'Balomano': 'balomano',
      'Rugby': 'rugby',
      'Multideporte': 'multideporte'
    };
    return self.misDeportes.map((e) {
      String texto = e;
      final style = LightModeTheme().bodyMedium.override(
            fontFamily: 'Readex Pro',
            letterSpacing: 0,
          );

      final width = calcularAnchoTexto(texto, style);
      return buildDeporte(
          DatosDeporte(e, imagenes[e]!, width < 60.0 ? 60.0 : (width + 10)),
          style);
    }).toList();
  }

  /// Build Deporte
  Widget buildDeporte(DatosDeporte e, TextStyle style) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: 50,
                width: 50,
                child: Image.network(
                  DatosServer.online(e.image),
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                e.nombre,
                style: style,
              ),
            ],
          ),
        ),
        BtnIcon(
          onPressed: () => self.onPressDeporte(e.nombre),
          padding: const EdgeInsets.all(0.0),
          hoverColor: Colores.proveedor.primary69,
          borderRadius: 10,
          borderWidth: self.deporte == e.nombre ? 1 : null,
          borderColor:
              self.deporte == e.nombre ? Colores.proveedor.primary : null,
          icon: Container(
            height: 70,
            width: e.width,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
          ),
        )
      ],
    );
  }

  Widget buildPistas() {
    return self.misPistas.obx(
        (state) => Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(
                    state!.length,
                    (i) => buildPista(state[i]),
                  ).divide(10.0.sh).addToEnd(65.0.sh),
                ),
              ),
            ),
        onLoading: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Center(
            child: SizedBox(
                width: 100,
                child: ColorLoader(
                  radius: 12,
                  padding: const EdgeInsets.only(right: 10),
                )),
          ),
        ),
        onEmpty: Center(
          child: Text('\nNo se encontraron pistas.',
              style: LightModeTheme().bodyMedium.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 16)),
        ));
  }

  /// Widget Pista
  Widget buildPista(MiPista pista) {
    self.idPista = pista.idPista;
    return InkWell(
      splashColor: const Color.fromARGB(0, 156, 137, 137),
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () => {self.cargarDatosReservas(pista.idPista)},
      child: Container(
        height: 90,
        decoration: BoxDecoration(
          color: LightModeTheme().secondaryBackground,
          boxShadow: const [
            BoxShadow(
              blurRadius: 4,
              color: Color.fromARGB(51, 0, 0, 0),
              offset: Offset(
                0,
                2,
              ),
            )
          ],
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          border: pista.eliminada
              ? Border.all(width: 1, color: Colores.rojo)
              : Border.all(width: 1, color: Colores.grisClaro),
        ),
        child: Align(
          alignment: const AlignmentDirectional(0, 0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(0),
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(0),
                      ),
                      child: pista.imagenPatrocinador == ''
                          ? Container(
                              height: 50,
                              width: 50,
                              color: Colores.proveedor.primary)
                          : Image.network(
                              DatosServer.pista(pista.imagenPatrocinador),
                              width: 50,
                              height: 50,
                              fit: BoxFit.fill, errorBuilder:
                                  (BuildContext context, Object exception,
                                      StackTrace? stackTrace) {
                              return Container(
                                  height: 50,
                                  width: 50,
                                  color: Colores.proveedor.primary);
                            }),
                    ),
                  ),
                  Text(
                    pista.deporte,
                    style: LightModeTheme().bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    10, 0, 0, 0),
                                child: Text(
                                  'Pista ${pista.numPista} ${pista.nombrePatrocinador.isEmpty ? '' : '- ${pista.nombrePatrocinador}'}',
                                  style: LightModeTheme().bodyMedium.override(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 16,
                                        letterSpacing: 0,
                                      ),
                                ),
                              ),
                              Visible(
                                isVisible: pista.eliminada,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: Text(
                                    'Eliminada',
                                    style: LightModeTheme().bodyMedium.override(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 12,
                                        letterSpacing: 0,
                                        color: Colores.rojo),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: buildListPartidas(
                            pista.totalLibre,
                            pista.totalAbierta,
                            pista.totalCerrada,
                            pista.total),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ).animateOnPageLoad(self.animationPistaDeporte);
  }

  List<Widget> buildListPartidas(
      int totalLibre, int totalAbierta, int totalCerrada, int total) {
    final totalReservas = totalLibre + totalAbierta + totalCerrada;
    final totalibres = total - totalAbierta - totalCerrada;
    return [
      buildPartida(
          title: 'Libre',
          numPartidas: totalibres.toString(),
          color: Colores.sucessGeneral),
      buildPartida(
          title: 'Abierta',
          numPartidas: totalAbierta.toString(),
          color: Colores.orange),
      buildPartida(
          title: 'Cerrada',
          numPartidas: totalCerrada.toString(),
          color: Colores.rojo),
      buildPartida(
          title: 'Total',
          numPartidas: '$totalReservas/$total',
          color: Colors.black),
    ];
  }

  Widget buildPartida({
    required String title,
    required String numPartidas,
    required Color color,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          title,
          style: LightModeTheme().bodyMedium.override(
                fontFamily: 'Readex Pro',
                color: color,
                fontSize: 14,
                letterSpacing: 0,
              ),
        ),
        Text(
          numPartidas,
          style: LightModeTheme().bodyMedium.override(
                fontFamily: 'Readex Pro',
                color: color,
                fontSize: 14,
                letterSpacing: 0,
              ),
        ),
      ],
    );
  }

  Widget buildReservas() {
    return self.misReservasUsuario.obx(
      (state) => Expanded(
        child: SingleChildScrollView(
          child: Column(
            children: List.generate(
              state!.length,
              (i) => buildReserva(state[i]),
            ).divide(paddingSize.sh).addToEnd(Get.context!.paddingBottom.sh),
          ),
        ),
      ),
      onLoading: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Center(
          child: SizedBox(
            width: 100,
            child: ColorLoader(
              radius: 12,
              padding: const EdgeInsets.only(right: 10),
            ),
          ),
        ),
      ),
      onEmpty: const Center(
        child: Text(
          '\nNo se encontraron reservas.',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  /// Reserva
  Widget buildReserva(MisReservasUsuarioModel state) {
    final isCerrada = state.reservasUsuarios != null &&
        state.reservasUsuarios!.plazasReservadasTotales == state.capacidad;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 3,
            color: LightModeTheme().primaryText,
            offset: const Offset(
              0,
              2,
            ),
          )
        ],
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(
          color: isCerrada ? Colores.rojo : Colores.orange,
          width: 2,
        ),
      ),
      child: BtnIcon(
        hoverColor: Colores.usuario.primary69,
        borderRadius: 10,
        onPressed: () async {
          int tiempoRestante = 0;
          try {
            DateTime fechaInicioPartida =
                self.construirDatetime(state.fechaReserva, state.horaInicio);
            DateTime fechaActual = DateTime.now();
            DateTime fechaTiempoCancelacion = fechaInicioPartida
                .subtract(Duration(hours: state.tiempo_cancelacion));
            if (fechaActual < fechaTiempoCancelacion) {
              tiempoRestante = fechaTiempoCancelacion.millisecondsSinceEpoch -
                  fechaActual.millisecondsSinceEpoch;
              self.empezarFechaRestante(tiempoRestante);
            }
          } catch (e, st) {
            print('eeeeeee $e');
            print('eeeeeee stack $st');
            return;
          }
          self.pageIndexNotifier.value = 0;
          DetalleReservaDialog(
            context: Get.context!,
            idReserva: state.idReserva.toString(),
            capacidad: state.capacidad,
            state: state,
            reservasUsuarios: state.reservasUsuarios,
            tiempoRestante: tiempoRestante,
          ).dialog();
        },
        icon: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                ImagenPistaEnReservas(image: state.foto),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                'Pista ${state.numPista} - ${state.nombrePatrocinador}',
                                style: LightModeTheme().bodyMedium.override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 16,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 5, 0),
                              child: Text(
                                '#${state.referencia}',
                                style: LightModeTheme().bodyMedium.override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 14,
                                      letterSpacing: 0,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${state.fechaReserva.formatReserva} - ${state.horaInicio.formatHora}',
                            style: LightModeTheme().bodyMedium.override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0,
                                ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 0, 5, 0),
                            child: Text(
                              _getDineroPagado(
                                      state.usuarios, state.dineroPagado)
                                  .euro,
                              // '${state.dineroPagado.euro}',
                              style: LightModeTheme().bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 18,
                                    letterSpacing: 0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            BuildUsuarios(
                capacidad: state.capacidad,
                idReserva: state.idReserva.toString(),
                idPista: state.idPista,
                eliminar: false,
                reservasUsuarios: state.reservasUsuarios),
          ],
        ),
      ),
    );
  }

  int _getDineroPagado(List<ReservaUsuario> usuarios, int dineroPagado) {
    int totalDineroPagado = 0;
    for (final element in usuarios) {
      totalDineroPagado += element.precio * element.plazasReservadas;
    }
    return totalDineroPagado;
  }

  Future<bool> checkURL(String url) async {
    try {
      final response = await http.head(Uri.parse(url));
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}

class DatosDeporte {
  final String nombre;
  final String image;
  final double width;
  DatosDeporte(this.nombre, this.image, this.width);
}
