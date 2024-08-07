import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../flutter_flow/flutter_flow_theme.dart';
import '../../../../../utils/colores.dart';
import '../datos_proveedor_c.dart';

class InputField {
  TextEditingController controller;
  int maxLength;
  InputField({required this.controller, required this.maxLength});
}

class CodigoIban extends GetView<DatosProveedorController> {
  const CodigoIban({super.key});

  DatosProveedorController get self => controller;

  @override
  Widget build(BuildContext context) {
    final lengthTextField = [2, 2, 4, 4, 2, 10];
    List<TextEditingController> controllersCodigo = [];
    if (self.codigoIbanController.text != '') {
      final insertarText = self.codigoIbanController.text;
      controllersCodigo = [
        TextEditingController(text: insertarText.substring(0, 2)),
        TextEditingController(text: insertarText.substring(2, 4)),
        TextEditingController(text: insertarText.substring(4, 8)),
        TextEditingController(text: insertarText.substring(8, 12)),
        TextEditingController(text: insertarText.substring(12, 14)),
        TextEditingController(text: insertarText.substring(14, 24)),
      ];
    } else {
      controllersCodigo = [
        TextEditingController(),
        TextEditingController(),
        TextEditingController(),
        TextEditingController(),
        TextEditingController(),
        TextEditingController(),
      ];
    }
    final focusNodeCodigo = [
      FocusNode(),
      FocusNode(),
      FocusNode(),
      FocusNode(),
      FocusNode(),
      FocusNode()
    ];
    final nombres = [
      'Código\nPais',
      'Digito\nControl\n¨IBAN¨',
      'Entidad',
      'Oficina',
      'Digito\ncontrol',
      'N° de cuenta'
    ];
    final title = ['', '', '', '', '', 'N° cuenta corriente completo'];
    final Map<int, FlexColumnWidth> columnWidth = {
      0: const FlexColumnWidth(0.7),
      1: const FlexColumnWidth(0.7),
      2: const FlexColumnWidth(0.8),
      3: const FlexColumnWidth(0.8),
      4: const FlexColumnWidth(0.7),
      5: const FlexColumnWidth(1.7),
    };
    final Map<int, FlexColumnWidth> columnWidthTitle = {
      0: const FlexColumnWidth(0.65),
      1: const FlexColumnWidth(0.65),
      2: const FlexColumnWidth(0.1),
      3: const FlexColumnWidth(0.1),
      4: const FlexColumnWidth(0.1),
      5: const FlexColumnWidth(1.7 + (0.8 * 3)),
    };
    return Column(
      children: [
        Table(columnWidths: columnWidthTitle, children: [
          TableRow(
              children: List.generate(
                  6,
                  (index) => Text(
                        title[index],
                        textAlign: TextAlign.center,
                        style: LightModeTheme().bodyMedium.copyWith(
                              color: LightModeTheme().accent1,
                            ),
                      ))),
        ]),
        Table(
          columnWidths: columnWidth,
          children: [
            TableRow(children: [
              ...List<Widget>.generate(6, (index) {
                if (index == 0) {
                  return buildInputIban(
                      context: context,
                      maxLength: lengthTextField[index],
                      textController: controllersCodigo[index],
                      focusNode: focusNodeCodigo[index],
                      onChanged: (value) {
                        if (value.length >= 2) {
                          // Cuando el usuario ingresa dos dígitos, cambiamos el enfoque al campo del año
                          focusNodeCodigo[1].requestFocus();
                        }
                      },
                      keyboardType: index > 0 ? TextInputType.number : null);
                }
                if (index == 5) {
                  return buildInputIban(
                    context: context,
                    maxLength: lengthTextField[index],
                    textController: controllersCodigo[index],
                    focusNode: focusNodeCodigo[index],
                    keyboardType: index > 0 ? TextInputType.number : null,
                    onChanged: (value) {
                      if (value.isEmpty) {
                        // Cuando el usuario borra el campo del año, cambiamos el enfoque al campo del mes
                        focusNodeCodigo[4].requestFocus();
                      }
                    },
                  );
                }
                return buildInputIban(
                  context: context,
                  maxLength: lengthTextField[index],
                  textController: controllersCodigo[index],
                  focusNode: focusNodeCodigo[index],
                  keyboardType: index > 0 ? TextInputType.number : null,
                  onChanged: (value) {
                    if (value.length >= lengthTextField[index]) {
                      // Cuando el usuario ingresa dos dígitos, cambiamos el enfoque al campo del año
                      focusNodeCodigo[index + 1].requestFocus();
                    }

                    if (value.isEmpty) {
                      // Cuando el usuario borra el campo del año, cambiamos el enfoque al campo del mes
                      focusNodeCodigo[index - 1].requestFocus();
                    }
                  },
                );
              })
            ]),
            TableRow(
                children: List.generate(
                    6,
                    (index) => Text(
                          nombres[index],
                          textAlign: TextAlign.center,
                          style: LightModeTheme().bodyMedium.override(
                                fontFamily: 'Readex Pro',
                                color: LightModeTheme().accent1,
                                fontSize: 9,
                              ),
                        )))
          ],
        ),
      ],
    );
  }

  Widget buildInputIban(
      {required BuildContext context,
      required int maxLength,
      TextInputType? keyboardType,
      required FocusNode focusNode,
      required TextEditingController textController,
      void Function(String)? onChanged}) {
    return TextFormField(
      controller: textController,
      focusNode: focusNode,
      keyboardType: keyboardType,
      maxLength: maxLength,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelStyle: LightModeTheme().labelMedium,
        hintStyle: LightModeTheme().labelMedium,
        counterText: '',
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colores.proveedor.primary,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colores.proveedor.primary69,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFF46EF98),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: LightModeTheme().error,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: LightModeTheme().error,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
      ),
      style: LightModeTheme().bodyMedium.override(
            fontFamily: 'Readex Pro',
            color: LightModeTheme().primaryText,
          ),
      enabled: false,
      textAlign: TextAlign.center,
    );
  }
}
