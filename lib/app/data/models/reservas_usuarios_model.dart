import 'dart:convert';

class ReservasUsuariosModel {
  final int? idPista;
  final DateTime? fechaReserva;
  final DateTime? timestamp;
  final String? horaInicio;
  final String? horaFin;
  final int? idTarifa;
  final int? idTarifaGeneral;
  final int? idTarifaEspecifca;
  final int? costeTotalReserva;
  final String? referencia;

  ReservasUsuariosModel({
    this.idPista,
    this.fechaReserva,
    this.timestamp,
    this.horaInicio,
    this.horaFin,
    this.idTarifa,
    this.idTarifaGeneral,
    this.idTarifaEspecifca,
    this.costeTotalReserva,
    this.referencia,
  });

  factory ReservasUsuariosModel.fromRawJson(String str) =>
      ReservasUsuariosModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ReservasUsuariosModel.fromJson(Map<String, dynamic> json) =>
      ReservasUsuariosModel(
        idPista: json["id_pista"],
        fechaReserva: DateTime.parse(json["fecha_reserva"]),
        timestamp: DateTime.parse(json["timestamp"]),
        horaInicio: json["hora_inicio"],
        horaFin: json["hora_fin"],
        idTarifa: json["id_tarifa"],
        idTarifaGeneral: json["id_tarifa_general"],
        idTarifaEspecifca: json["id_tarifa_especifca"],
        costeTotalReserva: json["coste_total_reserva"],
        referencia: json["referencia"],
      );

  Map<String, dynamic> toJson() => {
        "id_pista": idPista,
        "fecha_reserva": fechaReserva != null
            ? "${fechaReserva!.year.toString().padLeft(4, '0')}-${fechaReserva!.month.toString().padLeft(2, '0')}-${fechaReserva!.day.toString().padLeft(2, '0')}"
            : '',
        "timestamp": timestamp != null ? timestamp!.toIso8601String() : '',
        "hora_inicio": horaInicio,
        "hora_fin": horaFin,
        "id_tarifa": idTarifa,
        "id_tarifa_general": idTarifaGeneral,
        "id_tarifa_especifca": idTarifaEspecifca,
        "coste_total_reserva": costeTotalReserva,
        "referencia": referencia,
      };
}
