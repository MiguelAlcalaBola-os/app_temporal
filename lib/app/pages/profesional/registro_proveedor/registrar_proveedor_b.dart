import 'package:get/get.dart';
import 'registrar_proveedor_c.dart';

class RegistrarProveedorBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegistrarProveedorController>(
        () => RegistrarProveedorController());
  }
}
