import 'package:get/get.dart';
import './inicio_proveedor_c.dart';

class InicioProveedorBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InicioProveedorController>(() => InicioProveedorController());
  }
}
