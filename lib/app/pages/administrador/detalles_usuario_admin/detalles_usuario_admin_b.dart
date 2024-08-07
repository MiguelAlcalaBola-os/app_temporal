import 'package:get/get.dart';
import 'detalles_usuario_admin_c.dart';

class DetallesUsuarioBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetallesUsuarioController>(() => DetallesUsuarioController());
  }
}
