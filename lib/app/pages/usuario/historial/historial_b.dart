import 'package:get/get.dart';
import 'package:reservatu_pista/app/pages/usuario/historial/historial_c.dart';

class HistorialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HistorialController>(() => HistorialController());
  }
}
