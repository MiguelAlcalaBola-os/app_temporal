import 'package:get/get.dart';
import 'package:reservatu_pista/pages/usuario/monedero_virtual/monedero_c.dart';
import '../../flutter_flow/flutter_flow_icon_button.dart';
import '../../utils/buttons_sounds.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import '../../../utils/sizer.dart';

class AlertRecargarWidget extends StatefulWidget {
  final bool isTransferir;
  const AlertRecargarWidget({super.key, this.isTransferir = false});

  @override
  State<AlertRecargarWidget> createState() =>
      AlertRecargarWidgetState(isTransferir: isTransferir);
}

class AlertRecargarWidgetState extends State<AlertRecargarWidget> {
  AlertRecargarWidgetState({required this.isTransferir});
  MonederoController self = Get.find();
  final bool isTransferir;
  String get title => isTransferir ? 'Transferir' : 'Recargar';

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
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
      child: Container(
        width: double.infinity,
        height: 510,
        constraints: const BoxConstraints(maxWidth: 600),
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
            5.0.sh,
            buildTitle(),
            buildBilletes(),
            10.0.sh,
            Obx(() => Text(
                  self.money.euro,
                  style: LightModeTheme().displaySmall,
                )),
            buildBotones(),
            5.0.sh
          ],
        ),
      ),
    );
  }

  Widget buildTitle() {
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
            child: FlutterFlowIconButton(
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
                Navigator.pop(Get.context!);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget buildBilletes() {
    final List<Widget> generateListaBilletes = [];
    for (var i = 0; i < self.listaBitteles.length; i = i + 2) {
      generateListaBilletes.add(
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildBtnBillete(self.listaBitteles[i]),
            buildBtnBillete(self.listaBitteles[i + 1]),
          ],
        ),
      );
    }
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: generateListaBilletes.divide(const SizedBox(height: 5)),
    );
  }

  Widget buildBtnBillete(Rx<ButtonDinero> buttonDinero) {
    return Obx(() {
      final btn = buttonDinero.value;
      return InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () => onTap(buttonDinero),
        child: Container(
          width: context.w * 0.4,
          constraints: const BoxConstraints(maxWidth: 180),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(0),
            child: Image.asset(
              'assets/images/${btn.image}.jpg',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ).animateOnActionTrigger(btn.animation, hasBeenTriggered: btn.ativate);
    });
  }

// Cambiamos la funcionalidad al presionar el boton
  void onTap(Rx<ButtonDinero> buttonDinero) async {
    ButtonsSounds.playSound(sound: "assets/audios/money.wav");
    int newNumber = self.money += buttonDinero.value.dinero;
    if (isTransferir) {
    } else {
      if (newNumber > 100000) {
        self.money = 100000;
      }
    }
    buttonDinero.value.ativate = true;
    buttonDinero.refresh();
    SchedulerBinding.instance.addPostFrameCallback((_) async =>
        await buttonDinero.value.animation.controller.forward(from: 0.0));
  }

  Widget buildBotones() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FFButtonWidget(
          onPressed: () {
            ButtonsSounds.playSound(sound: "assets/audios/money.wav");
            self.money = 0;
          },
          text: 'Borrar',
          options: FFButtonOptions(
            width: 140,
            height: 40,
            padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
            iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
            color: LightModeTheme().error,
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
        FFButtonWidget(
          onPressed: () {
            ButtonsSounds.playSound(sound: "assets/audios/money.wav");
            self.onConfirmar();
          },
          text: 'Confirmar',
          options: FFButtonOptions(
            width: 140,
            height: 40,
            padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
            iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
            color: LightModeTheme().successGeneral,
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
      ],
    );
  }
}
