import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/utils/btn_icon.dart';
import '../../../flutter_flow/flutter_flow_theme.dart';
import '../../../flutter_flow/flutter_flow_util.dart';
import '../../../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../sizer.dart';

class GeneralDialogAnswer extends StatelessWidget {
  final String title;
  final String descripcion;
  final String textButton1;
  final String textButton2;
  final bool visibilityButton1;
  final bool visibilityButton2;
  final void Function()? onPressedButton1;
  final void Function()? onPressedButton2;
  final Color? colorButton1;
  final Color? colorButton2;
  final Widget? descripcionWidget;
  const GeneralDialogAnswer(
      {super.key,
      this.title = '',
      this.descripcion = '',
      this.descripcionWidget,
      this.textButton1 = 'Cancelar',
      this.textButton2 = 'Confirmar',
      this.visibilityButton1 = true,
      this.visibilityButton2 = true,
      this.colorButton1,
      this.colorButton2,
      this.onPressedButton1,
      this.onPressedButton2});
  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 30),
            padding: const EdgeInsets.symmetric(vertical: 30),
            decoration: BoxDecoration(
              color: LightModeTheme().secondaryBackground,
              boxShadow: const [
                BoxShadow(
                  blurRadius: 4,
                  color: Color(0x320E151B),
                  offset: Offset(0, 1),
                )
              ],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 100.w - 45,
                  child: Stack(
                    children: [
                      Center(
                        child: Text(
                          title,
                          style: LightModeTheme()
                              .displaySmall
                              .copyWith(decoration: TextDecoration.none),
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
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  child: SizedBox(
                    height: 200,
                    child: Scrollbar(
                      thumbVisibility: true,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            descripcionWidget ??
                                Text(
                                  descripcion,
                                  style: LightModeTheme().bodyLarge.copyWith(
                                      decoration: TextDecoration.none),
                                ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: visibilityButton1 && visibilityButton2
                      ? MainAxisAlignment.spaceEvenly
                      : MainAxisAlignment.center,
                  children: [
                    Visibility(
                      visible: visibilityButton1,
                      child: FFButtonWidget(
                        onPressed: onPressedButton1 ?? Get.back,
                        text: textButton1,
                        options: FFButtonOptions(
                          width: 140,
                          height: 40,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24, 0, 24, 0),
                          iconPadding:
                              const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          color: colorButton1 ?? LightModeTheme().error,
                          textStyle: LightModeTheme().titleSmall.override(
                                fontFamily: 'Readex Pro',
                                color: LightModeTheme().primaryText,
                              ),
                          elevation: 3,
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: visibilityButton2,
                      child: FFButtonWidget(
                        onPressed: onPressedButton2 ?? Get.back,
                        text: textButton2,
                        options: FFButtonOptions(
                          width: 140,
                          height: 40,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24, 0, 24, 0),
                          iconPadding:
                              const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          color:
                              colorButton2 ?? LightModeTheme().successGeneral,
                          textStyle: LightModeTheme().titleSmall.override(
                                fontFamily: 'Readex Pro',
                                color: LightModeTheme().primaryText,
                              ),
                          elevation: 3,
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
