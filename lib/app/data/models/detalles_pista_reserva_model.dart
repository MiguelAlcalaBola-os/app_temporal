import 'dart:convert';

List<DetallesPistaReservaModel> detallesPistaReservaModelFromJsonList(
        List<dynamic> list) =>
    List<DetallesPistaReservaModel>.from(
        list.map((x) => DetallesPistaReservaModel.fromJson(x)));

class DetallesPistaReservaModel {
  final int idPista;
  final int numPista;
  final String imagenPatrocinador;
  final int capacidad;
  final int automatizada;
  final int duracionPartida;
  final int tiempoReservaSocio;
  final int tiempoReservaNoSocio;

  DetallesPistaReservaModel({
    required this.idPista,
    required this.numPista,
    required this.imagenPatrocinador,
    required this.capacidad,
    required this.automatizada,
    required this.duracionPartida,
    required this.tiempoReservaSocio,
    required this.tiempoReservaNoSocio,
  });

  factory DetallesPistaReservaModel.fromRawJson(String str) =>
      DetallesPistaReservaModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DetallesPistaReservaModel.fromJson(Map<String, dynamic> json) =>
      DetallesPistaReservaModel(
        idPista: json["id_pista"],
        numPista: json["num_pista"],
        imagenPatrocinador: json["imagen_patrocinador"],
        capacidad: json["capacidad"],
        automatizada: json["automatizada"],
        duracionPartida: json["duracion_partida"],
        tiempoReservaSocio: json["tiempo_reserva_socio"],
        tiempoReservaNoSocio: json["tiempo_reserva_no_socio"],
      );

  Map<String, dynamic> toJson() => {
        "id_pista": idPista,
        "num_pista": numPista,
        "imagen_patrocinador": imagenPatrocinador,
        "capacidad": capacidad,
        "automatizada": automatizada,
        "duracion_partida": duracionPartida,
        "tiempo_reserva_socio": tiempoReservaSocio,
        "tiempo_reserva_no_socio": tiempoReservaNoSocio,
      };
}
