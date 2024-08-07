import 'dart:convert';

class ListPistas {
  List<PistasModel> listPistas;
  ListPistas({required this.listPistas});
  factory ListPistas.fromRawList(String str) =>
      ListPistas.fromList(json.decode(str));
  factory ListPistas.fromList(List<dynamic> list) =>
      ListPistas(listPistas: list.map((e) => PistasModel.fromJson(e)).toList());
  String toRawList() => json.encode(listPistas.map((e) => e.toJson()).toList());
}

class PistasModel {
  int? idPista;
  String? deporte;
  int? capacidad;
  int? numPista;
  bool? techada;
  String? iluminacion;
  String? tipo;
  String? cesped;
  bool? automatizada;
  int? duracionPartida;
  String? horaInicio;
  String? horaFin;
  int? tiempoReservaSocio;
  int? tiempoCancelacionSocio;
  int? precioLuzSocio;
  int? precioSinLuzSocio;
  int? tiempoReservaNoSocio;
  int? tiempoCancelacionNoSocio;
  int? precioLuzNoSocio;
  int? precioSinLuzNoSocio;
  String? descripcion;
  String? nombrePatrocinador;
  String? imagenPatrocinador;
  bool? vestuario;
  bool? duchas;
  String? imagenesPista;
  bool? efectivo;
  bool? tarjeta;
  bool? bono;
  bool? reservatupista;
  DateTime? fechaRegistro;

  PistasModel({
    this.idPista,
    this.capacidad,
    this.deporte,
    this.numPista,
    this.techada,
    this.iluminacion,
    this.tipo,
    this.cesped,
    this.automatizada,
    this.duracionPartida,
    this.horaInicio,
    this.horaFin,
    this.tiempoReservaSocio,
    this.tiempoCancelacionSocio,
    this.precioLuzSocio,
    this.precioSinLuzSocio,
    this.tiempoReservaNoSocio,
    this.tiempoCancelacionNoSocio,
    this.precioLuzNoSocio,
    this.precioSinLuzNoSocio,
    this.descripcion,
    this.nombrePatrocinador,
    this.imagenPatrocinador,
    this.vestuario,
    this.duchas,
    this.imagenesPista,
    this.efectivo,
    this.tarjeta,
    this.bono,
    this.reservatupista,
    this.fechaRegistro,
  });

  factory PistasModel.fromRawJson(String str) =>
      PistasModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PistasModel.fromJson(Map<String, dynamic> json) => PistasModel(
        idPista: json["id_pista"],
        deporte: json["deporte"],
        numPista: json["num_pista"],
        techada: json["techada"],
        capacidad: json["capacidad"],
        iluminacion: json["iluminacion"],
        tipo: json["tipo"],
        cesped: json["cesped"],
        automatizada: json["automatizada"],
        duracionPartida: json["duracion_partida"],
        horaInicio: json["hora_inicio"],
        horaFin: json["hora_fin"],
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
      );

  Map<String, dynamic> toJson() => {
        "deporte": deporte,
        "num_pista": numPista,
        "techada": techada,
        "capacidad": capacidad,
        "iluminacion": iluminacion,
        "tipo": tipo,
        "cesped": cesped,
        "automatizada": automatizada,
        "duracion_partida": duracionPartida,
        "hora_inicio": horaInicio,
        "hora_fin": horaFin,
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
      };
}
