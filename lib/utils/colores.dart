import 'dart:ui';

abstract final class Colores {
  static final ColoresProveedor proveedor = ColoresProveedor();
  static final ColoresUsuario usuario = ColoresUsuario();
  static final ColoresAdmin admin = ColoresAdmin();
  static const Color rojo = Color(0xFFF77066);
  static const Color verde = Color.fromARGB(255, 48, 234, 138);
  static const Color verdeCheck = Color(0xff4d39d2c0);
  static const Color verdeBorderCheck = Color(0xff39d2c0);
  static const Color azul = Color.fromRGBO(43, 120, 220, 1);
  static const Color orange = Color(0xFFFFA500);
  static const Color yellowFavorito = Color(0xffFFC107);
  static const Color grisClaro = Color.fromRGBO(220, 220, 220, 1.0);
  static const Color gris192 = Color.fromRGBO(192, 192, 192, 1);
  static const Color sucessGeneral = Color(0xFF46EF98);
}

class ColoresProveedor {
  final Color primary = const Color.fromARGB(255, 48, 234, 138);
  final Color primary160 = const Color.fromARGB(160, 48, 234, 138);
  final Color primary69 = const Color.fromARGB(69, 48, 234, 138);
  final Color primary40 = const Color.fromARGB(40, 48, 234, 138);
}

class ColoresUsuario {
  final Color primary = const Color.fromRGBO(43, 120, 220, 1);
  final Color primary160 = const Color.fromARGB(160, 43, 120, 220);
  final Color primary200 = const Color.fromARGB(200, 43, 120, 220);
  final Color primary69 = const Color.fromARGB(69, 43, 120, 220);
  final Color background = const Color(0xFFF1F4F8);
}

class ColoresAdmin {
  final Color primary = const Color.fromRGBO(247, 112, 102, 1);
  final Color primary160 = const Color.fromRGBO(160, 112, 102, 1);
  final Color primary69 = const Color.fromRGBO(69, 112, 102, 1);
  final Color primary40 = const Color.fromRGBO(40, 112, 102, 1);
}
