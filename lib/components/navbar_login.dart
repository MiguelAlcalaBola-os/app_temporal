import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:reservatu_pista/utils/btn_icon.dart';
import 'package:reservatu_pista/utils/sizer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import 'package:url_launcher/url_launcher.dart';
import 'alert_versions_widget.dart';

class NavBarLogin extends StatefulWidget {
  const NavBarLogin({super.key, required this.isMin});
  final bool isMin;

  @override
  State<NavBarLogin> createState() => _NavBarLoginState();
}

class _NavBarLoginState extends State<NavBarLogin> {
  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  void _sendEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'info@reservatupista.com',
      queryParameters: {
        'subject': 'Contacto ReservatuPista',
      },
    );

    _launchInBrowser(emailLaunchUri);
  }

  void launchWhatsApp() async {
    String url = "https://wa.me/34653483483";
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'No se pudo abrir WhatsApp.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Align(alignment: Alignment.bottomCenter, child: buildNavBar());
  }

  Widget buildLogosText() {
    final sizeLogos = widget.isMin ? 45.0 : 60.0;
    return Row(
      children: [
        Container(
          width: sizeLogos,
          height: sizeLogos,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(),
          child: Image.asset(
            'assets/images/logo_diputacion_caseres.png',
            fit: BoxFit.fitWidth,
          ),
        ),
        Expanded(
          child: Container(
            height: 50,
            constraints: const BoxConstraints(maxWidth: 650),
            child: buildResponsiveText(context),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            width: sizeLogos,
            height: sizeLogos,
            decoration: BoxDecoration(
              color: const Color(0xFF00E676),
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: BtnIcon(
              hoverColor: const Color.fromARGB(117, 0, 0, 0),
              borderRadius: 30,
              onPressed: () =>
                  _launchInBrowser(Uri.parse("https://wa.me/34653483483")),
              icon: Container(
                width: 45.0,
                height: 45.0,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/images/icon_whatsapp.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildNavBar() {
    return SizedBox(
      width: context.w,
      height: widget.isMin
          ? 115.0
          : context.w < 500
              ? 130
              : 120,
      child: Column(
        children: [
          buildLogosText(),
          Container(
            width: context.w,
            decoration: BoxDecoration(
              color: LightModeTheme().secondaryBackground,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                buildVersionCorreoMovil(),
                Text(
                  '© 2023 MODULARBOX S.L.${context.w < 500 ? '\n' : ' '}TODOS LOS DERECHOS RESERVADOS',
                  textAlign: TextAlign.center,
                  style: LightModeTheme().bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      fontWeight: FontWeight.w900,
                      fontSize: context.w < 500 ? 11 : 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildVersionCorreoMovil() {
    final fontSize = context.w < 330 ? 10.0 : 12.0;
    return Container(
      width: context.w,
      height: 30.0,
      decoration: BoxDecoration(
        color: LightModeTheme().primaryText,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Versions(),
          BtnIcon(
            hoverColor: const Color.fromARGB(144, 255, 255, 255),
            padding: const EdgeInsets.all(0),
            onPressed: _sendEmail,
            icon: Row(
              children: [
                Icon(
                  Icons.email,
                  color: LightModeTheme().bottomBarLoginText,
                  size: 20.0,
                ),
                Text(
                  'info@reservatupista.com',
                  style: LightModeTheme().bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        fontSize: fontSize,
                        color: LightModeTheme().bottomBarLoginText,
                      ),
                ),
              ],
            ),
          ),
          BtnIcon(
            hoverColor: const Color.fromARGB(144, 255, 255, 255),
            padding: const EdgeInsets.all(0),
            onPressed: () => _launchInBrowser(Uri.parse("tel:34653483483")),
            icon: Row(
              children: [
                Icon(
                  Icons.phone,
                  color: LightModeTheme().bottomBarLoginText,
                  size: 20.0,
                ),
                1.0.sw,
                Text(
                  '653483483',
                  style: LightModeTheme().bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        fontSize: fontSize,
                        color: LightModeTheme().bottomBarLoginText,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildResponsiveText(BuildContext context) {
    double fontSize = context.w < 450 ? 12.0 : 16.0;
    fontSize = context.w < 450 ? 12.0 : 14.0;
    if (context.w < 450) {
      return Align(
        alignment: Alignment.center,
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            'Premio a la Creación en la\nIndustria del Software para la\nProvincia de Cáceres',
            textAlign: TextAlign.center,
            maxLines: 3,
            style: LightModeTheme().labelSmall.copyWith(fontSize: fontSize),
          ),
        ),
      );
    }
    return Align(
      alignment: Alignment.center,
      child: AutoSizeText(
        'Premio a la Creación en la Industria\ndel Software para la Provincia de Cáceres',
        textAlign: TextAlign.center,
        maxLines: 2,
        style: LightModeTheme().labelSmall.copyWith(fontSize: fontSize),
      ),
    );
  }
}
