import 'package:get/get.dart';
import 'package:reservatu_pista/app/pages/administrador/admin_page/pagina_administrador_c.dart';

class AdminPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminPageController>(() => AdminPageController());
  }
}
