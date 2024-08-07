import 'package:flutter/material.dart';
import 'package:reservatu_pista/app/data/models/reservas_usuario_model.dart';
import 'package:reservatu_pista/app/data/provider/datos_server.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_util.dart';
import 'package:reservatu_pista/utils/btn_icon.dart';
import 'package:reservatu_pista/utils/colores.dart';
import 'package:reservatu_pista/utils/server/image_server.dart';
import 'package:reservatu_pista/utils/sizer.dart';

class BuildUsuarios extends StatelessWidget {
  BuildUsuarios(
      {super.key,
      required this.capacidad,
      required this.reservasUsuarios,
      this.idUsuario,
      this.fotoUsuario,
      this.divide = 7.0});
  final int capacidad;
  final ReservasUsuarios? reservasUsuarios;
  final double divide;
  final MainAxisAlignment mainAxisAlignment = MainAxisAlignment.spaceAround;
  final int? idUsuario;
  final String? fotoUsuario;
  // Definir la lista de enteros
  List<int> idUsuarioList = [];

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
      ]),
    );
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
                        const Text('')
                      ],
                    )).divide(divide.sw))
      ].divide(divide.sw),
    );
  }

  Widget buildUsuario(ReservaUsuario user, bool isPlazaReservada) {
    // Verificar si la partida esta cerrada
    final isCerrada = capacidad == reservasUsuarios!.plazasReservadasTotales;

    // Función para verificar si un número está en la lista
    bool exitsIdUsuario(int idUsuario) {
      final exists = idUsuarioList.any((element) => element == idUsuario);
      if (!exists) {
        idUsuarioList.add(user.idUsuario);
      }
      return exists;
    }

    return Row(
        mainAxisAlignment: mainAxisAlignment,
        children: List.generate(user.plazasReservadas, (index) {
          print(user.precioPorReserva);
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
              Text(exitsIdUsuario(user.idUsuario) ? 'Invitado' : user.nick),
              Text(user.nivel),
              Text(getDinero(user, index)),
            ],
          );
        }).divide(divide.sw));
  }

  String getDinero(ReservaUsuario user, int index) => idUsuario == null
      ? user.precioPorReserva![index].euro
      : (idUsuario == user.idUsuario ? user.precioPorReserva![index].euro : '');

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
