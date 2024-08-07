import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/app/global_widgets/button_general.dart';
import 'package:reservatu_pista/components/navbar_y_appbar_profesional.dart';
import 'package:reservatu_pista/constants.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_util.dart';
import 'package:reservatu_pista/utils/btn_icon.dart';
import 'package:reservatu_pista/utils/colores.dart';
import 'package:reservatu_pista/utils/responsive_web.dart';
import 'package:reservatu_pista/utils/sizer.dart';
import '../../../../flutter_flow/flutter_flow_theme.dart';
import './tarifas_pista_c.dart';
import 'widgets/clonar_dias.dart';

class TarifasPistaPage extends GetView<TarifasPistaController> {
  const TarifasPistaPage({super.key});

  TarifasPistaController get self => controller;
  @override
  Widget build(BuildContext context) {
    return NavbarYAppbarProfesional(
        title: 'Tarifas',
        isTitleBack: true,
        isNavBar: false,
        bottomNavigatorBar: Padding(
          padding: EdgeInsets.symmetric(vertical: isiOS ? 10.0 : 5.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            _buildBotonNavBar(
              context,
              'Clonar Día',
              Icons.copy,
              false,
              const Color(0xff2196F3),
            ),
            20.0.sw,
            _buildBotonNavBar(
                context, 'Guardar', Icons.save, true, Colores.verde)
          ]),
        ),
        child: Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: paddingVertical,
                child: ResponsiveWeb(child: Obx(buildListaDeDiasSemana)),
              ),
              ResponsiveWeb(child: buildTableTarifas(context)),
              Visible(
                  isVisible: self.listTarifas.isNotEmpty,
                  child: buildTableDatos(context))
            ],
          ),
        ));
  }

  /// Construir la lista para seleccionar el dia de la semana
  Widget buildListaDeDiasSemana() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        self.listDiaSemana.length,
        (index) => BtnIcon(
          height: 45,
          padding: const EdgeInsets.all(2.5),
          hoverColor: Colores.proveedor.primary69,
          onPressed: () => self.changeDia(index),
          icon: CircleAvatar(
              backgroundColor: self.indexDias.value == index
                  ? const Color(0xFF46EF98)
                  : LightModeTheme().primary,
              child: Text(
                self.listDiaSemana[index],
                style: LightModeTheme().titleSmall.override(
                      fontFamily: 'Readex Pro',
                      color: self.indexDias.value == index
                          ? Colors.black
                          : Colors.white,
                      fontSize: 12.0,
                    ),
              )),
        ),
      ),
    );
  }

  Widget _buildBotonTitleTable(
      String titleTable, dynamic Function()? onPressed) {
    return TableCell(
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF1F4F8),
          boxShadow: [
            const BoxShadow(
              color: Colors.white,
              offset: Offset(-2, -2),
              blurRadius: 2,
            ),
            BoxShadow(
              color: Colors.grey.shade600,
              offset: const Offset(1, 1.8),
              blurRadius: 2,
            ),
          ],
        ),
        child: BtnIcon(
          padding: const EdgeInsets.all(0),
          hoverColor: Colores.proveedor.primary69,
          onPressed: onPressed,
          icon: Text(
            titleTable,
            textAlign: TextAlign.center,
            style: LightModeTheme().bodyMedium,
          ),
        ),
      ),
    );
  }

  /// Construir la tabla con el titulo de cada fila
  Widget buildTableTarifas(BuildContext context) {
    final Map<int, FlexColumnWidth> columnWidth = {
      0: const FlexColumnWidth(1.2),
      1: const FlexColumnWidth(0.7),
      2: const FlexColumnWidth(0.6),
      3: const FlexColumnWidth(0.7),
      4: const FlexColumnWidth(0.9),
      5: const FlexColumnWidth(0.9),
    };
    final List<String> titleTable = [
      'Activado',
      'Clases',
      'Luz',
      'Hora',
      'Socio',
      'No Socio'
    ];
    return Table(
        columnWidths: columnWidth,
        border: TableBorder.all(width: 1, color: const Color(0xFF2B78DC)),
        children: [
          TableRow(
              decoration: const BoxDecoration(color: Color(0xFFF1F4F8)),
              children: [
                ...List.generate(titleTable.length, (index) {
                  /// Activar y desactivar
                  if (titleTable[index] == 'Activado') {
                    return _buildBotonTitleTable(
                        titleTable[index], self.onChangeAllActive);
                  }

                  /// Clases
                  if (index == 1) {
                    return _buildBotonTitleTable(
                        titleTable[index], self.onChangeAllClase);
                  }

                  /// Luz
                  if (index == 2) {
                    return _buildBotonTitleTable(
                        titleTable[index], self.onChangeAllLuz);
                  }
                  return TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Text(
                      titleTable[index],
                      textAlign: TextAlign.center,
                      style: LightModeTheme().bodyMedium,
                    ),
                  );
                })
              ])
        ]);
  }

  /// Construir la tabla con los datos dados de cada tarifa
  Widget buildTableDatos(BuildContext context) {
    final Map<int, FlexColumnWidth> columnWidth = {
      0: const FlexColumnWidth(1.2),
      1: const FlexColumnWidth(0.7),
      2: const FlexColumnWidth(0.6),
      3: const FlexColumnWidth(0.7),
      4: const FlexColumnWidth(0.9),
      5: const FlexColumnWidth(0.9),
    };
    print(self.listTarifas);
    return Expanded(
      child: SingleChildScrollView(
        child: ResponsiveWeb(
          child: Obx(() => Table(
              columnWidths: columnWidth,
              border: TableBorder.all(width: 1, color: const Color(0xFF5A9BEE)),
              children: List.generate(
                self.listTarifas[self.indexDias.value].length,
                (index) {
                  final val = self.listTarifas[self.indexDias.value][index];
                  final activeOrDesactive = self.listActive.value[index];
                  return TableRow(
                    decoration: activeOrDesactive
                        ? const BoxDecoration(color: Color(0xFF93EF93))
                        : null,
                    children: [
                      // Datos Activado
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: BtnIcon(
                          padding: const EdgeInsets.all(0),
                          hoverColor: Colores.proveedor.primary69,
                          onPressed: () =>
                              self.onChangeActive(activeOrDesactive, index),
                          icon: Text(
                            activeOrDesactive ? 'Activado' : 'Desactivado',
                            textAlign: TextAlign.center,
                            style: LightModeTheme().bodyMedium,
                          ),
                        ),
                      ),
                      // Datos Clases
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Obx(() => ElevatedButton(
                              onPressed: () =>
                                  self.onChangeClase(activeOrDesactive, index),
                              style: ButtonStyle(
                                  overlayColor: MaterialStatePropertyAll(
                                      activeOrDesactive
                                          ? const Color.fromARGB(60, 0, 0, 0)
                                          : Colors.transparent),
                                  backgroundColor:
                                      const MaterialStatePropertyAll(
                                          Colors.transparent),
                                  shadowColor: const MaterialStatePropertyAll(
                                      Colors.transparent),
                                  padding: const MaterialStatePropertyAll(
                                      EdgeInsets.zero)),
                              child: Icon(
                                Icons.school,
                                color: self.listClase[index].value
                                    ? const Color(0xFFD241FF)
                                    : LightModeTheme().secondaryText,
                                size: 24.0,
                              ),
                            )),
                      ),
                      // Datos Luz
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Obx(() => ElevatedButton(
                              onPressed: () =>
                                  self.onChangeLuz(activeOrDesactive, index),
                              style: ButtonStyle(
                                  overlayColor: MaterialStatePropertyAll(
                                      activeOrDesactive
                                          ? const Color.fromARGB(60, 0, 0, 0)
                                          : Colors.transparent),
                                  backgroundColor:
                                      const MaterialStatePropertyAll(
                                          Colors.transparent),
                                  shadowColor: const MaterialStatePropertyAll(
                                      Colors.transparent),
                                  padding: const MaterialStatePropertyAll(
                                      EdgeInsets.zero)),
                              child: Icon(
                                FontAwesomeIcons.solidLightbulb,
                                color: self.listLuz[index].value
                                    ? LightModeTheme().warning
                                    : LightModeTheme().secondaryText,
                                size: 24.0,
                              ),
                            )),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Text(
                          val.horaInicio!,
                          textAlign: TextAlign.center,
                          style: LightModeTheme().bodyMedium,
                        ),
                      ),
                      TableCell(
                        child: Obx(() => TextFormField(
                              maxLength: 7,
                              controller: TextEditingController(
                                  text: self.listClase[index].value
                                      ? '0,00 €'
                                      : self.listLuz[index].value
                                          ? val.precioConLuzSocio
                                          : val.precioSinLuzSocio),
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      decimal: true),
                              obscureText: false,
                              decoration: InputDecoration(
                                counterText: '',
                                labelStyle: LightModeTheme().labelMedium,
                                hintStyle: LightModeTheme().labelMedium,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                focusedErrorBorder: InputBorder.none,
                              ),
                              inputFormatters: [PrecioInputFormatter()],
                              style: LightModeTheme().bodyMedium,
                              textAlign: TextAlign.center,
                              onChanged: (precio) => self.onChangePrecioSocio(
                                  self.listLuz[index].value, index, precio),
                            )),
                      ),
                      TableCell(
                        child: Obx(() => TextFormField(
                              maxLength: 7,
                              controller: TextEditingController(
                                  text: self.listClase[index].value
                                      ? '0,00 €'
                                      : self.listLuz[index].value
                                          ? val.precioConLuzNoSocio
                                          : val.precioSinLuzNoSocio),
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      decimal: true),
                              obscureText: false,
                              decoration: InputDecoration(
                                counterText: '',
                                labelStyle: LightModeTheme().labelMedium,
                                hintStyle: LightModeTheme().labelMedium,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                focusedErrorBorder: InputBorder.none,
                              ),
                              inputFormatters: [PrecioInputFormatter()],
                              style: LightModeTheme().bodyMedium,
                              textAlign: TextAlign.center,
                              onChanged: (precio) => self.onChangePrecioNoSocio(
                                  self.listLuz[index].value, index, precio),
                            )),
                      ),
                    ],
                  );
                },
              ))),
        ),
      ),
    );
  }

  Widget _buildBotonNavBar(BuildContext context, String text, IconData icon,
      bool isGuardar, Color color) {
    return ButtonGeneral(
      onPressed: () async {
        if (isGuardar) {
          self.onGuardar();
        } else {
          self.selectedDias.value =
              List.generate(self.selectedDias.value.length, (e) => false);
          await showAlignedDialog(
            context: context,
            isGlobal: true,
            avoidOverflow: false,
            targetAnchor: const AlignmentDirectional(0.0, 0.0)
                .resolve(Directionality.of(context)),
            followerAnchor: const AlignmentDirectional(0.0, 0.0)
                .resolve(Directionality.of(context)),
            builder: (dialogContext) {
              return ClonarDias();
            },
          );
        }
      },
      height: 40,
      text: text,
      prefixIcon: Icon(
        icon,
        color: Colors.white,
      ),
      fillColor: color,
    );
  }

  // Contruir los botones
  Widget buildButton(
      BuildContext context, String text, IconData icon, bool isGuardar) {
    return ElevatedButton(
      onPressed: () async {
        if (isGuardar) {
          self.onGuardar();
        } else {
          self.selectedDias.value =
              List.generate(self.selectedDias.value.length, (e) => false);
          await showAlignedDialog(
            context: context,
            isGlobal: true,
            avoidOverflow: false,
            targetAnchor: const AlignmentDirectional(0.0, 0.0)
                .resolve(Directionality.of(context)),
            followerAnchor: const AlignmentDirectional(0.0, 0.0)
                .resolve(Directionality.of(context)),
            builder: (dialogContext) {
              return ClonarDias();
            },
          );
        }
      },
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all<Color>(const Color(0xff2196F3)),
        fixedSize: MaterialStateProperty.all<Size>(const Size(150, 20)),
      ),
      child: Center(
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.black,
            ),
            Expanded(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontFamily: "Roboto",
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PrecioInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String textCambiar = '';
    print(oldValue.text.length);
    print(newValue.text.length);
    if (oldValue.text.length > newValue.text.length) {
      textCambiar = oldValue.text.substring(0, oldValue.text.length - 4);
    } else {
      textCambiar = newValue.text;
    }
    String newText = textCambiar.replaceAll(',', ''); // Eliminar puntos
    newText = newText.replaceAll('€', ''); // Eliminar Euro
    int newTextLength = newText.length; // Tamano del texto
    if (newTextLength == 0) {
      // Si no hay ningún número ingresado, devolver un valor vacío
      return const TextEditingValue();
    }
    if (int.tryParse(newText) == null) {
      return oldValue;
    } else {
      int amount = int.parse(newText); // Convertir a número y dividir por 100
      final amountEuro = amount.euro;
      return TextEditingValue(
        text: amountEuro,
        selection: TextSelection.collapsed(offset: amountEuro.length - 2),
      );
    }
  }
}

// class PrecioInputFormatter extends TextInputFormatter {
//   @override
//   TextEditingValue formatEditUpdate(
//     TextEditingValue oldValue,
//     TextEditingValue newValue,
//   ) {
//     String newText = newValue.text.replaceAll('.', ''); // Eliminar puntos
//     int newTextLength = newText.length;

//     if (newTextLength == 0) {
//       // Si no hay ningún número ingresado, devolver un valor vacío
//       return const TextEditingValue();
//     }

//     double amount = double.parse(newText.substring(0, newText.length - 2)) /
//         100; // Convertir a número y dividir por 100
//     String formattedText =
//         amount.toStringAsFixed(2); // Formatear con dos decimales

//     return TextEditingValue(
//       text: '$formattedText €',
//       selection: TextSelection.collapsed(offset: formattedText.length),
//     );
//   }
// }
