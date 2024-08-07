import 'dart:convert';

class ClubModel {
  String token;
  int idClub;
  String nombre;
  String codigoPostal;
  String localidad;
  String direccion;
  String provincia;
  String comunidad;
  String pais;
  int idProveedor;

  ClubModel(
      {this.token = '',
      this.idClub = 0,
      this.nombre = '',
      this.codigoPostal = '',
      this.localidad = '',
      this.direccion = '',
      this.provincia = '',
      this.comunidad = '',
      this.pais = '',
      this.idProveedor = 0});

  factory ClubModel.fromRawJson(String str) =>
      ClubModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ClubModel.fromJson(Map<String, dynamic> json) => ClubModel(
        token: json["token"] ?? '',
        idClub: json["id_club"] ?? 0,
        nombre: json["nombre"] ?? '',
        codigoPostal: json["codigo_postal"] ?? '',
        localidad: json["localidad"] ?? '',
        direccion: json["direccion"] ?? '',
        provincia: json["provincia"] ?? '',
        comunidad: json["comunidad"] ?? '',
        pais: json["pais"] ?? '',
        idProveedor: json["id_proveedor"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "id_club": idClub,
        "nombre": nombre,
        "codigo_postal": codigoPostal,
        "localidad": localidad,
        "direccion": direccion,
        "provincia": provincia,
        "comunidad": comunidad,
        "pais": pais,
      };
}
