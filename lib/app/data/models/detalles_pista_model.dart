// To parse this JSON data, do
//
//     final detallesPistaModel = detallesPistaModelFromJson(jsonString);

import 'dart:convert';

DetallesPistaModel detallesPistaModelFromJson(String str) =>
    DetallesPistaModel.fromJson(json.decode(str));

String detallesPistaModelToJson(DetallesPistaModel data) =>
    json.encode(data.toJson());

class DetallesPistaModel {
  final int idPista;
  final String deporte;
  final int numPista;
  final int techada;
  final String iluminacion;
  final String tipo;
  final String cesped;
  final int automatizada;
  final int duracionPartida;
  final String horaInicio;
  final String horaFin;
  final dynamic horaInicioLuces;
  final dynamic horaFinLuces;
  final int tiempoReservaSocio;
  final int tiempoCancelacionSocio;
  final int precioLuzSocio;
  final int precioSinLuzSocio;
  final int tiempoReservaNoSocio;
  final int tiempoCancelacionNoSocio;
  final int precioLuzNoSocio;
  final int precioSinLuzNoSocio;
  final String descripcion;
  final String nombrePatrocinador;
  final String imagenPatrocinador;
  final int vestuario;
  final int duchas;
  final String imagenesPista;
  final int idClub;
  final int capacidad;

  DetallesPistaModel({
    required this.idPista,
    required this.deporte,
    required this.numPista,
    required this.techada,
    required this.iluminacion,
    required this.tipo,
    required this.cesped,
    required this.automatizada,
    required this.duracionPartida,
    required this.horaInicio,
    required this.horaFin,
    required this.horaInicioLuces,
    required this.horaFinLuces,
    required this.tiempoReservaSocio,
    required this.tiempoCancelacionSocio,
    required this.precioLuzSocio,
    required this.precioSinLuzSocio,
    required this.tiempoReservaNoSocio,
    required this.tiempoCancelacionNoSocio,
    required this.precioLuzNoSocio,
    required this.precioSinLuzNoSocio,
    required this.descripcion,
    required this.nombrePatrocinador,
    required this.imagenPatrocinador,
    required this.vestuario,
    required this.duchas,
    required this.imagenesPista,
    required this.idClub,
    required this.capacidad,
  });

  factory DetallesPistaModel.fromJson(Map<String, dynamic> json) =>
      DetallesPistaModel(
        idPista: json["id_pista"],
        deporte: json["deporte"],
        numPista: json["num_pista"],
        techada: json["techada"],
        iluminacion: json["iluminacion"],
        tipo: json["tipo"],
        cesped: json["cesped"],
        automatizada: json["automatizada"],
        duracionPartida: json["duracion_partida"],
        horaInicio: json["hora_inicio"],
        horaFin: json["hora_fin"],
        horaInicioLuces: json["hora_inicio_luces"],
        horaFinLuces: json["hora_fin_luces"],
        tiempoReservaSocio: json["tiempo_reserva_socio"],
        tiempoCancelacionSocio: json["tiempo_cancelacion_socio"],
        precioLuzSocio: json["precio_luz_socio"],
        precioSinLuzSocio: json["precio_sin_luz_socio"],
        tiempoReservaNoSocio: json["tiempo_reserva_no_socio"],
        tiempoCancelacionNoSocio: json["tiempo_cancelacion_no_socio"],
        precioLuzNoSocio: json["precio_luz_no_socio"],
        precioSinLuzNoSocio: json["precio_sin_luz_no_socio"],
        descripcion: json["descripcion"],
        nombrePatrocinador: json["nombre_patrocinador"],
        imagenPatrocinador: json["imagen_patrocinador"],
        vestuario: json["vestuario"],
        duchas: json["duchas"],
        imagenesPista: json["imagenes_pista"],
        idClub: json["id_club"],
        capacidad: json["capacidad"],
      );

  Map<String, dynamic> toJson() => {
        "id_pista": idPista,
        "deporte": deporte,
        "num_pista": numPista,
        "techada": techada,
        "iluminacion": iluminacion,
        "tipo": tipo,
        "cesped": cesped,
        "automatizada": automatizada,
        "duracion_partida": duracionPartida,
        "hora_inicio": horaInicio,
        "hora_fin": horaFin,
        "hora_inicio_luces": horaInicioLuces,
        "hora_fin_luces": horaFinLuces,
        "tiempo_reserva_socio": tiempoReservaSocio,
        "tiempo_cancelacion_socio": tiempoCancelacionSocio,
        "precio_luz_socio": precioLuzSocio,
        "precio_sin_luz_socio": precioSinLuzSocio,
        "tiempo_reserva_no_socio": tiempoReservaNoSocio,
        "tiempo_cancelacion_no_socio": tiempoCancelacionNoSocio,
        "precio_luz_no_socio": precioLuzNoSocio,
        "precio_sin_luz_no_socio": precioSinLuzNoSocio,
        "descripcion": descripcion,
        "nombre_patrocinador": nombrePatrocinador,
        "imagen_patrocinador": imagenPatrocinador,
        "vestuario": vestuario,
        "duchas": duchas,
        "imagenes_pista": imagenesPista,
        "id_club": idClub,
        "capacidad": capacidad,
      };
}
