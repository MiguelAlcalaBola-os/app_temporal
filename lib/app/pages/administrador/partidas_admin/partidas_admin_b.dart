import 'package:get/get.dart';
import 'package:reservatu_pista/app/pages/administrador/partidas_admin/partidas_admin_c.dart';

class AdminPartidasBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminPartidasController>(() => AdminPartidasController());
  }
}
