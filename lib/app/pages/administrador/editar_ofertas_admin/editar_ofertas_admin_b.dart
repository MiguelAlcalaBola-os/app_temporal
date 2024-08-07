import 'package:get/get.dart';
import 'package:reservatu_pista/app/pages/administrador/editar_ofertas_admin/editar_ofertas_admin_c.dart';

class EditarOfertasBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditarOfertasController>(() => EditarOfertasController());
  }
}
