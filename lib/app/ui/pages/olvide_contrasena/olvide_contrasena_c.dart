import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/app/data/models/message_error.dart';
import 'package:reservatu_pista/app/data/provider/datos_server.dart';
import 'package:reservatu_pista/app/data/provider/email_node.dart';
import 'package:reservatu_pista/app/data/provider/proveedor_node.dart';
import 'package:reservatu_pista/app/data/provider/usuario_node.dart';
import 'package:reservatu_pista/app/routes/app_pages.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_util.dart';
import 'package:reservatu_pista/utils/animations/list_animations.dart';
import 'package:reservatu_pista/utils/colores.dart';
import 'package:reservatu_pista/utils/dialog/message_server_dialog.dart';

class OlvideContrasenaController extends GetxController
    with GetTickerProviderStateMixin {
  final pageViewController = PageController(initialPage: 0);
  int typeUser = 0;
  final emailController = TextEditingController();
  final formKey0 = GlobalKey<FormState>();
  final formKeyOTP = GlobalKey<FormState>();
  final formKeyContrasena = GlobalKey<FormState>();
  bool validatorForm = false;
  final stateEmail = false.obs;
  final messageEmail = ''.obs;

  final controllersCodigo =
      List.generate(6, (index) => TextEditingController());

  late Color lineColor;
  late Color focusedColor;
  late AnimationController animEmail;
  final provider = EmailProvider();
  final providerUsuario = UsuarioProvider();
  final providerProveedor = ProveedorProvider();

  // La visibilidad de la contrasena
  RxBool contrasenaVisibility = false.obs;
  RxBool comprobarContrasenaVisibility = false.obs;
  // Controladores contrasena
  final tcContrasena = TextEditingController();
  final tcContrasenaComprobar = TextEditingController();
// Animaciones contrasena
  late AnimationController animContrasena;
  late AnimationController animContrasenaComprobar;

  /// Visibilidad email
  final _email = ''.obs;
  String get email => _email.value;
  set email(String value) => _email.value = value;

  int id = 0;
  String token = '';

  final _validateOTP = false.obs;
  bool get validateOTP => _validateOTP.value;
  set validateOTP(bool value) => _validateOTP.value = value;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    animEmail = animVibrate(vsync: this);
    animContrasena = animVibrate(vsync: this);
    animContrasenaComprobar = animVibrate(vsync: this);
    settearDatosUser();

    /// Animaciones para la contrasena
    debounce(contrasenaVisibility, (_) => contrasenaVisibility.value = false,
        time: const Duration(seconds: 3, milliseconds: 30));
    debounce(comprobarContrasenaVisibility,
        (_) => comprobarContrasenaVisibility.value = false,
        time: const Duration(seconds: 3, milliseconds: 30));
  }

  void settearDatosUser() {
    if (Get.parameters['tipo_usuario'] == null) {
      Get.toNamed(Routes.LOGIN_USUARIO);
      return;
    } else {
      typeUser = int.parse(Get.parameters['tipo_usuario']!);
    }
    // Cambiar los colores en base a el usuario o proveedor
    if (typeUser == 0) {
      lineColor = Colores.usuario.primary;
      focusedColor = Colores.usuario.primary160;
    } else {
      lineColor = Colores.proveedor.primary;
      focusedColor = Colores.proveedor.primary160;
    }
  }

  void restartValidate(String value) {
    if (value.isEmpty && validatorForm) {
      formKey0.currentState!.validate();
    }
  }

  String? validatorEmail(String? val) {
    if (val!.isEmpty) {
      return 'Ingresa tu correo.';
    }
    if (!GetUtils.isEmail(val)) {
      return '';
    }
    return null;
  }

  Future<void> resendSendEmail() async {
    try {
      if (stateEmail.value) {
        nextPageForm();
        return;
      }
      if (formKey0.currentState!.validate()) {
        if (GetUtils.isEmail(emailController.text)) {
          String result = '';
          if (typeUser == 0) {
            result = await providerUsuario.existeUsuario(emailController.text);
          } else {
            result =
                await providerProveedor.existeProveedor(emailController.text);
          }
          if (result != '') {
            nextPageForm();
            stateEmail.value = true;
            provider.enviarOlvideContrasena(
              emailController.text,
              typeUser == 1,
            );
          } else {
            messageEmail.value =
                '''Lo sentimos ocurrio un error al Recuperar la Contraseña.''';
            return;
          }
        }
      }
    } catch (e, st) {
      print(e.toString());
      print(st.toString());
    }
  }

  void codigoOTPComplete() {
    for (final element in controllersCodigo) {
      if (element.text.isEmpty) {
        return;
      }
    }
    validarOTP();
  }

  Future<void> validarOTP() async {
    try {
      final getOTP = controllersCodigo.map((e) => e.text).toList().join();
      final result = await provider.validarOTP(
          emailController.text, getOTP, typeUser != 0);
      if (result is! MessageError) {
        if (typeUser != 0) {
          id = result['id_proveedor'];
        } else {
          id = result['id_usuario'];
        }
        token = result['token'];
        validateOTP = false;
        nextPageForm();
      } else {
        validateOTP = true;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> cambiarContrasena() async {
    if (formKeyContrasena.currentState!.validate()) {
      try {
        print('cambiarContrasena ${[
          id,
          token,
          [tcContrasena.text.hashContrasena],
          [contrasena]
        ]}');
        if (typeUser == 0) {
          await providerUsuario.modificarContrasena(
              id, token, [tcContrasena.text.hashContrasena], [contrasena]);
        } else {
          await providerProveedor.modificarContrasena(
              id, token, [tcContrasena.text.hashContrasena], [contrasena]);
        }

        MessageServerDialog(
          context: Get.context!,
          title: "Restablecer Contraseña",
          subtitle: 'Contraseña Restablecida Correctamente',
          alertType: success,
          onPressed: () => Get.offAllNamed(Routes.LOGIN_USUARIO),
        ).dialog();
      } catch (e) {
        print(e.toString());

        MessageServerDialog(
          context: Get.context!,
          title: "Restablecer Contraseña",
          subtitle:
              'Ocurrio un error al restablecer la contraseña, intentalo mas tarde.',
          alertType: warning,
          onPressed: () => Get.offAllNamed(Routes.LOGIN_USUARIO),
        ).dialog();
      }
    }
  }

  String? validateTextFieldContrasena(
      AnimationController anim, FocusNode focusNode) {
    if (tcContrasena.text.isEmpty) {
      anim.forward();
      return '';
    }
    if (tcContrasena.text.length < 6) {
      anim.forward();
      return '';
    }
    if (tcContrasena.text != tcContrasenaComprobar.text) {
      anim.forward();
      return '';
    }
    return null;
  }

  String? validateTextFieldContrasenaComprobar(
      AnimationController anim, FocusNode focusNode) {
    if (tcContrasena.text.isEmpty) {
      anim.forward();
      return '';
    }
    if (tcContrasenaComprobar.text.length < 6) {
      anim.forward();
      return 'La contraseña debe tener minimo 6 dígitos.';
    }
    if (tcContrasena.text != tcContrasenaComprobar.text) {
      anim.forward();
      return 'La contraseña no coinciden.';
    }
    return null;
  }

  /// Ir a la pagina siguiente controller
  void nextPageForm() {
    pageViewController.nextPage(
        duration: const Duration(milliseconds: 200), curve: Curves.linear);
  }

  @override
  void dispose() {
    // Liberar PageController
    pageViewController.dispose();

    // Liberar TextEditingControllers
    emailController.dispose();
    tcContrasena.dispose();
    tcContrasenaComprobar.dispose();
    for (var controller in controllersCodigo) {
      controller.dispose();
    }

    // Liberar AnimationControllers
    animEmail.dispose();
    animContrasena.dispose();
    animContrasenaComprobar.dispose();

    // Llamar al dispose de la clase padre
    super.dispose();
  }
}
