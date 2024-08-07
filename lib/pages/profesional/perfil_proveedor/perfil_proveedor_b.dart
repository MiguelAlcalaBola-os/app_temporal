import 'package:get/get.dart';
import './perfil_proveedor_c.dart';

class PerfilProveedorBinding implements Bindings {
  @override
  void dependencies() async {
    Get.lazyPut<PerfilProveedorController>(() => PerfilProveedorController());
  }
}
