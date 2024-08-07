import 'package:reservatu_pista/app/global_widgets/button_cerrar_dialog.dart';
import 'package:reservatu_pista/app/global_widgets/button_general.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_util.dart';
import 'package:reservatu_pista/utils/btn_icon.dart';
import 'package:reservatu_pista/utils/colores.dart';
import 'package:reservatu_pista/utils/sizer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:reservatu_pista/utils/auto_size_text/auto_size_text.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class AnswerDialog {
  AnswerDialog({
    required this.context,
    required this.title,
    required this.subtitle,
    this.textButton = 'Eliminar',
    this.navBar,
    this.isProveedor = false,
    this.isBack = false,
    this.precio = '',
    this.onPressedBack,
    this.onPressedButton,
  });
  final String title;
  final String subtitle;
  final String textButton;
  final BuildContext context;
  final pageIndexNotifier = ValueNotifier(0);
  final Widget? navBar;
  final void Function()? onPressedBack;
  final void Function()? onPressedButton;
  final bool isProveedor;
  final bool isBack;
  final String precio;

  bool get isPrecio => precio.isNotEmpty;

  void dialog() {
    WoltModalSheet.show<void>(
        pageIndexNotifier: pageIndexNotifier,
        context: context,
        pageListBuilder: (modalSheetContext) {
          return [
            page1(),
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
        modalBarrierColor: isProveedor
            ? Colores.proveedor.primary69
            : Colores.usuario.primary69,
        maxDialogWidth: 630,
        minDialogWidth: context.w < 650 ? context.w - 20 : 650);
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
        stickyActionBar: buildStickyActionBar(),
        backgroundColor: Colors.white,
        child: Padding(
          padding: EdgeInsets.only(bottom: isPrecio ? 80.0 : 60.0),
          child: Column(
            children: [
              richSubtitle(subtitle),
              Visible(
                isVisible: isPrecio,
                child: Text(
                  precio,
                  textAlign: TextAlign.center,
                  style: LightModeTheme().bodyMedium.override(
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w600,
                        fontSize: 23,
                      ),
                ),
              )
            ],
          ),
        ));
  }

  Widget buildStickyActionBar() {
    return Container(
        width: context.w,
        color: Colors.transparent,
        child: Align(
          child: ButtonGeneral(
              isProveedor: isProveedor,
              text: textButton,
              onPressed: isBack
                  ? (onPressedButton != null
                      ? () => {
                            onPressedButton!(),
                            Navigator.of(context).pop(),
                          }
                      : null)
                  : onPressedButton),
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
    return ButtonCerrarDialog(contextDialog: context);
  }

  Widget richSubtitle(String subtitle) {
    final fontSize = context.w < 450 ? 18.0 : 22.0;
    return buildSubtitle(fontSize);
  }

  Widget buildSubtitle(double fontSize) {
    return Padding(
      padding: isPrecio
          ? const EdgeInsets.only(
              top: 30.0, left: 10.0, right: 10.0, bottom: 5.0)
          : const EdgeInsets.symmetric(vertical: 30.0, horizontal: 10.0),
      child: Text(
        subtitle,
        textAlign: TextAlign.center,
        style: LightModeTheme().bodyLarge.copyWith(fontSize: fontSize),
      ),
    );
  }
}
