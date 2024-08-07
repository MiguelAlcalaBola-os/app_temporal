import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/app/data/models/reservas_usuario_model.dart';
import 'package:reservatu_pista/app/data/provider/datos_server.dart';
import 'package:reservatu_pista/app/pages/usuario/reservar_pista/reservar_pista_c.dart';
import 'package:reservatu_pista/constants.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_theme.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_util.dart';
import 'package:reservatu_pista/utils/btn_icon.dart';
import 'package:reservatu_pista/utils/colores.dart';
import 'package:reservatu_pista/utils/server/image_server.dart';

class PlazasReservasUsuarios extends GetView<ReservarPistaController> {
  const PlazasReservasUsuarios({super.key, this.isNivel = false});
  final bool isNivel;
  ReservarPistaController get self => controller;
  // Precio de la reserva
  int get precio => self.pista_con_luces
      ? self.precio_con_luz_no_socio
      : self.precio_sin_luz_no_socio;
  // Capacidad de la pista
  int get capacidad => self.pistas.value[self.selectPista.value!].capacidad;
  bool get total => todasMisReservas2();
  @override
  Widget build(BuildContext context) {
    return Obx(_buildListaDeReservas);
  }

  Widget _buildListaDeReservas() {
    if (self.reservas_usuarios.value == null) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: paddingVertical,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _buildReservas(),
      ),
    );
  }

  List<Widget> _buildReservas() {
    List<Widget> listaReservas = [];
    for (ReservasUsuarioType e in createReservasUsuarioType()) {
      if (e.type == EnumTypeReserva.abierta) {
        listaReservas = [
          ...listaReservas,
          ...List<Widget>.generate(
              e.reservaUsuario.plazasReservadas,
              (index) => mostrarBotonReserva(
                  index: index,
                  user: e.reservaUsuario,
                  borderColor: Colores.orange,
                  child: ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(30.0)),
                      child: Image.network(
                        DatosServer.usuario(e.reservaUsuario.imagen),
                        height: 50,
                        width: 50,
                      ))))
        ];
      }
      if (e.type == EnumTypeReserva.usuario) {
        listaReservas = [
          ...listaReservas,
          ...List<Widget>.generate(
              e.reservaUsuario.plazasReservadas,
              (index) => mostrarBotonReserva(
                    index: index,
                    user: e.reservaUsuario,
                    // onPressed: _onPressedReservaUsuario,
                    borderColor: Colores.usuario.primary,
                    child: ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(30.0)),
                      child: ImageServer(
                        height: 50,
                        width: 50,
                      ),
                    ),
                  ))
        ];
      }
      if (e.type == EnumTypeReserva.libre) {
        listaReservas = [
          ...listaReservas,
          ...List<Widget>.generate(
              e.reservaUsuario.plazasReservadas,
              (index) => mostrarBotonReserva(
                  index: index,
                  user: e.reservaUsuario,
                  // onPressed: null,
                  // onPressed: _onPressedReservaLibre,
                  borderColor: Colores.usuario.primary))
        ];
      }
    }
    listaReservas.add(Obx(buildCancelarReservar));
    return listaReservas;
  }

  void _onPressedReservaUsuario() {
    if (self.totalMisReservas) {
      self.totalMisReservas = false;
    }
    final isMenorZero = self.usuario.value.plazasReservadas - 1;
    if (isMenorZero <= 0) {
      return;
    }
    self.usuario.value.plazasReservadas -= 1;
    self.plazas_a_reservar -= 1;
    // ignore: non_constant_identifier_names
    final precio_a_mostrar = precio * self.usuario.value.plazasReservadas;
    self.precio_a_mostrar = precio_a_mostrar;
    if (self.plazas_a_reservar <= capacidad) {
      self.cancelarReserva.value = false;
    }
    self.usuario.refresh();
  }

  void _onPressedReservaLibre() {
    self.precio_elegido = precio;
    self.usuario.value.plazasReservadas += 1;
    self.plazas_a_reservar += 1;
    if (self.plazas_a_reservar == (capacidad)) {
      self.cancelarReserva.value = true;
    }

    /// Poner las reservas abiertas y mostrarlas
    // final total = todasMisReservas2();
    if (total) {
      self.totalMisReservas = true;
    }

    final precioAMostrar = precio * self.usuario.value.plazasReservadas;
    self.precio_a_mostrar = precioAMostrar;
    self.usuario.refresh();
  }

  void _onPressedCancelarReserva() {
    if (self.cancelarReserva.isTrue || self.totalMisReservas) {
      self.usuario.value.plazasReservadas = 1;
      self.plazas_a_reservar = 1;
      self.cancelarReserva.value = false;
      self.totalMisReservas = false;
    } else {
      if (self.totalMisReservas) {
        self.totalMisReservas = false;
      } else {
        /// Poner las reservas abiertas y mostrarlas
        // final total = todasMisReservas2();
        if (total) {
          final reservasPendientes =
              capacidad - self.reservas_usuarios.value!.plazasReservadasTotales;
          self.plazas_a_reservar = reservasPendientes;
          self.usuario.value.plazasReservadas = reservasPendientes;
          self.totalMisReservas = true;
        } else {
          // ignore: non_constant_identifier_names
          self.plazas_a_reservar = capacidad;
          self.usuario.value.plazasReservadas = capacidad;
          self.cancelarReserva.value = true;
        }
      }
    }
    self.precio_a_mostrar =
        self.precio_elegido * self.usuario.value.plazasReservadas;
    self.usuario.refresh();
  }

  Widget mostrarBotonReserva(
      {required ReservaUsuario user,
      Color? borderColor,
      required int index,
      Widget? child,
      dynamic Function()? onPressed}) {
    final textStyle = Get.width < 375.0
        ? LightModeTheme().bodySmall.copyWith(fontSize: 11)
        : LightModeTheme().bodySmall;
    final sizeButton = Get.width < 375.0 ? 45.0 : 50.0;
    return SizedBox(
        width: 70,
        child: Column(
          children: [
            BtnIcon(
                onPressed: onPressed,
                padding: EdgeInsets.zero,
                borderRadius: 35.0,
                size: Size(sizeButton, sizeButton),
                borderWidth: 2,
                hoverColor: Colores.usuario.primary69,
                borderColor: borderColor,
                fillColor: Colors.white,
                icon: child ??
                    Icon(
                      Icons.add,
                      color: Colores.usuario.primary,
                      size: 40,
                      weight: 2,
                    )),
            Text(
              user.nick,
              style: textStyle,
            ),
            Text(
              user.nivel,
              style: textStyle,
            )
          ],
        ));
  }

  /// Build bonton para cancelar y reservar todo
  Widget buildCancelarReservar() {
    final changeColor =
        total ? true : self.cancelarReserva.value || self.totalMisReservas;
    return Visible(
      isVisible: capacidad > 0,
      child: BtnIcon(
        onPressed: total ? null : _onPressedCancelarReserva,
        fillColor: changeColor ? Colores.rojo : Colores.usuario.primary,
        borderRadius: 10,
        padding: const EdgeInsets.all(0),
        size: const Size(75, 55),
        icon: Text(
          changeColor ? 'Cancelar' : 'Reservar\ntodo',
          style: LightModeTheme().bodyMedium.copyWith(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  /// Verificar si todas las reservas son del usuario y si tiene alguna pendiente
  bool todasMisReservas2() {
    if (self.usuario.value.plazasReservadas == capacidad) {
      return true;
    }
    if (self.reservas_usuarios.value!.plazasReservadasTotales == 0) {
      return false;
    }
    final idUsuario = self.usuario.value.idUsuario;
    int total = 0;
    for (final reserva_usuario in self.reservas_usuarios.value!.usuarios) {
      if (reserva_usuario.idUsuario == idUsuario) {
        total += reserva_usuario.plazasReservadas;
      }
    }
    return total == self.reservas_usuarios.value!.plazasReservadasTotales;
  }

  List<ReservasUsuarioType> createReservasUsuarioType() {
    final List<ReservasUsuarioType> lista = [];
    final reservas_usuarios = self.reservas_usuarios.value;

    /// Reservas Abiertas en caso de que haya
    if (reservas_usuarios is ReservasUsuarios && self.cancelarReserva.isFalse) {
      for (var e in reservas_usuarios.usuarios) {
        lista.add(ReservasUsuarioType(EnumTypeReserva.abierta, e));
      }
    }

    /// Reservas del propio usuario
    lista.add(ReservasUsuarioType(EnumTypeReserva.usuario, self.usuario.value));

    /// Reservas Por rellenar, en este caso solo son botones vacios
    if (self.cancelarReserva.isFalse && self.totalMisReservas == false) {
      // ver el tamano de los botones
      final tamanoBotones = self.cancelarReserva.value
          ? capacidad
          : (capacidad -
              (self.reservas_usuarios.value!.plazasReservadasTotales +
                  self.usuario.value.plazasReservadas));
      lista.add(ReservasUsuarioType(EnumTypeReserva.libre,
          ReservaUsuario(plazasReservadas: tamanoBotones)));
    }
    return lista;
  }
}

enum EnumTypeReserva { abierta, usuario, libre }

class ReservasUsuarioType {
  final EnumTypeReserva type;
  final ReservaUsuario reservaUsuario;
  ReservasUsuarioType(this.type, this.reservaUsuario);
}
