import 'package:get/get.dart';
import 'package:reservatu_pista/pages/usuario/inicio/inicio_c.dart';

class InicioBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InicioController>(() => InicioController());
  }
}
