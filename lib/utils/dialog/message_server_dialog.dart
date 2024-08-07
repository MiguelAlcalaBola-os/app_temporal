import 'package:reservatu_pista/app/global_widgets/button_cerrar_dialog.dart';
import 'package:reservatu_pista/app/global_widgets/button_general.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_util.dart';
import 'package:reservatu_pista/utils/colores.dart';
import 'package:url_launcher/url_launcher.dart';
import '../btn_icon.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import '../sizer.dart';
import 'package:reservatu_pista/utils/auto_size_text/auto_size_text.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

const success = 0;
const warning = 1;
const error = 2;

class MessageServerDialog {
  MessageServerDialog(
      {required this.context,
      this.alertType,
      required this.title,
      required this.subtitle,
      this.code,
      this.navBar,
      this.isProveedor = false,
      this.precio = '',
      this.onPressed});
  final String title;
  final String subtitle;
  final BuildContext context;
  final pageIndexNotifier = ValueNotifier(0);
  final int? alertType;
  final int? code;
  final void Function()? onPressed;
  final Widget? navBar;
  final bool isProveedor;
  final String precio;

  bool get isPrecio => precio.isNotEmpty;
  final Map<int, AssetImage> _typeAsset = {
    success: const AssetImage("assets/images/success.png"),
    warning: const AssetImage("assets/images/warning.png"),
    error: const AssetImage("assets/images/error.png"),
  };
  void dialog() {
    WoltModalSheet.show<void>(
      pageIndexNotifier: pageIndexNotifier,
      context: context,
      pageListBuilder: (modalSheetContext) {
        return [
          page1(modalSheetContext),
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

  SliverWoltModalSheetPage page1(BuildContext modalSheetContext) {
    return WoltModalSheetPage(
        hasTopBarLayer: true,
        topBarTitle: buildTitle(),
        isTopBarLayerAlwaysVisible: true,
        enableDrag: false,
        trailingNavBarWidget: buildCerrar(modalSheetContext),
        resizeToAvoidBottomInset: false,
        hasSabGradient: true,
        stickyActionBar: navBar != null ? buildStickyActionBar() : null,
        backgroundColor: Colors.white,
        child: Padding(
          padding: EdgeInsets.only(
              bottom: isPrecio ? 30.0 : (navBar == null ? 0 : 60.0)),
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
              ),
              10.0.sh,
              _defaultIcon(),
              20.0.sh,
            ],
          ),
        ));
  }

  Widget buildStickyActionBar() {
    return Container(
        width: context.w,
        color: Colors.transparent,
        child: Align(child: navBar));
  }

  Widget _defaultIcon() {
    return BtnIcon(
      onPressed: onPressed ?? Navigator.of(context).pop,
      hoverColor:
          isProveedor ? Colores.proveedor.primary69 : Colores.usuario.primary69,
      icon: Image(
        image: _typeAsset[alertType]!,
        width: 70,
        height: 70,
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

  Widget buildCerrar(BuildContext context) {
    return ButtonCerrarDialog(contextDialog: context, onPressed: onPressed);
  }

  Widget richSubtitle(String subtitle) {
    final fontSize = context.w < 450 ? 18.0 : 22.0;
    if (code is int) {
      return buildCode(fontSize);
    } else {
      return buildSubtitle(fontSize);
    }
  }

  Widget buildSubtitle(double fontSize) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 30.0, left: 10.0, right: 10.0, bottom: 5.0),
      child: Text(
        subtitle,
        textAlign: TextAlign.center,
        style: LightModeTheme().bodyLarge.copyWith(fontSize: fontSize),
      ),
    );
  }

  Widget buildCode(double fontSize) {
    return Padding(
      padding: isPrecio
          ? const EdgeInsets.only(
              top: 30.0, left: 10.0, right: 10.0, bottom: 5.0)
          : const EdgeInsets.symmetric(vertical: 30.0, horizontal: 10.0),
      child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              style: LightModeTheme()
                  .bodyLarge
                  .copyWith(fontSize: fontSize, color: Colors.grey.shade600),
              children: [
                TextSpan(text: subtitle),
                const TextSpan(
                    text: '\nCode: ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: '$code.')
              ])),
    );
  }

  /// Cambiar si es is Proveedor
  void buildIrALink(String link) {
    MessageServerDialog(
      context: context,
      title: title,
      subtitle: subtitle,
      isProveedor: isProveedor,
      navBar: ButtonGeneral(
        text: 'Aceptar',
        hoverColor: isProveedor
            ? Colores.proveedor.primary69
            : Colores.usuario.primary69,
        fillColor:
            isProveedor ? Colores.proveedor.primary : Colores.usuario.primary,
        onPressed: () async {
          final urlPoliticaPrivacidad = Uri.parse(link);
          final canLaunch = await canLaunchUrl(urlPoliticaPrivacidad);
          if (canLaunch) {
            launchUrl(urlPoliticaPrivacidad);
          }
        },
      ),
    ).dialog();
  }
}
