import 'package:get/get.dart';
import 'package:reservatu_pista/app/data/models/execute_model.dart';
import 'package:reservatu_pista/app/data/models/mis_reservas_usuario_model.dart';
import 'package:reservatu_pista/app/data/provider/datos_server.dart';
import 'package:reservatu_pista/app/data/services/db_s.dart';

class ExecuteProvider extends GetConnect {
  DBService db = Get.find();
  final url = DatosServer.urlServer;

  Future<dynamic> misReservas(String deporte,
      {int page = 1,
      int itemsPerPage = 10,
      bool isHistorial = true,
      bool isReservasAbiertas = false}) async {
    try {
      final queryIsHistorial = isHistorial ? '1' : '0';
      final queryIsReservasAbiertas = isReservasAbiertas ? '1' : '0';
      final response = await get(
        '$url/reserva',
        query: {
          'id_usuario': db.idUsuario.toString(),
          'itemsPerPage': itemsPerPage.toString(),
          'page': page.toString(),
          'isHistorial': queryIsHistorial,
          'isReservasAbiertas': queryIsReservasAbiertas,
          'isCountReservas': '0'
        },
        contentType: 'application/json',
      );
      if (response.statusCode == 200) {
        final result = ExecuteModel<
                MisReservasUsuarioModel>.fromJsonMisReservasUsuarioModel(
            response.body);
        print('entra response.statusCode == 200');
        return result.datos;
      } else {
        print('entra nulllllllllllllll');
        return null;
      }
    } catch (error, stack) {
      print('Error al saber si el usuario existe: $error');
      print(stack);
      return null;
    }
  }

  Future<int> misReservasTotal(String deporte,
      {int page = 1,
      int itemsPerPage = 10,
      bool isHistorial = true,
      bool isReservasAbiertas = false}) async {
    try {
      final queryIsHistorial = isHistorial ? '1' : '0';
      final queryIsReservasAbiertas = isReservasAbiertas ? '1' : '0';
      final response = await get(
        '$url/reserva',
        query: {
          'id_usuario': db.idUsuario.toString(),
          'itemsPerPage': itemsPerPage.toString(),
          'page': page.toString(),
          'isHistorial': queryIsHistorial,
          'isReservasAbiertas': queryIsReservasAbiertas,
          'isCountReservas': '1'
        },
        contentType: 'application/json',
      );
      print('response.body total ${response.body}');
      if (response.statusCode == 200) {
        return response.body['total'] ?? 0;
      } else {
        print('entra nulllllllllllllll');
        return 0;
      }
    } catch (error, stack) {
      print('Error al saber si el usuario existe: $error');
      print(stack);
      return 0;
    }
  }

  Future<dynamic> obtenerTotalReservas({bool isHistorial = true}) async {
    try {
      final queryIsHistorial = isHistorial ? '1' : '0';
      print('obtenerTotalReservas');
      final response = await get(
        '$url/reserva/obtener_reservas_totales',
        query: {
          'id_usuario': db.idUsuario.toString(),
          'isHistorial': queryIsHistorial
        },
        contentType: 'application/json',
      );
      print('misReservasResponse2');
      print('misReservasResponse ${response.body['reservasTotales']}');
      if (response.statusCode == 200) {
        return response.body['reservasTotales'];
      } else {
        return null;
      }
    } catch (error, stack) {
      print('Error al saber si el usuario existe: $error');
      print(stack);
      return null;
    }
  }
}
