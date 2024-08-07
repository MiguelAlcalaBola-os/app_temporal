import 'package:get/get.dart';
import 'package:reservatu_pista/app/data/models/mis_reservas_usuario_model.dart';
import 'package:reservatu_pista/app/data/models/reservas_usuario_model.dart';
import 'package:reservatu_pista/app/pages/usuario/mis_reservas/widgets/build_usuarios.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_util.dart';
import 'package:reservatu_pista/utils/btn_icon.dart';
import 'package:reservatu_pista/utils/colores.dart';
import 'package:reservatu_pista/utils/sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import '../mis_reservas_c.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:reservatu_pista/app/global_widgets/dialog/answer_dialog.dart';
import 'package:reservatu_pista/app/global_widgets/button_cerrar_dialog.dart';
import 'package:reservatu_pista/utils/auto_size_text/auto_size_text.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class DetalleReserva extends GetView<MisReservasController> {
  const DetalleReserva(
      {super.key,
      required this.capacidad,
      required this.reservasUsuarios,
      required this.idReserva,
      required this.state,
      required this.tiempoRestante});
  final int capacidad;
  final ReservasUsuarios? reservasUsuarios;
  final String idReserva;
  final MisReservasUsuarioModel state;
  final int tiempoRestante;
  MisReservasController get self => controller;
  @override
  Widget build(BuildContext context) {
    print('statestatestate ${state.toJson()}');
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(30),
            color: LightModeTheme().secondaryBackground,
          ),
          margin: const EdgeInsets.symmetric(vertical: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              10.0.sh,
              buildTitle('Detalles de la Reserva'),
              10.0.sh,
              // Padding(
              //   padding: const EdgeInsets.symmetric(vertical: 15.0),
              //   child: Text(
              //     'Detalles Reserva',
              //     textAlign: TextAlign.center,
              //     style: LightModeTheme().bodyLarge.copyWith(fontSize: 30),
              //   ),
              // ),
              BuildUsuarios(
                capacidad: capacidad,
                reservasUsuarios: reservasUsuarios,
                divide: 20.0,
                idUsuario: self.db.idUsuario,
                fotoUsuario: self.db.fotoUsuario,
              ),
              20.0.sh,
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: Column(
                      children: [
                        buildDetalles(),
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Visible(
                      isVisible: reservasUsuarios!.plazasReservadasTotales !=
                              capacidad &&
                          state.fechaReserva >= DateTime.now(),
                      child: buildCancelarReserva()),
                  20.0.sw,
                  Visible(
                      isVisible: reservasUsuarios!.plazasReservadasTotales !=
                              capacidad &&
                          state.fechaReserva >= DateTime.now(),
                      child: buildWhatsappButton(state.idReserva)),
                ],
              ),
              20.0.sh,
            ],
          )),
    );
  }

  Widget buildTitle(String title) {
    return SizedBox(
      width: 100.w - 45,
      child: Stack(
        children: [
          Center(
            child: Text(
              title,
              style: LightModeTheme().displaySmall,
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0.9, 0),
            child: BtnIcon(
              borderColor: const Color.fromARGB(255, 0, 0, 0),
              borderRadius: 12,
              borderWidth: 3,
              fillColor: const Color(0xFFF77066),
              buttonSize: 45,
              icon: const Icon(
                Icons.close_rounded,
                color: Color.fromARGB(255, 0, 0, 0),
                size: 30,
              ),
              onPressed: Get.back,
            ),
          )
        ],
      ),
    );
  }

  DateTime construirDatetime(DateTime fecha, String horaInicio) {
    final hora = int.parse(horaInicio.substring(0, 2));
    final minutos = int.parse(horaInicio.substring(3, 5));
    DateTime fechaConHora = DateTime(
      fecha.year,
      fecha.month,
      fecha.day,
      hora, // Hora
      minutos, // Minuto
      0, // Segundo
    );
    print('fechaConHora $fechaConHora');
    return fechaConHora;
  }

  Widget buildCancelarReserva() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        BtnIcon(
          onPressed: state.tipoReserva == 'tarjeta'
              ? null
              : () async {
                  if (self.tiempoRestante <= 0) {
                    AnswerDialog(
                            isProveedor: false,
                            context: Get.context!,
                            title: 'Reserva NO Cancelada',
                            subtitle:
                                'La reserva no se ha podido cancelar \nya que el tiempo de cancelación de reservas de esta\n pista es inferior al tiempo que queda para la partida.',
                            textButton: 'Aceptar',
                            isBack: true)
                        .dialog();
                    // Get.dialog(ChangeDialogGeneral(
                    //   alertTitle: richTitle("Reserva NO Canceladadd"),
                    //   alertSubtitle: richSubtitle(
                    //       'La reserva no se ha podido cancelar ya que el tiempo de cancelación de reservas de esta pista es inferior al tiempo que queda para la partida.'),
                    //   textButton: "Cerrar",
                    //   alertType: TypeGeneralDialog.ERROR,
                    //   onPressed: () => Get.back(),
                    // ));
                  } else {
                    await self.eliminarReserva(idReserva);
                  }
                },
          icon: Text(
            'Cancelar Reserva',
            style: LightModeTheme().bodyMedium.copyWith(fontSize: 18),
          ),
          fillColor: state.tipoReserva == 'tarjeta'
              ? LightModeTheme().accent1
              : LightModeTheme().error,
          padding: const EdgeInsets.all(10.0),
          hoverColor: Colores.usuario.primary69,
          borderWidth: 1,
          borderRadius: 8.0,
        ),
      ],
    );
  }

  Future<void> compartirReservaWhatsapp(int id_reserva) async {
    String message = "https://app.reservatupista.com?id_reserva=$id_reserva";
    String phoneNumber =
        "34653483483"; // Número de teléfono al que se enviará el mensaje

    var whatsappUrl =
        "https://wa.me/$phoneNumber/?text=${Uri.encodeFull(message)}";
    if (!await launchUrl(
      Uri.parse(whatsappUrl),
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $whatsappUrl');
    }
  }

  Widget buildWhatsappButton(int id_reserva) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        BtnIcon(
          onPressed: () async {
            await compartirReservaWhatsapp(id_reserva);
          },
          icon: Row(children: [
            Text(
              'Compartir',
              style: LightModeTheme().bodyMedium.copyWith(fontSize: 18),
            ),
            5.0.sw,
            Image.asset(
              "assets/images/icon_whatsapp.png",
              width: 20,
              height: 20,
            )
          ]),
          fillColor: LightModeTheme().successGeneral,
          padding: const EdgeInsets.all(10.0),
          hoverColor: Colores.usuario.primary69,
          borderColor: Colores.sucessGeneral,
          borderWidth: 1,
          borderRadius: 8.0,
        ),
      ],
    );
  }

  Widget buildDetalles() {
    final List<List<String>> detalles = [
      ['Nº Reserva', '# ${state.referencia}'],
      ['Nivel', 'Libre'],
      ['Total precio', state.dineroPagado.euro],
      ['Localidad', state.localidad],
      [state.tipoProveedor, state.nombrePatrocinador],
      ['Deporte', state.deporte],
      ['Nº de Pista', state.numPista.toString()],
      ['Luz', 'Si'],
      ['Iluminación', state.iluminacion],
      ['Automatizada', state.automatizada == 0 ? 'No' : 'Si'],
      ['Pista', state.pista],
      ['Comienza', state.horaInicio.formatHora],
      ['Finaliza', state.horaFin.formatHora],
      ['Duración', '${state.duracionPartida} Minutos'],
      ['Tiempo Cancelación', '24 horas'],
    ];
    List<Widget> titles = [];
    List<Widget> descripcion = [];
    print('state.horaInicio.formatHora ${state.horaInicio.formatHora}');
    print('state.horaFin.formatHora ${state.horaFin.formatHora}');

    /// Terminar de agregar tiempo de cancelacion
    for (final element in detalles) {
      titles.add(
        Text(
          '${element[0]}:',
          style: LightModeTheme().bodyMedium.override(
                fontFamily: 'Readex Pro',
                letterSpacing: 0,
                fontWeight: FontWeight.w800,
              ),
        ),
      );
      titles.add(10.0.sh);
      descripcion.add(
        Text(
          element[1],
          style: LightModeTheme().bodyMedium.override(
                fontFamily: 'Readex Pro',
                letterSpacing: 0,
              ),
        ),
      );
      descripcion.add(10.0.sh);
    }

    print('state.tipoReserva ${state.tipoReserva}');
    if (state.tipoReserva == 'monedero') {
      /// Agregar tiempo de cancelacion
      titles.add(
        Text(
          'Cancelación:',
          style: LightModeTheme().bodyMedium.override(
                fontFamily: 'Readex Pro',
                letterSpacing: 0,
                fontWeight: FontWeight.w800,
              ),
        ),
      );
      titles.add(10.0.sh);
      descripcion.add(
        Obx(buildTextHorario),
      );
      descripcion.add(10.0.sh);
      // detalles
    }

    return Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: titles),
          ),
          Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: descripcion)
        ]);
  }

  Widget buildTextHorario() {
    final days = ((self.tiempoRestante / 1000 / 60 / 60) / 24).floor();
    final hour = (self.tiempoRestante / 1000 / 60 / 60).floor();
    int nuevoTiempoRestante = self.tiempoRestante - (hour * 1000 * 60 * 60);
    //tiempoRestante = tiempoRestante - (hour * 1000 * 60 * 60);
    final minute = ((nuevoTiempoRestante / 1000 / 60) % 60).floor();
    nuevoTiempoRestante = nuevoTiempoRestante - (minute * 1000 * 60);
    final second = (nuevoTiempoRestante / 1000).floor();
    print('hour $hour');
    print('minute $minute');
    print('second $second');
    return Text(
      self.tiempoRestante == 0
          ? 'No se puede cancelar'
          : 'Quedan $days Días, $hour horas, $minute minutos, $second segundos',
      style: LightModeTheme().displayMedium.override(
            fontFamily: 'Outfit',
            color: self.tiempoRestante == 0
                ? LightModeTheme().error
                : LightModeTheme().accent1,
            fontSize: 12,
            letterSpacing: 0,
          ),
    );
  }
}

class DetalleReservaDialog {
  DetalleReservaDialog({
    required this.context,
    required this.capacidad,
    required this.reservasUsuarios,
    required this.idReserva,
    required this.state,
    required this.tiempoRestante,
    this.onPressed,
  });
  final int capacidad;
  final ReservasUsuarios? reservasUsuarios;
  final String idReserva;
  final MisReservasUsuarioModel state;
  final int tiempoRestante;
  final BuildContext context;
  final void Function()? onPressed;
  final MisReservasController self = Get.find();

  void dialog() {
    WoltModalSheet.show<void>(
        pageIndexNotifier: self.pageIndexNotifier,
        context: context,
        pageListBuilder: (modalSheetContext) {
          return [
            page1(modalSheetContext),
          ];
        },
        modalTypeBuilder: (context) {
          return WoltModalType.dialog;
        },
        onModalDismissedWithBarrierTap: () {
          debugPrint('Closed modal sheet with barrier tap');
          Navigator.of(context).pop();
          self.pageIndexNotifier.value = 0;
        },
        barrierDismissible: false,
        maxDialogWidth: 630,
        minDialogWidth: context.w < 650 ? context.w - 20 : 650,
        minPageHeight: 1,
        maxPageHeight: 1);
  }

  SliverWoltModalSheetPage page1(BuildContext modalSheetContext) {
    return WoltModalSheetPage(
        hasTopBarLayer: true,
        topBarTitle: _buildTitle('Detalles de la Reserva'),
        isTopBarLayerAlwaysVisible: true,
        enableDrag: false,
        trailingNavBarWidget: _buildCerrar(modalSheetContext),
        resizeToAvoidBottomInset: false,
        hasSabGradient: true,
        backgroundColor: Colors.white,
        forceMaxHeight: true,
        child: _buildChild());
  }

  Widget _buildChild() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        10.0.sh,
        BuildUsuarios(
          capacidad: capacidad,
          reservasUsuarios: reservasUsuarios,
          divide: 20.0,
          idUsuario: self.db.idUsuario,
          fotoUsuario: self.db.fotoUsuario,
        ),
        10.0.sh,
        SingleChildScrollView(
          child: Column(
            children: [
              _buildDetalles(),
            ],
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visible(
                isVisible:
                    reservasUsuarios!.plazasReservadasTotales != capacidad &&
                        state.fechaReserva >= DateTime.now(),
                child: _buildCancelarReserva()),
            20.0.sw,
            Visible(
                isVisible:
                    reservasUsuarios!.plazasReservadasTotales != capacidad &&
                        state.fechaReserva >= DateTime.now(),
                child: _buildWhatsappButton(state.idReserva)),
          ],
        ),
        20.0.sh,
      ],
    );
  }

  Widget _buildTitle(String title) {
    return AutoSizeText(
      title,
      maxLines: 1,
      textAlign: TextAlign.center,
      style: LightModeTheme().displaySmall,
      minFontSize: 12, // Establece aquí tu tamaño mínimo de fuente
      maxFontSize: 28,
      stepGranularity: 1, // Ajuste granular para el tamaño de la fuente
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildCerrar(BuildContext context) {
    return ButtonCerrarDialog(contextDialog: context, onPressed: onPressed);
  }

  Widget _buildCancelarReserva() {
    print('state.tipoReserva ${state.tipoReserva}');
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        BtnIcon(
          onPressed: state.tipoReserva == 'tarjeta'
              ? null
              : () async {
                  // if (self.tiempoRestante <= 0) {
                  if (false) {
                    AnswerDialog(
                            isProveedor: false,
                            context: context,
                            title: 'Reserva NO Cancelada',
                            subtitle:
                                'La reserva no se ha podido cancelar \nya que el tiempo de cancelación de reservas de esta\n pista es inferior al tiempo que queda para la partida.',
                            textButton: 'Aceptar',
                            isBack: true)
                        .dialog();
                  } else {
                    await self.eliminarReserva(idReserva);
                  }
                },
          icon: Text(
            'Cancelar Reserva',
            style: LightModeTheme().bodyMedium.copyWith(fontSize: 18),
          ),
          fillColor: state.tipoReserva == 'tarjeta'
              ? LightModeTheme().accent1
              : LightModeTheme().error,
          padding: const EdgeInsets.all(10.0),
          hoverColor: Colores.usuario.primary69,
          borderWidth: 1,
          borderRadius: 8.0,
        ),
      ],
    );
  }

  Future<void> _compartirReservaWhatsapp(int id_reserva) async {
    String message = "https://app.reservatupista.com?id_reserva=$id_reserva";
    String phoneNumber =
        "34653483483"; // Número de teléfono al que se enviará el mensaje

    var whatsappUrl =
        "https://wa.me/$phoneNumber/?text=${Uri.encodeFull(message)}";
    if (!await launchUrl(
      Uri.parse(whatsappUrl),
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $whatsappUrl');
    }
  }

  Widget _buildWhatsappButton(int id_reserva) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        BtnIcon(
          onPressed: () async {
            await _compartirReservaWhatsapp(id_reserva);
          },
          icon: Row(children: [
            Text(
              'Compartir',
              style: LightModeTheme().bodyMedium.copyWith(fontSize: 18),
            ),
            5.0.sw,
            Image.asset(
              "assets/images/icon_whatsapp.png",
              width: 20,
              height: 20,
            )
          ]),
          fillColor: LightModeTheme().successGeneral,
          padding: const EdgeInsets.all(10.0),
          hoverColor: Colores.usuario.primary69,
          borderColor: Colores.sucessGeneral,
          borderWidth: 1,
          borderRadius: 8.0,
        ),
      ],
    );
  }

  Widget _buildDetalles() {
    final List<List<String>> detalles = [
      ['Nº Reserva', '# ${state.referencia}'],
      ['Nivel', 'Libre'],
      ['Total precio', state.dineroPagado.euro],
      ['Localidad', state.localidad],
      [state.tipoProveedor, state.nombrePatrocinador],
      ['Deporte', state.deporte],
      ['Nº de Pista', state.numPista.toString()],
      ['Luz', 'Si'],
      ['Iluminación', state.iluminacion],
      ['Automatizada', state.automatizada == 0 ? 'No' : 'Si'],
      ['Pista', state.pista],
      [
        'Horario',
        '${state.horaInicio.formatHora} - ${state.horaFin.formatHora}'
      ],
      ['Duración', '${state.duracionPartida} Minutos'],
      ['T. Cancelación', '24 horas'],
    ];
    List<Widget> titles = [];
    List<Widget> descripcion = [];
    double widthTitle = 0;
    for (final element in detalles) {
      final styleTitle = LightModeTheme().bodyMedium.override(
            fontFamily: 'Readex Pro',
            letterSpacing: 0,
            fontWeight: FontWeight.w800,
          );
      final width = calcularAnchoTexto('${element[0]}:', styleTitle);
      if (width > widthTitle) {
        widthTitle = width;
      }
      titles.add(
        Text(
          '${element[0]}:',
          style: styleTitle,
        ),
      );
      titles.add(5.0.sh);
      descripcion.add(
        Text(
          element[1],
          style: LightModeTheme().bodyMedium.override(
                fontFamily: 'Readex Pro',
                letterSpacing: 0,
              ),
        ),
      );
      descripcion.add(5.0.sh);
    }
    if (state.tipoReserva == 'monedero') {
      final styleTitle = LightModeTheme().bodyMedium.override(
            fontFamily: 'Readex Pro',
            letterSpacing: 0,
            fontWeight: FontWeight.w800,
          );
      final width = calcularAnchoTexto('Cancelación:', styleTitle);
      if (width > widthTitle) {
        widthTitle = width;
      }

      /// Agregar tiempo de cancelacion
      titles.add(
        Text('Cancelación:', style: styleTitle),
      );
      titles.add(5.0.sh);
      descripcion.add(
        Obx(buildTextHorario),
      );
      descripcion.add(5.0.sh);
    }

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Column(
          children: List.generate(
            titles.length,
            (i) => Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: widthTitle, child: titles[i]),
                  5.0.sw,
                  Expanded(
                    child: Align(
                        alignment: Alignment.centerLeft, child: descripcion[i]),
                  )
                ]),
          ),
        ));
  }

  Widget buildTextHorario() {
    print('self.tiempoRestante: ${self.tiempoRestante}');
    final days = ((self.tiempoRestante / 1000 / 60 / 60) / 24).floor();
    final hour = (self.tiempoRestante / 1000 / 60 / 60).floor();
    int nuevoTiempoRestante = self.tiempoRestante - (hour * 1000 * 60 * 60);
    //tiempoRestante = tiempoRestante - (hour * 1000 * 60 * 60);
    final minute = ((nuevoTiempoRestante / 1000 / 60) % 60).floor();
    nuevoTiempoRestante = nuevoTiempoRestante - (minute * 1000 * 60);
    final second = (nuevoTiempoRestante / 1000).floor();
    print('hour $hour');
    print('minute $minute');
    print('second $second');
    return Text(
      self.tiempoRestante == 0
          ? 'No se puede cancelar'
          : 'Quedan $days Días, $hour horas, $minute minutos, $second segundos',
      style: LightModeTheme().bodyMedium.override(
            fontFamily: 'Outfit',
            color: self.tiempoRestante == 0
                ? LightModeTheme().error
                : LightModeTheme().accent1,
            letterSpacing: 0,
          ),
    );
  }
}
