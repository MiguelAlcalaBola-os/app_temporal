import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class DetallesPedidoWidget extends StatefulWidget {
  const DetallesPedidoWidget({super.key});

  @override
  State<DetallesPedidoWidget> createState() => _DetallesPedidoWidgetState();
}

class _DetallesPedidoWidgetState extends State<DetallesPedidoWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          alignment: const AlignmentDirectional(0, 0),
          child: Material(
            color: Colors.transparent,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Container(
              width: 370,
              height: 485,
              constraints: const BoxConstraints(
                maxWidth: 570,
              ),
              decoration: BoxDecoration(
                color: LightModeTheme().secondaryBackground,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: LightModeTheme().primaryText,
                  width: 2,
                ),
              ),
              alignment: const AlignmentDirectional(0, 0),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
                                  color: LightModeTheme().reservaPendiente,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: LightModeTheme().primaryText,
                                    width: 2,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(40),
                                    child: Image.network(
                                      'https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyfHxwZXJzb258ZW58MHx8fHwxNzEyMjc4NTE1fDA&ixlib=rb-4.0.3&q=80&w=400',
                                      width: 60,
                                      height: 60,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Stack(
                                alignment: const AlignmentDirectional(0, 0),
                                children: [
                                  Align(
                                    alignment: const AlignmentDirectional(0, 0),
                                    child: Container(
                                      width: 120,
                                      height: 4,
                                      decoration: BoxDecoration(
                                        color:
                                            LightModeTheme().reservaPendiente,
                                        borderRadius: BorderRadius.circular(2),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 44,
                                    height: 44,
                                    decoration: BoxDecoration(
                                      color: LightModeTheme().reservaPendiente,
                                      shape: BoxShape.circle,
                                    ),
                                    alignment: const AlignmentDirectional(0, 0),
                                    child: const Icon(
                                      Icons.keyboard_double_arrow_right_rounded,
                                      color: Colors.black,
                                      size: 32,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
                                  color: LightModeTheme().reservaPendiente,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: LightModeTheme().primaryText,
                                    width: 2,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(40),
                                    child: Image.network(
                                      'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxfHxmYWNlfGVufDB8fHx8MTcxMjI0ODIxN3ww&ixlib=rb-4.0.3&q=80&w=400',
                                      width: 60,
                                      height: 60,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                            ].divide(const SizedBox(width: 16)),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '112,95€',
                                    textAlign: TextAlign.end,
                                    style:
                                        LightModeTheme().displaySmall.override(
                                              fontFamily: 'Outfit',
                                              letterSpacing: 0,
                                            ),
                                  ),
                                ].divide(const SizedBox(height: 4)),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          'Comprador',
                          style: LightModeTheme().labelMedium.override(
                                fontFamily: 'Readex Pro',
                                letterSpacing: 0,
                              ),
                        ),
                        Text(
                          'Adrián García Durán',
                          textAlign: TextAlign.end,
                          style: LightModeTheme().headlineSmall.override(
                                fontFamily: 'Outfit',
                                letterSpacing: 0,
                              ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                          child: Text(
                            'adrian@reservatupista.com',
                            textAlign: TextAlign.end,
                            style: LightModeTheme().labelMedium.override(
                                  fontFamily: 'Readex Pro',
                                  color: LightModeTheme().primary,
                                  letterSpacing: 0,
                                ),
                          ),
                        ),
                        Divider(
                          height: 2,
                          thickness: 1,
                          color: LightModeTheme().reservaPendiente,
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 15),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Información comprador',
                                      style:
                                          LightModeTheme().labelMedium.override(
                                                fontFamily: 'Readex Pro',
                                                letterSpacing: 0,
                                              ),
                                    ),
                                  ].divide(const SizedBox(height: 4)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: RichText(
                                  textScaler: MediaQuery.of(context).textScaler,
                                  text: TextSpan(
                                    children: [
                                      const TextSpan(
                                        text: 'Estado\n',
                                        style: TextStyle(),
                                      ),
                                      TextSpan(
                                        text: 'En proceso',
                                        style:
                                            LightModeTheme().bodyLarge.override(
                                                  fontFamily: 'Readex Pro',
                                                  color: LightModeTheme()
                                                      .reservaPendiente,
                                                  letterSpacing: 0,
                                                  fontWeight: FontWeight.bold,
                                                  lineHeight: 1.5,
                                                ),
                                      )
                                    ],
                                    style:
                                        LightModeTheme().labelMedium.override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0,
                                            ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: RichText(
                                  textScaler: MediaQuery.of(context).textScaler,
                                  text: TextSpan(
                                    children: [
                                      const TextSpan(
                                        text: 'Método de pago\n',
                                        style: TextStyle(),
                                      ),
                                      TextSpan(
                                        text: 'Tarjeta',
                                        style:
                                            LightModeTheme().bodyLarge.override(
                                                  fontFamily: 'Readex Pro',
                                                  letterSpacing: 0,
                                                  fontWeight: FontWeight.bold,
                                                  lineHeight: 1.5,
                                                ),
                                      )
                                    ],
                                    style:
                                        LightModeTheme().labelMedium.override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0,
                                            ),
                                  ),
                                ),
                              ),
                            ].divide(const SizedBox(width: 12)),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: RichText(
                                  textScaler: MediaQuery.of(context).textScaler,
                                  text: TextSpan(
                                    children: [
                                      const TextSpan(
                                        text: 'Dirección\n',
                                        style: TextStyle(),
                                      ),
                                      TextSpan(
                                        text:
                                            'Riolobos, Cáceres\nCalle Alhóndiga, 1, 10693',
                                        style:
                                            LightModeTheme().bodyLarge.override(
                                                  fontFamily: 'Readex Pro',
                                                  letterSpacing: 0,
                                                  fontWeight: FontWeight.bold,
                                                  lineHeight: 1.5,
                                                ),
                                      )
                                    ],
                                    style:
                                        LightModeTheme().labelMedium.override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0,
                                            ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: RichText(
                                  textScaler: MediaQuery.of(context).textScaler,
                                  text: TextSpan(
                                    children: [
                                      const TextSpan(
                                        text: 'Fecha de compra\n\n',
                                        style: TextStyle(),
                                      ),
                                      TextSpan(
                                        text: '05/04/2024 - 13:30',
                                        style:
                                            LightModeTheme().bodyLarge.override(
                                                  fontFamily: 'Readex Pro',
                                                  letterSpacing: 0,
                                                  fontWeight: FontWeight.bold,
                                                  lineHeight: 1.5,
                                                ),
                                      )
                                    ],
                                    style:
                                        LightModeTheme().labelMedium.override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0,
                                            ),
                                  ),
                                ),
                              ),
                            ].divide(const SizedBox(width: 12)),
                          ),
                        ),
                      ]
                          .divide(const SizedBox(height: 4))
                          .addToEnd(const SizedBox(height: 12)),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(1, -1),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 10, 10, 0),
                      child: FlutterFlowIconButton(
                        borderColor: LightModeTheme().error,
                        borderRadius: 20,
                        borderWidth: 0,
                        buttonSize: 40,
                        fillColor: LightModeTheme().errorGeneral,
                        icon: Icon(
                          Icons.close,
                          color: LightModeTheme().secondaryBackground,
                          size: 24,
                        ),
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
