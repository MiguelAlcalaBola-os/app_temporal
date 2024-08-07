import 'package:get/get.dart';
import 'login_administrador_c.dart';
import 'login_responsive_c.dart';

class LoginAdministradorBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginAdministradorController>(
        () => LoginAdministradorController());
    Get.lazyPut<LoginResponsiveController>(() => LoginResponsiveController());
  }
}
