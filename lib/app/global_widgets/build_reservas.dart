import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:reservatu_pista/app/data/models/mis_reservas_usuario_model.dart';
import 'package:reservatu_pista/app/global_widgets/bonos/sticker_bono_w.dart';
import 'package:reservatu_pista/app/global_widgets/imagenes_pista.dart';
import 'package:reservatu_pista/app/pages/usuario/mis_reservas/widgets/build_usuarios.dart';
import 'package:reservatu_pista/constants.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_theme.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_util.dart';
import 'package:reservatu_pista/utils/btn_icon.dart';
import 'package:reservatu_pista/utils/colores.dart';
import 'package:reservatu_pista/utils/loader/color_loader.dart';
import 'package:reservatu_pista/utils/responsive_web.dart';
import 'package:reservatu_pista/utils/sizer.dart';
import 'package:reservatu_pista/utils/state_getx/state_mixin_demo.dart';

class BuildReservas extends StatelessWidget {
  const BuildReservas(
      {super.key,
      required this.context,
      this.onPointerSignal,
      this.onNotification,
      required this.misReservasUsuario,
      required this.isLoading,
      this.idUsuario,
      this.fotoUsuario,
      this.scrollDirection = Axis.vertical,
      this.onPressedContainerReserva,
      this.nextReservas,
      this.backReservas});
  final BuildContext context;
  final void Function(PointerSignalEvent)? onPointerSignal;
  final bool Function(ScrollNotification)? onNotification;
  final StateRx<List<MisReservasUsuarioModel>> misReservasUsuario;
  final bool isLoading;
  final dynamic Function(MisReservasUsuarioModel state)?
      onPressedContainerReserva;
  final int? idUsuario;
  final String? fotoUsuario;
  final Axis scrollDirection;
  final Widget? nextReservas;
  final Widget? backReservas;

  @override
  Widget build(BuildContext context) {
    // return Expanded(child: buildReservas());
    if (scrollDirection == Axis.horizontal) {
      return buildReservasRow();
    }
    return Expanded(
      child: Listener(
        onPointerSignal: onPointerSignal,
        child: NotificationListener<ScrollNotification>(
            onNotification: onNotification, child: buildReservas()),
      ),
    );
  }

  Widget buildReservasRow() {
    return misReservasUsuario.obx(
      (state) => Padding(
        padding: paddingHorizontal,
        child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(
                        state!.length, (index) => buildReserva(state[index]))
                    .divide(paddingSize.sw))),
      ),
      onLoading: Padding(
        padding: const EdgeInsets.only(top: 0.0),
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
      onEmpty: Padding(
        padding: paddingHorizontal,
        child: _buildContainerStyleReserva(
          height: 200,
          isCerrada: false,
          child: const Center(
            child: Text(
              '\nNo se encontraron reservas.',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildReservas() {
    // if (scrollDirection == Axis.horizontal) {
    //   return CarouselSlider(items: []);
    // }
    return misReservasUsuario.obx(
      (state) => ListView.builder(
        itemCount: state!.length + 2,
        padding: EdgeInsets.only(bottom: context.paddingBottom),
        scrollDirection: scrollDirection,
        itemBuilder: (context, index) {
          print('state!.length ${state.length} ');
          print(
              '(index - 1) < state.length ${(index - 1)}, ${state.length} ${(index - 1) < state.length}');
          if (index > 0 && (index - 1) < state.length) {
            print('------------ buildReserva -----------');
            return ResponsiveWeb(child: buildReserva(state[index - 1]));
          } else if (index == 0) {
            print('backReservas');
            return backReservas ?? const SizedBox.shrink();
          }
          if (index == state.length) {
            print('nextReservas');
            return nextReservas ?? const SizedBox.shrink();
          }
          print('Vacio');
          return const SizedBox.shrink();
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
          width: 2,
        ),
      ),
      child: BtnIcon(
        hoverColor: Colores.usuario.primary69,
        borderRadius: 10,
        onPressed: onPressedContainerReserva != null
            ? () => onPressedContainerReserva!(state)
            : null,
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
                      fotoUsuario: fotoUsuario,
                      idUsuario: idUsuario),
                  Expanded(
                    child: SizedBox(
                      height: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // HorizontalCouponExample2(),
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

  /// Contenedor con el estilo de la reserva
  Widget _buildContainerStyleReserva(
      {required bool isCerrada, double? height, required Widget child}) {
    return Container(
        height: height,
        width: context.wMaxHorizontal,
        // margin: paddingVertical,
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
        child: child);
  }
}
