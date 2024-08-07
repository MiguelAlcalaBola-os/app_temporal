import 'dart:convert';
import 'package:get/get.dart';
import 'package:get/get_connect/connect.dart';
import 'package:http/http.dart' as http;
import 'package:reservatu_pista/app/data/models/execute_model.dart';
import 'package:reservatu_pista/app/data/models/message_error.dart';
import 'package:reservatu_pista/app/data/models/mis_pistas_model.dart';
import 'package:reservatu_pista/app/data/models/mis_reservas_usuario_model.dart';
import 'package:reservatu_pista/app/data/models/usuario_model.dart';
import 'package:reservatu_pista/backend/storage/storage.dart';
import 'package:reservatu_pista/utils/logs_developer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'datos_server.dart';

class PistaProvider extends GetConnect {
  late String token;
  late int idClub;
  bool isInitialize = false;
  final url = '${DatosServer.urlServer}/pista';

  Future<void> initialize() async {
    final storage = await SharedPreferences.getInstance();
    print(storage.idClub.read());
    idClub = storage.idClub.read();
    if (!isInitialize) {
      print(":fsdjndos");
      token = storage.tokenProveedor.read();
      idClub = storage.idClub.read();
      isInitialize = true;
    }
  }

  Future<dynamic> reservasProveedor(
      int idPista, String fecha, String deporte) async {
    try {
      await initialize();
      final response = await get(
        '$url/reservas/proveedor',
        query: {"id_pista": '$idPista', "fecha": fecha, "deporte": deporte},
        headers: {
          "Authorization": "Bearer $token",
        },
        contentType: 'application/json',
      );
      log('reservas22 ${response.body}');
      if (response.statusCode == 200) {
        return ExecuteModel<
                MisReservasUsuarioModel>.fromJsonMisReservasUsuarioModel(
            {'datos': response.body, 'success': true}).datos;
      } else {
        log(response.body);
        throw MessageError.fromJson(response.body);
      }
    } catch (error, stack) {
      log(error);
      log(stack);
      throw MessageError(
          message: 'Error al Modificar la Contraseña', code: 501);
    }
  }

  Future<MessageError> editarPista(
      int idPista, Map<String, dynamic> body) async {
    try {
      await initialize();
      final response = await put(
        '$url/$idPista',
        body,
        headers: {"Authorization": "Bearer $token"},
        contentType: 'application/json',
      );
      log('editarPista: ${response.body}');
      if (response.statusCode == 200) {
        return MessageError.fromJson(response.body);
      } else {
        return MessageError.fromJson(response.body);
      }
    } catch (error, stack) {
      log('Error editarPista: $error');
      log(stack);
      return MessageError(message: 'Error al Editar la Pista', code: 501);
    }
  }

  Future<MessageError> eliminarPista(int idPista) async {
    try {
      await initialize();
      final response = await delete(
        '$url/$idPista',
        headers: {"Authorization": "Bearer $token"},
      );
      log('eliminarPista: ${response.body}');
      if (response.statusCode == 200) {
        return MessageError.fromJson(response.body);
      } else {
        return MessageError.fromJson(response.body);
      }
    } catch (error, stack) {
      log('Error eliminarPisr: $error');
      log(stack);
      return MessageError(message: 'Error al eliminar la Pista', code: 501);
    }
  }

  // Get request
  Future<Response> getCountPistas(String deporte) =>
      get('$url/$idClub/total_pistas/?deporte=$deporte',
          headers: {"Authorization": "Bearer $token"});

  // Get Verificar si existe el nick
  Future<Response> crearPista(Map<String, dynamic> body) => post(
        '$url/$idClub',
        body,
        headers: {"Authorization": "Bearer $token"},
        contentType: 'application/json',
      );

  // Get Verificar si existe el email
  Future<Response> getUsuarioExisteEmail(String email) =>
      get('$url/usuario/existe_email', headers: {'emai': email});

  // Post request
  Future<Response> iniciarSesionUser(List datos) => post(
        '$url/usuario/iniciar_sesion',
        {
          "datos": datos,
        },
        contentType: 'application/json',
      );
  // Put Modificar datos
  Future<Response> modificarUser(int id, List datos, List<String> idsDatos) =>
      put(
        '$url/usuario',
        {"id": 1.toString(), "datos": datos, "ids_datos": idsDatos},
        headers: {
          "Authorization": "Bearer $token",
        },
        contentType: 'application/json',
      );
  // Get request
  Future<Response> deleteUser(String id, String token, String user) =>
      delete('$url/$user',
          headers: {"Authorization": "Bearer $token", 'id$user': id});

  // Get Mis Pistas
  Future<dynamic> getMisPista({
    required String deporte,
    String? diaSemana,
    String? fecha,
  }) async {
    /// Seleccionar una opcion en caso de que sean null
    Future<Response> selectOption() {
      if (diaSemana == null || fecha == null) {
        return get('$url/$idClub/?deporte=$deporte',
            headers: {"Authorization": "Bearer $token"});
      }
      return get(
          '$url/$idClub/?deporte=$deporte&dia_semana=$diaSemana&fecha=$fecha',
          headers: {"Authorization": "Bearer $token"});
    }

    try {
      await initialize();
      final response = await selectOption();
      if (response.statusCode == 200) {
        return MisPistas.fromList(response.body);
      } else {
        return MessageError.fromJson(response.body);
      }
    } catch (error, stack) {
      log(stack);
      log('Error al usuario kjj: $error');
      return MessageError(message: 'Error al obtener mis pistas', code: 501);
    }
  }

  // Obtener los datos de una  pista mediante id_pista
  Future<dynamic> getPista({
    required int idPista,
  }) async {
    await initialize();
    log("Entro en get mi pista id_pista ");

    try {
      await initialize();
      final response = await get('$url/pista/$idPista',
          headers: {"Authorization": "Bearer $token"});
      log('get Pista> ${jsonEncode(response.body)}');
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return MessageError.fromJson(response.body);
      }
    } catch (error, stack) {
      log(stack);
      log('Error al usuario kjj: $error');
      return MessageError(message: 'Error al obtener mis pistas', code: 501);
    }
  }

  // Obtener los datos de una  pista mediante id_pista
  Future<dynamic> getTarifas({
    required String idPista,
  }) async {
    await initialize();
    log("Entro en get mi tarifa ");

    try {
      await initialize();
      final response = await get('$url/tarifa/$idPista',
          headers: {"Authorization": "Bearer $token"});
      // log(response.body);
      final json = jsonEncode(response.body[0]);
      // log('getTarifas> $json');
      if (response.statusCode == 200) {
        return response.body as List<dynamic>;
      } else {
        return MessageError.fromJson(response.body);
      }
    } catch (error, stack) {
      log(stack);
      log('Error al obtener tarifa: $error');
      return MessageError(message: 'Error al obtener mis pistas', code: 501);
    }
  }

  /// Obtener el total de pistas
  Future<dynamic> getMisDeportes() async {
    log("  ============Entro en get mis deportes");
    try {
      await initialize();
      print('$url/$idClub/deportes');
      final response = await get('$url/$idClub/deportes',
          headers: {"Authorization": "Bearer $token"});
      print(response.body);
      if (response.statusCode == 200) {
        return List<String>.from(response.body);
      } else {
        return MessageError.fromJson(response.body);
      }
    } catch (error, stack) {
      print('stack $stack');
      print('Error al usuario kjj: $error');
      return MessageError(message: 'Error al obtener mis pistas', code: 501);
    }
  }

  /// Obtener la lista de deportes
  Future<List<String>> listaDeportesProveedor() async {
    log("  ============Entro en lista deportes mis deportes");
    try {
      await initialize();
      final response = await get('$url/$idClub/deportes',
          headers: {"Authorization": "Bearer $token"});
      if (response.statusCode == 200) {
        return List<String>.from(response.body);
      }
      throw '';
    } catch (e) {
      return [];
    }
  }
}

class PistaNode {
  final provider = PistaProvider();

  Future<MessageError> crearPista(Map<String, dynamic> body) async {
    try {
      await provider.initialize();
      final response = await provider.crearPista(body);
      log(response.body);
      if (response.statusCode == 200) {
        return MessageError.fromJson(response.body);
      } else {
        return MessageError.fromJson(response.body);
      }
    } catch (error, stack) {
      log('Error al saber si el usuario existe: $error');
      log(stack);
      return MessageError(message: 'Error al Agregar la Pista', code: 501);
    }
  }

  Future<bool> getUsuarioExisteEmail(String email) async {
    try {
      final response = await provider.getUsuarioExisteEmail(email);
      if (response.statusCode == 200) {
        return response.body == false;
      } else {
        return false;
      }
    } catch (error, stack) {
      log('Error al saber si el usuario existe: $error');
      log(stack);
      return false;
    }
  }

  /// Obtener el total de pistas
  Future<int?> getCountPistas(String deporte) async {
    try {
      await provider.initialize();
      final response = await provider.getCountPistas(deporte);
      log(response.body);
      if (response.statusCode == 200) {
        return response.body['total'];
      }
    } catch (error, stack) {
      log(stack);
      log('Error al usuario kjj: $error');
    }
    return null;
  }

  Future<dynamic> delete(String id, String token, String user) async {
    try {
      final response = await provider.deleteUser(id, token, user);
      if (response.statusCode == 200) {
        return MessageError.fromJson(response.body);
      } else {
        return MessageError.fromJson(response.body);
      }
    } catch (error) {
      return MessageError(message: 'Error al Eliminar la Cuenta', code: 501);
    }
  }

  Future<dynamic> iniciarSesion(List datos) async {
    try {
      final response = await provider.iniciarSesionUser(datos);
      if (response.statusCode == 200) {
        return UsuarioModel.fromJson(response.body);
      } else {
        return MessageError.fromJson(response.body);
      }
    } catch (error, stack) {
      log(error);
      log(stack);
      return MessageError(message: 'Error al Iniciar Sesion', code: 501);
    }
  }

  String getImageNode(String fotoName) {
    return '${DatosServer.urlServer}/images_usuario/$fotoName.png';
  }

  Future<void> anadirUsuarioNode(List usuario) async {
    try {
      final url = Uri.parse('${DatosServer.urlServer}/usuario');
      // Crear una solicitud multipart
      log(usuario.toString());
      var request = http.post(url,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "usuario": usuario,
          }));

      // Enviar la solicitud
      var response = await request;
      if (response.statusCode == 200) {
        log('usuario anadida correctamente');
      } else {
        // Manejar el caso en el que la carga no fue exitosa
        log('Error al usuario anadida. Código de estado: ${response.statusCode}');
      }
    } catch (error) {
      log('Error al usuario anadida: $error');
    }
  }

  Future<MessageError> modificarUsuarioNode(
      int id, List usuario, List<String> datosModificados) async {
    try {
      await provider.initialize();
      final response =
          await provider.modificarUser(id, usuario, datosModificados);
      if (response.statusCode == 200) {
        return MessageError.fromJson(response.body);
      } else {
        log(response.body);
        return MessageError(
            code: response.body.code,
            message: 'Ocurrio un error al actualizar el Usuario');
      }
    } catch (error, stack) {
      log(error);
      log(stack);
      return MessageError(message: 'Error al Modificar Usuario', code: 501);
    }
  }

  Future<UsuarioModel?> getUsuarioNode(String id) async {
    try {
      final url = Uri.parse('${DatosServer.urlServer}/usuario');
      // Crear una solicitud multipart
      var request = http.get(url);

      // Enviar la solicitud
      var response = await request;
      if (response.statusCode == 200) {
        log(response.body == '{}');
        log('get datos usuario correctamente');
        return UsuarioModel.fromRawJson(response.body);
      } else {
        // Manejar el caso en el que la carga no fue exitosa
        log('Error al usuario hgvh. Código de estado: ${response.statusCode}');
      }
    } catch (error, stack) {
      log(stack);
      log('Error al usuario kjj: $error');
    }
    return null;
  }
}
