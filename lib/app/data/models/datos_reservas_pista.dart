// To parse this JSON data, do
//
//     final datosReservaPista = datosReservaPistaFromJson(jsonString);

import 'dart:convert';

DatosReservaPista datosReservaPistaFromJson(String str) =>
    DatosReservaPista.fromJson(json.decode(str));

String datosReservaPistaToJson(DatosReservaPista data) =>
    json.encode(data.toJson());

class DatosReservaPista {
  List<ClubsFavorito> clubsFavoritos;
  int tiempoReserva;
  List<Reserva> reservas;

  DatosReservaPista({
    required this.clubsFavoritos,
    required this.tiempoReserva,
    required this.reservas,
  });

  factory DatosReservaPista.fromJson(Map<String, dynamic> json) =>
      DatosReservaPista(
        clubsFavoritos: List<ClubsFavorito>.from(
            json["clubsFavoritos"].map((x) => ClubsFavorito.fromJson(x))),
        tiempoReserva: json["tiempoReserva"],
        reservas: List<Reserva>.from(
            json["reservas"].map((x) => Reserva.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "clubsFavoritos":
            List<dynamic>.from(clubsFavoritos.map((x) => x.toJson())),
        "tiempoReserva": tiempoReserva,
        "reservas": List<dynamic>.from(reservas.map((x) => x.toJson())),
      };
}

class ClubsFavorito {
  int indexLocalidad;
  int indexClub;

  ClubsFavorito({
    required this.indexLocalidad,
    required this.indexClub,
  });

  factory ClubsFavorito.fromJson(Map<String, dynamic> json) => ClubsFavorito(
        indexLocalidad: json["indexLocalidad"],
        indexClub: json["indexClub"],
      );

  Map<String, dynamic> toJson() => {
        "indexLocalidad": indexLocalidad,
        "indexClub": indexClub,
      };
}

class Reserva {
  String localidad;
  List<Club> clubs;

  Reserva({
    required this.localidad,
    required this.clubs,
  });

  factory Reserva.fromJson(Map<String, dynamic> json) => Reserva(
        localidad: json["localidad"],
        clubs: List<Club>.from(json["clubs"].map((x) => Club.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "localidad": localidad,
        "clubs": List<dynamic>.from(clubs.map((x) => x.toJson())),
      };
}

class Club {
  String name;
  bool favorito;
  List<Deporte> deportes;

  Club({
    required this.name,
    required this.favorito,
    required this.deportes,
  });

  factory Club.fromJson(Map<String, dynamic> json) => Club(
        name: json["name"],
        favorito: json["favorito"],
        deportes: List<Deporte>.from(
            json["deportes"].map((x) => Deporte.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "favorito": favorito,
        "deportes": List<dynamic>.from(deportes.map((x) => x.toJson())),
      };
}

class Deporte {
  String name;
  List<Semana> semana;

  Deporte({
    required this.name,
    required this.semana,
  });

  factory Deporte.fromJson(Map<String, dynamic> json) => Deporte(
        name: json["name"],
        semana:
            List<Semana>.from(json["semana"].map((x) => Semana.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "semana": List<dynamic>.from(semana.map((x) => x.toJson())),
      };
}

class Semana {
  List<Pista> pistas;

  Semana({
    required this.pistas,
  });

  factory Semana.fromJson(Map<String, dynamic> json) => Semana(
        pistas: List<Pista>.from(json["pistas"].map((x) => Pista.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pistas": List<dynamic>.from(pistas.map((x) => x.toJson())),
      };
}

class Pista {
  String name;
  String image;

  Pista({
    required this.name,
    required this.image,
  });

  factory Pista.fromJson(Map<String, dynamic> json) => Pista(
        name: json["name"],
        image: json["image"],
      );
  /*List<Horario>.from(
            json["horarios"].map((x) => Horario.fromJson(x))) */

/*List<Horario>.from(json["horarios"].map((x) =>
            Horario(horario: '13:00', estatus: TypeEstadoHorario.abierta))),*/
  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
      };
}

class Horario {
  String horario;
  TypeEstadoHorario estatus;
  int? precio_con_luz_socio;
  int? precio_con_luz_no_socio;
  int? precio_sin_luz_socio;
  int? precio_sin_luz_no_socio;
  bool luces;
  Horario(
      {required this.horario,
      required this.estatus,
      required this.precio_con_luz_no_socio,
      required this.precio_con_luz_socio,
      required this.precio_sin_luz_no_socio,
      required this.precio_sin_luz_socio,
      this.luces = false});

  factory Horario.fromJson(Map<String, dynamic> json) {
    final TypeEstadoHorario typeEstado;
    int precio_con_luz_socio;
    int precio_con_luz_no_socio;
    int precio_sin_luz_socio;
    int precio_sin_luz_no_socio;
    switch (json["estatus"]) {
      case 'reservadaParcial':
        typeEstado = TypeEstadoHorario.reservadaParcial;
        break;
      case 'reservada':
        typeEstado = TypeEstadoHorario.reservada;
        break;
      case 'abierta':
        typeEstado = TypeEstadoHorario.abierta;
        break;
      case 'reservadaClase':
        typeEstado = TypeEstadoHorario.reservadaClase;
        break;
      default:
        typeEstado = TypeEstadoHorario.cerrada;
        break;
    }

    precio_con_luz_socio = json["precio_con_luz_socio"] ?? 2;
    precio_con_luz_no_socio = json["precio_con_luz_no_socio"] ?? 2;
    precio_sin_luz_socio = json["precio_sin_luz_socio"] ?? 2;
    precio_sin_luz_no_socio = json["precio_sin_luz_no_socio"] ?? 2;
    return Horario(
        horario: json["horario"],
        estatus: typeEstado,
        precio_con_luz_no_socio: precio_con_luz_no_socio,
        precio_con_luz_socio: precio_con_luz_socio,
        precio_sin_luz_no_socio: precio_sin_luz_no_socio,
        precio_sin_luz_socio: precio_sin_luz_socio);
  }

  Map<String, dynamic> toJson() => {
        "horario": horario,
        "estatus": estatus,
        "precio_con_luz_no_socio": precio_con_luz_no_socio,
        "precio_con_luz_socio": precio_con_luz_socio,
        "precio_sin_luz_no_socio": precio_sin_luz_no_socio,
        "precio_sin_luz_socio": precio_sin_luz_socio
      };
}

enum TypeEstadoHorario {
  reservadaParcial,
  reservadaClase,
  reservada,
  abierta,
  reservaEnProceso,
  cerrada
}
