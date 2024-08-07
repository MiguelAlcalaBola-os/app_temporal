import 'package:get/get.dart';
import '../tarifas_pista/tarifas_pista_c.dart';
import './anadir_pista_c.dart';

class AnadirPistaBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AnadirPistaController>(() => AnadirPistaController());
    Get.lazyPut<TarifasPistaController>(() => TarifasPistaController());
  }
}
