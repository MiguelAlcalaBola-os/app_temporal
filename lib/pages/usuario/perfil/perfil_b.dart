import 'package:get/get.dart';
import 'package:reservatu_pista/pages/usuario/perfil/perfil_c.dart';

class PerfilBinding implements Bindings {
  @override
  void dependencies() async {
    Get.lazyPut<PerfilController>(() => PerfilController());
  }
}
