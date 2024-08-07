import 'dart:convert';

class ReservasPistasUsuarios {
  final int? idReservaPistaUsuario;
  final DateTime? timestamp;
  final int? idReserva;
  final int? idUsuario;
  final int? dineroPagado;
  final int? plazasReservadas;

  ReservasPistasUsuarios({
    this.idReservaPistaUsuario,
    this.timestamp,
    this.idReserva,
    this.idUsuario,
    this.dineroPagado,
    this.plazasReservadas,
  });

  factory ReservasPistasUsuarios.fromRawJson(String str) =>
      ReservasPistasUsuarios.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ReservasPistasUsuarios.fromJson(Map<String, dynamic> json) =>
      ReservasPistasUsuarios(
        idReservaPistaUsuario: json["id_reserva_pista_usuario"],
        timestamp: json["timestamp"],
        idReserva: json["id_reserva"],
        idUsuario: json["id_usuario"],
        dineroPagado: json["dinero_pagado"],
        plazasReservadas: json["plazas_reservadas"],
      );

  Map<String, dynamic> toJson() => {
        "id_reserva_pista_usuario": idReservaPistaUsuario,
        "timestamp": timestamp == null ? '' : timestamp!.toIso8601String(),
        "id_reserva": idReserva,
        "id_usuario": idUsuario,
        "dinero_pagado": dineroPagado,
        "plazas_reservadas": plazasReservadas,
      };
}
