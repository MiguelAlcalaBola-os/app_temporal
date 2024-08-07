import 'dart:convert';

import 'package:reservatu_pista/app/data/models/reservas_usuario_model.dart';

class ReservasCompartidas {
  final int idReserva;
  final int idPista;
  final String horaInicio;
  final DateTime fechaReserva;
  final String referencia;
  final String deporte;
  final int numPista;
  final String nombrePatrocinador;
  final int capacidad;
  final String nombre;
  final String foto;
  final String horaFin;
  final String localidad;
  final String tipoReserva;
  final String iluminacion;
  final int automatizada;
  final String pista;
  final int duracionPartida;
  final int precioConLuzSocio;
  final int precioSinLuzSocio;
  final int precioConLuzNoSocio;
  final int precioSinLuzNoSocio;

  // final String tipoProveedor;
  final int tiempo_cancelacion;

  ReservasUsuarios? reservasUsuarios;

  ReservasCompartidas(
      {required this.idReserva,
      required this.idPista,
      required this.horaInicio,
      required this.fechaReserva,
      required this.referencia,
      required this.deporte,
      required this.numPista,
      required this.nombrePatrocinador,
      required this.capacidad,
      required this.nombre,
      required this.foto,
      required this.localidad,
      // required this.luz,
      required this.iluminacion,
      required this.automatizada,
      required this.pista,
      required this.horaFin,
      required this.duracionPartida,
      required this.tipoReserva,
      required this.precioConLuzSocio,
      required this.precioSinLuzSocio,
      required this.precioConLuzNoSocio,
      required this.precioSinLuzNoSocio,
      // required this.tipoProveedor,
      required this.tiempo_cancelacion,
      this.reservasUsuarios});

  factory ReservasCompartidas.fromRawJson(String str) =>
      ReservasCompartidas.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ReservasCompartidas.fromJson(Map<String, dynamic> json) =>
      ReservasCompartidas(
        idReserva: json["id_reserva"],
        idPista: json["id_pista"],
        horaInicio: json["hora_inicio"],
        fechaReserva:
            DateTime.parse(json["fecha_reserva"]).add(const Duration(days: 1)),
        referencia: json["referencia"],
        deporte: json["deporte"],
        numPista: json["num_pista"],
        nombrePatrocinador: json["nombre_patrocinador"],
        capacidad: json["capacidad"],
        nombre: json["nombre"],
        foto: json["foto"],
        localidad: json["localidad"],
        // luz: json['iluminacion'],
        iluminacion: json['iluminacion'],
        automatizada: json['automatizada'],
        pista: json['pista'],
        horaFin: json['hora_fin'],
        duracionPartida: json['duracion_partida'],
        tiempo_cancelacion: json['tiempo_cancelacion_no_socio'],
        // tipoProveedor: json['tipo'],
        tipoReserva: json['tipo_reserva'],
        precioConLuzSocio: json['precio_con_luz_socio'],
        precioSinLuzSocio: json['precio_sin_luz_socio'],
        precioConLuzNoSocio: json['precio_con_luz_no_socio'],
        precioSinLuzNoSocio: json['precio_sin_luz_no_socio'],
      );

  Map<String, dynamic> toJson() => {
        "id_reserva": idReserva,
        "id_pista": idPista,
        "hora_inicio": horaInicio,
        "horaFin": horaFin,
        "fecha_reserva": fechaReserva,
        "referencia": referencia,
        "deporte": deporte,
        "num_pista": numPista,
        "nombre_patrocinador": nombrePatrocinador,
        "capacidad": capacidad,
        "nombre": nombre,
        "foto": foto,
        "localidad": localidad,
        "precio_con_luz_socio": precioConLuzSocio,
        "precio_sin_luz_socio": precioSinLuzSocio,
        "precio_con_luz_no_socio": precioConLuzNoSocio,
        "precio_sin_luz_no_socio": precioSinLuzNoSocio,
        // "tipo_proveedor": tipoProveedor,
        "tipo_reserva": tipoReserva,
      };
}
