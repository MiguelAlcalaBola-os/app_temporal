import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/app/ui/pages/olvide_contrasena/olvide_contrasena_c.dart';
import 'package:reservatu_pista/app/widgets/text_inputters/inputter_registro.dart';
import 'package:reservatu_pista/utils/sizer.dart';
import '../../../../../flutter_flow/flutter_flow_theme.dart';

class InputField {
  TextEditingController controller;
  int maxLength;
  InputField({required this.controller, required this.maxLength});
}

class CodigoOTP extends GetView<OlvideContrasenaController> {
  const CodigoOTP({super.key});
  OlvideContrasenaController get self => controller;

  @override
  Widget build(BuildContext context) {
    final focusNodeCodigo = [
      FocusNode(),
      FocusNode(),
      FocusNode(),
      FocusNode(),
      FocusNode(),
      FocusNode()
    ];

    return Column(
      children: [
        5.0.sh,
        Table(
          children: [
            TableRow(children: [
              ...List<Widget>.generate(6, (index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: buildInputIban(
                      maxLength: 1,
                      textController: self.controllersCodigo[index],
                      focusNode: focusNodeCodigo[index],
                      keyboardType: index > 0 ? TextInputType.number : null,
                      onChanged: (value) {
                        if (index >= 0 && index < 5) {
                          if (value.isNotEmpty) {
                            // Cuando el usuario ingresa dos dígitos, cambiamos el enfoque al campo del año
                            focusNodeCodigo[index + 1].requestFocus();
                          }
                        }
                        if (index > 0 && index < 6) {
                          if (value.isEmpty) {
                            // Cuando el usuario borra el campo del año, cambiamos el enfoque al campo del mes
                            focusNodeCodigo[index - 1].requestFocus();
                          }
                        }
                        self.codigoOTPComplete();
                      }),
                );
              })
            ]),
          ],
        ),
      ],
    );
  }

  Widget buildInputIban(
      {required int maxLength,
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
      inputFormatters: [SoloNumeros()],
      decoration: InputDecoration(
        labelStyle: LightModeTheme().labelMedium.copyWith(fontSize: 18.0),
        hintStyle: LightModeTheme().labelMedium,
        counterText: '',
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: self.lineColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: self.focusedColor,
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
      ),
      style: LightModeTheme().bodyMedium.override(
          fontFamily: 'Readex Pro',
          color: LightModeTheme().primaryText,
          fontSize: 25.0),
      textAlign: TextAlign.center,
    );
  }
}
