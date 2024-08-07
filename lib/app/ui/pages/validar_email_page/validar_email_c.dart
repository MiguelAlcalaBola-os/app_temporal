// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:get/get.dart';
import 'package:reservatu_pista/app/data/models/message_error.dart';
import 'package:reservatu_pista/app/data/provider/proveedor_node.dart';
import 'package:reservatu_pista/app/data/provider/usuario_node.dart';
import 'package:reservatu_pista/app/routes/app_pages.dart';
import 'package:reservatu_pista/utils/dialog/message_server_dialog.dart';

class ValidarEmailController extends GetxController
    with GetTickerProviderStateMixin {
  String id = '';
  String token = '';
  String email = 'miguel@modularbox.com';
  String user = '0';
  // Controllador para esperar a validar el email
  final loadingValidar = true.obs;

  @override
  void onInit() async {
    super.onInit();
    onDatosEliminarCuenta();
  }

  Future<void> onValidarEmail() async {
    try {
      // Llamar a la api de reservatupista
      MessageError result;
      if (user == '0') {
        result = await UsuarioProvider().validarEmail(email);
      } else {
        result = await ProveedorProvider().validarEmail(email);
      }
      if (result.code == 2000 || email.isNotEmpty) {
        MessageServerDialog(
            context: Get.context!,
            alertType: success,
            title: 'Validar Email',
            subtitle: 'El email se valido correctamente.',
            onPressed: () => {Get.offAllNamed(Routes.LOGIN_USUARIO)}).dialog();
      } else {
        MessageServerDialog(
                context: Get.context!,
                alertType: warning,
                title: 'Validar Email',
                subtitle:
                    'Lo sentimos ocurrio un error al validar el email. Intentalo mas tarde.',
                onPressed: Get.back)
            .dialog();
      }
      loadingValidar.value = false;
    } catch (e) {
      print(e);
    }
  }

  void onDatosEliminarCuenta() async {
    final param = Get.parameters;
    final _email = param['email'];
    final _user = param['user'];

    if (_email != null && _user != null) {
      email = param['email'] ?? '';
      user = param['user'] ?? '0';
    } else {
      print("No hay datos");
    }

    onValidarEmail();
  }
}
