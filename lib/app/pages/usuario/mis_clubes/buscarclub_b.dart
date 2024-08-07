import 'package:get/get.dart';
import 'package:reservatu_pista/app/pages/usuario/mis_clubes/buscarclub_c.dart';

class BuscarClubBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BuscarClubController>(() => BuscarClubController());
  }
}
