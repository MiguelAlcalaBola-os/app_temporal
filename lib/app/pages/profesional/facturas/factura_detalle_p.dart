import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:reservatu_pista/app/pages/profesional/facturas/factura_detalle_c.dart';
import 'package:reservatu_pista/backend/schema/enums/enums.dart';
import 'package:reservatu_pista/components/navbar_y_appbar_profesional.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';

class FacturaProveedorWidget extends GetView<FacturaDetalleController> {
  const FacturaProveedorWidget({super.key});

  Widget build(BuildContext context) {
    return NavbarYAppbarProfesional(
        title: 'Tarifas Y facturas',
        page: TypePage.None,
        child: Expanded(child: _FacturaProveedorWidgetState()));
  }
}

class _FacturaProveedorWidgetState extends GetView<FacturaDetalleController> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: LightModeTheme().primaryBackground,
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 5),
                    child: Text(
                      'Factura Detallada',
                      style: LightModeTheme().headlineLarge.override(
                            fontFamily: 'Outfit',
                            letterSpacing: 0,
                          ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 5, 16, 0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: LightModeTheme().secondaryBackground,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Número de Factura:',
                                style: LightModeTheme().labelLarge.override(
                                      fontFamily: 'Readex Pro',
                                      letterSpacing: 0,
                                    ),
                              ),
                              Text(
                                '001-A',
                                style: LightModeTheme().bodyLarge.override(
                                      fontFamily: 'Readex Pro',
                                      letterSpacing: 0,
                                    ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Fecha de Emisión:',
                                style: LightModeTheme().labelLarge.override(
                                      fontFamily: 'Readex Pro',
                                      letterSpacing: 0,
                                    ),
                              ),
                              Text(
                                '01/04/2023',
                                style: LightModeTheme().bodyLarge.override(
                                      fontFamily: 'Readex Pro',
                                      letterSpacing: 0,
                                    ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Fecha de Vencimiento:',
                                style: LightModeTheme().labelLarge.override(
                                      fontFamily: 'Readex Pro',
                                      letterSpacing: 0,
                                    ),
                              ),
                              Text(
                                '15/04/2023',
                                style: LightModeTheme().bodyLarge.override(
                                      fontFamily: 'Readex Pro',
                                      letterSpacing: 0,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 5),
                    child: Text(
                      'Detalles del Proveedor:',
                      style: LightModeTheme().headlineMedium.override(
                            fontFamily: 'Outfit',
                            letterSpacing: 0,
                          ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 5, 16, 0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: LightModeTheme().secondaryBackground,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Modularbox SL',
                            style: LightModeTheme().bodyLarge.override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0,
                                ),
                          ),
                          Text(
                            'B10445955 ',
                            style: LightModeTheme().bodyLarge.override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0,
                                ),
                          ),
                          Text(
                            'Calle Llanos de Cáceres Nº1, 10195 (Cáceres)',
                            textAlign: TextAlign.center,
                            style: LightModeTheme().bodyLarge.override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0,
                                ),
                          ),
                          Text(
                            '653483483 ',
                            style: LightModeTheme().bodyLarge.override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0,
                                ),
                          ),
                          Text(
                            'proveedores@reservatupista.com',
                            style: LightModeTheme().bodyLarge.override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 5),
                    child: Text(
                      'Detalles del Cliente:',
                      style: LightModeTheme().headlineMedium.override(
                            fontFamily: 'Outfit',
                            letterSpacing: 0,
                          ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 5, 16, 0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: LightModeTheme().secondaryBackground,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Juan Pérez González',
                            style: LightModeTheme().bodyLarge.override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0,
                                ),
                          ),
                          Text(
                            'S-00234',
                            style: LightModeTheme().bodyLarge.override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0,
                                ),
                          ),
                          Text(
                            'Avenida de la Constitución 56, Ciudad Real',
                            style: LightModeTheme().bodyLarge.override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0,
                                ),
                          ),
                          Text(
                            '+34 678 901 234',
                            style: LightModeTheme().bodyLarge.override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0,
                                ),
                          ),
                          Text(
                            'juanperez@example.com',
                            style: LightModeTheme().bodyLarge.override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 5),
                    child: Text(
                      'Desglose de Servicios:',
                      style: LightModeTheme().headlineMedium.override(
                            fontFamily: 'Outfit',
                            letterSpacing: 0,
                          ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 5, 16, 0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: LightModeTheme().secondaryBackground,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'Club:',
                                          style: LightModeTheme()
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                letterSpacing: 0,
                                              ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'Pista:',
                                          style: LightModeTheme()
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                letterSpacing: 0,
                                              ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'Reserva:',
                                          style: LightModeTheme()
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                letterSpacing: 0,
                                              ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'Pagos:',
                                          style: LightModeTheme()
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                letterSpacing: 0,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ].divide(SizedBox(height: 2)),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          '20,00€',
                                          style: LightModeTheme()
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                letterSpacing: 0,
                                              ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          '2,50€',
                                          style: LightModeTheme()
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                letterSpacing: 0,
                                              ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          '0,40€',
                                          style: LightModeTheme()
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                letterSpacing: 0,
                                              ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          '200€',
                                          style: LightModeTheme()
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                letterSpacing: 0,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ].divide(SizedBox(height: 2)),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          '1',
                                          style: LightModeTheme()
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                letterSpacing: 0,
                                              ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          '12',
                                          style: LightModeTheme()
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                letterSpacing: 0,
                                              ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          '52',
                                          style: LightModeTheme()
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                letterSpacing: 0,
                                              ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          '3%',
                                          style: LightModeTheme()
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                letterSpacing: 0,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ].divide(SizedBox(height: 2)),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          '20,00€',
                                          style: LightModeTheme()
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                letterSpacing: 0,
                                              ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          '30,00€',
                                          style: LightModeTheme()
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                letterSpacing: 0,
                                              ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          '20,80€',
                                          style: LightModeTheme()
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                letterSpacing: 0,
                                              ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          '20,80€',
                                          style: LightModeTheme()
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                letterSpacing: 0,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ].divide(SizedBox(height: 2)),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Descuento:',
                                style: LightModeTheme().bodyLarge.override(
                                      fontFamily: 'Readex Pro',
                                      color: LightModeTheme().error,
                                      letterSpacing: 0,
                                    ),
                              ),
                              Text(
                                '-60,00€',
                                style: LightModeTheme().bodyLarge.override(
                                      fontFamily: 'Readex Pro',
                                      color: LightModeTheme().error,
                                      letterSpacing: 0,
                                    ),
                              ),
                            ],
                          ),
                          Divider(
                            height: 24,
                            thickness: 2,
                            color: LightModeTheme().accent3,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Subtotal:',
                                style: LightModeTheme().headlineMedium.override(
                                      fontFamily: 'Outfit',
                                      letterSpacing: 0,
                                    ),
                              ),
                              Text(
                                '135,00€',
                                style: LightModeTheme().headlineMedium.override(
                                      fontFamily: 'Outfit',
                                      letterSpacing: 0,
                                    ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'IVA 21%:',
                                style: LightModeTheme().headlineMedium.override(
                                      fontFamily: 'Outfit',
                                      fontSize: 24,
                                      letterSpacing: 0,
                                    ),
                              ),
                              Text(
                                '28,00€',
                                style: LightModeTheme().headlineMedium.override(
                                      fontFamily: 'Outfit',
                                      letterSpacing: 0,
                                    ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total:',
                                style: LightModeTheme().headlineLarge.override(
                                      fontFamily: 'Outfit',
                                      letterSpacing: 0,
                                    ),
                              ),
                              Text(
                                '163,00€',
                                style: LightModeTheme().headlineLarge.override(
                                      fontFamily: 'Outfit',
                                      letterSpacing: 0,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                        child: FFButtonWidget(
                          onPressed: () {
                            print('Button pressed ...');
                          },
                          text: 'Descargar factura',
                          options: FFButtonOptions(
                            height: 60,
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                            iconPadding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                            color: LightModeTheme().proveedor,
                            textStyle: LightModeTheme().titleSmall.override(
                                  fontFamily: 'Readex Pro',
                                  color: LightModeTheme().primaryText,
                                  letterSpacing: 0,
                                ),
                            elevation: 2,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                        child: FFButtonWidget(
                          onPressed: () {
                            print('Button pressed ...');
                          },
                          text: 'Enviar al email',
                          options: FFButtonOptions(
                            height: 60,
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                            iconPadding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                            color: LightModeTheme().proveedor,
                            textStyle: LightModeTheme().titleSmall.override(
                                  fontFamily: 'Readex Pro',
                                  color: LightModeTheme().primaryText,
                                  letterSpacing: 0,
                                ),
                            elevation: 2,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 45,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
