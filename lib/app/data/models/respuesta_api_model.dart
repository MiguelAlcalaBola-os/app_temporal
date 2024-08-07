import 'dart:convert';

class RespuestaApiModel<T> {
  String? message;
  int? code;
  dynamic datos;

  RespuestaApiModel({
    this.message,
    this.code,
    this.datos,
  });

  factory RespuestaApiModel.fromRawJson(String str) =>
      RespuestaApiModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RespuestaApiModel.fromJson(Map<String, dynamic> json) =>
      RespuestaApiModel(
        message: json["message"],
        code: json["code"],
        datos: json["datos"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "code": code,
        "datos": datos,
      };
}
