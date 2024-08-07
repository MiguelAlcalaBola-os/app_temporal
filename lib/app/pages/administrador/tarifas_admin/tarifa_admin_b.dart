import 'package:get/get.dart';
import 'package:reservatu_pista/app/pages/administrador/tarifas_admin/tarifa_admin_c.dart';

class AdminTarifasBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminTarifasController>(() => AdminTarifasController());
  }
}
