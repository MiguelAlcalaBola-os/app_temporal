import 'package:get/get.dart';
import '../anadir_pista/anadir_pista_c.dart';
import './tarifas_pista_c.dart';

class TarifasPistaBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TarifasPistaController>(() => TarifasPistaController());
    Get.lazyPut<AnadirPistaController>(() => AnadirPistaController());
  }
}
