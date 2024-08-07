import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reservatu_pista/app/data/models/detalles_pista_model.dart';
import 'package:reservatu_pista/app/data/models/pistas_model.dart';
import 'package:reservatu_pista/app/data/provider/datos_server.dart';
import 'package:reservatu_pista/app/data/provider/pista_node.dart';
import 'package:reservatu_pista/app/global_widgets/dialog/answer_dialog.dart';
import 'package:reservatu_pista/app/pages/profesional/anadir_pista/widgets/pista_editar_model.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_util.dart';
import 'package:reservatu_pista/utils/dialog/message_server_dialog.dart';
import 'package:reservatu_pista/utils/image/funciones_image.dart';
import 'package:reservatu_pista/utils/loader/color_loader_3.dart';
import 'package:image/image.dart' as img;
import 'package:reservatu_pista/utils/logs_developer.dart';
import '../../../../utils/animations/list_animations.dart';
import '../../../../utils/state_getx/state_mixin_demo.dart';
import '../../../routes/app_pages.dart';
import '../../../data/models/tarifas_model.dart';
import '../tarifas_pista/tarifas_pista_c.dart';

const deportes = {
  'Pádel': '🎾',
  'Tenis': '🎾',
  'Badminton': '🏸',
  'P. climatizada': '🏊‍♀️',
  'Piscina': '🏊‍♀️',
  'Baloncesto': '🏀',
  'Futbol sala': '⚽',
  'Futbol 7': '⚽',
  'Futbol 11': '⚽',
  'Pickleball': '🥍',
  'Squash': '🏸',
  'Tenis de mesa': '🏓',
  'Fronton': '🏓',
  'Balomano': '⚽',
  'Rugby': '🏉',
  'Multideporte': '🥅',
};

extension ExtDeporteIcon on String {
  String get icon => '${deportes[this]} $this';
}

String getDeporte(String val) {
  final split = val.split(' ');
  split.removeAt(0);
  return split.join(' ');
}

extension ExtConvertTextField on String {
  bool get sn => this == 'Si' ? true : false;
  String get de => getDeporte(this);
  int get dp => this == '60 Minutos' ? 60 : 90;
  String get tm => '$this:00';
  int get trOtc => int.parse(split(' ')[0]);
  int get pc =>
      int.parse('${split(' ')[0].split(',')[0]}${split(' ')[0].split(',')[1]}');
}

extension ExtEditarPista on int {
  String get sn => this == 0 ? 'No' : 'Si';
  bool get snb => this != 0;
}

class InputController {
  InputController(this.anim);
  TextEditingController controller = TextEditingController();
  FocusNode focus = FocusNode();
  RxBool isValidate = false.obs;
  GlobalKey key = GlobalKey();
  AnimationController anim;
}

class AnadirPistaController extends GetxController
    with GetTickerProviderStateMixin {
  /// Verificar si los datos han cambiado
  late PistaEditarModel pem;

  /// Verificar si la pista se va a editar o se va a crear
  int idPista = 0;
  bool isModificar = false;
  bool isMultiplesImagenesModificada = false;

  /// Termina el cmanio entre pantallas
  RxBool isValidBtnTarifas = false.obs;
  final TarifasPistaController selfTarifas = Get.find();
  final formKey = GlobalKey<FormState>();
  bool formValidation = true;
  // Controller de slider.
  ScrollController scrollController = ScrollController();
  // Input Controller deporte
  late InputController deporte;
  // Input Controller deporte
  late InputController selectSocio;
  // Input Controller deporte
  late InputController plazasReservar;
  // Input Controller techada
  late InputController techada;
  // Input Controller capacidad
  late InputController capacidad;
  // Input Controller iluminacion
  late InputController iluminacion;
  // Input Controller tipo
  late InputController tipo;
  // Input Controller cesped
  late InputController cesped;
  // Input Controller automatizada
  late InputController automatizada;
  // Input Controller duracionPartida
  late InputController duracionPartida;
  // Input Controller horaInicio
  late InputController horaInicio;
  // Input Controller horaFin
  late InputController horaFin;
  // Input Controller socioTiempoReserva
  late InputController socioTiempoReserva;
  // Input Controller socioTiempoCancelacion
  late InputController socioTiempoCancelacion;
  // Input Controller socioPrecioConLuz
  late InputController socioPrecioConLuz;
  // Input Controller socioPrecioSinLuz
  late InputController socioPrecioSinLuz;
  // Input Controller noSocioTiempoReserva
  late InputController noSocioTiempoReserva;
  // Input Controller noSocioTiempoCancelacion
  late InputController noSocioTiempoCancelacion;
  // Input Controller noSocioPrecioConLuz
  late InputController noSocioPrecioConLuz;
  // Input Controller noSocioPrecioSinLuz
  late InputController noSocioPrecioSinLuz;
  // Input Controller descripcion
  late InputController descripcion;
  // Input Controller nombrePatrocinador
  late InputController nombrePatrocinador;
  // Input Controller foto
  late InputController foto;
  // Input Controller vestuario
  late InputController vestuario;
  // Input Controller duchas
  late InputController duchas;
  // Input Controller efectivo
  late InputController efectivo;
  // Input Controller tarjeta
  late InputController tarjeta;
  // Input Controller bono
  late InputController bono;
  // Input Controller reservatupista
  late InputController reservatupista;
  // Animation Controller imagenesPistaAnim
  late AnimationController imagenesPistaAnim;
  // Animation Controller animTerminos
  late AnimationController animTerminos;
  // Controller numero de pista
  TextEditingController nPistaController = TextEditingController();
// Focus al InputController, solo a uno
  bool focusInputController = false;
  // Validar si se han creado las tarifas al momento de crear la pista
  RxBool validarTarifas = false.obs;
  // Imagenes de la pistas
  final imagesPista = StateRx(Rx<List<dynamic>>([]));
  // Lista de los horarios para crear las tarifas
  Rx<List<String>> listaHorarios = Rx<List<String>>([]);
  // Imagen del patrocinador
  final imagePatrocinador = FuncionesImage(isProveedor: true);
  // Provider para las peticiones de la pista
  final provider = PistaProvider();
  @override
  void onInit() {
    super.onInit();
    final paramIdPista = Get.parameters['id_pista'];
    idPista = paramIdPista != null ? int.parse(paramIdPista) : 0;
    isModificar = idPista != 0;
    imagesPista.change([], RxStatusDemo.success());
    ever(isValidBtnTarifas, (callback) {
      if (!callback) {
        final listValidators = [
          duracionPartida.controller.text,
          horaInicio.controller.text,
          horaFin.controller.text,
          socioPrecioConLuz.controller.text,
          socioPrecioSinLuz.controller.text,
          noSocioPrecioConLuz.controller.text,
          noSocioPrecioSinLuz.controller.text
        ];
        bool btnTarifas = true;
        for (String element in listValidators) {
          if (element.isEmpty) {
            btnTarifas = false;
            break;
          }
        }
        if (btnTarifas) {
          isValidBtnTarifas.value = true;
        }
      }
    });

    deporte = InputController(animVibrate(vsync: this));
    techada = InputController(animVibrate(vsync: this));
    capacidad = InputController(animVibrate(vsync: this));
    iluminacion = InputController(animVibrate(vsync: this));
    tipo = InputController(animVibrate(vsync: this));
    cesped = InputController(animVibrate(vsync: this));
    automatizada = InputController(animVibrate(vsync: this));
    duracionPartida = InputController(animVibrate(vsync: this));
    horaInicio = InputController(animVibrate(vsync: this));
    horaFin = InputController(animVibrate(vsync: this));
    socioTiempoReserva = InputController(animVibrate(vsync: this));
    socioTiempoCancelacion = InputController(animVibrate(vsync: this));
    socioPrecioConLuz = InputController(animVibrate(vsync: this));
    socioPrecioSinLuz = InputController(animVibrate(vsync: this));
    noSocioTiempoReserva = InputController(animVibrate(vsync: this));
    noSocioTiempoCancelacion = InputController(animVibrate(vsync: this));
    noSocioPrecioConLuz = InputController(animVibrate(vsync: this));
    noSocioPrecioSinLuz = InputController(animVibrate(vsync: this));
    descripcion = InputController(animVibrate(vsync: this));
    nombrePatrocinador = InputController(animVibrate(vsync: this));
    foto = InputController(animVibrate(vsync: this));
    vestuario = InputController(animVibrate(vsync: this));
    duchas = InputController(animVibrate(vsync: this));
    imagenesPistaAnim = animVibrate(vsync: this);
    efectivo = InputController(animVibrate(vsync: this));
    tarjeta = InputController(animVibrate(vsync: this));
    bono = InputController(animVibrate(vsync: this));
    reservatupista = InputController(animVibrate(vsync: this));
    selectSocio = InputController(animVibrate(vsync: this));
    plazasReservar = InputController(animVibrate(vsync: this));
    animTerminos = animVibrate(vsync: this);
    if (isModificar) {
      _datosPistaEditar();
    }
  }

  void _datosPistaEditar() async {
    try {
      imagesPista.loading();
      final result = await provider.getPista(idPista: idPista);
      if (result is List<dynamic>) {
        if (result.isEmpty) {
          return;
        }
        final detallesPista = DetallesPistaModel.fromJson(result[0]);
        rellenarDatosPista(detallesPista);
      }
      log(('_datosPistaEditar ${jsonEncode(result)}'));
    } catch (e) {
      log(e);
    }
  }

  void rellenarDatosPista(DetallesPistaModel _) {
    deporte.controller.text = _.deporte.icon;
    nPistaController.text = _.numPista.toString();
    capacidad.controller.text = _.capacidad.toString();
    techada.controller.text = _.techada.sn;
    iluminacion.controller.text = _.iluminacion;
    tipo.controller.text = _.tipo;
    cesped.controller.text = _.cesped;
    automatizada.controller.text = _.automatizada.sn;
    duracionPartida.controller.text = '${_.duracionPartida} Minutos';
    horaInicio.controller.text = _.horaInicio.formatHora.substring(0, 5);
    horaFin.controller.text = _.horaFin.formatHora.substring(0, 5);
    socioTiempoReserva.controller.text = '${_.tiempoReservaSocio} Día';
    socioTiempoCancelacion.controller.text =
        '${_.tiempoCancelacionSocio} Horas';
    socioPrecioConLuz.controller.text = _.precioLuzSocio.euro;
    socioPrecioSinLuz.controller.text = _.precioSinLuzSocio.euro;
    noSocioTiempoReserva.controller.text = '${_.tiempoReservaNoSocio} Día';
    noSocioTiempoCancelacion.controller.text =
        '${_.tiempoCancelacionNoSocio} Horas';
    noSocioPrecioConLuz.controller.text = _.precioLuzNoSocio.euro;
    noSocioPrecioSinLuz.controller.text = _.precioSinLuzNoSocio.euro;
    descripcion.controller.text = _.descripcion;
    nombrePatrocinador.controller.text = _.nombrePatrocinador;
    vestuario.controller.text = _.vestuario.sn;
    duchas.controller.text = _.duchas.sn;
    efectivo.controller.text = 'No';
    tarjeta.controller.text = 'No';
    bono.controller.text = 'No';
    reservatupista.controller.text = 'Si';
    // selfTarifas.datosGuardados.value = true;
    imagePatrocinador.imageNetwork.value =
        DatosServer.pista(_.imagenPatrocinador);
    imagesPista.success(_.imagenesPista.split(', '));

    pem = PistaEditarModel(
      techada: IsEdit(_.techada.snb),
      iluminacion: IsEdit(_.iluminacion),
      tipo: IsEdit(_.tipo),
      cesped: IsEdit(_.cesped),
      automatizada: IsEdit(_.automatizada.snb),
      duracionPartida: IsEdit(_.duracionPartida),
      horaInicio: IsEdit(_.horaInicio.substring(0, 5)),
      horaFin: IsEdit(_.horaFin.substring(0, 5)),
      socioTiempoReserva: IsEdit(_.tiempoReservaSocio),
      socioTiempoCancelacion: IsEdit(_.tiempoCancelacionSocio),
      socioPrecioConLuz: IsEdit(_.precioLuzSocio),
      socioPrecioSinLuz: IsEdit(_.precioSinLuzSocio),
      noSocioTiempoReserva: IsEdit(_.tiempoReservaNoSocio),
      noSocioTiempoCancelacion: IsEdit(_.tiempoCancelacionNoSocio),
      noSocioPrecioConLuz: IsEdit(_.precioLuzNoSocio),
      noSocioPrecioSinLuz: IsEdit(_.precioSinLuzNoSocio),
      descripcion: IsEdit(_.descripcion),
      nombrePatrocinador: IsEdit(_.nombrePatrocinador),
      vestuario: IsEdit(_.vestuario.snb),
      duchas: IsEdit(_.duchas.snb),
    );
    //efectivo: IsEdit('_.efectivo'),
    // tarjeta: IsEdit('_.tarjeta'),
    // bono: IsEdit('_.bono'),
    // reservatupista: IsEdit(_.reservatupista)
    isValidBtnTarifas.refresh();
    setDuration(duracionPartida.controller.text);
  }

  void onInitForm() {
    deporte.controller.text = '🎾 Pádel';
    nPistaController.text = '1';
    techada.controller.text = 'Si';
    iluminacion.controller.text = 'Si';
    tipo.controller.text = 'Cristal';
    cesped.controller.text = 'Verde';
    automatizada.controller.text = 'No';
    duracionPartida.controller.text = '60 Minutos';
    horaInicio.controller.text = '00:00';
    horaFin.controller.text = '03:00';
    socioTiempoReserva.controller.text = '10 Día';
    socioTiempoCancelacion.controller.text = '24 Horas';
    socioPrecioConLuz.controller.text = '1.25 €';
    socioPrecioSinLuz.controller.text = '1.00 €';
    noSocioTiempoReserva.controller.text = '6 Día';
    noSocioTiempoCancelacion.controller.text = '12 Horas';
    noSocioPrecioConLuz.controller.text = '2.15 €';
    noSocioPrecioSinLuz.controller.text = '2.00 €';
    descripcion.controller.text = 'Descripcion';
    nombrePatrocinador.controller.text = 'Patrocinador2';
    vestuario.controller.text = 'No';
    duchas.controller.text = 'No';
    efectivo.controller.text = 'No';
    tarjeta.controller.text = 'No';
    bono.controller.text = 'No';
    reservatupista.controller.text = 'Si';
  }

  /// Crear la pista y subirla al servidor
  Future<void> crearPista() async {
    bool validarAnterior = true;
    // if (imagesPista.rx.value.isEmpty) {
    //   validarAnterior = false;
    //   imagesPista.changeActions('validate');
    // }
    if (!selfTarifas.datosGuardados.value) {
      validarAnterior = false;
      validarTarifas.value = true;
    }
    formKey.currentState!.validate();
    if (formValidation && validarAnterior) {
      log("Todos los campos estan completos");
      try {
        Get.dialog(ColorLoader3());
        // Poner nombre en base a la fecha para que no se repita
        String nameFoto = DateTime.now().millisecondsSinceEpoch.toString();
        final imagenesPista = await imagePatrocinador.subirMultiplesImagenes(
            'pistas', nameFoto, imagesPista.rx.value);

        final imagenSubida =
            await imagePatrocinador.convertirSubirImagen('pistas', nameFoto);
        if (imagenSubida) {
          log("Se subio la imagen");
        } else {
          log("No se subio la imagen :/");
          // throw "Error al subir imagen";
        }
        final pistaDatos = PistasModel(
          deporte: deporte.controller.text.de,
          numPista: int.parse(nPistaController.text),
          techada: techada.controller.text.sn,
          capacidad: int.parse(capacidad.controller.text),
          iluminacion: iluminacion.controller.text,
          tipo: tipo.controller.text,
          cesped: cesped.controller.text,
          automatizada: automatizada.controller.text.sn,
          duracionPartida: duracionPartida.controller.text.dp,
          horaInicio: horaInicio.controller.text,
          horaFin: horaFin.controller.text,
          tiempoReservaSocio: socioTiempoReserva.controller.text.trOtc,
          tiempoCancelacionSocio: socioTiempoCancelacion.controller.text.trOtc,
          precioLuzSocio: socioPrecioConLuz.controller.text.pc,
          precioSinLuzSocio: socioPrecioSinLuz.controller.text.pc,
          tiempoReservaNoSocio: noSocioTiempoReserva.controller.text.trOtc,
          tiempoCancelacionNoSocio:
              noSocioTiempoCancelacion.controller.text.trOtc,
          precioLuzNoSocio: noSocioPrecioConLuz.controller.text.pc,
          precioSinLuzNoSocio: noSocioPrecioSinLuz.controller.text.pc,
          descripcion: descripcion.controller.text,
          nombrePatrocinador: nombrePatrocinador.controller.text,
          imagenPatrocinador: nameFoto,
          vestuario: vestuario.controller.text.sn,
          duchas: duchas.controller.text.sn,
          imagenesPista: imagenesPista,
          efectivo: efectivo.controller.text.sn,
          tarjeta: tarjeta.controller.text.sn,
          bono: bono.controller.text.sn,
          reservatupista: reservatupista.controller.text.sn,
        );
        final datosTarifas = [];
        for (final diasTarifas in selfTarifas.listTarifas) {
          for (final tarifa in diasTarifas) {
            datosTarifas.add(tarifa.toList(false));
          }
        }
        const datosTarifasKeys =
            'activado, clases, luz, dia_semana, hora_inicio, hora_fin, precio_con_luz_socio, precio_sin_luz_socio, precio_con_luz_no_socio, precio_sin_luz_no_socio';

        /// Llamar a la api
        final result = await PistaNode().crearPista({
          'pista': pistaDatos.toJson(),
          'tarifas': datosTarifas,
          'tarifas_keys': datosTarifasKeys
        });
        Get.back();

        // Regresar la respuesta
        if (result.code == 2000) {
          return MessageServerDialog(
            context: Get.context!,
            alertType: success,
            title: 'Crear Pista',
            subtitle: result.message,
            onPressed: () => Get.offAllNamed(Routes.PISTAS_PROVEEDOR),
          ).dialog();
        } else {
          return MessageServerDialog(
            context: Get.context!,
            alertType: warning,
            title: 'Crear Pista',
            subtitle: result.message,
            code: result.code,
            onPressed: Get.back,
          ).dialog();
        }
      } catch (e, stack) {
        Get.back();
        log(stack);
        log(e);
      }
    } else {
      formValidation = true;
    }
  }

  /// Crear la pista y subirla al servidor
  Future<void> editarPista() async {
    try {
      // Modificaciones en las tarifas
      pem.horaInicio.isModificado(horaInicio.controller.text);
      pem.horaFin.isModificado(horaFin.controller.text);
      pem.socioPrecioConLuz.isModificado(socioPrecioConLuz.controller.text.pc);
      pem.socioPrecioSinLuz.isModificado(socioPrecioSinLuz.controller.text.pc);
      pem.noSocioPrecioConLuz
          .isModificado(noSocioPrecioConLuz.controller.text.pc);
      pem.noSocioPrecioSinLuz
          .isModificado(noSocioPrecioSinLuz.controller.text.pc);

      if (pem.isModificacionesTarifa() && !selfTarifas.datosGuardados.value) {
        validarTarifas.value = true;
        print('fdskmksdfm');
        return;
      }

      Get.dialog(ColorLoader3());
      // verificar si la imagen se cambio si si la subimos
      String nameFoto = DateTime.now().millisecondsSinceEpoch.toString();
      if (isMultiplesImagenesModificada) {
        final imagenesPista = await imagePatrocinador.subirMultiplesImagenes(
            'pistas', nameFoto, imagesPista.rx.value);
        pem.imagenesPista.isModificado(imagenesPista);
      }

      if (imagePatrocinador.isImagenModificada) {
        final imagenSubida =
            await imagePatrocinador.convertirSubirImagen('pistas', nameFoto);
        if (imagenSubida) {
          log("Se subio la imagen");
          pem.imagenPatrocinador.isModificado(nameFoto);
        } else {
          log("No se subio la imagen :/");
          // throw "Error al subir imagen";
        }
      }

      pem.techada.isModificado(techada.controller.text.sn);
      pem.iluminacion.isModificado(iluminacion.controller.text);
      pem.tipo.isModificado(tipo.controller.text);
      pem.cesped.isModificado(cesped.controller.text);
      pem.automatizada.isModificado(automatizada.controller.text.sn);
      pem.duracionPartida.isModificado(duracionPartida.controller.text.dp);
      pem.socioTiempoReserva
          .isModificado(socioTiempoReserva.controller.text.trOtc);
      pem.socioTiempoCancelacion
          .isModificado(socioTiempoCancelacion.controller.text.trOtc);
      pem.noSocioTiempoReserva
          .isModificado(noSocioTiempoReserva.controller.text.trOtc);
      pem.noSocioTiempoCancelacion
          .isModificado(noSocioTiempoCancelacion.controller.text.trOtc);
      pem.descripcion.isModificado(descripcion.controller.text);
      pem.nombrePatrocinador.isModificado(nombrePatrocinador.controller.text);
      // pem.imagenPatrocinador.isModificado(nameFoto);
      pem.vestuario.isModificado(vestuario.controller.text.sn);
      pem.duchas.isModificado(duchas.controller.text.sn);

      final Map<String, dynamic> jsonEditar = {};
      if (selfTarifas.datosGuardados.value) {
        print(pem.horaFin.textModificado);
        print(pem.horaInicio.textModificado);
        print("dknfks");
        final datosTarifas = [];
        for (final diasTarifas in selfTarifas.listTarifas) {
          for (final tarifa in diasTarifas) {
            print(tarifa.changeTarifa);
            if (tarifa.changeTarifa) {
              datosTarifas.add(tarifa.toList(true));
            }
          }
        }
        if (datosTarifas.isNotEmpty) {
          jsonEditar['tarifas'] = datosTarifas;
          print('datosTarifas: $datosTarifas');
        }
      }
      final datosPista = pem.toJson();
      if (datosPista.keys.isNotEmpty) {
        jsonEditar['pista'] = datosPista;
      }
      // return;
      // pem.imagenesPista.isModificado(imagenesPista);
      // pem.efectivo.isModificado(efectivo.controller.text.sn);
      // pem.tarjeta.isModificado(tarjeta.controller.text.sn);
      // pem.bono.isModificado(bono.controller.text.sn);
      // pem.reservatupista.isModificado(reservatupista.controller.text.sn);
      log(jsonEditar);
      final result = await provider.editarPista(idPista, jsonEditar);
      Get.back();
      // Regresar la respuesta
      if (result.code == 2000) {
        return MessageServerDialog(
          context: Get.context!,
          alertType: success,
          title: 'Editar Pista',
          subtitle: result.message,
          onPressed: () => Get.offAllNamed(Routes.PISTAS_PROVEEDOR),
        ).dialog();
      } else {
        return MessageServerDialog(
          context: Get.context!,
          alertType: warning,
          title: 'Editar Pista',
          subtitle: result.message,
          code: result.code,
          onPressed: Get.back,
        ).dialog();
      }
    } catch (e, stack) {
      Get.back();
      log(stack);
      log(e);
    }
  }

  ///Eliminar la pista
  Future<void> answerPista() async {
    AnswerDialog(
            context: Get.context!,
            title: 'Eliminar Pista',
            subtitle:
                '¿Estás seguro de que deseas proceder con la eliminación de la pista?')
        .dialog();
  }

  Future<void> eliminarPista() async {
    try {
      Get.dialog(ColorLoader3());
      final result = await provider.eliminarPista(idPista);
      Get.back();
      // Regresar la respuesta
      if (result.code == 2000) {
        return MessageServerDialog(
            context: Get.context!,
            alertType: success,
            title: 'Eliminar Pista',
            subtitle: result.message,
            onPressed: () => Get.offAllNamed(Routes.PISTAS_PROVEEDOR)).dialog();
      } else {
        return MessageServerDialog(
          context: Get.context!,
          alertType: warning,
          title: 'Eliminar Pista',
          subtitle: result.message,
          code: result.code,
          onPressed: Get.back,
        ).dialog();
      }
    } catch (e, st) {
      print(e);
      print(st);
    }
  }

  AnimationController getAnimVibrate() {
    return animVibrate(vsync: this);
  }

  onChangeDeporte(String val) async {
    if (val.isNotEmpty) {
      int getSportCapacity(String sport) {
        switch (sport.de) {
          case 'Pádel':
            // '4 jugadores (2 por equipo)';
            return 4;
          case 'Tenis':
            // '2 jugadores (individual) o 4 jugadores (dobles)';
            return 2;
          case 'Badminton':
            // '2 jugadores (individual) o 4 jugadores (dobles)';
            return 2;
          case 'P. climatizada':
            return 8;
          case 'Piscina':
            // 'Capacidad variable, dependiendo del evento o uso';
            return 8;
          case 'Baloncesto':
            // '10 jugadores (5 por equipo)';
            return 1;
          case 'Futbol sala':
            // '10 jugadores (5 por equipo)';
            return 1;
          case 'Futbol 7':
            // '14 jugadores (7 por equipo)';
            return 1;
          case 'Futbol 11':
            // '22 jugadores (11 por equipo)';
            return 1;
          case 'Pickleball':
            // '4 jugadores (2 por equipo)';
            return 2;
          case 'Squash':
            // '2 jugadores';
            return 2;
          case 'Tenis de mesa':
            // '2 jugadores (individual) o 4 jugadores (dobles)';
            return 2;
          case 'Fronton':
            // '2 jugadores (individual) o 4 jugadores (dobles)';
            return 2;
          case 'Balomano':
            // '14 jugadores (7 por equipo)';
            return 1;
          case 'Rugby':
            // '30 jugadores (15 por equipo) o 14 jugadores (7 por equipo) para rugby 7';
            return 1;
          case 'Multideporte':
            // 'Capacidad variable, dependiendo del deporte específico';
            return 2;
          default:
            return 0;
        }
      }

      capacidad.controller.text = getSportCapacity(val).toString();

      final result = await PistaNode().getCountPistas(val.de);
      deporte.isValidate.value = false;
      if (val.isNotEmpty) {
        nPistaController.text = result.toString();
      }
    }
  }

  validarImage(
    String? val,
    RxBool isValidate,
    AnimationController anim,
    GlobalKey key,
  ) {
    if (imagePatrocinador.validatorImage(val) != null) {
      isValidate.value = true;
      anim.forward();
      if (!focusInputController) {
        focusInputController = true;
        final RenderBox textFieldRenderBox =
            key.currentContext!.findRenderObject() as RenderBox;
        final textFieldPosition = textFieldRenderBox.localToGlobal(Offset.zero);
        scrollController
            .animateTo(
              textFieldPosition.dy,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            )
            .then((value) => focusInputController = false);
      }
    } else {
      isValidate.value = false;
    }
    return null;
  }

  validarInputController(
    String? val,
    RxBool isValidate,
    AnimationController anim,
    GlobalKey key,
  ) {
    if (val!.isEmpty) {
      isValidate.value = true;
      anim.forward();
      if (!focusInputController) {
        focusInputController = true;
        final RenderBox textFieldRenderBox =
            key.currentContext!.findRenderObject() as RenderBox;
        final textFieldPosition = textFieldRenderBox.localToGlobal(Offset.zero);
        scrollController
            .animateTo(
              textFieldPosition.dy,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            )
            .then((value) => focusInputController = false);
      }
      formValidation = false;
    }
    return null;
  }

  /// Todo para crear las tarifas
  void generarListaTarifas() async {
    final horariosTarifas = getListHorarios();
    if (selfTarifas.datosGuardados.value && !isModificar) {
      selfTarifas.changeDia(0);
      Get.toNamed(Routes.TARIFAS_PISTA);
    } else if (isModificar) {
      try {
        print('generarListaTarifas');
        Get.dialog(ColorLoader3());

        pem.socioPrecioConLuz
            .isModificado(socioPrecioConLuz.controller.text.pc);
        pem.socioPrecioSinLuz
            .isModificado(socioPrecioSinLuz.controller.text.pc);
        pem.noSocioPrecioConLuz
            .isModificado(noSocioPrecioConLuz.controller.text.pc);
        pem.noSocioPrecioSinLuz
            .isModificado(noSocioPrecioSinLuz.controller.text.pc);
        await selfTarifas.onEditarTarifas(
          horaInicio: horaInicio.controller.text,
          horaFin: horaFin.controller.text,
          horariosTarifas: horariosTarifas,
          socioPrecioConLuz: socioPrecioConLuz.controller.text,
          socioPrecioSinLuz: socioPrecioSinLuz.controller.text,
          noSocioPrecioConLuz: noSocioPrecioConLuz.controller.text,
          noSocioPrecioSinLuz: noSocioPrecioSinLuz.controller.text,
          isSocioPrecioConLuz: pem.socioPrecioConLuz.modificar,
          isSocioPrecioSinLuz: pem.socioPrecioSinLuz.modificar,
          isNoSocioPrecioConLuz: pem.noSocioPrecioConLuz.modificar,
          isNoSocioPrecioSinLuz: pem.noSocioPrecioSinLuz.modificar,
        );
        Get.back();
        Get.toNamed(Routes.TARIFAS_PISTA);
      } catch (e, st) {
        print(e);
        print(st);
      }
      return;
    } else {
      final listDiaSemana = ['L', 'M', 'X', 'J', 'V', 'S', 'D'];
      final listaTarifas = List<List<Tarifa>>.generate(
          7,
          (indexDia) => List.generate(
              horariosTarifas.length,
              (index) => Tarifa(
                  horaInicio: horariosTarifas[index],
                  diaSemana: listDiaSemana[indexDia],
                  precioConLuzSocio: socioPrecioConLuz.controller.text,
                  precioSinLuzSocio: socioPrecioSinLuz.controller.text,
                  precioConLuzNoSocio: noSocioPrecioConLuz.controller.text,
                  precioSinLuzNoSocio: noSocioPrecioSinLuz.controller.text)));
      selfTarifas.onCrearPistas(listaTarifas);
      selfTarifas.indexDias.value = 0;
      Get.toNamed(Routes.TARIFAS_PISTA);
    }
  }

  List<String> getListHorarios() {
    final List<String> newListString = [];
    bool startList = false;
    for (final element in listaHorarios.value) {
      if (element == horaInicio.controller.text) {
        startList = true;
      }
      if (startList) {
        newListString.add(element);
        if (element == horaFin.controller.text) {
          break;
        }
      }
    }
    return newListString;
  }

  // Duracion si son 60mminutos o 90 minutos
  void setDuration(String value) {
    if (value == '60 Minutos') {
      generarListaHorarios(true);
    } else {
      generarListaHorarios(false);
    }
  }

  void generarListaHorarios(isSesena) {
    List<String> newListHorarios = [];
    DateTime initialTime = DateTime(2023, 1, 1, 0, 0);
    DateTime endTime = DateTime(2023, 1, 2, 0, 0);
    DateTime currentTime = initialTime;
    Duration duration = const Duration();
    if (isSesena) {
      duration = const Duration(minutes: 60);
    } else {
      duration = const Duration(minutes: 90);
    }
    String horaDia = DateFormat('HH:mm').format(currentTime);
    newListHorarios.add(horaDia);
    while (currentTime.isBefore(endTime)) {
      currentTime = currentTime.add(duration);
      String horaDia = DateFormat('HH:mm').format(currentTime);
      newListHorarios.add(horaDia);
    }
    newListHorarios.removeLast();
    listaHorarios.value = newListHorarios;
  }

  List<String> generarHoraFinal(List<String> lista) {
    final List<String> horariosFinal = [];
    bool startList = false;
    for (var i = 0; i < lista.length; i++) {
      if (startList) {
        horariosFinal.add(lista[i]);
      } else {
        if (lista[i] == horaInicio.controller.text) {
          if (i == lista.length - 1) {
            horariosFinal.add(lista[i]);
          }
          startList = true;
        }
      }
    }
    return horariosFinal;
  }

  /// Reducir imagen en bytes
  Future<Uint8List> imageResizeBytes(Uint8List imageData) async {
    // Decodificar la imagen desde Uint8List
    img.Image image = img.decodeImage(imageData)!;

    // Reducir la calidad de la imagen (ajusta el valor 70 según tus necesidades)
    img.Image compressedImage = img.copyResize(
      image,
      width: 150,
      height: 300,
    );

    // Codificar la imagen como Uint8List
    Uint8List compressedImageData =
        Uint8List.fromList(img.encodeJpg(compressedImage, quality: 60));

    // Devolver la imagen comprimida
    return compressedImageData;
  }

  /// Cargar las imagenes de la pista
  void pickImagesPista() async {
    try {
      Get.dialog(ColorLoader3());
      List<XFile> images = await ImagePicker().pickMultiImage();
      if (images.isNotEmpty) {
        imagesPista.loading();
        final maxImages = images.length > 5;
        if (maxImages) {
          /// Si el limite es mayor, mensaje de error
          return MessageServerDialog(
            context: Get.context!,
            alertType: warning,
            title: 'Imagenes pista',
            subtitle: 'Solo puedes seleccionar 5\nimagenes de la pista.',
            onPressed: Get.back,
          ).dialog();
        } else {
          List<File> imagesResizeFile = [];
          List<Uint8List> imagesResizeBytes = [];
          for (XFile img in images) {
            if (isWeb) {
              imagesResizeBytes
                  .add(await imageResizeBytes(await img.readAsBytes()));
            } else {
              imagesResizeFile.add(await imageResize(img.path));
            }
          }
          if (isWeb) {
            imagesPista.change(imagesResizeBytes, RxStatusDemo.success(),
                newAction: '');
          } else {
            imagesPista.change(imagesResizeFile, RxStatusDemo.success(),
                newAction: '');
          }
          isMultiplesImagenesModificada = true;
        }
      }
      Get.back();
    } catch (e) {
      imagesPista.success([]);
      Get.back();
      log(e);
    }
  }

  /// Reducir imagen
  Future<File> imageResize(String path) async {
    // Imagen decoded
    img.Image image = img.decodeImage(File(path).readAsBytesSync())!;
    // Reducir la calidad de la imagen (ajusta el valor 70 según tus necesidades)
    img.Image compressedImage = img.copyResize(
      image,
      width: 300,
      height: 600,
    );
    // Regresar la imagen comprimida
    return File(path)
      ..writeAsBytesSync(img.encodeJpg(compressedImage, quality: 90));
  }

  @override
  void dispose() {
    super.dispose();
    deporte.controller.dispose();
    nPistaController.dispose();
    techada.controller.dispose();
    iluminacion.controller.dispose();
    tipo.controller.dispose();
    cesped.controller.dispose();
    automatizada.controller.dispose();
    duracionPartida.controller.dispose();
    horaInicio.controller.dispose();
    horaFin.controller.dispose();
    socioTiempoReserva.controller.dispose();
    socioTiempoCancelacion.controller.dispose();
    socioPrecioConLuz.controller.dispose();
    socioPrecioSinLuz.controller.dispose();
    noSocioTiempoReserva.controller.dispose();
    noSocioTiempoCancelacion.controller.dispose();
    noSocioPrecioConLuz.controller.dispose();
    noSocioPrecioSinLuz.controller.dispose();
    descripcion.controller.dispose();
    nombrePatrocinador.controller.dispose();
    vestuario.controller.dispose();
    duchas.controller.dispose();
    efectivo.controller.dispose();
    tarjeta.controller.dispose();
    bono.controller.dispose();
    reservatupista.controller.dispose();
    // deporteController!.dispose();
    // deporteFocusNode!.dispose();
    // nPistaController!.dispose();
    // nPistaFocusNode!.dispose();
    // techadaController!.dispose();
    // techadaFocusNode!.dispose();
    // iluminacionController!.dispose();
    // iluminacionFocusNode!.dispose();
    // tipoController!.dispose();
    // tipoFocusNode!.dispose();
    // cespedController!.dispose();
    // cespedFocusNode!.dispose();
    // automatizadaController!.dispose();
    // automatizadaFocusNode!.dispose();
    // duracionPartidaController!.dispose();
    // duracionPartidaFocusNode!.dispose();
    // horaInicioController!.dispose();
    // horaInicioFocusNode!.dispose();
    // horaFinController!.dispose();
    // horaFinFocusNode!.dispose();
    // tiempoReservaSocioController!.dispose();
    // tiempoReservaSocioFocusNode!.dispose();
    // tiempoCancelacionSocioController!.dispose();
    // tiempoCancelacionSocioFocusNode!.dispose();
    // precioConLuzSocioController!.dispose();
    // precioConLuzSocioFocusNode!.dispose();
    // precioSinLuzSocioController!.dispose();
    // precioSinLuzSocioFocusNode!.dispose();
    // tiempoReservaNoSocioController!.dispose();
    // tiempoReservaNoSocioFocusNode!.dispose();
    // tiempoCancelacionNoSocioController!.dispose();
    // tiempoCancelacionNoSocioFocusNode!.dispose();
    // precioConLuzNoSocioController!.dispose();
    // precioConLuzNoSocioFocusNode!.dispose();
    // precioSinLuzNoSocioController!.dispose();
    // precioSinLuzNoSocioFocusNode!.dispose();
    // descripcionController!.dispose();
    // descripcionFocusNode!.dispose();
    // nombrePatrocinadorController!.dispose();
    // nombrePatrocinadorFocusNode!.dispose();
    // imagePatrocinadorController!.dispose();
    // imagePatrocinadorFocusNode!.dispose();
    // vestuarioController!.dispose();
    // vestuarioFocusNode!.dispose();
    // duchasController!.dispose();
    // duchasFocusNode!.dispose();
  }
}
