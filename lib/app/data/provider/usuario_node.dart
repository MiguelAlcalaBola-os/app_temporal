import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:reservatu_pista/app/data/models/message_error.dart';
import 'package:reservatu_pista/app/data/models/usuario_model.dart';
import 'package:reservatu_pista/backend/storage/storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'datos_server.dart';

class UsuarioProvider extends GetConnect {
  late String token;
  late int idUser;
  final url = DatosServer.urlServer;
  final urlMail = DatosServer.urlMail;
  final urlWeb = DatosServer.urlWeb;

  Future<void> initialize() async {
    final storage = await SharedPreferences.getInstance();
    token = storage.tokenUsuario.read();
    idUser = storage.idUsuario.read();
  }

  Future<MessageError> modificar(List datos, List<String> idsDatos) async {
    try {
      await initialize();
      final response = await put(
        '$url/usuario',
        {"id": idUser.toString(), "datos": datos, "ids_datos": idsDatos},
        headers: {
          "Authorization": "Bearer $token",
        },
        contentType: 'application/json',
      );
      if (response.statusCode == 200) {
        return MessageError.fromJson(response.body);
      } else {
        print(response.body);
        return MessageError.fromJson(response.body);
      }
    } catch (error, stack) {
      print(error);
      print(stack);
      return MessageError(message: 'Error al Modificar Usuario', code: 501);
    }
  }

//para obtener los modelos de las palas
  Future<Response<dynamic>> getModelosPalas(int id_marca) async {
    try {
      final response = await get(
        '$url/usuario/obtener_modelos_pala?id_marca=$id_marca',
        contentType: 'application/json',
      );
      if (response.statusCode == 200) {
        return response;
      } else {
        throw MessageError(
            code: response.body.code,
            message: 'Ocurrio un error al getModelosPalas');
      }
    } catch (error, stack) {
      print(error);
      print(stack);
      throw MessageError(message: 'Error al getModelosPalas', code: 501);
    }
  }

  //para obtener las marcas de las palas
  Future<Response<dynamic>> getMarcasPalas() async {
    try {
      final response = await get(
        '$url/usuario/obtener_marcas_palas',
        contentType: 'application/json',
      );
      if (response.statusCode == 200) {
        return response;
      } else {
        throw MessageError(
            code: response.body.code,
            message: 'Ocurrio un error al actualizar la contraseña');
      }
    } catch (error, stack) {
      print(error);
      print(stack);
      throw MessageError(
          message: 'Error al Modificar la Contraseña', code: 501);
    }
  }

  /// Modificar los datos del usuario
  Future<MessageError> modificarContrasena(
      int id, String tokenUser, List datos, List<String> idsDatos) async {
    try {
      final response = await put(
        '$url/usuario',
        {"id": id, "datos": datos, "ids_datos": idsDatos},
        headers: {
          "Authorization": "Bearer $tokenUser",
        },
        contentType: 'application/json',
      );
      if (response.statusCode == 200) {
        return MessageError.fromJson(response.body);
      } else {
        throw MessageError(
            code: response.body.code,
            message: 'Ocurrio un error al actualizar la contraseña');
      }
    } catch (error, stack) {
      print(error);
      print(stack);
      throw MessageError(
          message: 'Error al Modificar la Contraseña', code: 501);
    }
  }

  Future<String> existeUsuario(String email) async {
    try {
      final response = await get(
        '$url/usuario/existe_usuario',
        query: {'email': email},
      );
      if (response.statusCode == 200) {
        return response.body['nombre'];
      } else {
        return response.body['nombre'];
      }
    } catch (error, stack) {
      print(error);
      print(stack);
      return '';
    }
  }

  /// Modificar los datos del usuario
  Future<MessageError> modificarUsuario(
      List datos, List<String> idsDatos) async {
    try {
      await initialize();
      final response = await put(
        '$url/usuario',
        {"id": idUser.toString(), "datos": datos, "ids_datos": idsDatos},
        headers: {
          "Authorization": "Bearer $token",
        },
        contentType: 'application/json',
      );
      if (response.statusCode == 200) {
        return MessageError.fromJson(response.body);
      } else {
        print(response.body);
        return MessageError(
            code: response.body.code,
            message: 'Ocurrio un error al actualizar el Usuario');
      }
    } catch (error, stack) {
      print(error);
      print(stack);
      return MessageError(message: 'Error al Modificar Usuario', code: 501);
    }
  }

  // Validar el email del usuario
  Future<MessageError> validarEmail(String email) async {
    try {
      final response = await put('$url/usuario/validar_email', {
        "email": email,
      });
      if (response.statusCode == 200) {
        return MessageError.fromJson(response.body);
      } else {
        return MessageError.fromJson(response.body);
      }
    } catch (error, stack) {
      print(error);
      print(stack);
      return MessageError(message: 'Error al Validar el Email.', code: 501);
    }
  }

// Registrar usuario
  Future<MessageError> registrarUsuario(List usuario) async {
    try {
      final response = await post(
        '$url/usuario',
        {
          "datos": usuario,
        },
        contentType: 'application/json',
      );
      print('response.body ${response.body}');
      // Enviar la solicitud
      if (response.statusCode == 200) {
        return MessageError.fromJson(response.body);
      } else {
        return MessageError.fromJson(response.body);
      }
    } catch (error) {
      return MessageError(
          message: 'Ocurrio un error al registrar usuario', code: 501);
    }
  }

  Future<bool> getUsuarioExisteNick(String nick) async {
    try {
      final response =
          await get('$url/usuario/existe_nick', headers: {'nick': nick});
      if (response.statusCode == 200) {
        return response.body == false;
      } else {
        return false;
      }
    } catch (error, stack) {
      print('Error al saber si el usuario existe: $error');
      print(stack);
      return false;
    }
  }

/* Verificamos si el valor existe */
  Future<bool> getUsuarioExiste(String value, String type) async {
    try {
      final response = await get('$url/usuario/existe_value',
          headers: {'value': value, 'type': type});
      if (response.statusCode == 200) {
        return response.body == false;
      } else {
        return false;
      }
    } catch (error, stack) {
      print('Error al saber si el usuario existe: $error');
      print(stack);
      return false;
    }
  }

  // Get Verificar si existe el email
  Future<Response> getUsuarioExisteEmail(String email) =>
      get('$url/usuario/existe_email', headers: {'emai': email});

  // Post request
  Future<dynamic> iniciarSesion(List datos) async {
    try {
      final response = await post(
        '$url/usuario/iniciar_sesion',
        {
          "datos": datos,
        },
        contentType: 'application/json',
      );
      if (response.statusCode == 200) {
        print(response.body);
        return UsuarioModel.fromJson(response.body);
      } else {
        print(response.body);
        return MessageError.fromJson(response.body);
      }
    } catch (error, stack) {
      print(error);
      print(stack);
      return MessageError(message: 'Error al Iniciar Sesion', code: 501);
    }
  }

  // Get request
  Future<Response> deleteUser(String id, String token, String user) =>
      delete('$url/$user',
          headers: {"Authorization": "Bearer $token", 'id$user': id});

  Future<UsuarioModel?> getUsuarioDatos(List<String> listTypes) async {
    try {
      await initialize();
      print({
        "Authorization": "Bearer $token",
        "idusuario": idUser.toString(),
        "datos": '${listTypes.join(', ')}'
      });
      // Crear una solicitud multipart
      final response = await get('$url/usuario/datos', headers: {
        "Authorization": "Bearer $token",
        "idusuario": idUser.toString(),
        "datos": listTypes.join(', ')
      });
      print(response.body);
      if (response.statusCode == 200) {
        return UsuarioModel.fromJson(response.body);
      } else {
        final messageError = MessageError.fromJson(response.body);
        // Manejar el caso en el que la carga no fue exitosa
        print(
            'Error al obtener datos del usuario. Código: ${messageError.code}');
      }
    } catch (error, stack) {
      print(stack);
      print('Error al usuario getUsuarioDatos: $error');
    }
    return null;
  }

// Obtener los datos del usuario
  Future<UsuarioModel?> getUsuario(int id, List<String> listTypes) async {
    try {
      await initialize();
      final response = await get('$url/usuario/datos', headers: {
        "Authorization": "Bearer $token",
        "idusuario": idUser.toString(),
        "datos": listTypes.join(', ')
      });
      if (response.statusCode == 200) {
        return UsuarioModel.fromJson(response.body);
      } else {
        final messageError = MessageError(
            code: response.body.code,
            message: 'Ocurrio un error al actualizar el Usuario');
        print(messageError.message);
        // Manejar el caso en el que la carga no fue exitosa
        print(
            'Error al obtener datos del ---ausuario. Código: ${messageError.code}');
      }
    } catch (error, stack) {
      print(stack);
      print('Error al usuario getUsuario: $error');
    }
    return null;
  }
}

class UsuarioNode {
  final provider = UsuarioProvider();

  Future<bool> getUsuarioExisteEmail(String email) async {
    try {
      final response = await provider.getUsuarioExisteEmail(email);
      if (response.statusCode == 200) {
        return response.body == false;
      } else {
        return false;
      }
    } catch (error, stack) {
      print('Error al saber si el usuario existeee: $error');
      print(stack);
      return false;
    }
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

  String getImageNode(String fotoName) {
    return '${DatosServer.urlServer}/images_usuario/$fotoName.png';
  }

  Future<UsuarioModel?> getUsuarioNode(String id) async {
    try {
      final url = Uri.parse('${DatosServer.urlServer}/usuario');
      // Crear una solicitud multipart
      var request = http.get(url);

      // Enviar la solicitud
      var response = await request;
      if (response.statusCode == 200) {
        print(response.body == '{}');
        print('get datos usuario correctamente');
        return UsuarioModel.fromRawJson(response.body);
      } else {
        // Manejar el caso en el que la carga no fue exitosa
        print(
            'Error al usuario hgvh. Código de estado: ${response.statusCode}');
      }
    } catch (error, stack) {
      print(stack);
      print('Error al usuario getUsuarioNode: $error');
    }
    return null;
  }
}
