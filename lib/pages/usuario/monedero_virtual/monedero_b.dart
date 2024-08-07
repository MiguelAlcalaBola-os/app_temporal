import 'package:get/get.dart';
import 'package:reservatu_pista/app/pages/usuario/reservar_pista/controllers/db_alvaro_c.dart';
import 'package:reservatu_pista/app/pages/usuario/reservar_pista/reservar_pista_c.dart';
import './monedero_c.dart';

class MonederoBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MonederoController>(() => MonederoController());
    Get.lazyPut<ReservarPistaController>(() => ReservarPistaController(),
        tag: 'reserva');
    Get.lazyPut<DBAlvaroController>(() => DBAlvaroController());
  }
}
