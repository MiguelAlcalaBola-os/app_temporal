import 'dart:convert';

class MisReservas {
  List<MiReserva> misReservas;

  MisReservas({
    required this.misReservas,
  });

  factory MisReservas.fromRawJson(String str) =>
      MisReservas.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MisReservas.fromJson(Map<String, dynamic> json) => MisReservas(
        misReservas: List<MiReserva>.from(
            json["mis_reservas"].map((x) => MiReserva.fromJson(x))),
      );
  factory MisReservas.fromList(List<dynamic> list) => MisReservas(
        misReservas:
            List<MiReserva>.from(list.map((x) => MiReserva.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "mis_reservas": List<dynamic>.from(misReservas.map((x) => x.toJson())),
      };
}

class MiReserva {
  int idReserva;
  String nombrePatrocinador;
  int numPista;
  String imagenPatrocinador;
  DateTime fechaReserva;
  String horaInicio;
  String referencia;
  double costeTotalReserva;
  int total;
  int totalLibre;
  int totalAbierta;
  int totalCerrada;

  MiReserva({
    required this.idReserva,
    required this.nombrePatrocinador,
    required this.numPista,
    required this.fechaReserva,
    required this.imagenPatrocinador,
    required this.horaInicio,
    required this.referencia,
    required this.costeTotalReserva,
    required this.total,
    required this.totalLibre,
    required this.totalAbierta,
    required this.totalCerrada,
  });

  factory MiReserva.fromRawJson(String str) =>
      MiReserva.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MiReserva.fromJson(Map<String, dynamic> json) => MiReserva(
        idReserva: json["id_reserva"],
        nombrePatrocinador: json["nombre_patrocinador"],
        numPista: json["num_pista"],
        imagenPatrocinador: json["imagen_patrocinador"],
        fechaReserva: json["fecha_reserva"],
        horaInicio: json["hora_inicio"],
        referencia: json["referencia"],
        costeTotalReserva: json["coste_total_reserva"],
        total: json["total"],
        totalLibre: json['totalLibre'] ?? 0,
        totalAbierta: json['totalAbierta'] ?? 0,
        totalCerrada: json['totalCerrada'] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "id_reserva": idReserva,
        "nombre_patrocinador": nombrePatrocinador,
        "num_pista": numPista,
        "imagen_patrocinador": imagenPatrocinador,
        "fecha_reserva": fechaReserva,
        "referencia": referencia,
        "coste_total_reserva": costeTotalReserva,
        "total": total,
        "totalLibre": totalLibre,
        "totalAbierta": totalAbierta,
        "totalCerrada": totalCerrada,
      };
}
