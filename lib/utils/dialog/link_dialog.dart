import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:reservatu_pista/utils/colores.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../flutter_flow/flutter_flow_icon_button.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../sizer.dart';

class LinkDialog extends StatefulWidget {
  /// The title of the dialog is displayed in a large font at the top
  /// of the dialog.
  ///
  /// Usually has a bigger fontSize than the [alertSubtitle].
  final Text alertTitle;

  /// The subtitle of the dialog is displayed in a medium-sized font beneath
  /// the title of the dialog.
  ///
  /// Usually has a smaller fontSize than the [alertTitle]
  final Text alertSubtitle;

  /// The (optional) actions to be performed in the dialog is displayed
  /// the subtitle of the dialog. If no values are provided, a default
  /// [Button] widget is rendered.
  ///
  /// Typically a [List<Widget>] widget.
  final List<Widget> actions;

  final String urlLink;

  /// Specifies how blur the screen overlay effect should be.
  /// Higher values mean more blurred overlays.
  final double blurValue;

  // Specifies the opacity of the screen overlay
  final double backgroundOpacity;

  LinkDialog({
    Key? key,
    required this.alertTitle,
    required this.alertSubtitle,
    this.urlLink =
        'https://reservatupista.com/politica-de-privacidad-proteccion-de-datos-y-politica-de-cookies',
    this.actions = const [],
    this.blurValue = 3.0,
    this.backgroundOpacity = 0.2,
  }) : super(key: key);

  createState() => _LinkDialogState();
}

class _LinkDialogState extends State<LinkDialog> {
  final double dialogHeight = 100.h * (2 / 5);

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: const MediaQueryData(),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: widget.blurValue,
          sigmaY: widget.blurValue,
        ),
        child: Container(
          height: 100.h,
          color: Colors.white.withOpacity(widget.backgroundOpacity),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 90.w,
                      child: Card(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                        ),
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Align(
                                alignment: const AlignmentDirectional(0.9, 0),
                                child: FlutterFlowIconButton(
                                  borderColor:
                                      const Color.fromARGB(255, 0, 0, 0),
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
                              ),
                              10.0.sh,
                              widget.alertTitle,
                              SizedBox(height: dialogHeight / 10),
                              widget.alertSubtitle,
                              SizedBox(height: dialogHeight / 10),
                              defaultAction()
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildActions() {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: widget.actions,
      ),
    );
  }

  Container defaultAction() {
    return Container(
      alignment: Alignment.center,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 2.0,
          backgroundColor: Colores.sucessGeneral,
        ),
        onPressed: () async {
          final urlPoliticaPrivacidad = Uri.parse(widget.urlLink);
          final canLaunch = await canLaunchUrl(urlPoliticaPrivacidad);
          if (canLaunch) {
            launchUrl(urlPoliticaPrivacidad);
          }
        },
        child: const Text(
          'Aceptar',
          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
        ),
      ),
    );
  }
}

Text richTitleLink(String title, {double fontSize = 24.0}) {
  return Text(
    title,
    textAlign: TextAlign.center,
    style: LightModeTheme().bodyLarge.copyWith(fontSize: fontSize),
  );
}

Text richSubtitleLink(String subtitle) {
  return Text(
    subtitle,
    textAlign: TextAlign.center,
    style: LightModeTheme().bodyLarge.copyWith(color: Colors.grey),
  );
}
