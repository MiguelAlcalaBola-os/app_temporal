import 'package:get/get.dart';
import 'package:reservatu_pista/app/global_widgets/button_cerrar_dialog.dart';
import 'package:reservatu_pista/app/global_widgets/button_general.dart';
import 'package:reservatu_pista/app/global_widgets/dialog/answer_dialog.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_icon_button.dart';
import 'package:reservatu_pista/pages/usuario/monedero_virtual/monedero_c.dart';
import 'package:reservatu_pista/utils/btn_icon.dart';
import 'package:reservatu_pista/utils/buttons_sounds.dart';
import 'package:reservatu_pista/utils/colores.dart';
import 'package:reservatu_pista/utils/sizer.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:reservatu_pista/utils/auto_size_text/auto_size_text.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class RecargaWidget {
  final bool isTransferir;
  final BuildContext context;

  RecargaWidget({this.isTransferir = false, required this.context});

//   @override
//   State<RecargaWidget> createState() =>
//       RecargaWidgetState(isTransferir: isTransferir);
// }

// class RecargaWidgetState extends State<RecargaWidget> {
  // RecargaWidgetState({required this.isTransferir});
  MonederoController self = Get.find();
  // final bool isTransferir;
  String get title => isTransferir ? 'Transferir' : 'Recargar';

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
}

class RecargaDialog {
  RecargaDialog(
      {required this.context,
      required this.title,
      this.navBar,
      this.isProveedor = false,
      this.onPressedBack,
      this.onPressedButton,
      required this.page});
  final String title;
  final BuildContext context;
  final pageIndexNotifier = ValueNotifier(0);
  final int page;
  final Widget? navBar;
  final void Function()? onPressedBack;
  final void Function()? onPressedButton;
  final bool isProveedor;
  MonederoController self = Get.find();

  void dialog() {
    WoltModalSheet.show<void>(
      pageIndexNotifier: pageIndexNotifier,
      context: context,
      pageListBuilder: (modalSheetContext) {
        return [
          page1(),
          AnswerDialog(
              context: context,
              title: 'Recargar',
              subtitle: '¿Estás seguro de recargar el Monedero Virtual?',
              textButton: 'Recargar',
              onPressedButton: self.onConfirmar,
              onPressedBack: () => pageIndexNotifier.value = 0).page1()
        ];
      },
      modalTypeBuilder: (context) {
        return WoltModalType.dialog;
      },
      onModalDismissedWithBarrierTap: () {
        debugPrint('Closed modal sheet with barrier tap');
        Navigator.of(context).pop();
        pageIndexNotifier.value = 0;
      },
      barrierDismissible: false,
      modalBarrierColor:
          isProveedor ? Colores.proveedor.primary69 : Colores.usuario.primary69,
      maxDialogWidth: 630,
      minDialogWidth: context.w < 650 ? context.w - 20 : 650,
    );
  }

  SliverWoltModalSheetPage page1() {
    return WoltModalSheetPage(
        hasTopBarLayer: true,
        topBarTitle: buildTitle(),
        isTopBarLayerAlwaysVisible: true,
        enableDrag: false,
        leadingNavBarWidget: onPressedBack == null ? null : _defaultIcon(),
        trailingNavBarWidget: buildCerrar(),
        resizeToAvoidBottomInset: false,
        hasSabGradient: true,
        stickyActionBar: buildBotones(),
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 60.0),
          child: buildBilletes(),
        ));
  }

  Widget buildStickyActionBar() {
    return Container(
        width: context.w,
        color: Colors.transparent,
        child: Align(
          child: ButtonGeneral(
            onPressed: onPressedButton,
            isProveedor: true,
            fillColor: Colores.proveedor.primary,
            text: 'Eliminar',
          ),
        ));
  }

  Widget _defaultIcon() {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: BtnIcon(
        borderColor: Colors.transparent,
        hoverColor: isProveedor
            ? Colores.proveedor.primary69
            : Colores.usuario.primary69,
        borderRadius: 20.0,
        borderWidth: 1.0,
        buttonSize: 55.0,
        icon: Icon(
          Icons.arrow_back_rounded,
          color: LightModeTheme().primaryText,
          size: 30.0,
        ),
        onPressed: onPressedBack,
      ),
    );
  }

  Widget buildTitle() {
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

  Widget buildCerrar() {
    return ButtonCerrarDialog(
        contextDialog: context, onPressed: () => Navigator.pop(context));
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
      children: [
        10.0.sh,
        Column(
          mainAxisSize: MainAxisSize.max,
          children: generateListaBilletes.divide(const SizedBox(height: 5)),
        ),
        10.0.sh,
        Obx(() => Text(
              self.money.euro,
              style: LightModeTheme().displaySmall,
            )),
      ],
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
    if (newNumber > 100000) {
      self.money = 100000;
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
        ButtonGeneral(
          onPressed: () {
            ButtonsSounds.playSound(sound: "assets/audios/money.wav");
            self.money = 0;
          },
          text: 'Borrar',
          fillColor: Colores.rojo,
          height: 40,
          padding: null,
          width: 130,
        ),
        ButtonGeneral(
          onPressed: () {
            if (self.money > 0) {
              ButtonsSounds.playSound(sound: "assets/audios/money.wav");
              pageIndexNotifier.value = 1;
            }
            // self.onConfirmar();
          },
          text: 'Confirmar',
          height: 40,
          width: 130,
        ),
      ],
    );
  }

  // Widget richSubtitle(String subtitle) {
  //   final fontSize = context.w < 450 ? 18.0 : 22.0;
  //   return buildSubtitle(fontSize);
  // }

  // Widget buildSubtitle(double fontSize) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 10.0),
  //     child: Text(
  //       subtitle,
  //       textAlign: TextAlign.center,
  //       style: LightModeTheme().bodyLarge.copyWith(fontSize: fontSize),
  //     ),
  //   );
  // }
}
