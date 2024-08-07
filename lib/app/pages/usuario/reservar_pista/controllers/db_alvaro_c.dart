// ignore_for_file: avoid_print
import 'dart:convert';
import 'dart:math';
import 'package:get/get.dart';
import 'package:reservatu_pista/app/data/models/proveedor_model.dart';
import 'package:reservatu_pista/app/data/models/usuario_model.dart';
import 'package:reservatu_pista/app/data/provider/datos_server.dart';
import 'package:reservatu_pista/app/data/provider/proveedor_node.dart';
import 'package:reservatu_pista/app/data/provider/usuario_node.dart';
import 'package:reservatu_pista/app/pages/usuario/reservar_pista/reservar_pista_c.dart';
import 'package:reservatu_pista/backend/storage/storage.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_util.dart';
import 'package:reservatu_pista/utils/dialog/message_server_dialog.dart';
import 'package:reservatu_pista/utils/state_getx/state_mixin_demo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class DBAlvaroController extends GetxController {
  /// Versi el tpv es de pruebas?
  final testing = DatosServer.testing;
  // Iniciarlizar la db
  late SharedPreferences storage;
  String version = '2.1.6';
  Rx<String> imageServer = ''.obs;
  UsuarioModel? datosUsuario;
  ProveedorModel? datosProveedor;
  RxDouble money = 0.0.obs;
  final _dineroTotal = 0.obs;
  get dineroTotal => _dineroTotal.value;
  set dineroTotal(value) => _dineroTotal.value = value;

  final _dineroTotalEuros = '0'.obs;
  get dineroTotalEuros => _dineroTotalEuros.value;
  set dineroTotalEuros(value) => _dineroTotalEuros.value = value;

  StateRx<UsuarioModel?> datosPerfilUsuario = StateRx(Rx<UsuarioModel?>(null));
  // StateRx<UsuarioModel?> datosPerfilUsuario = StateRx(Rx<UsuarioModel?>(null));

  //alvaro
  final _idUsuario = 0.0.obs;
  get idUsuario => _idUsuario.value;
  set idUsuario(value) => _idUsuario.value = value;
  //void setIdUsuario(int value) => _idUsuario.value = value;
  @override
  void onInit() async {
    super.onInit();
    try {
      storage = await SharedPreferences.getInstance();
    } catch (e) {
      print(e);
    }
    print("sd");
  }

  Future<void> getImageUsuario(String? changeImage) async {
    try {
      if (changeImage != null) {
        imageServer.value = UsuarioNode().getImageNode(changeImage);
      } else {
        if (imageServer.value == '') {
          final storage = await SharedPreferences.getInstance();
          final String imageUsuario = storage.fotoUsuario.read();
          imageServer.value = UsuarioNode().getImageNode(imageUsuario);
          print('imageuUSaurio: $imageUsuario');
        }
      }
    } catch (e) {}
  }

  Future<bool> getDatosUsuario() async {
    try {
      final result = await UsuarioNode().getUsuarioNode('1');
      if (result is UsuarioModel) {
        imageServer.value = UsuarioNode().getImageNode(result.foto);
        datosUsuario = result;
        return true;
      }
    } catch (e) {
      print(e);
    }
    return false;
  }

  Future<bool> getDatosUsuarioId() async {
    try {
      final storage = await SharedPreferences.getInstance();
      final List<String> listTypes = [apellidos, nombre, nick, nivel, foto];

      final result = await UsuarioProvider()
          .getUsuario(storage.idUsuario.read(), listTypes);
      if (result is UsuarioModel) {
        imageServer.value = UsuarioNode().getImageNode(result.foto);
        datosPerfilUsuario.change(result, RxStatusDemo.success());
        datosUsuario = result;
        return true;
      }
    } catch (e) {
      print(e);
    }
    return false;
  }

  Future<void> getMoney() async {
    try {
      final storage = await SharedPreferences.getInstance();
      final List<String> listTypes = [
        dinero_total,
      ];

      final result = await UsuarioProvider()
          .getUsuario(storage.idUsuario.read(), listTypes);

      if (result is UsuarioModel) {
        dineroTotal = result.dineroTotal;
        dineroTotalEuros = ((dineroTotal) / 100).toStringAsFixed(2);
        print('dineroTotalEuros $dineroTotalEuros');
        print('eeeeeeeeeeeeeeeeeeeeeeeeeeeee');
      }
    } catch (e, stack) {
      print('e  $e');
    }
  }

  void getUserId() async {
    final getStorage = await SharedPreferences.getInstance();

    idUsuario = Storage(TypeStorage.idUsuario, getStorage).read();
  }

  void setDatosUsuario(UsuarioModel result) {
    imageServer.value = UsuarioNode().getImageNode(result.foto);
    datosUsuario = result;
  }

  void setDatosProveedor(ProveedorModel result) {
    imageServer.value = ProveedorNode().getImageNode(result.foto);
    datosProveedor = result;
  }

  Future<bool> getDatosProveedor() async {
    try {
      final result = await ProveedorNode().getProveedorNode('1');
      if (result is ProveedorModel) {
        imageServer.value = ProveedorNode().getImageNode(result.foto);
        datosProveedor = result;

        return true;
      }
    } catch (e) {
      print(e);
    }
    return false;
  }

  Future<http.Response> guardarUsuarioOperacion(
      String numOperacion,
      int cantidad,
      DateTime fecha,
      String horaInicio,
      String horaFin,
      int idUsuario,
      int idPista,
      {bool reservaConTarjeta = false}) async {
    http.Response response;

    print('id_usuario.toString() ${idUsuario.toString()}');
    print('num_operacion ${numOperacion}');
    print('cantidad ${cantidad}');
    print('fecha ${fecha}');
    print('hora_inicio ${horaInicio}');
    print('hora_fin ${horaFin}');
    print('id_pista ${idPista}');
    print('reservaConTarjeta ${reservaConTarjeta}');
    if (reservaConTarjeta) {
      response = await http.post(
          Uri.parse('${DatosServer.urlServer}/usuario/guardar_operacion'),
          headers: <String, String>{
            'Content-Type': 'application/json',
          },
          body: jsonEncode(<String, String>{
            'id_usuario': idUsuario.toString(),
            'num_operacion': numOperacion,
            'cantidad': cantidad.toString(),
            'fecha': fecha.toString(),
            'hora_inicio': horaInicio,
            'hora_fin': horaFin,
            'reserva_con_tarjeta': 'true',
            'id_pista': idPista.toString()
            //estado es null al principio
          }));
    } else {
      response = await http.post(
          Uri.parse('${DatosServer.urlServer}/usuario/guardar_operacion'),
          headers: <String, String>{
            'Content-Type': 'application/json',
          },
          body: jsonEncode(<String, String>{
            'id_usuario': idUsuario.toString(),
            'num_operacion': numOperacion,
            'cantidad': cantidad.toString(),
            'fecha': fecha.toString(),
            'hora_inicio': horaInicio,
            'hora_fin': horaFin,
            'reserva_con_tarjeta': 'false',
            'id_pista': idPista.toString()
            //estado es null al principio
          }));
    }
    return response;
  }

  void setHoraFin(horaInicio) {}

  Future<void> recargarMonedero(
      int dinero, ReservarPistaController reservarPistaController) async {
    try {
      String numOperacion = generarNumeroOperacionUnico();

      await guardarUsuarioOperacion(
        numOperacion,
        dinero,
        reservarPistaController.fecha_seleccionada.value,
        reservarPistaController.hora_inicio_reserva_seleccionada,
        reservarPistaController.hora_fin_reserva_seleccionada,
        storage.idUsuario.read(),
        reservarPistaController.id_pista_seleccionada.value,
      );
      DatosServer.openTpv(dinero, numOperacion, '');
      // Get.back();
      // Get.back();
    } catch (e, stack) {
      print("recargarMOndedor");
      print(e);
      print(stack);
      rethrow;
    }
  }

  Future<Map> comprobarExistenciaReservas(idPista, fecha, horaInicio) async {
    try {
      var url =
          '${DatosServer.urlServer}/usuario/comprobar_existencia_reservas?id_pista=$idPista&fecha=$fecha&hora_inicio=$horaInicio';
      var jsonData = await http.get(Uri.parse(url));
      var response = json.decode(jsonData.body.toString());
      return response;
    } catch (error) {
      print('eeeeeeeeerrrror: $error');
      return {};
    }
  }

  //es igual que recargarMonedero
  Future<void> reservarPistaConTarjeta(
      int dinero,
      ReservarPistaController reservarPistaController,
      // String nivel,
      void Function() onPressed) async {
    try {
      var numOperacion = '';
      var response = await comprobarExistenciaReservas(
          reservarPistaController.id_pista_seleccionada.value,
          reservarPistaController.fecha_seleccionada.value,
          reservarPistaController.hora_inicio_reserva_seleccionada);
      if (response['existeReserva'] && response['esReservaEnProceso']) {
        onPressed();
      } else {
        if (reservarPistaController.plazasLibres ==
            reservarPistaController.capacidad_pista) {
          numOperacion = generarNumeroOperacionUnico(esReservaConTarjeta: true);
        } else {
          numOperacion = generarNumeroOperacionUnico(
              esReservaConTarjeta: true, pisarReserva: true);
        }
        guardarUsuarioOperacion(
            numOperacion,
            dinero,
            reservarPistaController.fecha_seleccionada.value,
            reservarPistaController.hora_inicio_reserva_seleccionada,
            reservarPistaController.hora_fin_reserva_seleccionada,
            storage.idUsuario.read(),
            reservarPistaController.id_pista_seleccionada.value,
            reservaConTarjeta: true);

        DatosServer.openTpv(dinero, numOperacion, '');
        // Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }

  //es igual que recargarMonedero
  Future<void> reservarPistaCompartida(
      {required int dinero,
      required int id_pista_seleccionada,
      required DateTime fecha_seleccionada,
      required String hora_inicio_reserva_seleccionada,
      required String hora_fin_reserva_seleccionada,
      required int capacidad_pista,
      required int plazasLibres}) async {
    try {
      var numOperacion = '';
      var response = await comprobarExistenciaReservas(id_pista_seleccionada,
          fecha_seleccionada, hora_inicio_reserva_seleccionada);
      if (response['existeReserva'] && response['esReservaEnProceso']) {
        MessageServerDialog(
          isProveedor: false,
          context: Get.context!,
          alertType: warning,
          title: 'Reserva Compartida',
          subtitle:
              'Alguien está en proceso de reservar esta pista.\nIntente reservar en 10 minutos.',
        ).dialog();
      } else {
        if (plazasLibres == capacidad_pista) {
          numOperacion = generarNumeroOperacionUnico(esReservaConTarjeta: true);
        } else {
          numOperacion = generarNumeroOperacionUnico(
              esReservaConTarjeta: true, pisarReserva: true);
        }
        guardarUsuarioOperacion(
            numOperacion,
            dinero,
            fecha_seleccionada,
            hora_inicio_reserva_seleccionada,
            hora_fin_reserva_seleccionada,
            storage.idUsuario.read(),
            id_pista_seleccionada,
            reservaConTarjeta: true);

        DatosServer.openTpv(dinero, numOperacion, '');
        // Get.back();
        // Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }

  String generarNumeroOperacionUnico(
      {bool esReservaConTarjeta = false, bool pisarReserva = false}) {
    DateTime now = DateTime.now();
    Random random = Random();
    int aleatorio = random.nextInt(999999);

    String formattedString =
        '${now.year}${_padNumber(now.month)}${_padNumber(now.day)}_${_padNumber(now.hour)}${_padNumber(now.minute)}${_padNumber(now.second)}_$aleatorio';
    if (esReservaConTarjeta) formattedString += '_reservaConTarjeta';
    if (pisarReserva) formattedString += '_pisarReserva';
    return formattedString;
  }

  String _padNumber(int number) {
    return number.toString().padLeft(2, '0');
  }

  //alvaro
  Future<bool> subtractUserMoney(int idUsuario, int money) async {
    try {
      var url = '${DatosServer.urlServer}/usuario/restar_dinero';
      await http.post(Uri.parse(url),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({'id_usuario': idUsuario, 'cantidad': money * 100}));
      return true;
    } catch (error) {
      print('errorrrrr: $error');
      return false;
    }
  }

  Future<String?> reservarPista(
      int idUsuario,
      int money,
      DateTime fecha,
      String horaInicio,
      String idPista,
      int plazasAReservar,
      int nivelPartida) async {
    final obtenerNivel =
        nivelPartida == 0 ? '0.25' : (nivelPartida == 1 ? '0.50' : '');
    try {
      var url = '${DatosServer.urlServer}/usuario/reservar_pista';
      var response = await http.post(Uri.parse(url),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            'id_pista': idPista,
            'id_usuario': idUsuario,
            'cantidad': money * 100,
            'fecha': fecha.toString(),
            'hora_inicio': horaInicio,
            'plazas_a_reservar': plazasAReservar,
            'nivel': obtenerNivel,
          }));
      if (response.statusCode == 200) {
        return response.body;
      }
      return null;
    } catch (error) {
      print('error reservarPista $error');
      return null;
    }
  }

  Future<http.Response> obtenerPlazasPista(
      int idUsuario, DateTime fecha, String horaInicio, int idPista) async {
    try {
      var url = '${DatosServer.urlServer}/usuario/obtener_plazas_libres';
      http.Response response = await http.post(Uri.parse(url),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            'id_pista': idPista,
            'id_usuario': idUsuario,
            'fecha': fecha.toString(),
            'hora_inicio': horaInicio,
          }));
      return response;
    } catch (error) {
      print('eeeeeeeeerrror: $error');
      rethrow;
    }
  }

  Future<String> obtenerLocalidades() async {
    try {
      var url = '${DatosServer.urlServer}/usuario/obtener_localidades';
      var response = await http.get(Uri.parse(url));
      return response.body.toString();
    } catch (error) {
      print('eeeeeeeeerrrrooor: $error');
      rethrow;
    }
  }

  Future<String> obtenerClubes(String codPostal) async {
    try {
      var url =
          '${DatosServer.urlServer}/usuario/obtener_clubes?cod_postal=$codPostal';
      var response = await http.get(Uri.parse(url));
      return response.body.toString();
    } catch (error) {
      print('eeeeeeeeerrrrrrrror: $error');
      rethrow;
    }
  }

  Future<String> obtenerDeportes(String idClub) async {
    try {
      var url =
          '${DatosServer.urlServer}/usuario/obtener_deportes?id_club=$idClub';
      var response = await http.get(Uri.parse(url));
      return response.body.toString();
    } catch (error) {
      print('eeeeeeeeerrrrrrrrrrrrrrrrror: $error');
      rethrow;
    }
  }

  Future<String> obtenerPistas(String idClub, String deporte) async {
    try {
      var url =
          '${DatosServer.urlServer}/usuario/obtener_pistas?id_club=$idClub&deporte=$deporte';
      var response = await http.get(Uri.parse(url));
      return response.body.toString();
    } catch (error) {
      print('eeeeerror: $error');
      rethrow;
    }
  }

  Future<String> obtenerDatosPista(String idPista) async {
    try {
      var url =
          '${DatosServer.urlServer}/usuario/obtener_datos_pista?id_pista=$idPista';
      var response = await http.get(Uri.parse(url));
      return response.body.toString();
    } catch (error) {
      print('eeeeerrorrrrr: $error');
      rethrow;
    }
  }

  Future<String> obtenerHorariosPistas(int idPista, DateTime fecha) async {
    try {
      var url =
          '${DatosServer.urlServer}/usuario/obtener_horarios_pistas/$idPista/?dia_semana=${fecha.diaSemana}&fecha=${fecha}';
      var response = await http.get(Uri.parse(url));
      return response.body.toString();
    } catch (error, stack) {
      print('stackkkkkkkkkkkkkk $stack');
      print('errorrrrrrrrrrrrr $error');
      rethrow;
    }
  }

  Future<dynamic> obtenerHistorialReservas(int idUsuario) async {
    try {
      var url = '${DatosServer.urlServer}/usuario/obtener_historial_reservas';
      var result = await http.post(Uri.parse(url),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({'id_usuario': idUsuario}));
      return json.decode(result.body);
    } catch (error) {
      print('errorrrrr: $error');
      return null;
    }
  }

  Future<dynamic> obtenerHistorialRecargas(int idUsuario) async {
    try {
      var url = '${DatosServer.urlServer}/usuario/obtener_historial_recargas';
      var result = await http.post(Uri.parse(url),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({'id_usuario': idUsuario}));
      return json.decode(result.body);
    } catch (error) {
      print('errorrrrr: $error');
      return null;
    }
  }

  Future<dynamic> obtenerHistorialBonos(int idUsuario) async {
    try {
      var url = '${DatosServer.urlServer}/usuario/obtener_historial_bonos';
      var result = await http.post(Uri.parse(url),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({'id_usuario': idUsuario}));
      return json.decode(result.body);
    } catch (error) {
      print('errorrrrr: $error');
      return null;
    }
  }

  Future<dynamic> obtenerHistorialTodo(int idUsuario) async {
    try {
      var url = '${DatosServer.urlServer}/usuario/obtener_historial_todo';
      var result = await http.post(Uri.parse(url),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({'id_usuario': idUsuario}));
      return json.decode(result.body);
    } catch (error) {
      print('errorrrrr: $error');
      return null;
    }
  }
}

extension DateTimeExt on DateTime {
  String get diaSemana => ['L', 'M', 'X', 'J', 'V', 'S', 'D'][weekday - 1];
}
