import 'dart:convert';

class GeoNamesModel {
  String codigoPostal;
  String localidad;
  String provincia;
  String comunidad;

  GeoNamesModel({
    this.codigoPostal = '',
    this.localidad = '',
    this.provincia = '',
    this.comunidad = '',
  });

  factory GeoNamesModel.fromRawJson(String str) =>
      GeoNamesModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GeoNamesModel.fromJson(Map<String, dynamic> json) => GeoNamesModel(
        codigoPostal: json["codigo_postal"] ?? '',
        localidad: json["localidad"] ?? '',
        provincia: json["provincia"] ?? '',
        comunidad: json["comunidad"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "codigo_postal": codigoPostal,
        "localidad": localidad,
        "provincia": provincia,
        "comunidad": comunidad,
      };
}
