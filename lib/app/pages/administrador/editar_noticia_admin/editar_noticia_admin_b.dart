import 'package:get/get.dart';
import 'package:reservatu_pista/app/pages/administrador/editar_noticia_admin/editar_noticia_admin_c.dart';

class EditarNoticiasBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditarNoticiasController>(() => EditarNoticiasController());
  }
}
