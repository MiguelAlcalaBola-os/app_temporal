import 'dart:convert';

class ProveedorModel {
  String token;
  int idProveedor;
  int idClub;
  String tipo;
  String cifNif;
  String direccionFiscal;
  String codigoPostalFiscal;
  String localidadFiscal;
  String provinciaFiscal;
  String comunidadFiscal;
  String codigoIban;
  String certificadoCuenta;
  String nombre;
  String apellidos;
  int fijo;
  String email;
  String lada;
  String telefono;
  String contrasena;
  String foto;
  DateTime? fechaRegistro;
  bool noticia;

  ProveedorModel(
      {this.token = '',
      this.idProveedor = 0,
      this.idClub = 0,
      this.tipo = '',
      this.cifNif = '',
      this.direccionFiscal = '',
      this.codigoPostalFiscal = '',
      this.localidadFiscal = '',
      this.provinciaFiscal = '',
      this.comunidadFiscal = '',
      this.codigoIban = '',
      this.certificadoCuenta = '',
      this.nombre = '',
      this.apellidos = '',
      this.fijo = 0,
      this.email = '',
      this.lada = '',
      this.telefono = '',
      this.contrasena = '',
      this.foto = '',
      this.fechaRegistro,
      this.noticia = false});

  factory ProveedorModel.fromRawJson(String str) =>
      ProveedorModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProveedorModel.fromJson(Map<String, dynamic> json) => ProveedorModel(
        token: json["token"] ?? '',
        idProveedor: json["id_proveedor"] ?? 0,
        idClub: json["id_club"] ?? 0,
        tipo: json["tipo"] ?? '',
        cifNif: json["cif_nif"] ?? '',
        direccionFiscal: json["direccion_fiscal"] ?? '',
        codigoPostalFiscal: json["codigo_postal_fiscal"] ?? '',
        localidadFiscal: json["localidad_fiscal"] ?? '',
        provinciaFiscal: json["provincia_fiscal"] ?? '',
        comunidadFiscal: json["comunidad_fiscal"] ?? '',
        codigoIban: json["codigo_iban"] ?? '',
        certificadoCuenta: json["certificado_cuenta"] ?? '',
        nombre: json["nombre"] ?? '',
        apellidos: json["apellidos"] ?? '',
        fijo: json["fijo"] ?? 0,
        email: json["email"] ?? '',
        lada: json["lada"] ?? '',
        telefono: json["telefono"] ?? '',
        contrasena: json["contrasena"] ?? '',
        foto: json["foto"] ?? '',
        fechaRegistro: json["fecha_registro"] != null
            ? DateTime.parse(json["fecha_registro"])
            : null,
        noticia: json["noticia"] == 1,
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "id_proveedor": idProveedor,
        "id_club": idClub,
        "tipo": tipo,
        "cif_nif": cifNif,
        "direccion_fiscal": direccionFiscal,
        "codigo_postal_fiscal": codigoPostalFiscal,
        "localidad_fiscal": localidadFiscal,
        "provincia_fiscal": provinciaFiscal,
        "comunidad_fiscal": comunidadFiscal,
        "codigo_iban": codigoIban,
        "certificado_cuenta": certificadoCuenta,
        "nombre": nombre,
        "apellidos": apellidos,
        "fijo": fijo,
        "email": email,
        "lada": lada,
        "telefono": telefono,
        "contrasena": contrasena,
        "foto": foto,
        "fecha_registro": fechaRegistro?.toIso8601String(),
      };
}
