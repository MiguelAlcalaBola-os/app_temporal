// import 'dart:convert';

// ListaTartifas ListaTartifasFromJson(String str) => ListaTartifas.fromJson(json.decode(str));

// String ListaTartifasToJson(ListaTartifas data) => json.encode(data.toJson());

import 'package:reservatu_pista/flutter_flow/flutter_flow_util.dart';

class ListaTartifas {
  List<Tarifa> tarifas;

  ListaTartifas({
    required this.tarifas,
  });

  // factory ListaTartifas.fromJson(Map<String, dynamic> json) => ListaTartifas(
  //     tarifas: List<Tarifa>.from(j.map((x) => Tarifa.toJson())),
  // );

  Map<String, dynamic> toJson() => {
        "tarifas": List<dynamic>.from(tarifas.map((x) => x.toJson())),
      };
}

class Tarifa {
  final int idTarifa;
  bool disponible;
  bool luz;
  bool clases;
  String diaSemana;
  String? horaInicio;
  String precioConLuzSocio;
  String precioSinLuzSocio;
  String precioConLuzNoSocio;
  String precioSinLuzNoSocio;
  String fecha;
  bool changeTarifa;

  Tarifa(
      {this.idTarifa = 0,
      this.disponible = false,
      this.luz = false,
      this.clases = false,
      this.horaInicio,
      required this.diaSemana,
      this.precioConLuzSocio = '',
      this.precioSinLuzSocio = '',
      this.precioConLuzNoSocio = '',
      this.precioSinLuzNoSocio = '',
      this.changeTarifa = false,
      this.fecha = ''});

  factory Tarifa.fromJson(
          Map<String, dynamic> json,
          String socioPrecioConLuz,
          String socioPrecioSinLuz,
          String noSocioPrecioConLuz,
          String noSocioPrecioSinLuz,
          bool isSocioPrecioConLuz,
          bool isSocioPrecioSinLuz,
          bool isNoSocioPrecioConLuz,
          bool isNoSocioPrecioSinLuz) =>
      Tarifa(
          changeTarifa: isSocioPrecioConLuz ||
              isSocioPrecioSinLuz ||
              isNoSocioPrecioConLuz ||
              isNoSocioPrecioSinLuz,
          idTarifa: json["id_tarifa"] ?? 0,
          disponible: json["activado"] == 1,
          clases: json["clases"] == 1,
          luz: json["luz"] == 1,
          diaSemana: json["dia_semana"],
          horaInicio: json["hora_inicio"].toString().substring(0, 5),
          precioConLuzSocio: isSocioPrecioConLuz
              ? socioPrecioConLuz
              : (json['precio_con_luz_socio'] as int).euro,
          precioSinLuzSocio: isSocioPrecioSinLuz
              ? socioPrecioSinLuz
              : (json['precio_sin_luz_socio'] as int).euro,
          precioConLuzNoSocio: isNoSocioPrecioConLuz
              ? noSocioPrecioConLuz
              : (json['precio_con_luz_no_socio'] as int).euro,
          precioSinLuzNoSocio: isNoSocioPrecioSinLuz
              ? noSocioPrecioSinLuz
              : (json['precio_sin_luz_no_socio'] as int).euro);

  Map<String, dynamic> toJson() {
    return {
      'disponible': disponible,
      'luz': luz,
      'clases': clases,
      'hora_inicio': horaInicio,
      'precioConLuzSocio': precioConLuzSocio,
      'precioSinLuzSocio': precioSinLuzSocio,
      'precioConLuzNoSocio': precioConLuzNoSocio,
      'precioSinLuzNoSocio': precioSinLuzNoSocio,
      'dia_semana': precioSinLuzNoSocio,
    };
  }

  List<dynamic> toList(bool isEditar) {
    final listEditar = [
      disponible,
      clases,
      luz,
      diaSemana,
      horaInicio,
      '00:00:00',
      precioConLuzSocio.convertPrecio,
      precioSinLuzSocio.convertPrecio,
      precioConLuzNoSocio.convertPrecio,
      precioSinLuzNoSocio.convertPrecio,
    ];
    if (isEditar) {
      listEditar.add(idTarifa);
    }
    return listEditar;
  }
}

// Convertir el precio en euros a int
extension ExtConvertPrecio on String {
  int get convertPrecio =>
      int.parse('${split(' ')[0].split(',')[0]}${split(' ')[0].split(',')[1]}');
}
