import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/app/data/models/mis_reservas_usuario_model.dart';
import 'package:reservatu_pista/app/data/provider/datos_server.dart';
import 'package:reservatu_pista/app/global_widgets/bonos/sticker_bono_w.dart';
import 'package:reservatu_pista/app/global_widgets/build_reservas.dart';
import 'package:reservatu_pista/app/global_widgets/button_general.dart';
import 'package:reservatu_pista/app/global_widgets/imagenes_pista.dart';
import 'package:reservatu_pista/app/pages/usuario/mis_reservas/mis_reservas_c.dart';
import 'package:reservatu_pista/app/pages/usuario/mis_reservas/widgets/build_usuarios.dart';
import 'package:reservatu_pista/app/pages/usuario/mis_reservas/widgets/detalles_reserva.dart';
import 'package:reservatu_pista/backend/schema/enums/enums.dart';
import 'package:reservatu_pista/components/navbar_y_appbar_usuario.dart';
import 'package:reservatu_pista/constants.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_theme.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_util.dart';
import 'package:reservatu_pista/utils/btn_icon.dart';
import 'package:reservatu_pista/utils/colores.dart';
import 'package:reservatu_pista/utils/loader/color_loader.dart';
import 'package:reservatu_pista/utils/responsive_web.dart';
import 'package:reservatu_pista/utils/sizer.dart';
import 'package:reservatu_pista/utils/state_getx/state_mixin_demo.dart';

class MisReservasPage extends StatefulWidget {
  const MisReservasPage({super.key});

  @override
  State<MisReservasPage> createState() => _MisReservasPageState();
}

class _MisReservasPageState extends State<MisReservasPage> {
  final MisReservasController self = Get.find();
  @override
  Widget build(BuildContext context) {
    return NavbarYAppbarUsuario(
      title: 'Reservas',
      page: TypePage.MisReservas,
      child: Expanded(
        child: Padding(
          padding: paddingHorizontal,
          child: Column(
            children: [
              // HorizontalCouponExample2(),
              5.0.sh,
              ResponsiveWeb(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                    width: Get.width,
                    child: Obx(() => Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ...buildListDeportes(),
                          ],
                        )),
                  ),
                ),
              ),
              BuildReservas(
                  context: context,
                  onPressedContainerReserva: onPressedContainerReserva,
                  // onNotification: onNotification,
                  // onPointerSignal: onPointerSignal,
                  misReservasUsuario: self.misReservasUsuario,
                  isLoading: self.isLoading.value,
                  fotoUsuario: self.db.fotoUsuario,
                  nextReservas: Obx(_buildNextReservas),
                  backReservas: Obx(_buildBackReservas),
                  idUsuario: self.db.idUsuario),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBackReservas() {
    return Visible(
        isVisible: self.currentPage > 1, child: _buildBackNextReservas(false));
  }

  Widget _buildNextReservas() {
    final mostrarNext =
        self.totalReservas > (self.currentPage * self.itemsPerPage);
    return Visible(
        isVisible: (self.currentPage >= 1 && mostrarNext),
        child: _buildBackNextReservas(true));
  }

  Widget _buildBackNextReservas(bool isNext) {
    return self.totalReservas.value > 8
        ? ButtonGeneral(
            text: 'Cargar ${isNext ? 'Siguiente' : 'Anterior'}',
            onPressed: () {
              if (isNext) {
                self.currentPage += 1;
              } else {
                self.currentPage -= 1;
              }
              self.previousScrollPosition = 0;
              self.loadMoreData();
            })
        : const SizedBox.shrink();
  }

  void onPointerSignal(event) {
    if (event is PointerScrollEvent && !self.isThrottling.value) {
      self.isThrottling.value = true; // Activar la bandera
      if (event.scrollDelta.dy < 0 &&
          self.previousScrollPosition == 0 &&
          self.currentPage > 1) {
        self.currentPage -= 1;
        self.pageHaschanged.value = true;
        self.previousScrollPosition = 0;
        if (self.currentPage < 1) self.currentPage = 1;
        // self.loadMoreData();
      } else if (event.scrollDelta.dy > 0) {}
      if (self.currentPage < 1) self.currentPage = 1;
      // Desactivar la bandera después de un corto tiempo
      Future.delayed(const Duration(milliseconds: 1500), () {
        self.isThrottling.value = false;
      });
    }
    //});
  }

  bool onNotification(ScrollNotification scrollInfo) {
    bool hacia_abajo = false;
    if (scrollInfo.metrics.pixels > self.previousScrollPosition) {
      hacia_abajo = true;
    } else if (scrollInfo.metrics.pixels < self.previousScrollPosition) {
      hacia_abajo = false;
    }
    self.previousScrollPosition = scrollInfo.metrics.pixels;
    if (!self.isLoading.value &&
        scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent &&
        hacia_abajo) {
      if (self.currentPage * self.itemsPerPage < (self.initialLength)) {
        if (self.debounceTimer?.isActive ?? false) self.debounceTimer!.cancel();

        self.debounceTimer = Timer(const Duration(milliseconds: 500), () {
          self.currentPage += 1;
          self.previousScrollPosition = 0;
          self.loadMoreData();
        });
      }
      return true;
    } else if (!self.isLoading.value &&
        scrollInfo.metrics.pixels == scrollInfo.metrics.minScrollExtent &&
        !hacia_abajo) {
      if (self.currentPage != self.lastPageSelected) {
        self.lastPageSelected = self.currentPage;
        return false;
      }
      // Al llegar al inicio del scroll
      if (self.currentPage > 1) {
        if (self.debounceTimer?.isActive ?? false) self.debounceTimer!.cancel();
        self.debounceTimer = Timer(const Duration(milliseconds: 500), () {
          self.currentPage -= 1;
          self.previousScrollPosition = 0;
          self.loadMoreData();
        });
      }
      return true;
    }
    return false;
  }

  void onPressedContainerReserva(MisReservasUsuarioModel state) async {
    int tiempoRestante = 0;
    try {
      DateTime fechaInicioPartida =
          self.construirDatetime(state.fechaReserva, state.horaInicio);
      DateTime fechaActual = DateTime.now();
      DateTime fechaTiempoCancelacion = fechaInicioPartida
          .subtract(Duration(hours: state.tiempo_cancelacion));

      print(
          ' fechaTiempoCancelacion.millisecondsSinceEpoch - fechaActual.millisecondsSinceEpoch ${fechaTiempoCancelacion.millisecondsSinceEpoch - fechaActual.millisecondsSinceEpoch}');
      if (fechaActual < fechaTiempoCancelacion) {
        tiempoRestante = fechaTiempoCancelacion.millisecondsSinceEpoch -
            fechaActual.millisecondsSinceEpoch;
        print('tiempoRestante $tiempoRestante');

        int horasRestantes = (tiempoRestante / 1000 / 60 / 60).floor();
        int minutosRestantes = ((tiempoRestante / 1000 / 60) % 60).floor();
        int segundosRestantes = ((tiempoRestante / 1000) % 60).floor();

        print('horasRestantes $horasRestantes');
        print('minutosRestantes $minutosRestantes');
        print('segundosRestantes $segundosRestantes');
        self.empezarFechaRestante(tiempoRestante);
      }
    } catch (e, st) {
      print('eeeeeee $e');
      print('eeeeeee stack $st');
    }
    // Get.dialog(ResponsiveWeb(
    //     child: DetalleReserva(
    //   idReserva: state.idReserva.toString(),
    //   capacidad: state.capacidad,
    //   state: state,
    //   reservasUsuarios: state.reservasUsuarios,
    //   tiempoRestante: tiempoRestante,
    // )));
    DetalleReservaDialog(
      context: Get.context!,
      idReserva: state.idReserva.toString(),
      capacidad: state.capacidad,
      state: state,
      reservasUsuarios: state.reservasUsuarios,
      tiempoRestante: tiempoRestante,
    ).dialog();
  }

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
    return self.listaDeportes.map((e) {
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

  Widget buildReservas() {
    print('self.misReservasUsuario ${self.misReservasUsuario}');
    return self.misReservasUsuario.obx(
      (state) => ListView.builder(
        itemCount: state!.length + 1,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          if (index == state.length) {
            // Este es el último elemento, añade un SizedBox para forzar el scroll
            return SizedBox(
                height: context
                    .paddingBottom); // Ajusta la altura según sea necesario
          } else if (index == state.length - 1) {
            return ResponsiveWeb(
              child: Column(
                children: [
                  buildReserva(state[index]),
                  Visible(
                      isVisible: self.isLoading.value,
                      child: Padding(
                        padding: paddingVertical,
                        child: ColorLoader(),
                      ))
                ],
              ),
            );
          } else {
            return ResponsiveWeb(child: buildReserva(state[index]));
          }
        },
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
    // Verificar si la reserva esta cerrada
    print('state.() ${state.toJson()}');

    final isCerrada = state.reservasUsuarios != null &&
        state.reservasUsuarios!.plazasReservadasTotales == state.capacidad;
    return Container(
      margin: paddingVertical,
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
            print('tiempoCancelacion ${state.tiempo_cancelacion}');
            print('fechaInicioPartida $fechaInicioPartida');
            print('fechaActual $fechaActual');
            print('fechaTiempoCancelacion $fechaTiempoCancelacion');

            print(
                ' fechaTiempoCancelacion.millisecondsSinceEpoch - fechaActual.millisecondsSinceEpoch ${fechaTiempoCancelacion.millisecondsSinceEpoch - fechaActual.millisecondsSinceEpoch}');
            if (fechaActual < fechaTiempoCancelacion) {
              tiempoRestante = fechaTiempoCancelacion.millisecondsSinceEpoch -
                  fechaActual.millisecondsSinceEpoch;
              print('tiempoRestante $tiempoRestante');

              int horasRestantes = (tiempoRestante / 1000 / 60 / 60).floor();
              int minutosRestantes =
                  ((tiempoRestante / 1000 / 60) % 60).floor();
              int segundosRestantes = ((tiempoRestante / 1000) % 60).floor();

              print('horasRestantes $horasRestantes');
              print('minutosRestantes $minutosRestantes');
              print('segundosRestantes $segundosRestantes');
              self.empezarFechaRestante(tiempoRestante);
            }
          } catch (e, st) {
            print('eeeeeee $e');
            print('eeeeeee stack $st');
          }
          // Get.dialog(ResponsiveWeb(
          //     child: DetalleReserva(
          //   idReserva: state.idReserva.toString(),
          //   capacidad: state.capacidad,
          //   state: state,
          //   reservasUsuarios: state.reservasUsuarios,
          //   tiempoRestante: tiempoRestante,
          // )));
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
                ImagenPistaEnReservas(
                  image: state.foto,
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
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
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${state.fechaReserva.formatFecha} - ${state.horaInicio.formatHora}',
                            style: LightModeTheme().bodyMedium.override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0,
                                ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 0, 5, 0),
                            child: Text(
                              state.dineroPagado.euro,
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
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BuildUsuarios(
                      capacidad: state.capacidad,
                      reservasUsuarios: state.reservasUsuarios,
                      fotoUsuario: self.db.fotoUsuario,
                      idUsuario: self.db.idUsuario),
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                          child: Text(
                            state.tipoReserva,
                            style: LightModeTheme().bodyMedium.override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ].divide(const SizedBox(width: 3)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DatosDeporte {
  final String nombre;
  final String image;
  final double width;
  DatosDeporte(this.nombre, this.image, this.width);
}
