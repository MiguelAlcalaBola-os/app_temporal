import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/app/pages/profesional/anadir_pista/anadir_pista_c.dart';
import 'package:reservatu_pista/backend/schema/enums/enums.dart';
import 'package:reservatu_pista/components/navbar_y_appbar_usuario.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_theme.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_util.dart';
import 'package:reservatu_pista/utils/btn_icon.dart';
import 'package:reservatu_pista/utils/buttons_sounds.dart';
import 'package:reservatu_pista/utils/colores.dart';
import 'package:reservatu_pista/utils/dialog/terminos_condiciones_dialog.dart';
import 'package:reservatu_pista/utils/responsive_web.dart';
import 'package:reservatu_pista/utils/sizer.dart';
import 'reserva_compartida_c.dart';
import 'widgets/select_usuarios_compartido.dart';

class ReservaCompartidaPage extends GetView<ReservaCompartidaController> {
  const ReservaCompartidaPage({super.key});

  ReservaCompartidaController get self => controller;
  @override
  Widget build(BuildContext context) {
    return NavbarYAppbarUsuario(
      title: 'Reserva Compartida',
      page: TypePage.ReservarPista,
      child: Expanded(
        child: SingleChildScrollView(
            controller: controller.scrollController,
            child: Obx(buildReservaCompartida)),
      ),
    );
  }

  Widget buildReservaCompartida() {
    return Visible(
      isVisible: self.usuario.value != null,
      child: ResponsiveWeb(
        child: Column(
          children: [
            buildTodosDatos(),
            Obx(() => self.sizedBoxHeight.value.sh),
            50.0.sh,
          ],
        ),
      ),
    );
  }

  Widget buildTodosDatos() {
    return SizedBox(
      key: controller.keyDatos,
      child: Obx(
        () => Container(
          decoration:
              BoxDecoration(border: Border.all(width: 1, color: Colors.black)),
          child: Column(children: [
            ..._buildDatos(
                self.detallesReserva.localidad,
                self.detallesReserva.deporte,
                self.detallesReserva.numPista,
                self.detallesReserva.iluminacion.sn,
                self.detallesReserva.automatizada.toString().sn,
                self.detallesReserva.fechaReserva,
                self.detallesReserva.horaInicio,
                self.detallesReserva.horaFin,
                self.detallesReserva.duracionPartida,
                self.detallesReserva.precioConLuzNoSocio,
                self.detallesReserva.precioConLuzSocio,
                self.detallesReserva.precioSinLuzNoSocio,
                self.detallesReserva.precioSinLuzSocio),
          ]),
        ),
      ),
    );
  }

  List<Widget> _buildDatos(
      String localidad,
      String deporte,
      int numPista,
      bool luz,
      bool automatizada,
      DateTime fechaReserva,
      String fechaHoraInicio,
      String fechaHoraFin,
      int duracionPartida,
      int precioConLuzNoSocio,
      int precioConLuzSocio,
      int precioSinLuzNoSocio,
      int precioSinLuzSocio) {
    final List<Widget> list = [];

    int precioReserva = luz ? precioConLuzNoSocio : precioSinLuzNoSocio;
    self.precio_a_mostrar.value =
        precioReserva * self.usuario.value!.plazasReservadas;

    final datos = [
      "Localidad",
      "Deporte",
      "N° de pista",
      'Luz',
      'Automatizada',
      "Comienza",
      "Finaliza",
      "Duración",
      "Precio",
      "Descuento"
    ];
    const double fontSize = 13;
    final List<String> datosList = [
      localidad,
      deporte,
      numPista.toString(),
      luz ? 'Si' : 'No',
      automatizada ? 'Si' : 'No',
      '${fechaReserva.toString().substring(0, 10)} ${fechaHoraInicio.formatHora}',
      '${fechaReserva.toString().substring(0, 10)} ${fechaHoraFin.formatHora}',
      '${duracionPartida.toString()} minutos.',
      self.precio_a_mostrar.value.euro,
      "code"
    ];
    list.add(SizedBox(width: 100.w, child: const SelectedUsuariosCompartido()));
    for (var i = 0; i < datos.length; i++) {
      if (datosList[i] == "code") {
        list.add(
          Container(
            width: 100.w,
            height: 40,
            margin: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              children: [
                SizedBox(
                  width: 115,
                  child: Text("${datos[i]}:",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: fontSize,
                          color: Color(0xff4c4c4c))),
                ),
                Expanded(
                  child: SizedBox(
                    child: TextFormField(
                      controller: self.codigoDescuentoController,
                      maxLength: 10,
                      textAlignVertical: TextAlignVertical.bottom,
                      style: const TextStyle(
                        fontSize: fontSize,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: const InputDecoration(
                        hintText: 'Usa aquí el cupón descuento',
                        hintStyle: TextStyle(
                          fontSize: fontSize,
                        ),
                        counterText: '',
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffC0D914))),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      } else {
        list.add(
          Container(
            height: 20,
            margin: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              children: [
                SizedBox(
                  width: 115,
                  child: Text("${datos[i]}:",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: fontSize,
                          color: Color(0xff4c4c4c))),
                ),
                Expanded(
                  child: datos[i] == 'Precio'
                      ? Obx(() => Text(self.precio_a_mostrar.value.euro,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: fontSize,
                          )))
                      : Text(datosList[i],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: fontSize,
                          )),
                ),
              ],
            ),
          ),
        );
      }
    }
    list.add(const SizedBox(
      height: 5,
    ));
    list.add(
      Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: SelectionWidget(
                label: 'Monedero Virtual',
                value: self.db.dineroTotal > 0 ? 'monedero' : '0',
                controller: self.selectionController,
                self: self,
              ),
            ),
            Flexible(
              child: SelectionWidget(
                label: 'Tarjeta',
                value: self.capacidad_pista == self.plazas_a_reservar.value
                    ? 'tarjeta'
                    : '00',
                controller: self.selectionController,
                self: self,
              ),
            ),
          ],
        ),
      ),
    );
    list.add(const SizedBox(
      height: 5,
    ));
    list.add(
      TerminosCondicionesDialog(
        self.animTerminos,
        Colores.proveedor.primary,
        LightModeTheme().primaryText,
        saltoLinea: true,
      ),
    );
    list.add(const SizedBox(
      height: 5,
    ));
    list.add(SizedBox(
      width: 100.w - 16,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [buildButton(), const SizedBox(width: 40), buildCancelar()],
      ),
    ));
    return list;
  }

  Widget buildButton() {
    return ElevatedButton(
      onPressed: self.onConfirmar,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
            const Color.fromARGB(192, 0, 255, 123)),
        fixedSize: MaterialStateProperty.all<Size>(
          const Size(130, 20), // Ajusta el ancho y alto según tus necesidades
        ),
      ),
      child: const Center(
        child: Text(
          "Confirmar",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontFamily: "Roboto",
              fontSize: 12,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget buildCancelar() {
    return ElevatedButton(
      onPressed: self.selectHorario.value == null
          ? null
          : () {
              self.selectHorario.value = null;
              ButtonsSounds.playSound();
            },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
            const Color.fromARGB(211, 255, 48, 48)),
        fixedSize: MaterialStateProperty.all<Size>(
          const Size(130, 20), // Ajusta el ancho y alto según tus necesidades
        ),
      ),
      child: const Center(
        child: Text(
          "Cancelar",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontFamily: "Roboto",
              fontSize: 12,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class SelectionWidget extends StatelessWidget {
  final String label;
  final String value;
  final SelectionController controller;
  final ReservaCompartidaController self;
  const SelectionWidget(
      {super.key,
      required this.label,
      required this.value,
      required this.controller,
      required this.self});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String?>(
      valueListenable: controller.selectedOption,
      builder: (context, selectedValue, _) {
        bool isSelected = selectedValue == value;

        return BtnIcon(
          onPressed: () {
            if (value == 'tarjeta') {
              print('entraaaaaaaaa tarjeta');
            } else if (value == '00') {
              print('entraaaaaaaaa 00');
              if (self.plazas_a_reservar.value != self.capacidad_pista) {
                print(
                    'entraaaaaaaaa db.plazas_a_reservar.value != db.capacidad_pista');
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Error al seleccionar método de pago'),
                      content: const Text(
                          'Para reservar con tarjeta necesitas ocupar todas las plazas de la pista.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            // Cerrar la alerta cuando se presione el botón "Aceptar"
                            Navigator.of(context).pop();
                          },
                          child: const Text('Aceptar'),
                        ),
                      ],
                    );
                  },
                );
              }
            } else if (value == '0') {
              //if(db.plazasLibres)
              if (self.db.dineroTotal <= 0) {
                // es igual que value == '0' ya que comparo lo mismo al enviarle el value
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Falta de créditos'),
                      content: const Text(
                          'Necesitas recargar créditos en tu monedero virtual.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            // Cerrar la alerta cuando se presione el botón "Aceptar"
                            Navigator.of(context).pop();
                          },
                          child: const Text('Aceptar'),
                        ),
                      ],
                    );
                  },
                );
              } else if (self.db.dineroTotal < self.precio_a_mostrar.value) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Saldo insuficiente'),
                      content: const Text(
                          'El precio de la reserva es superior al dinero de su monedero virtual'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            // Cerrar la alerta cuando se presione el botón "Aceptar"
                            Navigator.of(context).pop();
                          },
                          child: const Text('Aceptar'),
                        ),
                      ],
                    );
                  },
                );
              }
            }
            if (value != '0' && value != '00')
              controller.selectedOption.value = value;
            print(
                'controller.selectedOption.value ${controller.selectedOption.value}');
          },
          icon: Container(
            // width: (Get.width - 30) / 2,
            height: 50,
            decoration: BoxDecoration(
              color: isSelected ? Colors.blue : Colors.white,
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: isSelected
                      ? Colors.blue.withOpacity(0.5)
                      : Colors.transparent,
                  spreadRadius: 3,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: Icon(
                        Icons.credit_card,
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
                            style: TextStyle(
                              fontSize: 13,
                              color: isSelected ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Visible(
                  isVisible: value == 'monedero',
                  child: Text(
                    self.db.dineroTotal.euro,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
