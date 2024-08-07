import 'package:get/get.dart';
import '../reservar_pista/controllers/db_alvaro_c.dart';
import 'reserva_compartida_c.dart';

class ReservaCompartidaBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReservaCompartidaController>(
        () => ReservaCompartidaController());
    Get.lazyPut<DBAlvaroController>(() => DBAlvaroController());
  }
}
