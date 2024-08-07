import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:reservatu_pista/app/data/models/mis_reservas_usuario_model.dart';
import 'package:reservatu_pista/app/global_widgets/build_reservas.dart';
import 'package:reservatu_pista/app/pages/usuario/historial/historial_c.dart';
import 'package:reservatu_pista/app/pages/usuario/mis_reservas/widgets/build_usuarios.dart';
import 'package:reservatu_pista/app/pages/usuario/mis_reservas/widgets/detalles_reserva.dart';
import 'package:reservatu_pista/backend/schema/enums/enums.dart';
import 'package:reservatu_pista/components/navbar_y_appbar_usuario.dart';
import 'package:reservatu_pista/constants.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_util.dart';
import 'package:reservatu_pista/utils/btn_icon.dart';
import 'package:reservatu_pista/utils/colores.dart';
import 'package:reservatu_pista/utils/loader/color_loader.dart';
import 'package:reservatu_pista/utils/responsive_web.dart';
import 'package:reservatu_pista/utils/sizer.dart';
import 'package:reservatu_pista/utils/state_getx/state_mixin_demo.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';

class HistorialPage extends StatefulWidget {
  const HistorialPage({super.key});

  @override
  State<HistorialPage> createState() => _HistorialPageState();
}

class _HistorialPageState extends State<HistorialPage> {
  final HistorialController self = Get.find();
  @override
  Widget build(BuildContext context) {
    return NavbarYAppbarUsuario(
        title: 'Historial',
        page: TypePage.None,
        child: Expanded(child: _buildHistorial()));
  }

  // Pagina historial
  Widget _buildHistorial() {
    return Padding(
      padding: paddingAll,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ResponsiveWeb(child: _buildBuscadorPartidas()),
          Center(
            child: Text(
              'Historial de Partidas',
              style: LightModeTheme().headlineMedium.override(
                  fontFamily: 'Outfit', letterSpacing: 0, fontSize: 20),
            ),
          ),
          BuildReservas(
              context: context,
              onPressedContainerReserva: onPressedContainerReserva,
              onNotification: onNotification,
              onPointerSignal: onPointerSignal,
              misReservasUsuario: self.misReservasUsuario,
              isLoading: self.isLoading.value,
              fotoUsuario: self.db.fotoUsuario,
              idUsuario: self.db.idUsuario)
          // Expanded(
          //   child: Listener(
          //     // onPointerSignal: onPointerSignal,
          //     child: NotificationListener<ScrollNotification>(
          //       // onNotification: onNotification,
          //       child: buildReservas(),
          //     ),
          //   ),
          // ),
          // buildReservas(),
          // Expanded(
          //     child: SingleChildScrollView(
          //         child: ResponsiveWeb(child: _buildPartidas())))
        ].divide(paddingSize.sh),
      ),
    );
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
        self.cargarDatos();
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
          self.cargarDatos();
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
          self.cargarDatos();
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

  Widget buildReservas() {
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
            // } else if (index == state.length - 1) {
            //   return ResponsiveWeb(
            //     child: Column(
            //       children: [
            //         buildReserva(state[index]),
            //       ],
            //     ),
            //   );
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
      width: context.wMaxHorizontal,
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
          width: 4,
        ),
      ),
      child: BtnIcon(
        hoverColor: Colores.usuario.primary69,
        borderRadius: 10,
        // onPressed: onPressedContainerReserva != null
        //     ? () => onPressedContainerReserva!(state)
        //     : null,
        icon: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
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
                      Text(
                        '${state.fechaReserva.formatFecha} | ${state.horaInicio.formatHora} - ${state.horaFin.formatHora}',
                        style: LightModeTheme().bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0,
                            ),
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
                    child: SizedBox(
                      height: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 0, 5, 0),
                            child: Text(
                              state.tipoReserva,
                              style: LightModeTheme().bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0,
                                  ),
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

  // Buscador de partidas
  Widget _buildBuscadorPartidas() {
    return TextFormField(
      autofocus: false,
      obscureText: false,
      decoration: InputDecoration(
        labelText: 'Buscar partidas...',
        hintText: 'Introduce el nombre de la partida...',
        hintStyle: LightModeTheme().bodyLarge.override(
              fontFamily: 'Readex Pro',
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
            color: LightModeTheme().usuario,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: LightModeTheme().usuario),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0x00000000),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      style: LightModeTheme().bodyMedium.override(
            fontFamily: 'Readex Pro',
            letterSpacing: 0,
          ),
    );
  }

  Widget _buildPartidas(MisReservasUsuarioModel state) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: List<Widget>.generate(10, (index) => _buildPartida(state))
          .divide(paddingSize.sh)
          .addToEnd(context.paddingBottom.sh),
    );
  }

  // Mostrar la partida
  Widget _buildPartida(MisReservasUsuarioModel state) {
    return Container(
      height: 100,
      width: 300,
      decoration: BoxDecoration(
          color: LightModeTheme().secondaryBackground,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            width: 2,
            color: LightModeTheme().usuario,
          )),
      child: Padding(
        padding: paddingAll,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Partida 1',
                  style: LightModeTheme().bodyLarge.override(
                        fontFamily: 'Readex Pro',
                        letterSpacing: 0,
                      ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                  child: Text(
                    'Fecha: 2024-04-15',
                    style: LightModeTheme().labelMedium.override(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0,
                        ),
                  ),
                ),
              ],
            ),
            Text(
              '15.00€',
              textAlign: TextAlign.end,
              style: LightModeTheme().headlineSmall.override(
                    fontFamily: 'Outfit',
                    letterSpacing: 0,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
