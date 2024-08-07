import 'package:get/get.dart';
import 'package:reservatu_pista/app/pages/usuario/reservar_pista/controllers/db_alvaro_c.dart';
import 'package:reservatu_pista/app/pages/usuario/reservar_pista/controllers/select_c.dart';
import './reservar_pista_c.dart';

class ReservarPistaBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReservarPistaController>(() => ReservarPistaController());
    Get.lazyPut<SelectController>(() => SelectController());
    Get.lazyPut<DBAlvaroController>(() => DBAlvaroController());
  }
}
