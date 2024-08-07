import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/app/data/models/mis_reservas_usuario_model.dart';
import 'package:reservatu_pista/app/data/provider/pista_node.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_util.dart';
import 'package:reservatu_pista/utils/dialog/message_server_dialog.dart';
import 'package:reservatu_pista/utils/state_getx/state_mixin_demo.dart';
import 'package:reservatu_pista/app/data/provider/reservas_node.dart';

mixin ReservasMixin {
  /// Total de las reservas
  final totalReservas = 0.obs;
  final pageIndexNotifier = ValueNotifier(0);

  /// Cosas compartidas con mis reservas
  final misReservasUsuario = StateRx(Rx<List<MisReservasUsuarioModel>>([]));
  var isLoading = false.obs;
  late Timer timer;
  final _tiempoRestante = 0.obs;
  int get tiempoRestante => _tiempoRestante.value;
  set tiempoRestante(int value) => _tiempoRestante.value = value;
  final changeReservas = false.obs;
  final rxdeporte = 'Pádel'.obs;
  String get deporte => rxdeporte.value;
  set deporte(String value) => rxdeporte.value = value;

  /// Controladores para el manejo de los dias de la fecha
  final _fecha = Rx<DateTime>(DateTime.now());
  DateTime get fecha => _fecha.value;
  set fecha(DateTime value) => _fecha.value = value;

  /// Clase para las peticiones a node
  final provider = PistaProvider();

  /// para cambiare de pantalla

  final _currentPage = 1.obs;
  int get currentPage => _currentPage.value;
  set currentPage(int value) => _currentPage.value = value;
  final pageHaschanged = false.obs;
  final isThrottling = false.obs;
  int lastPageSelected = 1;
  final int itemsPerPage = 10;
  late int initialLength;
  Timer? debounceTimer;
  double previousScrollPosition = 0.0;
  final ScrollController scrollController = ScrollController();
  List<String> listaDeportes = RxList([]);
  late List<MisReservasUsuarioModel> globalResult;

  /// Cosas compartidas
  void empezarFechaRestante(int tiempoRestante) {
    try {
      timer.cancel();
    } catch (e, st) {
      print('e: $e');
      print('st $st');
    }

    tiempoRestante = tiempoRestante;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      tiempoRestante = tiempoRestante - 1000;
    });
    // fecha = fechaRestante;
    // timer = Timer.periodic(const Duration(seconds: 1), (timer) {
    //   fecha = fecha!.subtract(const Duration(seconds: 1));
    // });
  }

  DateTime construirDatetime(DateTime fecha, String horaInicio) {
    final hora = int.parse(horaInicio.substring(0, 2));
    final minutos = int.parse(horaInicio.substring(3, 5));
    DateTime fechaConHora = DateTime(
      fecha.year,
      fecha.month,
      fecha.day,
      hora,
      minutos,
      0,
    );
    return fechaConHora;
  }

  Future<void> cargarDatosReservas(int idPista) async {
    if (isLoading.value) return;
    try {
      isLoading.value = true;
      misReservasUsuario.loading();
      final result = await provider.reservasProveedor(
        idPista,
        fecha.formatFechaDB,
        deporte,
      );
      if (result is List<MisReservasUsuarioModel>) {
        if (result.isEmpty) {
          misReservasUsuario.empty();
          return;
        }
        misReservasUsuario.success(result);
        changeReservas.value = true;
      }
    } catch (e) {
      print('errorrrrrrrrrr $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> eliminarReserva(String idReserva) async {
    try {
      final resultEliminarReserva =
          await ReservasProvider().cancelarReserva(idReserva);
      if (!resultEliminarReserva) {
        MessageServerDialog(
          context: Get.context!,
          title: "Reserva no Cancelada",
          subtitle:
              'La reserva no se ha podido cancelar ya que el tiempo de cancelación de reservas de esta pista es inferior al tiempo que queda para la partida.',
          alertType: warning,
        ).dialog();
      } else {
        MessageServerDialog(
          context: Get.context!,
          title: "Reserva Cancelada",
          subtitle: 'Enhorabuena!. La Reserva se ha cancelado correctamente.',
          alertType: success,
        ).dialog();
      }
      // await cargarDatosReservas();
    } catch (e) {
      MessageServerDialog(
        context: Get.context!,
        title: "Reserva No Cancelada",
        subtitle: 'Ha habido un error interno en la app.',
        alertType: error,
      ).dialog();
      throw e;
    }
  }
}
