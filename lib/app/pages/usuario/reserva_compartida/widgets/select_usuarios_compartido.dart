import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/app/data/models/reservas_usuario_model.dart';
import 'package:reservatu_pista/app/pages/usuario/reserva_compartida/reserva_compartida_c.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_theme.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_util.dart';
import 'package:reservatu_pista/utils/btn_icon.dart';
import 'package:reservatu_pista/utils/colores.dart';
import 'package:reservatu_pista/utils/server/image_server.dart';
import 'package:reservatu_pista/utils/sizer.dart';

class SelectedUsuariosCompartido extends GetView<ReservaCompartidaController> {
  const SelectedUsuariosCompartido({super.key});
  ReservaCompartidaController get self => controller;
  // Precio de la reserva
  int get precio => self.pista_con_luces.value
      ? self.detallesReserva.precioConLuzNoSocio
      : self.detallesReserva.precioSinLuzNoSocio;
  // Capacidad de la pista
  int get capacidad => self.detallesReserva.capacidad;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // ignore: non_constant_identifier_names
      final reservas_usuarios = self.reservas_usuarios.value;
      if (reservas_usuarios is ReservasUsuarios) {
        return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Row(
              children: [
                buildReservasAbiertas(reservas_usuarios),
                buildReservas()
              ].divide(7.0.sw),
            ),
          ),
          Obx(buildCancelarReservar),
        ]);
      }
      return const SizedBox.shrink();
    });
  }

  Widget buildButton(
    int length,
    RxBool cancelarReserva,
  ) {
    return Row(
      children: [
        buildUsuario(self.usuario.value!, false),
        self.cancelarReserva.value
            ? const SizedBox.shrink()
            : Row(
                children: List.generate(
                    length >= 0 ? length : 0,
                    (index) => Column(
                          children: [
                            BtnIcon(
                                onPressed: () {
                                  self.precio_elegido.value = precio;
                                  self.usuario.value!.plazasReservadas += 1;
                                  self.plazas_a_reservar.value += 1;
                                  if (self.plazas_a_reservar.value ==
                                      (capacidad)) {
                                    self.cancelarReserva.value = true;
                                  }

                                  /// Poner las reservas abiertas y mostrarlas
                                  final total = todasMisReservas2();
                                  if (total) {
                                    self.totalMisReservas = true;
                                  }

                                  final precio_a_mostrar = precio *
                                      self.usuario.value!.plazasReservadas;
                                  self.precio_a_mostrar.value =
                                      precio_a_mostrar;
                                  self.usuario.refresh();
                                },
                                padding: const EdgeInsets.all(0),
                                borderRadius: 35.0,
                                size: const Size(50, 50),
                                borderWidth: 2,
                                hoverColor: Colores.usuario.primary69,
                                borderColor: Colores.usuario.primary,
                                fillColor: Colors.white,
                                icon: Icon(
                                  Icons.add,
                                  color: Colores.usuario.primary,
                                  size: 30,
                                  weight: 2,
                                )),
                            const Text('')
                          ],
                        )).divide(7.0.sw))
      ].divide(7.0.sw),
    );
  }

  Widget buildUsuario(ReservaUsuario user, bool isPlazaReservada) {
    return Row(
        children: List.generate(
      user.plazasReservadas,
      (index) => Column(
        children: [
          BtnIcon(
            onPressed: index == 0 || (self.cancelarReserva.isTrue)
                ? null
                : () {
                    if (self.totalMisReservas) {
                      self.totalMisReservas = false;
                    }
                    final isMenorZero =
                        self.usuario.value!.plazasReservadas - 1;
                    if (isMenorZero < 0) {
                      return;
                    }
                    self.usuario.value!.plazasReservadas -= 1;
                    self.plazas_a_reservar.value -= 1;
                    // ignore: non_constant_identifier_names
                    final precio_a_mostrar =
                        precio * self.usuario.value!.plazasReservadas;
                    self.precio_a_mostrar.value = precio_a_mostrar;
                    if (self.plazas_a_reservar <= capacidad) {
                      self.cancelarReserva.value = false;
                    }
                    self.usuario.refresh();
                  },
            padding: const EdgeInsets.all(0),
            borderRadius: 35.0,
            size: const Size(50, 50),
            borderWidth: 2,
            hoverColor: Colores.usuario.primary69,
            borderColor:
                isPlazaReservada ? Colores.orange : Colores.usuario.primary,
            fillColor: Colors.white,
            icon: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(30.0)),
              child: ImageServer(
                height: 50,
                width: 50,
              ),
            ),
          ),
          Text(user.nick)
        ],
      ),
    ).divide(7.0.sw));
  }

  Widget buildReservasAbiertas(ReservasUsuarios reservas_usuarios) {
    return (self.cancelarReserva.value)
        ? const SizedBox.shrink()
        : Row(
            children: List.generate(
                reservas_usuarios.usuarios.length,
                (index) => buildUsuario(
                      reservas_usuarios.usuarios[index],
                      true,
                    )).divide(
            7.0.sw,
          ));
  }

  Widget buildReservas() {
    // ver el tamano de los botones
    final tamanoBotones = self.cancelarReserva.value
        ? capacidad
        : (capacidad -
            (self.reservas_usuarios.value!.plazasReservadasTotales +
                self.usuario.value!.plazasReservadas));
    return self.reservas_usuarios.value == null
        ? const SizedBox.shrink()
        : buildButton(
            tamanoBotones,
            self.cancelarReserva,
          );
  }

  /// Build bonton para cancelar y reservar todo
  Widget buildCancelarReservar() {
    final changeColor = self.cancelarReserva.value || self.totalMisReservas;
    return capacidad == 0
        ? const SizedBox.shrink()
        : BtnIcon(
            onPressed: () {
              if (self.cancelarReserva.isTrue || self.totalMisReservas) {
                self.usuario.value!.plazasReservadas = 1;
                self.plazas_a_reservar.value = 1;
                self.cancelarReserva.value = false;
                self.totalMisReservas = false;
              } else {
                if (self.totalMisReservas) {
                  self.totalMisReservas = false;
                } else {
                  /// Poner las reservas abiertas y mostrarlas
                  final total = todasMisReservas2();
                  if (total) {
                    final reservasPendientes = capacidad -
                        self.reservas_usuarios.value!.plazasReservadasTotales;
                    self.plazas_a_reservar.value = reservasPendientes;
                    self.usuario.value!.plazasReservadas = reservasPendientes;
                    self.totalMisReservas = true;
                  } else {
                    // ignore: non_constant_identifier_names
                    self.plazas_a_reservar.value = capacidad;
                    self.usuario.value!.plazasReservadas = capacidad;
                    self.cancelarReserva.value = true;
                  }
                }
              }
              self.precio_a_mostrar.value = self.precio_elegido.value *
                  self.usuario.value!.plazasReservadas;
              self.usuario.refresh();
            },
            fillColor: changeColor ? Colores.rojo : Colores.usuario.primary,
            borderRadius: 10,
            padding: const EdgeInsets.all(0),
            size: const Size(80, 60),
            icon: Text(
              changeColor ? 'Cancelar' : 'Reservar\ntodo',
              style: LightModeTheme().bodyMedium.copyWith(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          );
  }

  /// Verificar si todas las reservas son del usuario y si tiene alguna pendiente
  bool todasMisReservas2() {
    if (self.usuario.value!.plazasReservadas == capacidad) {
      return true;
    }
    if (self.reservas_usuarios.value!.plazasReservadasTotales == 0) {
      return false;
    }
    print("TodasMisReservas");
    final idUsuario = self.usuario.value!.idUsuario;
    print(idUsuario);
    print(self.reservas_usuarios.value!.usuarios);
    int total = 0;
    for (final reserva_usuario in self.reservas_usuarios.value!.usuarios) {
      print("total");
      print(
          "reserva_usuario.plazasReservada ${reserva_usuario.plazasReservadas}");
      if (reserva_usuario.idUsuario == idUsuario) {
        total += reserva_usuario.plazasReservadas;
      }
    }
    return total == self.reservas_usuarios.value!.plazasReservadasTotales;
  }
}
