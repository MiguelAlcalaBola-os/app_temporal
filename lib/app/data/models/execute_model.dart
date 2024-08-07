import 'dart:convert';
import 'package:reservatu_pista/app/data/models/mis_reservas_usuario_model.dart';
import 'package:reservatu_pista/app/data/models/reservas_pistas_usuarios.dart';

class ExecuteModel<T> {
  final bool success;
  final List<T> datos;

  ExecuteModel({
    required this.success,
    required this.datos,
  });

  String toRawJson() => json.encode(toJson());

  factory ExecuteModel.fromJsonReservasPistasUsuarios(
          Map<String, dynamic> json) =>
      ExecuteModel(
        success: json["success"],
        datos: List<T>.from(
            json["datos"].map((x) => ReservasPistasUsuarios.fromJson(x))),
      );

  factory ExecuteModel.fromJsonMisReservasUsuarioModel(
          Map<String, dynamic> json) =>
      ExecuteModel(
        success: json["success"],
        datos: List<T>.from(
            json["datos"].map((x) => MisReservasUsuarioModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
      };
}
