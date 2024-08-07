import 'package:get/get.dart';
import 'package:reservatu_pista/app/data/models/message_error.dart';
import 'package:reservatu_pista/app/data/models/usuario_model.dart';
import 'datos_server.dart';

class EmailProvider extends GetConnect {
  final url = DatosServer.urlServer;
  final urlPruebas = DatosServer.urlPruebas;
  final urlMail = DatosServer.urlMail;
  final urlWeb = DatosServer.urlWeb;

  // Enviar Email usuario
  Future<bool> bienvenida(
      String email, String nombre, String apellidos, bool isProveedor) async {
    final tipoUsuario = isProveedor ? '1' : '0';
    try {
      final paramsEmail = {
        'nombre': nombre,
        'apellidos': apellidos,
        'receiver': email
      };
      final body = {
        'is_proveedor': isProveedor,
        'params_email': paramsEmail,
        'receiver': email,
        'subject':
            "Bienvenido ${tipoUsuario == '0' ? 'Usuari@' : 'Proveed@r'} a Reservatupista.com"
      };

      final response = await post(
          '$urlMail/reservatupista/registro_bienvenida', body,
          contentType: 'application/json');
      // Enviar la solicitud
      if (response.statusCode == 200) {
        return true;
      } else {
        // Manejar el caso en el que la carga no fue exitosa
        printInfo(
            info:
                'Error al usuario anadida. Código de estado: ${response.statusCode}');
        throw '';
      }
    } catch (error, st) {
      printInfo(info: 'Error al usuario anadida: $error');
      print(st);
      return false;
    }
  }

  // Enviar Email usuario
  Future<bool> enviarEmailRegistro(
      String email, String nombre, String apellidos, bool isProveedor) async {
    final tipoUsuario = isProveedor ? '1' : '0';
    try {
      final paramsEmail = {
        'nombre': nombre,
        'apellidos': apellidos,
        'url_link': '$urlWeb/validar_email?email=$email&user=$tipoUsuario'
      };
      final body = {
        'is_proveedor': isProveedor,
        'params_email': paramsEmail,
        'receiver': email,
        'subject':
            "Registro ${tipoUsuario == '0' ? 'Usuario' : 'Proveedor'} Reservatupista.com"
      };

      final response = await post(
          '$urlMail/reservatupista/email_registro', body,
          contentType: 'application/json');
      // Enviar la solicitud
      if (response.statusCode == 200) {
        return true;
      } else {
        // Manejar el caso en el que la carga no fue exitosa
        printInfo(
            info:
                'Error al usuario anadida. Código de estado: ${response.statusCode}');
        throw '';
      }
    } catch (error, st) {
      printInfo(info: 'Error al usuario anadida: $error');
      print(st);
      return false;
    }
  }

  // Validar el email del usuario
  Future<dynamic> enviarOlvideContrasena(
      String correo, bool esProveedor) async {
    try {
      final response = await post(
          '$url/email/otp',
          {
            'correo': correo,
            'esProveedor': esProveedor,
          },
          contentType: 'application/json');
      if (response.statusCode == 200) {
        return true;
        // return MessageError.fromJson(response.body);
      } else {
        throw MessageError(message: 'Error al Validar el Email.', code: 501);
        // throw MessageError.fromJson(response.body);
      }
    } catch (error, stack) {
      printInfo(info: error.toString());
      printInfo(info: stack.toString());
      throw MessageError(message: 'Error al Validar el Email.', code: 501);
    }
  }

  // Validar el otp
  Future<dynamic> validarOTP(
      String correo, String otp, bool isProveedor) async {
    try {
      final response = await post('$url/email/validar_otp',
          {'correo': correo, 'otp': otp, 'esProveedor': isProveedor},
          contentType: 'application/json');
      printError(info: response.body.toString());
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return MessageError.fromJson(response.body);
      }
    } catch (error, stack) {
      printInfo(info: error.toString());
      printInfo(info: stack.toString());
      return MessageError(message: 'Error al Validar el OTP.', code: 501);
    }
  }

  // Enviar email reservas
  Future<dynamic> emailReservas(
    String idPista,
    String correo,
    String numReferencia,
    String fecha,
    String fechaInicio,
    String fechaFin,
    String ubicacion,
    String deporte,
    String numPista,
    String metodoPago,
    String nombre,
    String numParticipantes,
  ) async {
    try {
      final response = await post(
          '$url/email/reserva_monedero',
          {
            'id_pista': idPista,
            'correo': correo,
            'nick': '',
            'club': '',
            'array_participantes': '',
            'tipo_pista': '',
            'fecha': fecha,
            'hora_inicio': fechaInicio,
            'hora_fin': fechaFin,
            'num_referencia': numReferencia,
            'ubicacion': ubicacion,
            'deporte': deporte,
            'num_pista': numPista,
            'metodo_pago': 'Monedero',
            'nombre': nombre,
            'num_participantes': numParticipantes,
            'luz': 'Si - no',
            'automatizada': 'si- no',
            'coste_total_reserva': numParticipantes,
            'pin': 'SECURITY_CODE',
            'patrocinador': numParticipantes,
          },
          contentType: 'application/json');
      printError(info: response.body.toString());
      if (response.statusCode == 200) {
        return response.body;
      } else {
        // return MessageError.fromJson(response.body);
      }
    } catch (error, stack) {
      printInfo(info: error.toString());
      printInfo(info: stack.toString());
      return MessageError(message: 'Error al Validar el OTP.', code: 501);
    }
  }

  // Validar el email del usuario
  Future<MessageError> validarEmail(String email, bool isProveedor) async {
    if (isProveedor) {}
    try {
      final response = await put(
          '$url/usuario/validar_email',
          {
            "email": email,
          },
          contentType: 'application/json');
      printError(info: response.body.toString());
      if (response.statusCode == 200) {
        return MessageError.fromJson(response.body);
      } else {
        return MessageError.fromJson(response.body);
      }
    } catch (error, stack) {
      printInfo(info: error.toString());
      printInfo(info: stack.toString());
      return MessageError(message: 'Error al Validar el Email.', code: 501);
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
      printInfo(info: 'Error al saber si el usuario existe: $error');
      printInfo(info: stack.toString());
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
        printInfo(info: response.body);
        return UsuarioModel.fromJson(response.body);
      } else {
        printInfo(info: response.body);
        return MessageError.fromJson(response.body);
      }
    } catch (error, stack) {
      printInfo(info: error.toString());
      printInfo(info: stack.toString());
      return MessageError(message: 'Error al Iniciar Sesion', code: 501);
    }
  }
}
