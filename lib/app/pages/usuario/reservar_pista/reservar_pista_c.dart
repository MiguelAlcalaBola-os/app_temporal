// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/app/data/models/datos_reservas_pista.dart';
import 'package:reservatu_pista/app/data/models/detalles_pista_reserva_model.dart';
import 'package:reservatu_pista/app/data/models/localidad_model.dart';
import 'package:reservatu_pista/app/data/models/reservas_usuario_model.dart';
import 'package:reservatu_pista/app/data/provider/datos_server.dart';
import 'package:reservatu_pista/app/data/provider/proveedor_node.dart';
import 'package:reservatu_pista/app/data/provider/reservas_node.dart';
import 'package:reservatu_pista/app/data/services/db_s.dart';
import 'package:reservatu_pista/app/mixin/reservar_pista_mixin.dart';
import 'package:reservatu_pista/app/pages/usuario/reservar_pista/controllers/db_alvaro_c.dart';
import 'package:reservatu_pista/app/pages/usuario/reservar_pista/widgets/dialogs_messages.dart';
import 'package:reservatu_pista/app/pages/usuario/reservar_pista/widgets/size_move.dart';
import 'package:reservatu_pista/app/routes/app_pages.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_util.dart';
import 'package:reservatu_pista/utils/animations/list_animations.dart';
import 'package:reservatu_pista/utils/buttons_sounds.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:reservatu_pista/utils/loader/color_loader_3.dart';

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

class ReservarPistaController extends GetxController
    with GetTickerProviderStateMixin, ReservarPistaMixin {
  /// Para que se registren los usuarios en tenis con un cupon de descuento, esto se tiene que quitar, es gratis
  bool idProveedorTenis = false;

  /// Codigo de descuento ficticio
  final codigoFicticio = false.obs;
  final validarCodigoFicticio = false.obs;
  final precioCupon = 0.obs;
  bool codigoDescuentoUsuarioExiste = false;
  int? idCupon; // id_cupon en caso de que exista

  // Tamano de cada widget
  SizeMove sm = SizeMove();

  /// Todos los dialogos al reservar la pista
  late DialogsMessages dm;

  // Global key para el form de los inputs
  final formKey = GlobalKey<FormState>();

  /// Tiempo de reserva para el calendario
  final _tiempoReserva = 0.obs;
  int get tiempoReserva => _tiempoReserva.value;
  set tiempoReserva(int value) => _tiempoReserva.value = value;

  /// Datos usuarios a reservar
  final usuario = Rx<ReservaUsuario>(ReservaUsuario());
  final DBAlvaroController db2 = Get.find();
  final DBService db = Get.find();
  // Widget localidades Variables
  final localidades = Rx<List<String>>([]);
  LocalidadModel listLocalidades = LocalidadModel(localidades: []);
  final cod_postal = ''.obs;
  String localidad_seleccionada = '';

  /// Widget clubes Variables
  final clubes = Rx<List<String>>([]);
  final id_club_seleccionado = ''.obs;
  final Map<String, String> mapClubes = {};

  /// Widget deportes Variables
  final deportes = Rx<List<String>>([]);
  final Map<String, String> mapDeportes = {};
  final deporte_seleccionado = ''.obs;

  /// Widget pistas Variables
  final pistas = Rx<List<DetallesPistaReservaModel>>([]);
  final id_pista_seleccionada = Rx<int>(0);
  bool pista_automatizada = false;
  final selectPista = Rxn<int>(0);

  /// Widget horarios Variables
  bool pista_con_luces = false;
  int precio_con_luz_no_socio = 0;
  int precio_con_luz_socio = 0;
  int precio_sin_luz_socio = 0;
  int precio_sin_luz_no_socio = 0;

  // Ver modificaciones al seleccionar el horario
  final _hora_inicio_reserva_seleccionada = '00:00:00'.obs;
  String get hora_inicio_reserva_seleccionada =>
      _hora_inicio_reserva_seleccionada.value;
  set hora_inicio_reserva_seleccionada(String value) =>
      _hora_inicio_reserva_seleccionada.value = value;
  final selectHorario = Rxn<HorarioFinInicio>();
  String hora_fin_reserva_seleccionada = '01:00:00';
  int duracion_partida = 0;
  int plazas_a_reservar = 1;

  /// Widget Calendario Variables
  final fecha_seleccionada = Rx<DateTime>(
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day));
  final selectDateDay = Rx<DateTime?>(null);
  late List<DateTime?> singleDatePickerValueWithDefaultValue;

  // Globales para mostrar datos
  int plazasLibres = 0;
  int capacidad_pista = 4;
  int precio_a_mostrar = 0;
  int precio_elegido = 0;

  // Select Usuarios Widget
  final cancelarReserva = false.obs;

  // Todos los controladores
  final deporteController = TextEditingController();
  final deporteFocusNode = FocusNode();
  final clubController = TextEditingController();
  final clubFocusNode = FocusNode();
  final codigoDescuentoController = TextEditingController();

  /// Animaciones
  late AnimationController animTerminos;
  late AnimationController animPay;

  /// Obtener los usuarios con reservas
  final reservas_usuarios = Rxn<ReservasUsuarios>();
  // Verificar si las reservas son abiertas y si ha solicitado todas las reservas siendo el mismo
  bool totalMisReservas = false;

  // Selection Forma de pago 0: monedero, 1: Tarjeta, 2: Efecto or Club
  final selectPay = Rxn<int>(null);

  @override
  void onInit() async {
    super.onInit();
    generarListaLocalidades();
    animTerminos = animVibrate(vsync: this);
    animPay = animVibrate(vsync: this);
    db.getMoney();
    sm.insertDebounce();
    singleDatePickerValueWithDefaultValue = [DateTime.now()];
  }

  /// Empieza del 0 al 3
  void visibilidadWidget(int indexVisibility) {
    List<Rx> rxDatos = [
      deporte_seleccionado,
      selectDateDay,
      _tiempoReserva,
      selectHorario,
    ];
    List<dynamic> change = ['', null, 0, null];
    for (var i = indexVisibility; i < 4; i++) {
      rxDatos[i].value = change[i];
      print('visibilidadWidget');
    }
  }

  void onChangedDay(DateTime dayDate) {
    fecha_seleccionada.value =
        DateTime(dayDate.year, dayDate.month, dayDate.day);
    selectDateDay.value = dayDate;
    _hora_inicio_reserva_seleccionada.value = '00:00:00';
    selectHorario.value = null;
    selectPay.value = null;
    selectDateDay.refresh();
    sm.moveCalendar();
  }

  void onConfirmar() {
    if (!formKey.currentState!.validate() || selectPay.value == null) {
      if (selectPay.value == null) {
        animPay.forward();
      }
      return;
    }
    if (selectHorario.value == null) {
      return;
    }
    if (selectPay.value != null) {
      final changePrecio =
          codigoFicticio.isTrue ? precioCupon.value : precio_a_mostrar;
      print('changePrecio ${changePrecio}');
      final precioResta = db.dineroTotal - (changePrecio);
      if (precioResta < 0 && changePrecio != 0) {
        dm.reservaNoMoney();
      } else {
        if (selectPay.value == 1) {
          /// Pago con tarjeta
          dm.reservarTarjeta(
              precio: changePrecio.euro,
              onPressedButton: () => db2.reservarPistaConTarjeta(
                  changePrecio, this, dm.reservarProceso));
        } else {
          /// Reserva con Monedeo
          dm.reservarMonedero(
              precio: changePrecio.euro,
              onPressedButton: () => reservarPistaF(changePrecio));
        }
      }
    }
    ButtonsSounds.playSound();
  }

  void reservarPistaF(int changePrecio) async {
    try {
      Get.dialog(ColorLoader3());
      String? referencia = await ReservasProvider().reservarPista(
          db.idUsuario,
          changePrecio,
          fecha_seleccionada.value,
          hora_inicio_reserva_seleccionada,
          id_pista_seleccionada.value.toString(),
          usuario.value.plazasReservadas,
          selectedRadio.value,
          codigoFicticio.value,
          idCupon,
          codigoDescuentoController.text);
      Get.back();
      if (referencia is String) {
        // await EmailProvider().emailReservas(
        //     id_pista_seleccionada.value.toString(),
        //     db.email,
        //     referencia,
        //     fecha_seleccionada.value.toString().substring(0, 10),
        //     hora_inicio_reserva_seleccionada.value,
        //     hora_fin_reserva_seleccionada.value,
        //     localidad_seleccionada.value,
        //     deporteController.text,
        //     (selectPista.value! + 1).toString(),
        //     'monedero',
        //     db.nombre,
        //     plazas_a_reservar.value.toString());
        dm.reservarSuccess(
            onPressed: () => {Get.back(), Get.offNamed(Routes.MIS_RESERVAS)});
      } else {
        dm.reservaError();
      }
    } catch (e) {}
  }

  Future<void> obtenerPlazasLibres() async {
    try {
      // Iniciarlizar el usuario con los datos guardados
      usuario.value = ReservaUsuario(
          idUsuario: db.idUsuario,
          nick: db.nick,
          nivel: db.nivel == '' ? '0.0' : db.nivel,
          imagen: db.fotoUsuario,
          plazasReservadas: 1);
      final idPista = id_pista_seleccionada.value.toString();
      final fecha = fecha_seleccionada.value.formatDate;
      final horaInicio = hora_inicio_reserva_seleccionada;
      final result = await ReservasProvider()
          .obtenerPlazasLibres(idPista, fecha, horaInicio);
      if (result is ReservasUsuarios) {
        /// refrescar todo
        reservas_usuarios.value = result;
        plazasLibres = capacidad_pista - result.plazasReservadasTotales;
        codigoDescuentoController.text = result.codigoCupon;
        codigoDescuentoUsuarioExiste = result.codigoCupon != '';
        // usuario.value.plazasReservadas = 1;
        // cancelarReserva.value = false;
        // totalMisReservas = false;
        // plazas_a_reservar = 0;
        // plazas_a_reservar = 4;
        usuario.value.plazasReservadas = capacidad_pista;
        cancelarReserva.value = true;
        totalMisReservas = true;
        usuario.refresh();
        sm.moveHorarios();
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> generarListaLocalidades() async {
    try {
      dynamic localidadesJson = await obtenerLocalidades();
      // Convertir la cadena JSON en una lista de mapas
      listLocalidades = LocalidadModel.fromRawJson(localidadesJson);
      List<String> listaLocalidades = listLocalidades.localidades
          .map<String>((localidad) => localidad.localidad)
          .toList();
      localidades.value = listaLocalidades;
      return;
    } catch (error) {
      rethrow;
    }
  }

  Future<dynamic> obtenerLocalidades() async {
    try {
      var url = '${DatosServer.urlServer}/usuario/obtener_localidades';
      var response = await http.get(Uri.parse(url));

      return response.body;
    } catch (error) {
      print('eeeeeeeeerrrrooor: $error');
      rethrow;
    }
  }

  //funcion para obtener los clubes que hay en cada localidad
  Future<void> generarListaClubes(
      String cod_postal, List<String> codigos_postales) async {
    try {
      //resets
      clubController.text = '';
      deporteController.text = '';
      clubes.value = [];
      deportes.value = [];

      List<dynamic> clubesCodPostal =
          await ProveedorProvider().obtenerClubes(codigos_postales);

      for (var i = 0; i < clubesCodPostal.length; i++) {
        mapClubes[clubesCodPostal[i]['nombre']] =
            clubesCodPostal[i]['id_club'].toString();
        if (clubesCodPostal[i]['id_proveedor'] == 65) {
          idProveedorTenis = true;
        }
      }

      List<String> listaClubes = clubesCodPostal
          .map<String>((club) => club['nombre'] as String)
          .toList();
      clubes.value = listaClubes;
      return;
    } catch (error, stack) {
      print('stack: ${stack}');
      print('errorr $error');
      rethrow;
    }
  }

  //funcion para obtener los deportes que hay en cada pista de los clubes
  Future<void> generarListaDeportes(String id_club) async {
    //deporteController.text = '';
    deporte_seleccionado.value = '';
    try {
      String deportesJson = await db2.obtenerDeportes(id_club);
      if (deportesJson == '{}') {
        deportes.value = [];
        return;
      }
      List<dynamic> deportesData = json.decode(deportesJson);

      List<String> listaDeportes = deportesData
          .map<String>((deporte) => deporte['deporte'] as String)
          .toList();
      deportes.value = listaDeportes;
      return;
    } catch (error, stack) {
      print('stack: ${stack}');
      print('errorrrrrrrr $error');
      rethrow;
    }
  }

  void onPressedPista(int index, String idPista) {
    bool estaAutomatizada(idPista) {
      List<DetallesPistaReservaModel> listPistas = pistas.value;
      print('estaAutomatizada : $listPistas');
      for (int i = 0; i < listPistas.length; i++) {
        if (listPistas[i].idPista == idPista) {
          return listPistas[i].automatizada == 1;
        }
      }
      return false;
    }

    int obtenerDuracionPartida(idPista) {
      List<DetallesPistaReservaModel> listPistas = pistas.value;
      for (int i = 0; i < listPistas.length; i++) {
        if (listPistas[i].idPista == idPista) {
          return listPistas[i].duracionPartida;
        }
      }
      return 60;
    }

    onPressedBuildChip(index);
    id_pista_seleccionada.value = int.parse(idPista);
    print('id_pista_seleccionada $id_pista_seleccionada');
    pista_automatizada = estaAutomatizada(id_pista_seleccionada.value);
    duracion_partida = obtenerDuracionPartida(id_pista_seleccionada.value);
  }

  void onPressedBuildChip(int index) {
    selectHorario.value = null;
    hora_inicio_reserva_seleccionada = '00:00:00';
    selectPista.value = index;
    tiempoReserva = pistas.value[index].tiempoReservaNoSocio;
    _tiempoReserva.refresh();
    selectDateDay.refresh();
    onChangedDay(DateTime.now());
    // sm.movePista();
  }

//funcion para obtener las pistas que hay en cada club
  Future<void> generarListaPistas(String id_club, String deporte) async {
    //deporteController.text = '';
    try {
      String pistasJson = await db2.obtenerPistas(id_club, deporte);
      if (pistasJson.isEmpty) {
        pistas.value = [];
        return;
      }

      pistas.value =
          detallesPistaReservaModelFromJsonList(json.decode(pistasJson));
      //POR DEFECTO SIEMPRE COGE COMO SELECCIONADA LA PRIMERA QUE DEVUELVE LA BASE DE DATOS
      id_pista_seleccionada.value = pistas.value[0].idPista;
      duracion_partida = pistas.value[0].duracionPartida;
      pista_automatizada = (pistas.value[0].automatizada == 1) ? true : false;
      capacidad_pista = pistas.value[0].capacidad;
      visibilidadWidget(2);
      onPressedBuildChip(0);
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
      String response =
          await db2.obtenerHorariosPistas(idPista, dia_seleccionado);
      if (response.length <= 0) return [];
      List<dynamic> datosPista2 = json.decode(response);
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

  @override
  void dispose() {
    // Dispose de los TextEditingControllers
    deporteController.dispose();
    clubController.dispose();
    codigoDescuentoController.dispose();

    // Dispose de los FocusNodes
    deporteFocusNode.dispose();
    clubFocusNode.dispose();

    // Dispose de los AnimationControllers
    animTerminos.dispose();
    animPay.dispose();

    super.dispose();
  }
}
