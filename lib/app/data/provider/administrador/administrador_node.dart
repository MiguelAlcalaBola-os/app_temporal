import 'package:get/get.dart';
import 'package:reservatu_pista/app/data/models/respuesta_api_model.dart';
import 'package:reservatu_pista/app/data/provider/datos_server.dart';

RespuestaApiModel respuestaApi(
    Response<dynamic> response, String messageError) {
  if (response.statusCode == 200) {
    return RespuestaApiModel.fromJson(response.body);
  } else {
    return RespuestaApiModel(message: messageError, code: 5000);
  }
}

class BonoProvider extends GetConnect {
  final url = '${DatosServer.urlServer}/administradir';
  final urlPruebas = DatosServer.urlPruebas;
  final urlMail = DatosServer.urlMail;
  final urlWeb = DatosServer.urlWeb;

  // Obteneemos los usuarios de la base de datos
  Future<int?> getUsuarios(
    int limit,
    int offset,
  ) async {
    final response = await get<RespuestaApiModel?>('$url/usuarios',
        query: {'limit': '$limit', 'offset': '$offset'}, decoder: (data) {
      if (data is Map<String, dynamic>) {
        final result = RespuestaApiModel.fromJson(data);
        if (result.datos != null) {
          return result.datos;
        }
      }
      return null;
    }, contentType: 'application/json');
    // return response.body;
  }
}
