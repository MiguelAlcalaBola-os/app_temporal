import 'dart:core';

class Socio {
  int id;
  String nombre;
  String nick;
  bool socio;
  String nivel;
  String dni;
  String direccion;
  int partidasJugadas;
  String posicion;
  String horario;
  String email;
  String telefono;
  String fechaAlta;
  String urlImagen;
  int tiempoRestante;

  Socio(
      this.id,
      this.nombre,
      this.nick,
      this.dni,
      this.nivel,
      this.direccion,
      this.partidasJugadas,
      this.posicion,
      this.horario,
      this.email,
      this.telefono,
      this.fechaAlta,
      this.urlImagen,
      this.socio,
      this.tiempoRestante);

  bool isSocio() {
    return socio;
  }
}
