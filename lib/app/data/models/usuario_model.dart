import 'dart:convert';

class UsuarioModel {
  String token;
  int idUsuario;
  String nombre;
  String apellidos;
  String sexo;
  String dni;
  String lada;
  String telefono;
  String email;
  String empadronamiento;
  String comunidadDeVecinos;
  String direccion;
  String codigoPostal;
  String localidad;
  String provincia;
  String comunidad;
  String nick;
  String nivel;
  String posicion;
  String marcaPala;
  String modeloPala;
  String juegosSemana;
  String foto;
  int dineroTotal;
  DateTime? fechaRegistro;
  final bool noticia;

  UsuarioModel(
      {this.token = '',
      this.idUsuario = 0,
      this.nombre = '',
      this.apellidos = '',
      this.sexo = '',
      this.dni = '',
      this.lada = '',
      this.telefono = '',
      this.email = '',
      this.empadronamiento = '',
      this.comunidadDeVecinos = '',
      this.direccion = '',
      this.codigoPostal = '',
      this.localidad = '',
      this.provincia = '',
      this.comunidad = '',
      this.nick = '',
      this.nivel = '',
      this.posicion = '',
      this.marcaPala = '',
      this.modeloPala = '',
      this.juegosSemana = '',
      this.foto = '',
      this.dineroTotal = 0,
      this.fechaRegistro,
      this.noticia = false});

  factory UsuarioModel.fromRawJson(String str) =>
      UsuarioModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UsuarioModel.fromJson(Map<String, dynamic> json) => UsuarioModel(
      token: json["token"] ?? '',
      idUsuario: json["id_usuario"] ?? 0,
      nombre: json["nombre"] ?? '',
      apellidos: json["apellidos"] ?? '',
      sexo: json["sexo"] ?? '',
      dni: json["DNI"] ?? '',
      lada: json["lada"] ?? '',
      telefono: json["telefono"] ?? '',
      email: json["email"] ?? '',
      empadronamiento: json["empadronamiento"] ?? '',
      comunidadDeVecinos: json["comunidad_de_vecinos"] ?? '',
      direccion: json["direccion"] ?? '',
      codigoPostal: json["codigo_postal"] ?? '',
      localidad: json["localidad"] ?? '',
      provincia: json["provincia"] ?? '',
      comunidad: json["comunidad"] ?? '',
      nick: json["nick"] ?? '',
      nivel: json["nivel"] ?? '',
      posicion: json["posicion"] ?? '',
      marcaPala: json["marca_pala"] ?? '',
      modeloPala: json["modelo_pala"] ?? '',
      juegosSemana: json["juegos_semana"] ?? '',
      foto: json["foto"] ?? '',
      dineroTotal: json["dinero_total"] ?? 0,
      fechaRegistro: json["fecha_registro"] != null
          ? DateTime.parse(json["fecha_registro"])
          : null,
      noticia: json['noticia'] == 1);

  Map<String, dynamic> toJson() => {
        "token": token,
        "id_usuario": idUsuario,
        "nombre": nombre,
        "apellidos": apellidos,
        "sexo": sexo,
        "DNI": dni,
        "lada": lada,
        "telefono": telefono,
        "email": email,
        "empadronamiento": empadronamiento,
        "comunidad_de_vecinos": comunidadDeVecinos,
        "direccion": direccion,
        "codigo_postal": codigoPostal,
        "localidad": localidad,
        "provincia": provincia,
        "nick": nick,
        "nivel": nivel,
        "posicion": posicion,
        "marca_pala": marcaPala,
        "modelo_pala": modeloPala,
        "juegos_semana": juegosSemana,
        "foto": foto,
        "dinero_total": dineroTotal,
        "fecha_registro":
            fechaRegistro == null ? '' : fechaRegistro!.toIso8601String(),
      };
}
