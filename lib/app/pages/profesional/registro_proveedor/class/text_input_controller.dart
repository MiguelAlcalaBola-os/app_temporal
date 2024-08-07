import 'package:flutter/material.dart';

class TextInputController {
  // Controlador para el campo de texto del tipo.
  TextEditingController tipo = TextEditingController();

  // Controlador para el campo de texto del CIF/NIF.
  TextEditingController cifNif = TextEditingController();

  // Controlador para el campo de texto de la dirección fiscal.
  TextEditingController direccionFiscal = TextEditingController();

  // Controlador para el campo de texto del código postal fiscal.
  TextEditingController codigoPostalFiscal = TextEditingController();

  // Controlador para el campo de texto de la localidad fiscal.
  TextEditingController localidadFiscal = TextEditingController();

  // Controlador para el campo de texto de la provincia fiscal.
  TextEditingController provinciaFiscal = TextEditingController();

  // Controlador para el campo de texto de la comunidad fiscal.
  TextEditingController comunidadFiscal = TextEditingController();

  // Controlador para el campo de texto del código IBAN.
  TextEditingController codigoIban = TextEditingController();

  // Controlador para el campo de texto del nombre.
  TextEditingController nombre = TextEditingController();

  // Controlador para el campo de texto de los apellidos.
  TextEditingController apellidos = TextEditingController();

  // Controlador para el campo de texto del número fijo.
  TextEditingController fijo = TextEditingController();

  // Controlador para el campo de texto del correo electrónico.
  TextEditingController email = TextEditingController();

  // Controlador para el campo de texto del prefijo telefónico.
  TextEditingController lada = TextEditingController(text: '🇪🇸 +34');

  // Controlador para el campo de texto del teléfono.
  TextEditingController telefono = TextEditingController();

  // Controlador para el campo de texto del nombre comercial.
  TextEditingController nombreComercial = TextEditingController();

  // Controlador para el campo de texto de la dirección.
  TextEditingController direccion = TextEditingController();

  // Controlador para el campo de texto del código postal.
  TextEditingController codigoPostal = TextEditingController();

  // Controlador para el campo de texto de la localidad.
  TextEditingController localidad = TextEditingController();

  // Controlador para el campo de texto de la provincia.
  TextEditingController provincia = TextEditingController();

  // Controlador para el campo de texto de la comunidad.
  TextEditingController comunidad = TextEditingController();

  // Controlador para el campo de texto de la fecha de registro.
  TextEditingController fechaRegistro = TextEditingController();

  // Controlador para el campo de texto de la contraseña.
  TextEditingController contrasena = TextEditingController();

  // Controlador para el campo de texto de la confirmación de contraseña.
  TextEditingController contrasenaComprobar = TextEditingController();
}
