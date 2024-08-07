import 'package:get/get.dart';
import 'package:reservatu_pista/app/data/models/respuesta_api_model.dart';
import 'datos_server.dart';

RespuestaApiModel respuestaApi(
    Response<dynamic> response, String messageError) {
  if (response.statusCode == 200) {
    return RespuestaApiModel.fromJson(response.body);
  } else {
    return RespuestaApiModel(message: messageError, code: 5000);
  }
}

class BonoProvider extends GetConnect {
  final url = '${DatosServer.urlServer}/bonos';
  final urlPruebas = DatosServer.urlPruebas;
  final urlMail = DatosServer.urlMail;
  final urlWeb = DatosServer.urlWeb;

  // Verificamos si existe el bono y si si regresamos el id_cupon
  Future<int?> existeBono(String idPista, String deporte, String codigo) async {
    const title = 'ExisteBono';

    print('$title title');
    print({'idpista': idPista, 'deporte': deporte, 'codigo': codigo});
    final response = await get<int?>('$url/existe',
        query: {'idpista': idPista, 'deporte': deporte, 'codigo': codigo},
        decoder: (data) {
      print(data);
      if (data is Map<String, dynamic>) {
        final result = RespuestaApiModel.fromJson(data);
        print(result.datos);
        if (result.datos != null) {
          print('sdkjfnos');
          return result.datos;
        }
      }
      return null;
    }, contentType: 'application/json');
    return response.body;
  }
}
