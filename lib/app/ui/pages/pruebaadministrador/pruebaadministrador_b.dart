
import 'package:get/get.dart';
import 'pruebaadministrador_c.dart';


class PruebaAdministradorBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PruebaAdministradorController>(() => PruebaAdministradorController());
  }
}