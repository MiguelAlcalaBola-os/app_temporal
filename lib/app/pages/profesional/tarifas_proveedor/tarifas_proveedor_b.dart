import 'package:get/get.dart';
import 'package:reservatu_pista/app/pages/profesional/tarifas_proveedor/tarifas_proveedor_c.dart';

class TarifasProveedorBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TarifasProveedorController>(() => TarifasProveedorController());
  }
}
