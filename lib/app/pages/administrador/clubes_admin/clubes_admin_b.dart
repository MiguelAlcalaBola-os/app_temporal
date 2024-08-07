import 'package:get/get.dart';
import 'package:reservatu_pista/app/pages/administrador/clubes_admin/clubes_admin_c.dart';

class ClubesAdminBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ClubesAdminController>(() => ClubesAdminController());
  }
}
