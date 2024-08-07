import 'package:get/get_connect/connect.dart';
import 'package:reservatu_pista/app/data/models/geonames_model.dart';
import 'datos_server.dart';

class GeoNamesProvider extends GetConnect {
  final url = DatosServer.urlServer;
  // Get Localizacion
  Future<GeoNamesModel?> getLocalizacion(String codigoPostal) async {
    final response = await get('$url/geonames', headers: {
      "codigopostal": codigoPostal,
    });
    if (response.statusCode == 200) {
      return GeoNamesModel.fromJson(response.body);
    } else {
      return null;
    }
  }
}
