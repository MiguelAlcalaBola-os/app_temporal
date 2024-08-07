// ignore_for_file: non_constant_identifier_names
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:reservatu_pista/app/data/models/geonames_model.dart';
import 'package:reservatu_pista/app/data/provider/email_node.dart';
import 'package:reservatu_pista/app/data/provider/geonames_node.dart';
import 'package:reservatu_pista/app/data/provider/usuario_node.dart';
import 'package:reservatu_pista/app/routes/app_pages.dart';
import 'package:reservatu_pista/utils/dialog/message_server_dialog.dart';
import 'package:reservatu_pista/utils/image/funciones_image.dart';
import 'package:reservatu_pista/utils/loader/color_loader_3.dart';
import '../../../../utils/state_getx/state_mixin_demo.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'class/text_input_controller.dart';

class RegistrarUsuarioController extends GetxController
    with GetTickerProviderStateMixin {
  // Traer datos de la api de codigo postal Nominatim
  final apiCodigoPostal = StateRx(Rxn<bool>());
  // Api si existe el nick
  final apiExisteNick = StateRx(Rxn<bool>());
  // Api si existe el email
  final apiExisteEmail = StateRx(Rxn<bool>());
  // Controlladores para los inputs
  final tc = TextInputController();
  List<Map<String, String>> marcasPalas = [
    {'': ''}
  ].obs;
  List<Map<String, String>> modelosPalas = [
    {'': ''}
  ].obs;
  final marcasPalasMap = Rx<Map<String, String>>({});
  // Global key para el form de los inputs
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // Si el form esta validado
  bool isValidateForms = false;
  // La visibilidad de la contrasena
  RxBool contrasenaVisibility = false.obs;
  RxBool comprobarContrasenaVisibility = false.obs;
  // Verificar si existe nick y mandar a la api en un tiempo determinado
  RxString nick = ''.obs;
  // Verificar si existe email y mandar a la api en un tiempo determinado
  RxString email = ''.obs;
  // Clase para la imagen
  final image = FuncionesImage();
  // Cambiar la noticia
  bool noticia = false;

  /// Peticiones a la api
  final provider = UsuarioProvider();

  @override
  void onInit() {
    super.onInit();
    buildMarcasPalas();
    debounce(contrasenaVisibility, (_) => contrasenaVisibility.value = false,
        time: const Duration(seconds: 3, milliseconds: 30));
    debounce(comprobarContrasenaVisibility,
        (_) => comprobarContrasenaVisibility.value = false,
        time: const Duration(seconds: 3, milliseconds: 30));
    debounce(nick, (value) async {
      existeValor(value, 'nick', apiExisteNick);
    }, time: const Duration(seconds: 1));
    debounce(email, (value) async {
      if (GetUtils.isEmail(value)) {
        existeValor(value, 'email', apiExisteEmail);
      } else {
        apiExisteEmail.success(false);
      }
    }, time: const Duration(seconds: 1));
  }

  onInitForm() {
    tc.nombre.text = 'Nombre Fiticio';
    tc.apellidos.text = 'Apellido Fiticio';
    tc.sexo.text = 'Hombre';
    tc.dni.text = '';
    tc.lada.text = '🇪🇸 +34';
    tc.telefono.text = '999999999';
    tc.email.text = 'miguel@modularbox.com';
    tc.direccion.text = 'Direccion';
    tc.codigoPostal.text = '12345';
    tc.localidad.text = 'Localidad';
    tc.provincia.text = 'Provincia';
    tc.comunidad.text = 'Comunidad';
    tc.nick.text = 'mike1121';
    tc.contrasenaComprobar.text = '12345678';
    tc.contrasena.text = '12345678';
  }

  /// Obtener los modelos de las palas
  Future<void> buildModelosPalas(int id_marca) async {
    final response = await provider.getModelosPalas(id_marca);
    List<dynamic> data = response.body;
    modelosPalas.clear();
    for (var element in data) {
      modelosPalas.add({
        'modelo': element['modelo'].toString(),
        'id': element['id_marca_pala'].toString()
      });
    }
  }

  /// Obtener las marcas de la pala
  Future<void> buildMarcasPalas() async {
    final response = await provider.getMarcasPalas();
    List<dynamic> data = response.body;
    marcasPalas.clear();
    Map<String, String> newMapa = {};
    for (var element in data) {
      newMapa[element['marca']] = element['id'].toString();
      marcasPalas.add({
        'marca': element['marca'].toString(),
        'id': element['id'].toString()
      });
    }
  }

  /// Loading Nick
  void loadingNick(String val) {
    if (val.isEmpty) {
      apiExisteNick.empty();
    } else {
      apiExisteNick.loading();
      nick.value = val;
    }
  }

  /// Loading Value
  void loadingValue(String val, RxString valrx, StateRx<bool?> state) {
    if (val.isEmpty) {
      state.empty();
    } else {
      state.loading();
      valrx.value = val;
    }
  }

  /// Existe el Nick
  void existeNick(String nick, Future<bool> Function(String) api) async {
    // Muestra el estado de carga
    apiExisteNick.loading();
    try {
      final existe = await provider.getUsuarioExisteNick(nick);
      apiExisteNick.success(existe);
    } catch (error) {
      // En caso de error, muestra el mensaje de error
      apiExisteNick.success(false);
    }
  }

  /// Existe Valor en el servidor
  void existeValor(String value, String type, StateRx valuerx) async {
    // Muestra el estado de carga
    valuerx.loading();
    try {
      final existe = await provider.getUsuarioExiste(value, type);
      valuerx.success(existe);
    } catch (error) {
      // En caso de error, muestra el mensaje de error
      valuerx.success(false);
    }
  }

  /// Existe el Codigo Postal
  void existeCodigoPostal(String codigoPostal) async {
    if (codigoPostal.length == 5) {
      // Muestra el estado de carga
      apiCodigoPostal.loading();
      try {
        final direccion =
            await GeoNamesProvider().getLocalizacion(codigoPostal);
        if (direccion is GeoNamesModel) {
          tc.localidad.text = direccion.localidad;
          tc.comunidad.text = direccion.comunidad;
          tc.provincia.text = direccion.provincia;
          apiCodigoPostal.success(true);
        } else {
          apiCodigoPostal.success(false);
        }
      } catch (error) {
        // En caso de error, muestra el mensaje de error
        apiCodigoPostal.success(false);
      }
    } else {
      tc.localidad.text = '';
      tc.comunidad.text = '';
      tc.provincia.text = '';
      apiCodigoPostal.empty();
    }
  }

  /// Registrar Usuario
  void onPressedRegistrar() async {
    if (formKey.currentState!.validate()) {
      try {
        Get.dialog(ColorLoader3());
        // Poner nombre en base a la fecha para que no se repita
        String nameFoto = DateTime.now().millisecondsSinceEpoch.toString();
        nameFoto = image.imageAsset.value != null
            ? '${image.imageAsset.value!}@$nameFoto'
            : nameFoto;
        final imagenSubida =
            await image.convertirSubirImagen('usuarios', nameFoto);
        if (imagenSubida) {
          print("Se subio la imagen");
        } else {
          print("No se subio la imagen :/");
          throw "Error al subir imagen";
        }

        /// Insertar los datos en SQL en la tabla
        List<int> bytes = utf8.encode(tc.contrasena.text);
        String hashConstrasena = sha1.convert(bytes).toString();
        final nombre = tc.nombre.text;
        final apellidos = tc.apellidos.text;
        final sexo = tc.sexo.text;
        final DNI = tc.dni.text;
        final lada = tc.lada.text.split(" ")[1];
        final telefono = tc.telefono.text;
        final email = tc.email.text;
        final empadronamiento = tc.empadronamiento.text;
        final comunidad_de_vecinos = tc.comunidadVecinos.text;
        final direccion = tc.direccion.text;
        final codigo_postal = tc.codigoPostal.text;
        final localidad = tc.localidad.text;
        final provincia = tc.provincia.text;
        final comunidad = tc.comunidad.text;
        final nick = tc.nick.text;
        final nivel = tc.nivel.text;
        final posicion = tc.posicion.text;
        final marca_pala = tc.pala.text;
        final modelo_pala = tc.modelo.text;
        final juegos_semana = tc.juegoPorSemana.text;
        final contrasena = hashConstrasena;
        final foto = nameFoto;

        final datosSQL = [
          nombre,
          apellidos,
          sexo,
          DNI,
          lada,
          telefono,
          email,
          empadronamiento,
          comunidad_de_vecinos,
          direccion,
          codigo_postal,
          localidad,
          provincia,
          comunidad,
          nick,
          nivel,
          posicion,
          marca_pala,
          modelo_pala,
          juegos_semana,
          contrasena,
          foto,
          noticia
        ];

        /// Registrar al registrar al usuario
        final registrar = await provider.registrarUsuario(datosSQL);
        Get.back();
        if (registrar.code == 2000) {
          return MessageServerDialog(
            context: Get.context!,
            alertType: success,
            title: 'Registro Usuario',
            subtitle: 'Compruebe su correo para finalizar el registro.',
            onPressed: () {
              Get.offAllNamed(Routes.LOGIN_USUARIO, arguments: 0);
            },
          ).dialog();
        } else {
          return MessageServerDialog(
            context: Get.context!,
            alertType: warning,
            title: 'Registro Usuario',
            subtitle: registrar.message,
            onPressed: Get.back,
          ).dialog();
        }
      } catch (e) {
        return MessageServerDialog(
          context: Get.context!,
          alertType: error,
          title: 'Registro Usuario',
          subtitle:
              'Ocurrio un error interno, lo sentimos vuelvelo a intentar mas tarde.',
          onPressed: Get.back,
        ).dialog();
      }
    }
  }

  String? validateTextField(BuildContext context, String? text,
      AnimationController anim, FocusNode focusNode, String nameData) {
    if (text == null || text.isEmpty) {
      // FocusScope.of(context).requestFocus(focusNode);
      anim.forward();
      return '';
    }
    return null;
  }

  String? validateTextFieldContrasena(
      AnimationController anim, FocusNode focusNode) {
    if (tc.contrasena.text.isEmpty) {
      // if (!isFocusNode) {
      anim.forward();
      return '';
    }
    if (tc.contrasena.text.length < 6) {
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
      anim.forward();
      return '';
    }
    if (tc.contrasenaComprobar.text.length < 6) {
      anim.forward();
      return 'La contraseña debe tener minimo 6 dígitos.';
    }
    if (tc.contrasena.text != tc.contrasenaComprobar.text) {
      anim.forward();
      return 'La contraseña no coinciden.';
    }
    return null;
  }

  @override
  void dispose() {
    tc.unfocusNode.dispose();
    tc.nickFocusNode.dispose();
    tc.nick.dispose();
    tc.nombreFocusNode.dispose();
    tc.nombre.dispose();
    tc.apellidosFocusNode.dispose();
    tc.apellidos.dispose();
    tc.sexoFocusNode.dispose();
    tc.sexo.dispose();
    tc.dniFocusNode.dispose();
    tc.dni.dispose();
    tc.telefonoFocusNode.dispose();
    tc.telefono.dispose();
    tc.emailFocusNode.dispose();
    tc.email.dispose();
    tc.socioFocusNode.dispose();
    tc.empadronamiento.dispose();
    tc.contrasena.dispose();
    tc.contrasenaComprobar.dispose();
    super.dispose();
  }
}
