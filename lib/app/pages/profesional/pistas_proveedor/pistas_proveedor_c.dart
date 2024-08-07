import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/app/data/provider/pista_node.dart';
import 'package:reservatu_pista/utils/state_getx/state_mixin_demo.dart';
import '../../../../flutter_flow/flutter_flow_animations.dart';
import '../../../data/models/mis_pistas_model.dart';

class PistasProveedorController extends GetxController
    with GetSingleTickerProviderStateMixin {
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

  /// Controlador para cambiar de deporte
  final _deporte = 'Pádel'.obs;
  String get deporte => _deporte.value;
  set deporte(String value) => _deporte.value = value;
  // Global key para el cambio del deporte
  List<GlobalKey> deporteKey = List.generate(16, (index) => GlobalKey());
  // Mostrar el width una vez que cargue la pantalla
  Rx<List<double>> deportesWidth =
      Rx<List<double>>(List.generate(16, (index) => 30.0));

  /// Clase para las peticiones a node
  final provider = PistaProvider();

  @override
  void onReady() {
    super.onReady();
    cargarDeportes();
  }

  /// Initialization and disposal methods.
  @override
  void onInit() async {
    super.onInit();

    // Mandar llamar a la api cargar datos cada vez que se cambie el estado del deporte
    debounce(_deporte, (val) => cargarDatos(),
        time: const Duration(milliseconds: 100));
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
      final result = await provider.getMisPista(deporte: deporte);
      if (result is MisPistas) {
        if (result.misPistas.isEmpty) {
          misPistas.empty();
        } else {
          misPistas.success(result.misPistas);
        }
      }
    } catch (error) {
      misPistas.error('Error al cargar datos de las pistas.');
    }
  }

  /// Ver cuando pulsa en algun deporte
  void onPressDeporte(String val) => {deporte = val};
}
