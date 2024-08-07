import 'dart:convert';

class LocalidadModel {
  final List<Localidad> localidades;

  LocalidadModel({
    required this.localidades,
  });

  factory LocalidadModel.fromRawJson(String str) =>
      LocalidadModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LocalidadModel.fromJson(List json) => LocalidadModel(
        localidades:
            List<Localidad>.from(json.map((x) => Localidad.fromJson(x))),
      );

  List<Localidad> findCodigosPostales(String value) =>
      localidades.where((element) => element.localidad == value).toList();

  Map<String, dynamic> toJson() => {
        "localidades": List<dynamic>.from(localidades.map((x) => x.toJson())),
      };
}

class Localidad {
  final String localidad;
  final List<String> codPostal;

  Localidad({
    required this.localidad,
    required this.codPostal,
  });

  factory Localidad.fromRawJson(String str) =>
      Localidad.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Localidad.fromJson(Map<String, dynamic> json) => Localidad(
        localidad: json["localidad"],
        codPostal: List<String>.from(json["cod_postal"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "localidad": localidad,
        "cod_postal": List<dynamic>.from(codPostal.map((x) => x)),
      };
}
