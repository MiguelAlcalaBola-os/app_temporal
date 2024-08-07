import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_animations.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_theme.dart';
import 'package:reservatu_pista/utils/colores.dart';
import '../registrar_proveedor_c.dart';
import 'input_registrar.dart';

extension ExtBuildContext on BuildContext {
  Offset pos() {
    // Obtener la posición del widget en la columna
    RenderBox renderBox = findRenderObject() as RenderBox;
    Offset position = renderBox.localToGlobal(Offset.zero);
    return position;
  }
}

class BuildInput extends GetView<RegistrarProveedorController> {
  BuildInput(
      {super.key,
      this.validator,
      this.padding,
      required this.labelText,
      required this.anim,
      required this.maxLength,
      this.keyboardType,
      required this.textEditingController,
      this.isSelect = false,
      this.onValidate,
      this.listSelect,
      this.inputFormatters,
      this.enabled = true,
      this.isRequired = true,
      this.suffixIcon,
      this.prefixIcon,
      this.errorStyle,
      this.obscureText = false,
      this.prefixIconColor,
      this.onChanged,
      this.enableInteractiveSelection,
      this.isFocusNode = false,
      this.onTap});

  final String? Function(String?)? validator;
  final EdgeInsetsGeometry? padding;
  final String labelText;
  final bool isSelect;
  final AnimationController anim;
  final int maxLength;
  final List<String>? listSelect;
  final TextInputType? keyboardType;
  final FocusNode focusNode = FocusNode();
  final TextEditingController textEditingController;
  final bool isRequired;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? onValidate;
  final bool enabled;
  final Widget? suffixIcon;
  final void Function(String)? onChanged;
  final Widget? prefixIcon;
  final TextStyle? errorStyle;
  final bool obscureText;
  final Color? prefixIconColor;
  final void Function()? onTap;
  final bool? enableInteractiveSelection;
  final bool isFocusNode;

  /// LLamar el controlador
  RegistrarProveedorController get self => controller;

  @override
  Widget build(BuildContext context) {
    return VibratingWidget(
        controller: anim,
        child: Padding(
            padding: padding ??
                const EdgeInsetsDirectional.fromSTEB(5.0, 10.0, 5.0, 0.0),
            child: LayoutBuilder(builder: (context, boxContrains) {
              return isSelect
                  ? InputSelect(
                      context: context,
                      controller: textEditingController,
                      focusNode: focusNode,
                      maxLength: maxLength,
                      keyboardType: keyboardType,
                      decoration: InputDecoration(
                        counterText: '',
                        errorStyle: const TextStyle(fontSize: 0),
                        labelText: labelText,
                        hintStyle: LightModeTheme().bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              color: const Color(0xFF95A1AC),
                            ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colores.proveedor.primary,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colores.proveedor.primary160,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: LightModeTheme().error,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: LightModeTheme().error,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        filled: true,
                        fillColor: LightModeTheme().secondaryBackground,
                        contentPadding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 12.0, 16.0, 12.0),
                      ),
                      listSelect: listSelect!,
                      readOnly: true,
                      enableInteractiveSelection: isSelect,
                      onChanged: (val) => textEditingController.text = val,
                      validator: isRequired ? validateTextField : null,
                    )
                  : LayoutBuilder(builder: (context, boxContrains) {
                      return TextFormField(
                        controller: textEditingController,
                        focusNode: focusNode,
                        maxLength: maxLength,
                        keyboardType: keyboardType,
                        obscureText: obscureText,
                        enabled: enabled,
                        decoration: InputDecoration(
                          counterText: '',
                          errorStyle: const TextStyle(fontSize: 0),
                          labelText: labelText,
                          hintStyle: LightModeTheme().bodyMedium.override(
                                fontFamily: 'Readex Pro',
                                color: const Color(0xFF95A1AC),
                              ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colores.proveedor.primary160,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colores.proveedor.primary,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colores.proveedor.primary,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: LightModeTheme().error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: LightModeTheme().error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          suffixIcon: suffixIcon,
                          prefixIcon: prefixIcon,
                          prefixIconColor: prefixIconColor,
                          filled: true,
                          fillColor: LightModeTheme().secondaryBackground,
                          contentPadding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 12.0, 16.0, 12.0),
                        ),
                        style: LightModeTheme().bodyMedium,
                        inputFormatters: inputFormatters,
                        onChanged: onChanged,
                        onTap: onTap,
                        enableInteractiveSelection: enableInteractiveSelection,
                        validator: validator ??
                            (isRequired ? validateTextField : null),
                      );
                    });
            })));
  }

  Widget buildSelect(BuildContext context) {
    return InputSelect(
      context: context,
      controller: textEditingController,
      focusNode: focusNode,
      maxLength: maxLength,
      keyboardType: keyboardType,
      listSelect: listSelect!,
      decoration: InputDecoration(
        counterText: '',
        errorStyle: const TextStyle(fontSize: 0),
        labelText: labelText,
        hintStyle: LightModeTheme().bodyMedium.override(
              fontFamily: 'Readex Pro',
              color: const Color(0xFF95A1AC),
            ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: LightModeTheme().primary,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: LightModeTheme().primary,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: LightModeTheme().error,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: LightModeTheme().error,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        filled: true,
        fillColor: LightModeTheme().secondaryBackground,
        contentPadding:
            const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
      ),
      readOnly: true,
      enableInteractiveSelection: false,
      onChanged: onChanged ?? (val) => textEditingController.text = val,
      validator: isRequired ? validateTextField : null,
    );
  }

  String? validateTextField(String? text) {
    if (text == null || text.isEmpty) {
      if (isFocusNode) {
        focusNode.requestFocus();
        showOkAlertDialog(
          context: Get.context!,
          title: '"ReservatuPista" Me gustaría saber tu ubicación',
          message:
              '''La aplicación necesita acceder a tu ubicación para proporcionarte servicios basados en la ubicación,
        como encontrar pistas cercanas, obtener direcciones y mejorar tu experiencia de usuario.
        Tu ubicación se utilizará únicamente dentro de la aplicación y no será compartida con terceros sin tu consentimiento.
        Al permitir el acceso a tu ubicación, podrás disfrutar plenamente de todas las funciones de la aplicación.''',
          barrierDismissible: false,
        );
      }
      anim.forward();
      return '';
    }
    return onValidate == null ? null : onValidate!(text);
  }
}
