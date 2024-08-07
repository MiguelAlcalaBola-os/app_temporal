import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/app/data/models/datos_reservas_pista.dart';
import 'package:reservatu_pista/app/pages/usuario/reservar_pista/reservar_pista_c.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_theme.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_util.dart';
import 'package:reservatu_pista/utils/btn_icon.dart';
import 'package:reservatu_pista/utils/colores.dart';
import 'package:reservatu_pista/utils/format_date.dart';

class HorariosW extends StatelessWidget {
  HorariosW({super.key});
  final ReservarPistaController self = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(_buildFechasHorarios);
  }

  Widget _buildFechasHorarios() {
    return self.selectDateDay.value == null
        ? const SizedBox.shrink()
        : _buildHorarios();
  }

  Widget _buildHorarios() {
    return Column(
      children: [
        Container(
          color: Colors.green,
          height: 40.0,
          child: Center(
            child: Text(
              self.selectDateDay.value != null
                  ? FormatDate.dateToString(DateTime(
                      self.selectDateDay.value!.year,
                      self.selectDateDay.value!.month,
                      self.selectDateDay.value!.day))
                  : FormatDate.dateToString(DateTime(DateTime.now().year,
                      DateTime.now().month, DateTime.now().day)),
              textAlign: TextAlign.center,
              style: LightModeTheme().bodySmall.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 18),
            ),
          ),
        ),
        FutureBuilder<Widget>(
          future: enviarHorarios(
              self.id_pista_seleccionada.value,
              DateTime(
                  self.fecha_seleccionada.value.year,
                  self.fecha_seleccionada.value.month,
                  self.fecha_seleccionada.value
                      .day)), // Aquí debes pasar el id de la pista correcto
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Mientras se carga la lista de widgets
              return const CircularProgressIndicator(); // Puedes mostrar un indicador de carga
            } else if (snapshot.hasError) {
              // Si hay un error al cargar la lista de widgets
              return Text('Errorr: ${snapshot.error}');
            } else {
              return snapshot.data!;
            }
          },
        ),
      ],
    );
  }

  Future<Widget> enviarHorarios(int idPista, DateTime diaActual) async {
    final datosPistaJson = await self.generarListaHorarios(idPista, diaActual);
    final List<Horario> arrayHorarios = [];
    for (var i = 0; i < datosPistaJson.length; i++) {
      TypeEstadoHorario status;
      switch (datosPistaJson[i]['estado']) {
        case 'CERRADA':
          status = TypeEstadoHorario.cerrada;
          break;
        case 'RESERVADA_CLASE':
          status = TypeEstadoHorario.reservadaClase;
          break;
        case 'RESERVADA_PARCIAL':
          status = TypeEstadoHorario.reservadaParcial;
          break;
        case 'RESERVADA_COMPLETA':
          status = TypeEstadoHorario.reservada;
          break;
        case 'RESERVA_EN_PROCESO':
          status = TypeEstadoHorario.reservaEnProceso;
          break;
        default:
          status = TypeEstadoHorario.abierta;
          break;
      }
      arrayHorarios.add(Horario(
          horario: datosPistaJson[i]['hora'],
          estatus: status,
          precio_con_luz_no_socio: datosPistaJson[i]['precio_con_luz_no_socio'],
          precio_con_luz_socio: datosPistaJson[i]['precio_con_luz_socio'],
          precio_sin_luz_no_socio: datosPistaJson[i]['precio_sin_luz_no_socio'],
          precio_sin_luz_socio: datosPistaJson[i]['precio_sin_luz_socio'],
          luces: datosPistaJson[i]['luz']));
    }
    self.sm.setHorarios(arrayHorarios.length);
    return _buildListaHorarios(arrayHorarios);
  }

  Widget _buildListaHorarios(List<Horario> horarios) {
    Future<void> _onPressedHorario(int index, String textHorario,
        String termino, bool isReservaParcial) async {
      self.pista_con_luces = horarios[index].luces;
      print('lISTAhORARIOS ');
      print(horarios[index].toJson());
      self.precio_con_luz_no_socio =
          horarios[index].precio_con_luz_no_socio ?? 0;
      self.precio_con_luz_socio = horarios[index].precio_con_luz_socio ?? 0;
      self.precio_sin_luz_no_socio =
          horarios[index].precio_sin_luz_no_socio ?? 0;
      self.precio_sin_luz_socio = horarios[index].precio_sin_luz_socio ?? 0;
      self.hora_inicio_reserva_seleccionada = textHorario;
      self.selectHorario.value = HorarioFinInicio(
          inicio: textHorario,
          termino: termino,
          typeEstadoHorario: TypeEstadoHorario.abierta);
      int horaHoraInicio =
          int.parse(self.hora_inicio_reserva_seleccionada.substring(0, 2));
      int minutosHoraInicio =
          int.parse(self.hora_inicio_reserva_seleccionada.substring(3, 5));
      // PARA SETEAR LA HORA FIN
      DateTime horaInicial = DateTime(
          self.fecha_seleccionada.value.year,
          self.fecha_seleccionada.value.month,
          self.fecha_seleccionada.value.day,
          horaHoraInicio,
          minutosHoraInicio,
          0);
      DateTime horaFin =
          horaInicial.add(Duration(minutes: self.duracion_partida));
      self.hora_fin_reserva_seleccionada =
          horaFin.toString().substring(11, isReservaParcial ? 18 : 19);
      self.selectPay.value = null;
      self.codigoFicticio.value = false;
      self.codigoDescuentoController.text = '';
      await self.obtenerPlazasLibres();
    }

    return Column(
        children: List.generate(1, (col) {
      final List<Widget> rows = [];

      for (var i = 0; i < horarios.length; i = i + 4) {
        rows.add(Obx(() => Row(
                children: List<Widget>.generate(4, (row) {
              if ((row + i) < horarios.length) {
                final String textHorario = horarios[row + i].horario;
                final isSelect =
                    self.hora_inicio_reserva_seleccionada == textHorario;
                final String termino = (row + i + 1) == horarios.length
                    ? "00:00"
                    : horarios[row + i + 1].horario;
                if (horarios[row + i].estatus == TypeEstadoHorario.cerrada) {
                  return _buildContainerHorario(
                    isSelect: isSelect,
                    textHorario: textHorario,
                    fillColor: Colors.grey,
                  );
                } else if (horarios[row + i].estatus ==
                    TypeEstadoHorario.abierta) {
                  return _buildContainerHorario(
                      isSelect: isSelect,
                      textHorario: textHorario,
                      fillColor: Colors.greenAccent,
                      onPressed: () async => await _onPressedHorario(
                          row + i, textHorario, termino, false));
                } else if (horarios[row + i].estatus ==
                    TypeEstadoHorario.reservada) {
                  return _buildContainerHorario(
                      isSelect: isSelect,
                      textHorario: textHorario,
                      fillColor: Colores.rojo,
                      isButton: false);
                } else if (horarios[row + i].estatus ==
                    TypeEstadoHorario.reservadaClase) {
                  return _buildContainerHorario(
                    isSelect: isSelect,
                    textHorario: textHorario,
                    fillColor: Colors.purpleAccent,
                  );
                } else if (horarios[row + i].estatus ==
                    TypeEstadoHorario.reservadaParcial) {
                  return _buildContainerHorario(
                    isSelect: isSelect,
                    textHorario: textHorario,
                    fillColor: Colores.orange,
                    onPressed: () async =>
                        _onPressedHorario(row + i, textHorario, termino, true),
                  );
                }
                return _buildContainerHorario(
                  isSelect: isSelect,
                  textHorario: textHorario,
                  fillColor: const Color(0xffc0c0c0),
                );
              } else {
                return const Flexible(
                  child: SizedBox(
                    height: 40,
                  ),
                );
              }
            }))));
      }
      return Column(
        children: rows,
      );
    }));
  }

  Widget _buildContainerHorario(
      {required bool isSelect,
      required String textHorario,
      required final Color fillColor,
      final dynamic Function()? onPressed,
      final bool isButton = true}) {
    if (isButton) {
      return Flexible(
        child: BtnIcon(
            padding: const EdgeInsets.all(0),
            height: 40,
            fillColor: fillColor,
            borderRadius: isSelect ? 30 : null,
            borderColor: isSelect ? Colores.usuario.primary : Colors.white,
            borderWidth: isSelect ? 2 : 0.5,
            hoverColor: Colores.usuario.primary69,
            onPressed: onPressed,
            icon: Center(
                child: Text(
              textHorario.formatHora,
              style: LightModeTheme().bodySmall.copyWith(
                  color: const Color.fromARGB(255, 0, 0, 0), fontSize: 16),
            ))),
      );
    } else {
      return Flexible(
          child: Container(
              height: 40,
              decoration: BoxDecoration(
                  color: fillColor,
                  border: Border.all(width: 0.5, color: Colors.white)),
              child: Center(
                  child: Text(
                textHorario.formatHora,
                style: LightModeTheme().bodySmall.copyWith(
                    color: const Color.fromARGB(255, 0, 0, 0), fontSize: 16),
              ))));
    }
  }
}
