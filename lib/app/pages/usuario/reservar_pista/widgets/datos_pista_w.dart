import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/app/data/provider/bonos_node.dart';
import 'package:reservatu_pista/app/global_widgets/button_general.dart';
import 'package:reservatu_pista/app/global_widgets/radio_button.dart';
import 'package:reservatu_pista/app/pages/usuario/reservar_pista/reservar_pista_c.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_animations.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_theme.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_theme_modify.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_util.dart';
import 'package:reservatu_pista/utils/buttons_sounds.dart';
import 'package:reservatu_pista/utils/colores.dart';
import 'package:reservatu_pista/utils/dialog/terminos_condiciones_dialog.dart';
import 'package:reservatu_pista/utils/sizer.dart';
import 'plazas_reservas_usuarios.dart';

const fontSizeDatos = 13.0;

class DatosPistaW extends StatelessWidget {
  DatosPistaW({super.key});
  final ReservarPistaController self = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(buildDatosPista);
  }

  Widget buildDatosPista() {
    return Visible(
      isVisible: self.selectHorario.value != null,
      child: Form(
        key: self.formKey,
        child: Card(
          elevation: 3.0,
          shadowColor: Colores.azul,
          color: Colors.white,
          child: SizedBox(height: 535.0, child: _buildListaDeDatos()),
        ),
      ),
    );
  }

  /// Construir toda la lista de los datos en orden
  Widget _buildListaDeDatos() {
    int precioReserva = self.pista_con_luces
        ? self.precio_con_luz_no_socio
        : self.precio_sin_luz_no_socio;
    self.precio_a_mostrar = precioReserva * self.usuario.value.plazasReservadas;
    final fechaHoraInicio = DateTime(
        self.fecha_seleccionada.value.year,
        self.fecha_seleccionada.value.month,
        self.fecha_seleccionada.value.day,
        int.parse(self.hora_inicio_reserva_seleccionada.substring(0, 2)),
        int.parse(self.hora_inicio_reserva_seleccionada.substring(3, 5)));
    final fechaHoraFin = self.fecha_seleccionada;
    final comienza =
        '${fechaHoraInicio.toString().substring(0, 10).formatDiaMesAnio} ${fechaHoraInicio.toString().substring(11, 16)}h';
    final finaliza =
        '${fechaHoraFin.toString().substring(0, 10).formatDiaMesAnio} ${self.hora_fin_reserva_seleccionada.formatHora}';
    final duracionPartidaPista = '${self.duracion_partida.toString()} minutos';
    final luzPista = self.pista_con_luces ? 'Si' : 'No';
    final automatizadaPista = self.pista_automatizada ? 'Si' : 'No';
    return Column(
      children: [
        const PlazasReservasUsuarios(),
        _buildDatosRow('Nivel', child: _buildDatoNivel()),
        _buildDatosRow('Localidad', subtitle: self.localidad_seleccionada),
        _buildDatosRow('Deporte', subtitle: self.deporte_seleccionado.value),
        _buildDatosRow('N° de pista',
            subtitle: ((self.selectPista.value ?? 0) + 1).toString()),
        _buildDatosRow('Comienza', subtitle: comienza),
        _buildDatosRow('Finaliza', subtitle: finaliza),
        _buildDatosRow('Duración', subtitle: duracionPartidaPista),
        _buildDatosRow('Luz', subtitle: luzPista),
        _buildDatosRow('Automatizada', subtitle: automatizadaPista),
        Obx(_buildDatoPrecio),
        _buildDatoCupon(),
        _buildDatoSelectPay(),
        SizedBox(
          height: 55,
          child: TerminosCondicionesDialog(
            self.animTerminos,
            Colores.proveedor.primary,
            LightModeTheme().primaryText,
            paddingLeft: 0.0,
            widthText: 70,
            saltoLinea: true,
          ),
        ),
        _buildBotones()
      ],
    );
  }

  /// Build Nivel de la pista
  Widget _buildDatoNivel() {
    final niveles = ['±0.25', '±0.50', 'Libre'];

    return Row(
      children: List.generate(
        3,
        (index) => Obx(
          () => CustomRadioButton(
            value: index,
            groupValue: self.selectedRadio.value,
            onChanged: (int? value) {
              self.selectedRadio.value = value!;
            },
            label: niveles[index],
          ),
        ),
      ).divide(3.0.sw),
    );
  }

  Widget _buildDatoSelectPay() {
    return VibratingWidget(
        controller: self.animPay,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: _buildPay(
                    label: 'Monedero Virtual',
                    value: 0,
                    icon: Icons.euro_rounded,
                    active: true),
              ),
              Flexible(
                child: _buildPay(
                    label: 'Tarjeta',
                    value: 1,
                    icon: Icons.credit_card,
                    active: false),
              ),
            ],
          ),
        ));
  }

  // Build el precio de la pista, en el caso de cupon cambiara
  Widget _buildDatoPrecio() {
    final precio = self.precio_a_mostrar.euro;
    return self.codigoFicticio.value
        ? _buildDatosRow('Precio',
            child: Text.rich(TextSpan(
                text: precio,
                style: const TextStyle(
                  decoration: TextDecoration.lineThrough,
                  decorationColor: Colors.red,
                  decorationThickness: 4,
                  fontWeight: FontWeight.bold,
                  fontSize: fontSizeDatos,
                ),
                children: [
                  TextSpan(
                      text: '   ${self.precioCupon.value.euro}',
                      style: const TextStyle(
                        decoration: TextDecoration.none,
                      )),
                  const TextSpan(
                      text: '   100%',
                      style: TextStyle(
                          color: Colores.orange,
                          decoration: TextDecoration.none))
                ])))
        : _buildDatosRow('Precio', subtitle: precio);
  }

  /// Contruir el cupon de descuento
  Widget _buildDatoCupon() {
    return _buildDatosRow(
      'Cupón descuento',
      height: 40,
      child: Stack(children: [
        TextFormField(
          controller: self.codigoDescuentoController,
          maxLength: 10,
          textAlignVertical: TextAlignVertical.bottom,
          style: const TextStyle(
            fontSize: fontSizeDatos,
            fontWeight: FontWeight.bold,
          ),
          enabled: !self.codigoDescuentoUsuarioExiste,
          decoration: InputDecoration(
            hintText: 'Cupón descuento',
            hintStyle: const TextStyle(
              fontSize: fontSizeDatos,
            ),
            counterText: '',
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: self.validarCodigoFicticio.value
                        ? Colores.rojo
                        : Colores.usuario.primary)),
            border: const OutlineInputBorder(
              borderSide: BorderSide(),
            ),
          ),
        ),
        self.codigoDescuentoUsuarioExiste
            ? const SizedBox.shrink()
            : Positioned(
                right: 0,
                child: ButtonGeneral(
                  onPressed: () async {
                    ///Quitar esto es solo para rapido de la pista de tenis
                    final bool tenisCodigo = (self.idProveedorTenis &&
                        self.codigoDescuentoController.text == '1tenises1');
                    final existeBono = await BonoProvider().existeBono(
                        self.id_pista_seleccionada.value.toString(),
                        self.deporte_seleccionado.value,
                        self.codigoDescuentoController.text);
                    if (existeBono is int) {
                      self.idCupon = existeBono;
                      print(self.idCupon);
                    } else {
                      self.idCupon = null;
                    }
                    print('existeBono $existeBono');
                    if (self.codigoFicticio.value) {
                      self.codigoFicticio.toggle();
                    } else if (self.codigoDescuentoController.text ==
                            'codmodular' ||
                        tenisCodigo ||
                        (existeBono != null)) {
                      self.codigoFicticio.toggle();
                      self.validarCodigoFicticio.value = false;
                      self.precioCupon.value = 0;
                      self.selectPay.value = 0;
                    } else {
                      self.validarCodigoFicticio.value = true;
                    }
                  },
                  fillColor: self.codigoFicticio.value ? Colores.rojo : null,
                  text: self.codigoFicticio.value ? 'Quitar' : 'Aplicar',
                  height: 30,
                  fontSize: fontSizeDatos,
                  borderRadius: 5,
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                ),
              )
      ]),
    );
  }

  /// Construir el titulo y el subtitulo ya sea widget or child
  Widget _buildDatosRow(String title,
      {final String? subtitle, final Widget? child, final double height = 20}) {
    return Container(
      height: height,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        children: [
          SizedBox(
            width: 115,
            child: Text("$title:",
                style: MyTheme.bodyMedium.override(
                  fontFamily: 'Readex Pro',
                  letterSpacing: 0,
                  fontWeight: FontWeight.w600,
                )),
          ),
          Expanded(
            child: subtitle != null
                ? Text(
                    subtitle,
                    style: MyTheme.bodyMedium,
                  )
                : (child ?? const SizedBox.shrink()),
          )
        ],
      ),
    );
  }

  Widget _buildPay(
      {required String label,
      required int value,
      required IconData icon,
      required bool active}) {
    final bool isSelected = self.selectPay.value == value;
    final int changePrecio = self.codigoFicticio.value
        ? self.precioCupon.value
        : self.precio_a_mostrar;

    final isPrecioZeroQuitarTarjeta = changePrecio == 0 && value == 1;
    return ButtonGeneral(
      onPressed: !active
          ? null
          : isPrecioZeroQuitarTarjeta
              ? null
              : () {
                  if (changePrecio == 0) {
                    self.selectPay.value = value;
                    return;
                  }

                  /// En caso de que sea tarjeta
                  if (value == 1) {
                    if (self.plazas_a_reservar != self.capacidad_pista) {
                      self.dm.metodoPagoErrorTarjeta();
                      return;
                    }
                    // En caso de monedero
                  } else if (value == 0) {
                    if (self.db.dineroTotal <= 0 && changePrecio != 0) {
                      // es igual que value == '0' ya que comparo lo mismo al enviarle el value
                      self.dm.faltaCreditosError();
                      return;
                    } else if (self.db.dineroTotal < changePrecio) {
                      self.dm.saldoInsuficienteError();
                      return;
                    }
                  }
                  self.selectPay.value = value;
                },
      fillColor: !active
          ? Colores.gris192
          : isPrecioZeroQuitarTarjeta
              ? Colores.gris192
              : (isSelected ? Colores.usuario.primary : Colors.white),
      borderRadius: 8.0,
      borderColor: Colors.black,
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 4.0, top: 4.0),
                child: Icon(
                  icon,
                  size: 25,
                  color: isSelected ? Colors.white : Colors.black,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child: Center(
                    child: Text(
                      label,
                      style: MyTheme.bodyMedium.copyWith(
                        color: isSelected ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Visible(
            isVisible: value == 0,
            child: Text(
              self.db.dineroTotal.euro,
              style: MyTheme.bodyMedium.copyWith(
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          )
        ],
      ),
    );
  }

  /// Contruir los botones del final
  Widget _buildBotones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ButtonGeneral(
          text: 'Confirmar',
          onPressed: self.onConfirmar,
          fillColor: Colores.verde,
        ),
        const SizedBox(width: 40),
        ButtonGeneral(
          text: 'Cancelar',
          onPressed: self.selectHorario.value == null
              ? null
              : () {
                  self.selectHorario.value = null;
                  ButtonsSounds.playSound();
                },
          fillColor: Colores.rojo,
        )
      ],
    );
  }
}
