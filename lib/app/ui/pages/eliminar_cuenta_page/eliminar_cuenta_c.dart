import 'dart:convert';
import 'package:get/get.dart';
import 'package:reservatu_pista/app/data/models/message_error.dart';
import 'package:reservatu_pista/app/data/models/proveedor_model.dart';
import 'package:reservatu_pista/app/data/models/usuario_model.dart';
import 'package:reservatu_pista/app/data/provider/proveedor_node.dart';
import 'package:reservatu_pista/app/data/provider/usuario_node.dart';
import 'package:reservatu_pista/app/ui/pages/eliminar_cuenta_page/widgets/alert_eliminar_cuenta_p.dart';
import 'package:reservatu_pista/utils/dialog/message_server_dialog.dart';
import '../../../../utils/animations/list_animations.dart';
import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';

class EliminarCuentaController extends GetxController
    with GetTickerProviderStateMixin {
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
  RxBool checkboxValueTerminosUsuario = false.obs;
  // State field(s) for Checkbox widget.
  RxBool checkboxEliminarCuenta = false.obs;
  // State field(s) for Checkbox widget.
  RxBool checkboxValueTerminosProveedor = false.obs;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isValidateForms = false;

  /// Animations
  late AnimationController animUsuario;
  late AnimationController animContrasena;
  late AnimationController animTerminosUsuario;
  late AnimationController animTerminosProveedor;

  String id = '';
  String token = '';

  @override
  void onInit() async {
    super.onInit();
    // onInitForm();
    onDatosEliminarCuenta();
    animUsuario = animVibrate(vsync: this);
    animContrasena = animVibrate(vsync: this);
    animTerminosUsuario = animVibrate(vsync: this);
    animTerminosProveedor = animVibrate(vsync: this);
    debounce(passwordVisibility, (_) => passwordVisibility.value = false,
        time: const Duration(seconds: 3, milliseconds: 30));
  }

  void onDatosEliminarCuenta() async {
    final param = Get.parameters;
    final _id = param['idUsuario'];
    final _token = param['token'];
    final _email = param['email'];
    final _user = param['user'];

    if (_id != null && _token != null && _email != null && _user != null) {
      print("Si hay parametros");
      id = _id;
      token = _token;
      Get.dialog(AlertEliminarCuentaWidget(user: int.parse(_user)));
    } else {
      print("No hay datos");
    }
    final datosELiminar =
        '?id=$_id&user=0&token=$_token&email=$_email&user=$_user';
  }

  // Pruebas para la app
  void onInitForm() {
    emailUsuarioController.text = 'ya3@ya3.com';
    emailProveedorController.text = 'app@reservatupista.com';
    passwordUsuarioController.text = '12345678';
  }

  void resetAll() {
    Get.back();
    Get.back();
    Get.back();
    emailUsuarioController.text = '';
    emailProveedorController.text = '';
    passwordUsuarioController.text = '';
  }

  void onEliminarUser(int user) async {
    MessageServerDialog(
      isProveedor: false,
      context: Get.context!,
      alertType: warning,
      title: 'Eliminar Cuenta',
      subtitle: 'result.messageError()',
    ).dialog();
    return;
    // Usuario 0, Proveedor 1
    // Llamar a la api de reservatupista
    final result = await UsuarioNode()
        .delete(id, token, user == 0 ? 'usuario' : 'proveedor');
    if (result is MessageError) {
      if (result.code == 2000) {
        // Get.dialog(AnswerDialog(
        //   alertTitle: richTitle("Eliminar Cuenta"),
        //   alertSubtitle: richSubtitle(result.messageError()),
        //   textButton: "Cerrar",
        //   alertType: TypeGeneralDialog.SUCCESS,
        //   onPressed: () =>
        //       {Get.back(), Get.back(), Get.back(), Get.forceAppUpdate()},
        // ));

        MessageServerDialog(
            isProveedor: false,
            context: Get.context!,
            alertType: success,
            title: 'Eliminar Cuenta',
            subtitle: result.messageError(),
            onPressed: () => {
                  Get.back(),
                  Get.back(),
                  Get.back(),
                  Get.forceAppUpdate()
                }).dialog();
      } else {
        MessageServerDialog(
            isProveedor: false,
            context: Get.context!,
            alertType: warning,
            title: 'Eliminar Cuenta',
            subtitle: result.messageError(),
            onPressed: () => {
                  Get.back(),
                  Get.back(),
                  Get.back(),
                  Get.forceAppUpdate()
                }).dialog();
        // Get.dialog(ChangeDialogGeneral(
        //   alertTitle: richTitle("Eliminar Cuenta"),
        //   alertSubtitle: richSubtitle(result.messageError()),
        //   textButton: "Cerrar",
        //   alertType: TypeGeneralDialog.WARNING,
        //   onPressed: () => {Get.back(), Get.back(), Get.back()},
        // ));
      }
    }
  }

  // Iniciar Sesion Usuario
  void onPressedUsuario() async {
    if (formUsuarioKey.currentState!.validate()) {
      bool isUserPrueba =
          emailUsuarioController.text == 'app@reservatupista.com' &&
              passwordUsuarioController.text == '12345678';
      if (isUserPrueba) {
        MessageServerDialog(
                isProveedor: false,
                context: Get.context!,
                alertType: warning,
                title: "Login Usuario",
                subtitle: 'No es posible eliminar una cuenta privada.',
                onPressed: Get.back)
            .dialog();
        return;
      }
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
          id = result.idUsuario.toString();
          token = result.token;
          Get.dialog(AlertEliminarCuentaWidget(user: 0));
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

  // Iniciar sesion P
  void onPressedProveedor() async {
    if (formProveedorKey.currentState!.validate()) {
      bool isUserPrueba =
          emailProveedorController.text == 'app@reservatupista.com' &&
              passwordProveedorController.text == '12345678';
      if (isUserPrueba) {
        MessageServerDialog(
                isProveedor: true,
                context: Get.context!,
                alertType: warning,
                title: "Login Proveedor",
                subtitle: 'No es posible eliminar una cuenta privada.',
                onPressed: Get.back)
            .dialog();
        return;
      }
      if (!checkboxValueTerminosProveedor.value && !isUserPrueba) {
        animTerminosProveedor.forward();
      } else {
        List<int> bytes = utf8.encode(passwordProveedorController.text);
        String hashConstrasena = sha1.convert(bytes).toString();
        final result = await ProveedorNode()
            .iniciarSesion([emailProveedorController.text, hashConstrasena]);
        if (result is ProveedorModel) {
          id = result.idProveedor.toString();
          token = result.token;
          Get.dialog(AlertEliminarCuentaWidget(user: 1));
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
      // !formKey.currentState!.validate();
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
