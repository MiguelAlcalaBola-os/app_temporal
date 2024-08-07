import 'package:get/get.dart';
import 'package:reservatu_pista/app/pages/administrador/banco_admin/banco_admin_c.dart';

class BancoAdminBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminBancoController>(() => AdminBancoController());
  }
}
