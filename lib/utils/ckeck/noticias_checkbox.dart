import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/constants.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_util.dart';
import 'package:reservatu_pista/utils/btn_icon.dart';
import 'package:reservatu_pista/utils/colores.dart';
import 'package:reservatu_pista/utils/sizer.dart';
import '../../flutter_flow/flutter_flow_animations.dart';
import '../../flutter_flow/flutter_flow_theme.dart';

class NoticiasCheckbox extends StatefulWidget {
  final AnimationController animTerminos;
  final Color focusedColor;
  final Color palomita;
  final double? paddingTop;
  final bool saltoLinea;
  final void Function(bool?) onChanged;
  final bool initialValue;

  const NoticiasCheckbox({
    required this.animTerminos,
    required this.focusedColor,
    required this.palomita,
    required this.onChanged,
    this.paddingTop,
    this.saltoLinea = false,
    this.initialValue = false,
    super.key,
  });

  @override
  NoticiasCheckboxState createState() => NoticiasCheckboxState();
}

class NoticiasCheckboxState extends State<NoticiasCheckbox> {
  late RxBool checkboxTerminos;
  final RxBool validateTerminos = false.obs;

  @override
  void initState() {
    super.initState();
    checkboxTerminos = widget.initialValue.obs;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      TextFormField(
          enabled: false,
          validator: (value) {
            if (!checkboxTerminos.value && isiOS == false) {
              validateTerminos.value = true;
              widget.animTerminos.forward();
              return '';
            }
            return null;
          },
          decoration: const InputDecoration(
              border: InputBorder.none, contentPadding: EdgeInsets.zero),
          style: const TextStyle(height: 0)),
      Padding(
          padding: EdgeInsets.only(
              left: 5.0, top: widget.paddingTop ?? 0.0, right: 5, bottom: 10.0),
          child: VibratingWidget(
            controller: widget.animTerminos,
            child: Obx(buildNoticia),
          ))
    ]);
  }

  // Construir la noticia
  Widget buildNoticia() {
    return Container(
      decoration: validateTerminos.value
          ? BoxDecoration(
              border: Border.all(width: 2, color: Colores.rojo),
              borderRadius: BorderRadius.circular(10.0))
          : null,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Theme(
            data: ThemeData(
              checkboxTheme: CheckboxThemeData(
                visualDensity: VisualDensity.compact,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              unselectedWidgetColor: LightModeTheme().secondaryText,
            ),
            child: Obx(buildCheckbox),
          ),
          10.0.sw,
          BtnIcon(
            width: (context.w > maxWidth ? maxWidth : context.w) - 65,
            borderRadius: 12,
            padding: const EdgeInsets.all(0),
            icon: Align(
              alignment: Alignment.centerLeft,
              child: AutoSizeText(
                'Deseo recibir nuestras noticias y actualizaciones por correo.',
                maxLines: 2,
                style: LightModeTheme().bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      color: LightModeTheme().primary,
                    ),
                minFontSize: 12, // Establece aquí tu tamaño mínimo de fuente
                stepGranularity:
                    1, // Ajuste granular para el tamaño de la fuente
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCheckbox() {
    return Checkbox(
      value: checkboxTerminos.value,
      onChanged: (val) async {
        checkboxTerminos.toggle();
        if (validateTerminos.value) {
          validateTerminos.toggle();
        }
        widget.onChanged(val);
      },
      activeColor: widget.focusedColor,
      side:
          validateTerminos.value ? const BorderSide(color: Colores.rojo) : null,
      checkColor: widget.palomita,
    );
  }
}
