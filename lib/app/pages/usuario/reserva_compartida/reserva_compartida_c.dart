// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:reservatu_pista/app/data/models/datos_reservas_pista.dart';
import 'package:reservatu_pista/app/data/models/reserva_compartida_model.dart';
import 'package:reservatu_pista/app/data/models/reservas_usuario_model.dart';
import 'package:reservatu_pista/app/data/provider/datos_server.dart';
import 'package:reservatu_pista/app/data/provider/email_node.dart';
import 'package:reservatu_pista/app/data/provider/reservas_node.dart';
import 'package:reservatu_pista/app/data/services/db_s.dart';
import 'package:reservatu_pista/app/pages/usuario/reservar_pista/controllers/db_alvaro_c.dart';
import 'package:reservatu_pista/utils/animations/list_animations.dart';
import 'package:reservatu_pista/utils/buttons_sounds.dart';
import 'package:reservatu_pista/utils/dialog/rich_alert_flutterflow.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

extension ExtDateTime on DateTime {
  String get formatDate =>
      '${year.toString()}-${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')}';
}

class HorarioFinInicio {
  HorarioFinInicio(
      {required this.inicio,
      required this.termino,
      required this.typeEstadoHorario});

  final String inicio;
  final String termino;
  final TypeEstadoHorario typeEstadoHorario;
  bool isEquals(HorarioFinInicio horaFinInicio) {
    final bool validar =
        horaFinInicio.inicio == inicio && horaFinInicio.termino == termino;
    return validar;
  }
}

class ReservaCompartidaController extends GetxController
    with GetTickerProviderStateMixin {
  /// Reservas Usuario

  /// Datos usuarios a reservar
  final usuario = Rxn<ReservaUsuario>();
  DBAlvaroController db2 = Get.find();
  DBService db = Get.find();
  Rx<List<dynamic>> pistas = Rx<List<dynamic>>([]);
  Rx<int> id_pista_seleccionada = Rx<int>(0);
  Rx<bool> pista_automatizada = Rx<bool>(false);
  Rx<bool> pista_con_luces = Rx<bool>(false);
  Rx<String> hora_apertura_pista = Rx<String>('');
  Rx<String> hora_cierre_pista = Rx<String>('');
  Rx<int> duracion_partida = Rx<int>(0);
  Rx<DateTime> fecha_seleccionada = Rx<DateTime>(
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day));
  Rx<String> hora_inicio_reserva_seleccionada = Rx<String>('00:00:00');
  Rx<String> hora_fin_reserva_seleccionada = Rx<String>('01:00:00');
  Rx<int> plazas_a_reservar = Rx<int>(1);
  //variable que almacenara la diferencia entre la capacidad de la pista y las plazas que quiere reservar el user, para no tener que estar seteando constantemente la diferencia
  int plazasLibres = 0;
  int capacidad_pista = 4;
  Rx<int?> selectLocalidad = Rx<int?>(null);
  Rx<String> localidad_seleccionada = Rx<String>('');
  Rx<int?> selectClub = Rx<int?>(null);
  Rx<int?> selectDeporte = Rx<int?>(null);
  // Rx<int?> selectedDay = Rx<int?>(null);
  Rx<int?> selectPista = Rx<int?>(null);
  Rx<int?> selectDay = Rx<int?>(null);
  Rx<String?> selectedItemDeporte = Rx<String?>(null);
  final precio_con_luz_socio = 0;
  final precio_con_luz_no_socio = 0;
  final precio_sin_luz_socio = 0;
  final precio_sin_luz_no_socio = 0;
  Rx<int> precio_elegido = Rx<int>(0);
  Rx<int> precio_a_mostrar = 0
      .obs; //PRECIO QUE SE MOSTRARÁ AL USUARIO A LA HORA DE RESERVAR ALGUNA PISTA. Se calcula multiplicando el precio obtenido de la reserva por las plazas que se va a reservar
  // late SharedPreferences storage;
  // Cancelar la reserva
  final cancelarReserva = false.obs;

  Rx<HorarioFinInicio?> selectHorario = Rx<HorarioFinInicio?>(null);
  final ScrollController scrollController = ScrollController();
  Rx<DateTime?> selectDateDay = Rx<DateTime?>(null);
  RxList<bool> listReservas = [false, false, false, false].obs;
  TextEditingController localidadController = TextEditingController();
  FocusNode localidadFocusNode = FocusNode();
  TextEditingController deporteController = TextEditingController();
  FocusNode deporteFocusNode = FocusNode();
  TextEditingController PistaController = TextEditingController();
  FocusNode PistaFocusNode = FocusNode();
  TextEditingController nPistaController = TextEditingController();
  FocusNode nPistaFocusNode = FocusNode();
  TextEditingController clubController = TextEditingController();
  FocusNode clubFocusNode = FocusNode();
  TextEditingController codigoDescuentoController = TextEditingController();

  /// Global Keys
  GlobalKey keyInputs = GlobalKey();
  GlobalKey keyCalendar = GlobalKey();
  GlobalKey keyHorarios = GlobalKey();
  GlobalKey keyPistas = GlobalKey();
  GlobalKey keyDatos = GlobalKey();

  int diaHoy = 0;
  // Checar si los terminos y condiciones son aceptados
  late AnimationController animTerminos;

  RxDouble totalHeight = 0.0.obs;
  RxDouble sizedBoxHeight = 0.0.obs;
  late DateTime fechaActual;
  // late List<DateTime> tiempoReservaListaCalendar;

  final appBarAndNavBar = 120;
  PageController pageViewController = PageController();

  /// Obtener los usuarios con reservas
  final reservas_usuarios = Rxn<ReservasUsuarios>();
  // Verificar si las reservas son abiertas y si ha solicitado todas las reservas siendo el mismo
  bool totalMisReservas = false;

  // Selection controller
  final SelectionController selectionController = SelectionController();

  late ReservasCompartidas detallesReserva;
  // Anim

  @override
  void onInit() async {
    super.onInit();
    animTerminos = animVibrate(vsync: this);
    await inicializarDatos();

    fechaActual = DateTime.now();
    db.getMoney();
  }

  Future<void> inicializarDatos() async {
    try {
      await db.getDB();
      final result = await ReservasProvider().reservaCompartida(db.idReserva);
      if (result is ReservasCompartidas) {
        detallesReserva = result;
        id_pista_seleccionada.value = result.idPista;
        fecha_seleccionada.value = result.fechaReserva;
        hora_inicio_reserva_seleccionada.value = result.horaInicio;

        await obtenerPlazasLibres();
        // Iniciarlizar el usuario con los datos guardados
        usuario.value = ReservaUsuario(
            idUsuario: db.idUsuario,
            nick: db.nick,
            imagen: db.fotoUsuario,
            plazasReservadas: 1);
      }
    } catch (e, st) {
      print('onInit Error $e');
      print('onInit Stack $st');
    }
  }

  void onConfirmar() {
    double precioReserva = precio_a_mostrar.value / 100; //euros
    if (selectionController.selectedOption.value != '' &&
        selectionController.selectedOption.value != 'rellenar') {
      final precio = db.dineroTotal - (precio_a_mostrar.value);
      print('preciooooooooooo ${precio}'); //(0 - 4.0);
      if (precio < 0) {
        if (selectionController.selectedOption.value == 'tarjeta') {
          print('preciooooooooooo tarjeta');
          Get.dialog(RichAlertFlutterFlow(
            alertType: TypeAlert.NONE,
            alertTitle: 'Reservar Pista',
            alertSubtitle: '¿Desea reservar la pista directamente con tarjeta?',
            textButton: '',
            acceptButton: MaterialButton(
              color: Colors.green,
              onPressed: () => () => db2.reservarPistaCompartida(
                  dinero: precio_a_mostrar.value,
                  capacidad_pista: capacidad_pista,
                  fecha_seleccionada: fecha_seleccionada.value,
                  hora_fin_reserva_seleccionada:
                      hora_fin_reserva_seleccionada.value,
                  hora_inicio_reserva_seleccionada:
                      hora_inicio_reserva_seleccionada.value,
                  id_pista_seleccionada: id_pista_seleccionada.value,
                  plazasLibres: plazasLibres),
              splashColor: Colors.lightGreen,
              child: const Text(
                'Aceptar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
            cancelButton: MaterialButton(
              color: Colors.red,
              onPressed: () => Get.back(),
              splashColor: Colors.redAccent,
              child: const Text(
                'Cancelar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
            precio: '${precioReserva.toStringAsFixed(2)} €',
            onPressed: () {
              Get.back();
            },
          ));
        } else {
          Get.dialog(RichAlertFlutterFlow(
            alertType: TypeAlert.NONE,
            alertTitle: 'Reservar Pista',
            alertSubtitle:
                'No tienes saldo suficiente, debes recargar para poder reservar.',
            textButton: 'Aceptar',
            precio: '${precioReserva.toStringAsFixed(2)} €',
            onPressed: () {
              Get.back();
            },
          ));
        }
      } else {
        if (selectionController.selectedOption.value == 'tarjeta') {
          print('preciooooooooooo tarjeta');
          Get.dialog(RichAlertFlutterFlow(
            alertType: TypeAlert.NONE,
            alertTitle: 'Reservar Pista',
            alertSubtitle: '¿Desea reservar la pista directamente con tarjeta?',
            textButton: '',
            acceptButton: MaterialButton(
              color: Colors.green,
              onPressed: () => db2.reservarPistaCompartida(
                  dinero: precio_a_mostrar.value,
                  capacidad_pista: capacidad_pista,
                  fecha_seleccionada: fecha_seleccionada.value,
                  hora_fin_reserva_seleccionada:
                      hora_fin_reserva_seleccionada.value,
                  hora_inicio_reserva_seleccionada:
                      hora_inicio_reserva_seleccionada.value,
                  id_pista_seleccionada: id_pista_seleccionada.value,
                  plazasLibres: plazasLibres),
              splashColor: Colors.lightGreen,
              child: const Text(
                'Aceptar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
            cancelButton: MaterialButton(
              color: Colors.red,
              onPressed: () => Get.back(),
              splashColor: Colors.redAccent,
              child: const Text(
                'Cancelar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
            precio: '${precioReserva.toStringAsFixed(2)} €',
            onPressed: () {
              Get.back();
            },
          ));
        } else {
          Get.dialog(RichAlertFlutterFlow(
            alertType: TypeAlert.NONE,
            alertTitle: 'Reservar Pista',
            alertSubtitle: '¿Desea reservar la pista?',
            textButton: '',
            acceptButton: MaterialButton(
              color: Colors.green,
              onPressed: reservarPistaF,
              splashColor: Colors.lightGreen,
              child: const Text(
                'Aceptar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
            cancelButton: MaterialButton(
              color: Colors.red,
              onPressed: () => Get.back(),
              splashColor: Colors.redAccent,
              child: const Text(
                'Cancelar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
            precio: '${precioReserva.toStringAsFixed(2)} €',
            onPressed: Get.back,
          ));
        }
      }
    }
    ButtonsSounds.playSound();
  }

  void reservarPistaF() async {
    String? referencia = await db2.reservarPista(
        db.idUsuario,
        precio_a_mostrar.value,
        fecha_seleccionada.value,
        hora_inicio_reserva_seleccionada.value,
        id_pista_seleccionada.value.toString(),
        usuario.value!.plazasReservadas,
        2);
    if (referencia is String) {
      await EmailProvider().emailReservas(
          id_pista_seleccionada.value.toString(),
          db.email,
          referencia,
          fecha_seleccionada.value.toString().substring(0, 10),
          hora_inicio_reserva_seleccionada.value,
          hora_fin_reserva_seleccionada.value,
          localidad_seleccionada.value,
          deporteController.text,
          (selectPista.value! + 1).toString(),
          'monedero',
          db.nombre,
          plazas_a_reservar.value.toString());
      Get.defaultDialog(
        title: "Reserva exitosa",
        middleText: "La pista se ha reservado correctamente.",
        actions: [
          TextButton(
            onPressed: () {
              // Get.toNamed(Routes.MIS_RESERVAS);
              Get.back();
              Get.back();
            },
            child: const Text('Aceptar'),
          ),
        ],
      );
    } else {
      Get.defaultDialog(
        title: "Error al reservar pista",
        middleText: "La pista no se ha podido reservar.",
        actions: [
          TextButton(
            onPressed: () {
              Get.back(); // Cierra la alerta
            },
            child: const Text('Aceptar'),
          ),
        ],
      );
    }
  }

  Future<void> obtenerPlazasLibres() async {
    final idPista = id_pista_seleccionada.value.toString();
    final fecha = fecha_seleccionada.value.formatDate;
    final horaInicio = hora_inicio_reserva_seleccionada.value;
    final result = await ReservasProvider()
        .obtenerPlazasLibres(idPista, fecha, horaInicio);
    if (result is ReservasUsuarios) {
      reservas_usuarios.value = result;

      /// refrescar todo
      reservas_usuarios.value = result;
      plazasLibres = capacidad_pista - result.plazasReservadasTotales;
      cancelarReserva.value = false;
      totalMisReservas = false;
      usuario.refresh();
      print('plazaslibressss $plazasLibres');
      print('reservas_usuarios.valueeee ${reservas_usuarios.value}');
    }
  }

  Future<String> obtenerLocalidades() async {
    try {
      var url = '${DatosServer.urlServer}/usuario/obtener_localidades';
      var response = await http.get(Uri.parse(url));
      return response.body.toString();
    } catch (error) {
      print('eeeeeeeeerrrrooor: $error');
      rethrow;
    }
  }

//funcion para obtener las pistas que hay en cada club
  Future<void> generarListaPistas(String id_club, String deporte) async {
    //deporteController.text = '';
    try {
      String pistasJson = await db2.obtenerPistas(id_club, deporte);
      print('pistasJson $pistasJson');
      if (pistasJson.isEmpty) {
        pistas.value = [];
        return;
      }
      print('llega akiiii');

      // List<dynamic> pistasData = json.decode(pistasJson);
      pistas.value = json.decode(pistasJson);
      print('llega akiiii22');
      //POR DEFECTO SIEMPRE COGE COMO SELECCIONADA LA PRIMERA QUE DEVUELVE LA BASE DE DATOS
      id_pista_seleccionada.value = pistas.value[0]['id_pista'];
      print('id_pista_seleccionada ${id_pista_seleccionada.value}');
      duracion_partida.value = pistas.value[0]['duracion_partida'];
      print('duracion_partida.value ${duracion_partida.value}');
      pista_automatizada.value =
          (pistas.value[0]['automatizada'] == 1) ? true : false;
      capacidad_pista = pistas.value[0]['capacidad'];
      print('capacidad_pistaaaaa ${capacidad_pista}');
      print('pista_automatizadaaa ${pista_automatizada.value}');
      /* List<String> listaPistas = pistasData
          .map<String>((pista) => pista['id_pista'].toString())
          .toList();*/
      return;
    } catch (error, stack) {
      print('stack: ${stack}');
      print('$error');
      rethrow;
    }
  }

  Future<List<dynamic>> generarListaHorarios(
      int idPista, DateTime dia_seleccionado) async {
    try {
      print('responseeeeeeeeeeee00');
      String response =
          await db2.obtenerHorariosPistas(idPista, dia_seleccionado);
      print('responseeeeeeeeeeee11 ${response}');
      if (response.length <= 0) return [];
      print('responseeeeeeeeeeee22 ${response}');
      List<dynamic> datosPista2 = json.decode(response);
      print('datosPista22 ${datosPista2}');
      return datosPista2;
    } catch (error, stack) {
      print('stack: ${stack}');
      print('errorrrrr $error');
      rethrow;
    }
  }

  DateTime fechaAnterior() {
    // Obtén la fecha y hora actual
    DateTime fechaActual = DateTime.now();

    // Crea una duración de un día (24 horas)
    const unDia = Duration(days: 1);

    // Resta un día a la fecha actual
    return fechaActual.add(unDia);
  }

  DateTime getAddDia(int days) {
    final addDia = Duration(days: days);
    return fechaActual.add(addDia);
  }

  SvgPicture _buildSvgIcon(String asset) {
    return SvgPicture.asset(
      asset,
      height: 5,
      width: 5,
      fit: BoxFit.fill,
      colorFilter: const ColorFilter.mode(
          Color.fromARGB(255, 145, 145, 145), BlendMode.srcIn),
    );
  }
}

class SelectionController {
  ValueNotifier<String?> selectedOption = ValueNotifier<String>('');
}
