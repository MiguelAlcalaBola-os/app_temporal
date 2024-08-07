import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/app/data/provider/reservas_node.dart';
import 'package:reservatu_pista/app/mixin/reservas_mixin.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_util.dart';
import 'package:reservatu_pista/utils/dialog/message_server_dialog.dart';
import 'package:reservatu_pista/utils/state_getx/state_mixin_demo.dart';
import '../../../../flutter_flow/flutter_flow_animations.dart';
import '../../../data/models/mis_pistas_model.dart';

class MisPistasController extends GetxController
    with GetSingleTickerProviderStateMixin, ReservasMixin {
  int idPista = 0;

  ///Guardar datos para mandarlos
  String _idReserva = '';
  int _idReservaPistaUsuario = 0;
  bool cancelarReserva = false;

  /// Obtencion de los datos de la api
  final misPistas = StateRx(Rx<List<MiPista>>([]));
  final misDeportes = <String>[].obs;

  /// Controlador para las animaciones
  final animationPistaDeporte = AnimationInfo(
    trigger: AnimationTrigger.onPageLoad,
    effects: [
      FadeEffect(
        curve: Curves.linear,
        delay: 0.ms,
        duration: 400.ms,
        begin: 0.0,
        end: 1.0,
      ),
      MoveEffect(
        curve: Curves.linear,
        delay: 0.ms,
        duration: 400.ms,
        begin: const Offset(50.0, 0.0),
        end: const Offset(0.0, 0.0),
      ),
    ],
  );

  /// Controlador para cambiar de paginas en la
  PageController? pageViewController;
  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

  /// Declaramos una variable booleana donde false sera previous fecha y true sera next fecha
  final _fechaNextPrevious = false.obs;
  bool get fechaNextPrevious => _fechaNextPrevious.value;
  set fechaNextPrevious(bool value) => _fechaNextPrevious.value == value
      ? _fechaNextPrevious.refresh()
      : _fechaNextPrevious.value = value;

  // Global key para el cambio del deporte
  List<GlobalKey> deporteKey = List.generate(16, (index) => GlobalKey());
  // Mostrar el width una vez que cargue la pantalla
  Rx<List<double>> deportesWidth =
      Rx<List<double>>(List.generate(16, (index) => 30.0));

  @override
  void onReady() {
    super.onReady();
    cargarDeportes();
  }

  /// Initialization and disposal methods.
  @override
  void onInit() async {
    super.onInit();
    // Cambiar la fecha cuando se actualice y mover el pageview
    debounce(_fechaNextPrevious, (val) => val ? nextPage() : previousPage(),
        time: const Duration(milliseconds: 200));
    // Mandar llamar a la api cargar datos cada vez que se cambie el estado del deporte
    debounce(rxdeporte, (val) => {cargarDatos(), print("cambiar")},
        time: const Duration(milliseconds: 100));
  }

  Future<bool> onCancelarReservaProveedor(
      String idReserva, int idReservaPistaUsuario) async {
    _idReserva = idReserva;
    _idReservaPistaUsuario = idReservaPistaUsuario;
    pageIndexNotifier.value = 1;
    print('pageIndezNotifier: ${pageIndexNotifier.value}');
    return true;
  }

  void onPresedCancelarReserva(int idPista) async {
    final result = await ReservasProvider()
        .cancelarReservaProveedor(_idReserva, _idReservaPistaUsuario);
    final subtitle = result
        ? 'Reservada Eliminada Correctamente'
        : 'Error al Eliminar la Reserva';
    final alertType = result ? success : warning;
    MessageServerDialog(
      isProveedor: true,
      context: Get.context!,
      title: 'Eliminar Reserva',
      alertType: alertType,
      subtitle: subtitle,
      onPressed: () =>
          {cargarDatosReservas(idPista), Navigator.of(Get.context!).pop()},
    ).dialog();
    print('idReserva = $_idReserva');
    print('idReservaPistaUsuario = $_idReservaPistaUsuario');
    print('cancelarReserva = $cancelarReserva');
  }

  void cargarDeportes() async {
    final result = await provider.getMisDeportes();
    if (result is List<String>) {
      if (result.isEmpty) {
        return;
      }
      misDeportes.value = result;
      deporte = result[0];
    }
  }

  /// Método para cargar datos
  void cargarDatos() async {
    misPistas.loading();
    try {
      final result = await provider.getMisPista(
          deporte: deporte,
          diaSemana: fecha.letraDia,
          fecha: fecha.formatFechaDB);
      if (result is MisPistas) {
        if (result.misPistas.isEmpty) {
          misPistas.empty();
        } else {
          misPistas.success(result.misPistas);
        }
        changeReservas.value = false;
      }
    } catch (error) {
      misPistas.error('Error al cargar datos de las pistas.');
    }
  }

  /// Funciones para el controlador de las paginas para cambiar la pagina de dia
  void nextPageBool() => {
        pageViewController!.jumpToPage(1),
        fechaNextPrevious = true,
      };

  void previousPageBool() =>
      {pageViewController!.jumpToPage(1), fechaNextPrevious = false};

  /// Funciones para el controlador de las paginas para cambiar la pagina de dia
  void nextPage() => {
        pageViewController!.nextPage(
            duration: const Duration(milliseconds: 300), curve: Curves.linear),
        nextDia()
      };

  void previousPage() => {
        pageViewController!.previousPage(
            duration: const Duration(milliseconds: 300), curve: Curves.linear),
        previousDia()
      };

  /// Funciones para la fecha en este caso para cambiar de dias en el inicio
  void nextDia() => {fecha = fecha.add(const Duration(days: 1)), cargarDatos()};
  void previousDia() =>
      {fecha = fecha.subtract(const Duration(days: 1)), cargarDatos()};

  /// Ver cuando pulsa en algun deporte
  void onPressDeporte(String val) => {deporte = val};
}
