import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:reservatu_pista/app/pages/administrador/usuarios_admin/usuarios_admin_c.dart';
import 'package:reservatu_pista/app/pages/profesional/mis_socios/mis_socios_c.dart';
import 'package:reservatu_pista/app/pages/profesional/mis_socios/widgets/popup_datos_socios2.dart';
import 'package:reservatu_pista/app/pages/profesional/mis_socios/widgets/popup_datos_socios_pendiente.dart';
import 'package:reservatu_pista/components/nav_app_administrador/navbar_y_appbar_admin.dart';
import 'package:reservatu_pista/utils/ckeck/ckecker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';

import 'widgets/usuarios_w.dart';

class AdminUsuarioWidget extends GetView<AdminUsuariosController> {
  const AdminUsuarioWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<MisSociosController>(() => MisSociosController());
    return NavbarYAppbarAdmin(
        title: 'Usuarios',
        isTitleBack: true,
        isNavBar: false,
        child: Expanded(child: UsuariosWidget()));
  }
}
