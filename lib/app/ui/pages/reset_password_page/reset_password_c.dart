import 'dart:convert';
import 'package:get/get.dart';
import 'package:reservatu_pista/app/data/models/message_error.dart';
import 'package:reservatu_pista/app/data/provider/datos_server.dart';
import 'package:reservatu_pista/app/data/provider/proveedor_node.dart';
import 'package:reservatu_pista/app/data/provider/usuario_node.dart';
import 'package:reservatu_pista/app/data/services/db_s.dart';
import 'package:reservatu_pista/utils/dialog/message_server_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../backend/storage/storage.dart';
import '../../../../utils/animations/list_animations.dart';
import '../../../routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';
import '../../../data/models/proveedor_model.dart';
import '../../../data/models/usuario_model.dart';

class ResetPasswordController extends GetxController
    with GetTickerProviderStateMixin {
  bool movilPequeno = false;

  /// Obtener la pagina 0 Usuario, 1 Proveedor
  int? initialPage = Get.arguments;
  PageController pageViewController = PageController(
      initialPage: Get.arguments == null ? 0 : Get.arguments as int);
  final unfocusNode = FocusNode();
  // State field(s) for email widget.
  FocusNode emailUsuarioFocusNode = FocusNode();
  TextEditingController emailUsuarioController = TextEditingController();
  // State field(s) for password widget.
  FocusNode passwordUsuarioFocusNode = FocusNode();
  TextEditingController passwordUsuarioController = TextEditingController();
  // State field(s) for email widget.
  FocusNode emailProveedorFocusNode = FocusNode();
  TextEditingController emailProveedorController = TextEditingController();
  // State field(s) for password widget.
  FocusNode passwordProveedorFocusNode = FocusNode();
  TextEditingController passwordProveedorController = TextEditingController();
  // Keys para el formulario de usuario y de proveedor
  GlobalKey<FormState> formUsuarioKey = GlobalKey<FormState>();
  GlobalKey<FormState> formProveedorKey = GlobalKey<FormState>();

  // Controlador para ver el password
  RxBool passwordProveedorVisibility = false.obs;
  RxBool passwordVisibility = false.obs;
  String? Function(BuildContext, String?)? passwordProveedorControllerValidator;
  // State field(s) for Checkbox widget.
  RxBool checkboxValueRecordarUsuario = false.obs;
  // State field(s) for Checkbox widget.
  RxBool checkboxValueTerminosUsuario = false.obs;
  // State field(s) for Checkbox widget.
  RxBool checkboxValueRecordarProveedor = false.obs;
  // State field(s) for Checkbox widget.
  RxBool checkboxValueTerminosProveedor = false.obs;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isValidateForms = false;

  /// Animations
  late AnimationController animUsuario;
  late AnimationController animContrasena;
  late AnimationController animTerminosUsuario;
  late AnimationController animTerminosProveedor;

  // Controller datos locales
  DBService db = Get.find();

  // Iniciar Los datos guardados
  late SharedPreferences storage;

  @override
  void onInit() async {
    super.onInit();
    print('Get.previousRoute login ${Get.previousRoute}');
    // onInitForm();
    animUsuario = animVibrate(vsync: this);
    animContrasena = animVibrate(vsync: this);
    animTerminosUsuario = animVibrate(vsync: this);
    animTerminosProveedor = animVibrate(vsync: this);
    storage = await SharedPreferences.getInstance();
    recordarContrasena();
    debounce(passwordVisibility, (_) => passwordVisibility.value = false,
        time: const Duration(seconds: 3, milliseconds: 30));
    debounce(passwordProveedorVisibility,
        (_) => passwordProveedorVisibility.value = false,
        time: const Duration(seconds: 3, milliseconds: 30));
  }

  /// Verificar si el usuario o proveedor a solicitado recordar la contrasena
  void recordarContrasena() async {
    try {
      // Usuario
      if (storage.passwordUsuario.exitsValue()) {
        passwordUsuarioController.text = storage.passwordUsuario.read();
        checkboxValueRecordarUsuario.value = true;
      }
      if (storage.emailUsuario.exitsValue()) {
        emailUsuarioController.text = storage.emailUsuario.read();
        checkboxValueRecordarUsuario.value = true;
      }
      // Proveedor
      if (storage.passwordProveedor.exitsValue()) {
        passwordProveedorController.text = storage.passwordProveedor.read();
        checkboxValueRecordarProveedor.value = true;
      }
      if (storage.emailProveedor.exitsValue()) {
        emailProveedorController.text = storage.emailProveedor.read();
        checkboxValueRecordarProveedor.value = true;
      }
    } catch (e) {
      print(e);
    }
  }

  // Pruebas para la app
  void onInitForm() {
    emailUsuarioController.text = 'app@reservatupista.com';
    emailProveedorController.text = 'app@reservatupista.com';
    passwordProveedorController.text = '12345678';
    passwordUsuarioController.text = '12345678';
  }

  // Iniciar Sesion Usuario
  void onPressedUsuario() async {
    if (formUsuarioKey.currentState!.validate()) {
      bool isUserPrueba =
          (emailUsuarioController.text == 'app@reservatupista.com' ||
                  emailUsuarioController.text == 'email@ficticio.com') &&
              passwordUsuarioController.text == '12345678';
      if (!checkboxValueTerminosUsuario.value && !isUserPrueba) {
        animTerminosUsuario.forward();
      } else {
        // Encriptar contrasena
        List<int> bytes = utf8.encode(passwordUsuarioController.text);
        String hashConstrasena = sha1.convert(bytes).toString();
        // Llamar a la api de reservatupista
        final result = await UsuarioProvider().iniciarSesion([
          emailUsuarioController.text,
          emailUsuarioController.text,
          hashConstrasena
        ]);
        if (result is UsuarioModel) {
          // Si el usuario existe guardamos el id para futuras peticiones
          storage.idUsuario.write(result.idUsuario);
          // Guardar el token
          storage.tokenUsuario.write(result.token);
          // Guardar el foto
          storage.fotoUsuario.write(DatosServer.usuario(result.foto));
          // Guardamos el dinero total del usuario
          storage.dineroTotal.write(result.dineroTotal);
          storage.nick.write(result.nick);
          storage.nombre.write(result.nombre);
          storage.apellidos.write(result.apellidos);
          // Guardar si es proveedor
          storage.isProveedor.write(false);
          // Si es recordar contrasena
          if (checkboxValueRecordarUsuario.value) {
            await storage.passwordUsuario.write(passwordUsuarioController.text);
            await storage.emailUsuario.write(emailUsuarioController.text);
          } else {
            storage.passwordUsuario.remove();
            storage.emailUsuario.remove();
          }
          await db.getDB();
          Get.toNamed(Routes.INICIO);
        } else if (result is MessageError) {
          MessageServerDialog(
                  isProveedor: false,
                  context: Get.context!,
                  alertType: warning,
                  title: "Login Usuario",
                  subtitle: result.messageError(),
                  onPressed: Get.back)
              .dialog();
        }
      }
      isValidateForms = true;
    }
  }

  // Iniciar sesion Proveedor
  void onPressedProveedor() async {
    if (formProveedorKey.currentState!.validate()) {
      bool isUserPrueba =
          (emailUsuarioController.text == 'app@reservatupista.com' ||
                  emailUsuarioController.text == 'email@ficticio.com') &&
              passwordProveedorController.text == '12345678';
      if (!checkboxValueTerminosProveedor.value && !isUserPrueba) {
        animTerminosProveedor.forward();
      } else {
        List<int> bytes = utf8.encode(passwordProveedorController.text);
        String hashConstrasena = sha1.convert(bytes).toString();
        final result = await ProveedorProvider()
            .iniciarSesion([emailProveedorController.text, hashConstrasena]);
        if (result is ProveedorModel) {
          // Si el usuario existe guardamos el id para futuras peticiones
          storage.idProveedor.write(result.idProveedor);
          // Guardar el token
          storage.tokenProveedor.write(result.token);
          // Guardamos el id del club
          storage.idClub.write(result.idClub);
          // Guardamos el id del club
          storage.nombreClub.write(result.nombre);
          // Guardar el foto
          storage.fotoProveedor.write(DatosServer.proveedor(result.foto));
          // Guardar si es proveedor
          storage.isProveedor.write(true);
          // Si es recordar contrasena
          if (checkboxValueRecordarProveedor.value) {
            storage.passwordProveedor.write(passwordProveedorController.text);
            storage.emailProveedor.write(emailProveedorController.text);
          } else {
            storage.passwordProveedor.remove();
            storage.emailProveedor.remove();
          }
          await db.getDB();
          Get.toNamed(Routes.INICIO_PROVEEDOR);
        } else if (result is MessageError) {
          MessageServerDialog(
                  isProveedor: true,
                  context: Get.context!,
                  alertType: warning,
                  title: "Login Proveedor",
                  subtitle: result.messageError(),
                  onPressed: Get.back)
              .dialog();
        }
      }
      isValidateForms = true;
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
    emailUsuarioFocusNode.dispose();
    emailUsuarioController.dispose();
    passwordUsuarioFocusNode.dispose();
    passwordUsuarioController.dispose();
    emailProveedorFocusNode.dispose();
    emailProveedorController.dispose();
    passwordProveedorFocusNode.dispose();
    passwordProveedorController.dispose();
    super.dispose();
  }
}
