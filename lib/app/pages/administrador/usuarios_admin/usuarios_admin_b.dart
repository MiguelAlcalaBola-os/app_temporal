import 'package:get/get.dart';
import 'package:reservatu_pista/app/pages/administrador/usuarios_admin/usuarios_admin_c.dart';
import 'package:reservatu_pista/app/pages/profesional/mis_socios/mis_socios_c.dart';

class AdminUsuariosBinding implements Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut<AdminUsuariosController>(() => AdminUsuariosController())
      ..lazyPut<MisSociosController>(() => MisSociosController());
  }
}
