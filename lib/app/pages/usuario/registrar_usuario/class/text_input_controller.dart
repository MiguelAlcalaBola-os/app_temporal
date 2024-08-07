import 'package:flutter/material.dart';

class TextInputController {
  ///  Nodo de enfoque para manejar el estado del foco de los campos de texto.
  final unfocusNode = FocusNode();

  // Nodo de enfoque y controlador para el campo de texto del nick.
  FocusNode nickFocusNode = FocusNode();
  TextEditingController nick = TextEditingController();

  // Nodo de enfoque y controlador para el campo de texto del nombre.
  FocusNode nombreFocusNode = FocusNode();
  TextEditingController nombre = TextEditingController();

  // Nodo de enfoque y controlador para el campo de texto de los apellidos.
  FocusNode apellidosFocusNode = FocusNode();
  TextEditingController apellidos = TextEditingController();

  // Nodo de enfoque y controlador para el campo de texto del sexo.
  FocusNode sexoFocusNode = FocusNode();
  TextEditingController sexo = TextEditingController();

  // Nodo de enfoque y controlador para el campo de texto del DNI.
  FocusNode dniFocusNode = FocusNode();
  TextEditingController dni = TextEditingController();

  // Nodo de enfoque y controlador para el campo de texto del teléfono.
  FocusNode telefonoFocusNode = FocusNode();
  TextEditingController telefono = TextEditingController();

  // Nodo de enfoque y controlador para el campo de texto del correo electrónico.
  FocusNode emailFocusNode = FocusNode();
  TextEditingController email = TextEditingController();

  // Nodo de enfoque para el campo de texto del socio.
  FocusNode socioFocusNode = FocusNode();

  // Controlador para el campo de texto del empadronamiento.
  TextEditingController empadronamiento = TextEditingController();

  // Controlador para el campo de texto del prefijo telefónico.
  TextEditingController lada = TextEditingController(text: '🇪🇸 +34');

  // Controlador para el campo de texto de la foto del usuario.
  TextEditingController foto = TextEditingController();

  // Controlador para el campo de texto de la dirección.
  TextEditingController direccion = TextEditingController();

  // Controlador para el campo de texto de la comunidad de vecinos.
  TextEditingController comunidadVecinos = TextEditingController();

  // Controlador para el campo de texto de la comunidad.
  TextEditingController comunidad = TextEditingController();

  // Controlador para el campo de texto del código postal.
  TextEditingController codigoPostal = TextEditingController();

  // Controlador para el campo de texto de la localidad.
  TextEditingController localidad = TextEditingController();

  // Controlador para el campo de texto de la provincia.
  TextEditingController provincia = TextEditingController();

  // Controlador para el campo de texto del nivel.
  TextEditingController nivel = TextEditingController();

  // Controlador para el campo de texto de la posición.
  TextEditingController posicion = TextEditingController();

  // Controlador para el campo de texto de la pala.
  TextEditingController pala = TextEditingController();

  // Controlador para el campo de texto del modelo.
  TextEditingController modelo = TextEditingController();

  // Controlador para el campo de texto de los juegos por semana.
  TextEditingController juegoPorSemana = TextEditingController();

  // Controlador para el campo de texto de la contraseña.
  TextEditingController contrasena = TextEditingController();

  // Controlador para el campo de texto de la confirmación de contraseña.
  TextEditingController contrasenaComprobar = TextEditingController();

  // Nodo de enfoque para el campo de texto de la foto.
  FocusNode fotoFocusNode = FocusNode();
}
