import 'package:get/get.dart';
import 'package:reservatu_pista/app/data/services/db_s.dart';
import 'package:reservatu_pista/utils/dialog/message_server_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../backend/storage/storage.dart';
import '../../../../utils/animations/list_animations.dart';
import '../../../routes/app_pages.dart';
import 'package:flutter/material.dart';

class LoginAdministradorController extends GetxController
    with GetTickerProviderStateMixin {
  /// Obtener la pagina 0 Usuario, 1 Proveedor
  int? initialPage = Get.arguments;
  final unfocusNode = FocusNode();
  // State field(s) for email widget.
  FocusNode emailFocusNode = FocusNode();
  TextEditingController emailController = TextEditingController();
  // State field(s) for password widget.
  FocusNode passwordFocusNode = FocusNode();
  TextEditingController passwordController = TextEditingController();
  // Keys para el formulario de usuario y de Administrador
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Controlador para ver el password
  RxBool passwordVisibility = false.obs;
  String? Function(BuildContext, String?)? passwordControllerValidator;
  // State field(s) for Checkbox widget.
  RxBool checkboxValueRecordar = false.obs;
  bool isValidateForms = false;

  /// Animations
  late AnimationController anim;
  late AnimationController animContrasena;
  late AnimationController animTerminos;

  // Controller datos locales
  DBService db = Get.find();

  // Iniciar Los datos guardados
  late SharedPreferences storage;

  @override
  void onInit() async {
    super.onInit();
    // onInitForm();
    anim = animVibrate(vsync: this);
    animContrasena = animVibrate(vsync: this);
    animTerminos = animVibrate(vsync: this);
    storage = await SharedPreferences.getInstance();
    recordarContrasena();
    debounce(passwordVisibility, (_) => passwordVisibility.value = false,
        time: const Duration(seconds: 3, milliseconds: 30));
  }

  /// Verificar si el usuario o proveedor a solicitado recordar la contrasena
  void recordarContrasena() async {
    try {
      // Administrador
      if (storage.passwordAdministrador.exitsValue()) {
        passwordController.text = storage.passwordAdministrador.read();
        checkboxValueRecordar.value = true;
      }
      if (storage.emailAdministrador.exitsValue()) {
        emailController.text = storage.emailAdministrador.read();
        checkboxValueRecordar.value = true;
      }
    } catch (e) {
      print(e);
    }
  }

  // Pruebas para la app
  void onInitForm() {
    emailController.text = 'app@reservatupista.com';
    passwordController.text = '55301903';
  }

  void onPressedAdministrador() async {
    if (formKey.currentState!.validate()) {
      if (emailController.text == 'app@reservatupista.com' &&
          passwordController.text == '55301903') {
        if (checkboxValueRecordar.value) {
          await storage.passwordAdministrador.write(passwordController.text);
          await storage.emailAdministrador.write(emailController.text);
        } else {
          storage.passwordAdministrador.remove();
          storage.emailAdministrador.remove();
        }
        Get.offAllNamed(Routes.ADMINISTRADOR);
      } else {
        return MessageServerDialog(
          context: Get.context!,
          alertType: warning,
          title: 'Login Proveedor',
          subtitle: 'Contraseña o email incorrecto.',
          onPressed: Get.back,
        ).dialog();
      }
    }
  }

  String? validateTextField(String? text, AnimationController anim) {
    if (text!.isEmpty) {
      anim.forward();
      return '';
    }
    return null;
  }

  void onChangeTextField(String text) {
    if (isValidateForms && text.isNotEmpty) {
      isValidateForms = false;
    }
  }

  @override
  void dispose() {
    // Limpiar y liberar recursos
    unfocusNode.dispose();
    emailFocusNode.dispose();
    emailController.dispose();
    passwordFocusNode.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
