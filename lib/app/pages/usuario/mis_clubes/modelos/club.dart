import 'package:get/get.dart';

class Club {
  int id;
  String tipo;
  String nombre;
  String localidad;
  int antiguedad;
  RxBool esFavorito = false.obs;
  String urlImagen;

  Club(this.id, this.nombre, this.localidad, this.antiguedad, this.urlImagen,
      this.tipo);
}
