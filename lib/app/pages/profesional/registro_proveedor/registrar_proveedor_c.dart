import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:reservatu_pista/app/data/models/geonames_model.dart';
import 'package:reservatu_pista/app/data/provider/email_node.dart';
import 'package:reservatu_pista/app/data/provider/geonames_node.dart';
import 'package:reservatu_pista/app/data/provider/proveedor_node.dart';
import 'package:reservatu_pista/utils/dialog/message_server_dialog.dart';
import 'package:reservatu_pista/utils/image/funciones_image.dart';
import 'package:reservatu_pista/utils/loader/color_loader_3.dart';
import '../../../../utils/animations/list_animations.dart';
import '../../../../utils/state_getx/state_mixin_demo.dart';
import '../../../routes/app_pages.dart';
import 'class/text_input_controller.dart';

class RegistrarProveedorController extends GetxController
    with GetTickerProviderStateMixin {
  // Clase para guardar los controladores de los inputs
  final tc = TextInputController();
  // Controllador para hacer scroll
  ScrollController scrollController = ScrollController();
  // Rellenar codigo iban
  bool pruebaEliminarVariable = false;
  // Traer datos de la api de codigo postal Nominatim
  StateRx<bool?> apiCodigoPostalFiscal = StateRx(Rx<bool?>(null));
  // Traer datos de la api de codigo postal Nominatim
  StateRx<bool?> apiCodigoPostal = StateRx(Rx<bool?>(null));
  // GlobalKey para validar el FORM
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // Verificar si el form esta validado
  bool isValidateForms = false;
  // Visibilidad las contrasenas
  RxBool contrasenaVisibility = false.obs;
  RxBool comprobarContrasenaVisibility = false.obs;
  // Animacion de terminos y condiciones
  late AnimationController animTerminos;
  // El texto se guarda en un array en codigo Iban, de acuerdo al Widget COmo el controlador
  List<String> listCodigoIban = ['', '', '', '', '', ''];
  // Clase para la imagen del proveedor
  final imageProveedor = FuncionesImage(isProveedor: true);
  // Clase para la imagen del certificado de cuenta
  final imageCertificado = FuncionesImage(isProveedor: true);
  // Recibir noticias
  bool noticia = false;

  /// Initialization and disposal methods.
  @override
  void onInit() async {
    super.onInit();
    animTerminos = animVibrate(vsync: this);
    // final enviarMail = await ProveedorProvider()
    //     .enviarEmail('nutridos2@gmail.com', 'Miguel Angel');
    // sendEmails();
    // onInitForm();
    // Inicializar la animacion de terminos y condiciones
  }

  // void sendEmails() async {
  //   try {
  //     await ProveedorProvider()
  //         .enviarEmail('miguel@modularbox.com', 'Miguel Angel');

  //     await ProveedorProvider()
  //         .enviarEmail('xhmigue@outlook.com', 'Miguel Angel');

  //     await ProveedorProvider()
  //         .enviarEmail('nutridos2@gmail.com', 'Miguel Angel');
  //   } catch (e) {}
  // }

  // Esto es para pruebas
  void onInitForm() {
    tc.tipo.text = 'Club';
    tc.cifNif.text = 'N1232443F';
    tc.direccionFiscal.text = 'Direccion';
    tc.codigoPostalFiscal.text = '123456';
    tc.localidadFiscal.text = 'Localidad';
    tc.provinciaFiscal.text = 'Provincia';
    tc.comunidadFiscal.text = 'Comunidad';
    tc.nombre.text = 'Nombre Ficticio';
    tc.apellidos.text = 'Apellido Ficticio';
    tc.fijo.text = '123456789';
    tc.email.text = 'miguel@modularbox.com';
    tc.telefono.text = '123456789';
    tc.nombreComercial.text = 'Nombre Comercio';
    tc.direccion.text = 'Direccion';
    tc.codigoPostal.text = '12345';
    tc.localidad.text = 'Localidad';
    tc.provincia.text = 'Provincia';
    tc.comunidad.text = 'Comunidad';
    tc.contrasena.text = '12345678';
    tc.contrasenaComprobar.text = '12345678';
  }

  /// Subir los datos al servidor
  void onPressedRegistrar() async {
    isValidateForms = true;
    if (formKey.currentState!.validate()) {
      try {
        Get.dialog(ColorLoader3());
        // Poner nombre en base a la fecha para que no se repita
        String nameFoto = DateTime.now().millisecondsSinceEpoch.toString();
        if (imageProveedor.existeImagen()) {
          final imagenProveedorSubida = await imageProveedor
              .convertirSubirImagen('proveedores', nameFoto);
          if (imagenProveedorSubida) {
            print("Se subio la imagen");
          } else {
            print("No se subio la imagen :/");
            throw "Error al subir imagen";
          }
        } else {
          throw "No estan las imagenes";
        }
        if (imageCertificado.existeImagen()) {
          final imagenCertficadoSubida = await imageCertificado
              .convertirSubirImagen('proveedores', '${nameFoto}_CC');
          if (imagenCertficadoSubida) {
            print("Se subio la imagen");
          } else {
            print("No se subio la imagen :/");
            throw "Error al subir imagen";
          }
        }

        /// Insertar los datos en SQL en la tabla
        List<int> bytes = utf8.encode(tc.contrasena.text);
        String hashConstrasena = sha1.convert(bytes).toString();

        final datosSQLProveedor = [
          tc.tipo.text,
          tc.cifNif.text,
          listCodigoIban.join(),
          '${nameFoto}_CC',
          tc.nombre.text,
          tc.apellidos.text,
          tc.fijo.text,
          tc.email.text,
          tc.lada.text.split(" ")[1],
          tc.telefono.text,
          tc.direccionFiscal.text,
          tc.localidadFiscal.text,
          tc.provinciaFiscal.text,
          tc.comunidadFiscal.text,
          hashConstrasena,
          nameFoto,
          tc.codigoPostalFiscal.text,
          noticia
        ];

        final datosSQLClub = [
          tc.nombreComercial.text,
          tc.codigoPostal.text,
          tc.direccion.text,
          tc.localidad.text,
        ];

        final datosSQLocalidades = [
          tc.codigoPostal.text,
          tc.localidad.text,
          tc.provincia.text,
          tc.comunidad.text,
        ];

        /// Subir los datos al servidor
        final result = await ProveedorProvider().registrarProveedor(
            datosSQLProveedor, datosSQLClub, datosSQLocalidades);
        Get.back();
        if (result.code == 2000) {
          return MessageServerDialog(
            context: Get.context!,
            alertType: success,
            title: 'Registro Proveedor',
            subtitle: 'Compruebe su correo para finalizar el registro.',
            onPressed: () {
              Get.offAllNamed(Routes.LOGIN_USUARIO, arguments: 0);
            },
          ).dialog();
        } else {
          return MessageServerDialog(
            context: Get.context!,
            alertType: warning,
            title: 'Registro Proveedor',
            subtitle: result.message,
            onPressed: Get.back,
          ).dialog();
        }
      } catch (e) {
        return MessageServerDialog(
          context: Get.context!,
          alertType: error,
          title: 'Registro Proveedor',
          subtitle:
              'Ocurrio un error interno, lo sentimos vuelvelo a intentar mas tarde.',
          onPressed: Get.back,
        ).dialog();
      }
    }
  }

  /// Existe el Codigo Postal
  void existeCodigoPostalFiscal(String codigoPostal) async {
    if (codigoPostal.length == 5) {
      // Muestra el estado de carga
      apiCodigoPostalFiscal.changeStatus(RxStatusDemo.loading());
      try {
        final direccion =
            await GeoNamesProvider().getLocalizacion(codigoPostal);
        if (direccion is GeoNamesModel) {
          tc.localidadFiscal.text = direccion.localidad;
          tc.comunidadFiscal.text = direccion.comunidad;
          tc.provinciaFiscal.text = direccion.provincia;
          apiCodigoPostalFiscal.change(true, RxStatusDemo.success());
        } else {
          apiCodigoPostalFiscal.change(false, RxStatusDemo.success());
        }
      } catch (error) {
        // En caso de error, muestra el mensaje de error
        apiCodigoPostalFiscal.change(false, RxStatusDemo.success());
      }
    } else {
      tc.localidadFiscal.text = '';
      tc.comunidadFiscal.text = '';
      tc.provinciaFiscal.text = '';
      apiCodigoPostalFiscal.changeStatus(RxStatusDemo.empty());
    }
  }

  /// Existe el Codigo Postal
  void existeCodigoPostal(String codigoPostal) async {
    if (codigoPostal.length == 5) {
      // Muestra el estado de carga
      apiCodigoPostal.changeStatus(RxStatusDemo.loading());
      try {
        final direccion =
            await GeoNamesProvider().getLocalizacion(codigoPostal);
        if (direccion is GeoNamesModel) {
          tc.localidad.text = direccion.localidad;
          tc.comunidad.text = direccion.comunidad;
          tc.provincia.text = direccion.provincia;
          apiCodigoPostal.change(true, RxStatusDemo.success());
        } else {
          apiCodigoPostal.change(false, RxStatusDemo.success());
        }
      } catch (error) {
        // En caso de error, muestra el mensaje de error
        apiCodigoPostal.change(false, RxStatusDemo.success());
      }
    } else {
      tc.localidad.text = '';
      tc.comunidad.text = '';
      tc.provincia.text = '';
      apiCodigoPostal.changeStatus(RxStatusDemo.empty());
    }
  }

  String? validateTextFieldContrasena(
      AnimationController anim, FocusNode focusNode) {
    if (tc.contrasena.text.isEmpty) {
      // if (!isFocusNode) {
      //   isFocusNode = true;
      //   focusNode.requestFocus();
      // }
      anim.forward();
      return '';
    }
    if (tc.contrasena.text.length < 6) {
      // if (!isFocusNode) {
      //   isFocusNode = true;
      //   focusNode.requestFocus();
      // }
      anim.forward();
      return '';
    }
    if (tc.contrasena.text != tc.contrasenaComprobar.text) {
      // if (!isFocusNode) {
      //   isFocusNode = true;
      //   focusNode.requestFocus();
      // }
      anim.forward();
      return '';
    }
    return null;
  }

  String? validateTextFieldContrasenaComprobar(
      AnimationController anim, FocusNode focusNode) {
    if (tc.contrasena.text.isEmpty) {
      // if (!isFocusNode) {
      //   isFocusNode = true;
      //   focusNode.requestFocus();
      // }
      anim.forward();
      return '';
    }
    if (tc.contrasenaComprobar.text.length < 6) {
      // if (!isFocusNode) {
      //   isFocusNode = true;
      //   focusNode.requestFocus();
      // }
      anim.forward();
      return 'La contraseña debe tener minimo 6 dígitos.';
    }
    if (tc.contrasena.text != tc.contrasenaComprobar.text) {
      // if (!isFocusNode) {
      //   isFocusNode = true;
      //   focusNode.requestFocus();
      // }
      anim.forward();
      return 'La contraseña no coinciden.';
    }
    return null;
  }

  String? validateTextField(BuildContext context, String? text,
      AnimationController anim, FocusNode focusNode, String nameData) {
    if (text == null || text.isEmpty) {
      FocusScope.of(context).requestFocus(focusNode);
      anim.forward();
      return '';
    }
    return null;
  }
}
