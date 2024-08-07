import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/app/data/models/reservas_usuario_model.dart';
import 'package:reservatu_pista/app/data/provider/datos_server.dart';
import 'package:reservatu_pista/app/mixin/reservas_mixin.dart';
import 'package:reservatu_pista/app/pages/profesional/mis_pistas/mis_pistas_c.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_util.dart';
import 'package:reservatu_pista/utils/btn_icon.dart';
import 'package:reservatu_pista/utils/colores.dart';
import 'package:reservatu_pista/utils/server/image_server.dart';
import 'package:reservatu_pista/utils/sizer.dart';
import 'package:badges/badges.dart' as badges;

class BuildUsuarios extends StatelessWidget with ReservasMixin {
  BuildUsuarios(
      {super.key,
      required this.capacidad,
      required this.reservasUsuarios,
      this.idUsuario,
      this.fotoUsuario,
      required this.idReserva,
      required this.eliminar,
      required this.idPista,
      this.divide = 7.0});
  final int capacidad;
  final ReservasUsuarios? reservasUsuarios;
  final double divide;
  final MainAxisAlignment mainAxisAlignment = MainAxisAlignment.spaceAround;
  final int? idUsuario;
  final String? fotoUsuario;
  final bool eliminar;
  final String idReserva;
  final int idPista;
  final MisPistasController self = Get.find();
  // Definir la lista de enteros
  final idUsuarioList = [];

  @override
  Widget build(BuildContext context) {
    if (reservasUsuarios == null) {
      return const SizedBox.shrink();
    }
    return Visible(
        isVisible: reservasUsuarios != null,
        child: Row(mainAxisAlignment: mainAxisAlignment, children: [
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Row(
              mainAxisAlignment: mainAxisAlignment,
              children: [
                buildReservasAbiertas(reservasUsuarios!),
                buildReservas()
              ].divide(divide.sw),
            ),
          ),
        ]));
  }

  Widget buildButton(
    int length,
  ) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Row(
            mainAxisAlignment: mainAxisAlignment,
            children: List.generate(
                length >= 0 ? length : 0,
                (index) => Column(
                      children: [
                        BtnIcon(
                            onPressed: null,
                            padding: const EdgeInsets.all(0),
                            borderRadius: 35.0,
                            size: const Size(50, 50),
                            borderWidth: 2,
                            hoverColor: Colores.usuario.primary69,
                            borderColor: Colores.usuario.primary,
                            fillColor: Colors.white,
                            icon: const SizedBox.shrink()),
                        const Text(''),
                        const Text(''),
                        const Text(''),
                        const Text('')
                      ],
                    )).divide(divide.sw))
      ].divide(divide.sw),
    );
  }

  Widget buildUsuario(ReservaUsuario user, bool isPlazaReservada) {
    return Row(
        mainAxisAlignment: mainAxisAlignment,
        children: List.generate(user.plazasReservadas, (index) {
          return eliminar
              ? badges.Badge(
                  position: const badges.BadgePosition(end: -1, top: -6),
                  badgeContent: BtnIcon(
                    padding: const EdgeInsets.all(0),
                    borderWidth: 1,
                    buttonSize: 20,
                    icon: const Icon(
                      Icons.cancel_outlined,
                      color: Colors.white,
                      size: 18,
                    ),
                    onPressed: () async {
                      print("ELiminar");
                      try {
                        await self.onCancelarReservaProveedor(
                            idReserva, user.idReservaPistaUsuario);
                        // await cargarDatosReservas(idPista);
                      } catch (e) {
                        print(e);
                      }
                    },
                  ),
                  showBadge: true,
                  elevation: 4,
                  padding: const EdgeInsets.all(0),
                  animationType: badges.BadgeAnimationType.scale,
                  child: buildDatosUsuario(user, isPlazaReservada))
              : buildDatosUsuario(user, isPlazaReservada);
        }).divide(divide.sw));
  }

  Widget buildDatosUsuario(ReservaUsuario user, bool isPlazaReservada) {
    // Verificar si la partida esta cerrada
    final isCerrada = capacidad == reservasUsuarios!.plazasReservadasTotales;

    // Función para verificar si un número está en la lista
    bool _exitsIdUsuario(int idUsuario) {
      final exists = idUsuarioList.any((element) => element == idUsuario);
      if (!exists) {
        idUsuarioList.add(user.idUsuario);
      }
      print('exits: $exists');
      return exists;
    }

    return Column(
      children: [
        BtnIcon(
          onPressed: null,
          padding: const EdgeInsets.all(0),
          borderRadius: 35.0,
          size: const Size(50, 50),
          borderWidth: 2,
          hoverColor: Colores.usuario.primary69,
          borderColor: isPlazaReservada
              ? (isCerrada ? Colores.rojo : Colores.orange)
              : Colores.usuario.primary,
          fillColor: Colors.white,
          icon: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(30.0)),
              child: buildImagen(user.imagen)),
        ),
        Text(_exitsIdUsuario(user.idUsuario) ? 'Invitado' : user.nick),
        Text(user.nivel),
        Text(getDinero(user)),
        Text(user.tipoReserva),
      ],
    );
  }

  String getDinero(ReservaUsuario user) => idUsuario == null
      ? user.precio.euro
      : (idUsuario == user.idUsuario ? user.precio.euro : '');

  Widget buildImagen(imageName) {
    if (imageName == fotoUsuario) {
      return ImageServer(
        width: 50,
        height: 50,
      );
    }
    return Image.network(DatosServer.usuario(imageName), width: 50, height: 50);
  }

  Widget buildReservasAbiertas(ReservasUsuarios reservasUsuarios) {
    return Row(
        mainAxisAlignment: mainAxisAlignment,
        children: List.generate(
            reservasUsuarios.usuarios.length,
            (index) => buildUsuario(
                  reservasUsuarios.usuarios[index],
                  true,
                )).divide(
          divide.sw,
        ));
  }

  Widget buildReservas() {
    // ver el tamano de los botones
    final tamanoBotones = capacidad - reservasUsuarios!.plazasReservadasTotales;
    return buildButton(
      tamanoBotones,
    );
  }
}
