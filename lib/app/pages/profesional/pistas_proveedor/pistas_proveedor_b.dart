import 'package:get/get.dart';
import 'pistas_proveedor_c.dart';

class PistasProveedorBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PistasProveedorController>(() => PistasProveedorController());
  }
}
