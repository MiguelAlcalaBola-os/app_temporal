import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/route_manager.dart';
import 'package:reservatu_pista/app/pages/profesional/facturas/factura_detalle_p.dart';
import 'package:reservatu_pista/app/pages/profesional/tarifas_proveedor/tarifas_proveedor_c.dart';
import 'package:reservatu_pista/backend/schema/enums/enums.dart';
import 'package:reservatu_pista/components/navbar_y_appbar_profesional.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_util.dart';
import 'package:reservatu_pista/utils/responsive_web.dart';
import 'package:reservatu_pista/utils/sizer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';

class TarifasProveedorPage extends GetView<TarifasProveedorController> {
  const TarifasProveedorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return NavbarYAppbarProfesional(
        title: 'Tarifas',
        page: TypePage.None,
        child: Expanded(child: _TarifasProveedorPageState()));
  }
}

class _TarifasProveedorPageState extends GetView<TarifasProveedorController> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Text('\nNo se encontraron Tarifas.',
        style: LightModeTheme().bodyMedium.copyWith(
            color: Colors.black, fontWeight: FontWeight.w700, fontSize: 16));
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: LightModeTheme().primaryBackground,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
            child: ResponsiveWeb(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                child: SizedBox(
                  height: 60,
                  child: PageView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FFButtonWidget(
                            onPressed: () {},
                            text: '',
                            icon: const Icon(
                              Icons.arrow_back,
                              size: 15,
                            ),
                            options: FFButtonOptions(
                              height: 40,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12, 0, 12, 0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 0, 0),
                              color: LightModeTheme().proveedor,
                              textStyle: LightModeTheme().titleSmall.override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                    letterSpacing: 0,
                                  ),
                              elevation: 3,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          Text(
                            'Febrero',
                            textAlign: TextAlign.center,
                            style: LightModeTheme().bodyMedium.override(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 32,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          FFButtonWidget(
                            onPressed: () {},
                            text: '',
                            icon: const Icon(
                              Icons.arrow_forward,
                              size: 15,
                            ),
                            options: FFButtonOptions(
                              height: 40,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12, 0, 12, 0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 0, 0),
                              color: LightModeTheme().proveedor,
                              textStyle: LightModeTheme().titleSmall.override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                    letterSpacing: 0,
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
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FFButtonWidget(
                            onPressed: () {},
                            text: '',
                            icon: const Icon(
                              Icons.arrow_back,
                              size: 15,
                            ),
                            options: FFButtonOptions(
                              height: 40,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12, 0, 12, 0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 0, 0),
                              color: LightModeTheme().proveedor,
                              textStyle: LightModeTheme().titleSmall.override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                    letterSpacing: 0,
                                  ),
                              elevation: 3,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          Text(
                            'Marzo',
                            textAlign: TextAlign.center,
                            style: LightModeTheme().bodyMedium.override(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 32,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          FFButtonWidget(
                            onPressed: () {},
                            text: '',
                            icon: const Icon(
                              Icons.arrow_forward,
                              size: 15,
                            ),
                            options: FFButtonOptions(
                              height: 40,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12, 0, 12, 0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 0, 0),
                              color: LightModeTheme().proveedor,
                              textStyle: LightModeTheme().titleSmall.override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                    letterSpacing: 0,
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
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FFButtonWidget(
                            onPressed: () {},
                            text: '',
                            icon: const Icon(
                              Icons.arrow_back,
                              size: 15,
                            ),
                            options: FFButtonOptions(
                              height: 40,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12, 0, 12, 0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 0, 0),
                              color: LightModeTheme().proveedor,
                              textStyle: LightModeTheme().titleSmall.override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                    letterSpacing: 0,
                                  ),
                              elevation: 3,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          Text(
                            'Abril',
                            textAlign: TextAlign.center,
                            style: LightModeTheme().bodyMedium.override(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 32,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          FFButtonWidget(
                            onPressed: () {},
                            text: '',
                            icon: const Icon(
                              Icons.arrow_forward,
                              size: 15,
                            ),
                            options: FFButtonOptions(
                              height: 40,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12, 0, 12, 0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 0, 0),
                              color: LightModeTheme().proveedor,
                              textStyle: LightModeTheme().titleSmall.override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                    letterSpacing: 0,
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
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: ResponsiveWeb(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0, 0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 30),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 0, 20, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0, 0, 0, 20),
                                            child: Text(
                                              ' ',
                                              style: LightModeTheme()
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    fontSize: 18,
                                                    letterSpacing: 0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0, 0, 0, 20),
                                            child: Text(
                                              'Club',
                                              style: LightModeTheme()
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    fontSize: 18,
                                                    letterSpacing: 0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0, 0, 0, 20),
                                            child: Text(
                                              'Pistas',
                                              style: LightModeTheme()
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    fontSize: 18,
                                                    letterSpacing: 0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0, 0, 0, 20),
                                            child: Text(
                                              'Reservas',
                                              style: LightModeTheme()
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    fontSize: 18,
                                                    letterSpacing: 0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0, 0, 0, 10),
                                            child: Text(
                                              'Pagos',
                                              style: LightModeTheme()
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    fontSize: 18,
                                                    letterSpacing: 0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 0, 20, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0, 0, 0, 20),
                                            child: Text(
                                              'Unidad',
                                              style: LightModeTheme()
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    fontSize: 20,
                                                    letterSpacing: 0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0, 0, 0, 20),
                                            child: Text(
                                              ' 1',
                                              style: LightModeTheme()
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    fontSize: 18,
                                                    letterSpacing: 0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0, 0, 0, 20),
                                            child: Text(
                                              '2',
                                              style: LightModeTheme()
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    fontSize: 18,
                                                    letterSpacing: 0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0, 0, 0, 20),
                                            child: Text(
                                              '52',
                                              style: LightModeTheme()
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    fontSize: 18,
                                                    letterSpacing: 0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0, 0, 0, 10),
                                            child: Text(
                                              '200,00€',
                                              style: LightModeTheme()
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    fontSize: 18,
                                                    letterSpacing: 0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: LightModeTheme().aguamarina,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(10, 0, 10, 0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 20),
                                              child: Text(
                                                'Precio',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 20,
                                                          letterSpacing: 0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 20),
                                              child: Text(
                                                ' 20,00€',
                                                style: LightModeTheme()
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      fontSize: 18,
                                                      letterSpacing: 0,
                                                    ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 20),
                                              child: Text(
                                                '2,50€',
                                                style: LightModeTheme()
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      fontSize: 18,
                                                      letterSpacing: 0,
                                                    ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 20),
                                              child: Text(
                                                '0,40€',
                                                style: LightModeTheme()
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      fontSize: 18,
                                                      letterSpacing: 0,
                                                    ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 10),
                                              child: Text(
                                                '3%',
                                                style: LightModeTheme()
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      fontSize: 18,
                                                      letterSpacing: 0,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              10, 0, 0, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0, 0, 0, 20),
                                            child: Text(
                                              'Total',
                                              style: LightModeTheme()
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    fontSize: 20,
                                                    letterSpacing: 0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0, 0, 0, 20),
                                            child: Text(
                                              '20,00€',
                                              style: LightModeTheme()
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    fontSize: 18,
                                                    letterSpacing: 0,
                                                  ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0, 0, 0, 20),
                                            child: Text(
                                              '5,00€',
                                              style: LightModeTheme()
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    fontSize: 18,
                                                    letterSpacing: 0,
                                                  ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0, 0, 0, 20),
                                            child: Text(
                                              '27,20€',
                                              style: LightModeTheme()
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    fontSize: 18,
                                                    letterSpacing: 0,
                                                  ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0, 0, 0, 10),
                                            child: Text(
                                              '14.40€',
                                              style: LightModeTheme()
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    fontSize: 18,
                                                    letterSpacing: 0,
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
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(15, 0, 15, 50),
                      child: Container(
                        height: 90,
                        decoration: BoxDecoration(
                          color: LightModeTheme().secondaryBackground,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: LightModeTheme().primaryText,
                            width: 2,
                          ),
                        ),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                height: 80,
                                decoration: BoxDecoration(
                                  color: LightModeTheme().secondaryBackground,
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(8),
                                    bottomRight: Radius.circular(0),
                                    topLeft: Radius.circular(8),
                                    topRight: Radius.circular(0),
                                  ),
                                  border: Border.all(
                                    color: LightModeTheme().secondaryBackground,
                                  ),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Pistas',
                                      style:
                                          LightModeTheme().bodyMedium.override(
                                                fontFamily: 'Readex Pro',
                                                fontSize: 20,
                                                letterSpacing: 0,
                                              ),
                                    ),
                                    SizedBox(
                                      width: 80,
                                      child: Divider(
                                        thickness: 1,
                                        color: LightModeTheme().primaryText,
                                      ),
                                    ),
                                    Text(
                                      'Precio',
                                      style:
                                          LightModeTheme().bodyMedium.override(
                                                fontFamily: 'Readex Pro',
                                                fontSize: 20,
                                                letterSpacing: 0,
                                              ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 80,
                                child: VerticalDivider(
                                  thickness: 1,
                                  color: LightModeTheme().primaryText,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 15, 0),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 0.6,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    color: LightModeTheme().secondaryBackground,
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(0),
                                      bottomRight: Radius.circular(8),
                                      topLeft: Radius.circular(0),
                                      topRight: Radius.circular(8),
                                    ),
                                    border: Border.all(
                                      color:
                                          LightModeTheme().secondaryBackground,
                                      width: 2,
                                    ),
                                  ),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          decoration: const BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                '1',
                                                style: LightModeTheme()
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      fontSize: 20,
                                                      letterSpacing: 0,
                                                    ),
                                              ),
                                              SizedBox(
                                                width: 30,
                                                child: Divider(
                                                  thickness: 1,
                                                  color: LightModeTheme()
                                                      .primaryText,
                                                ),
                                              ),
                                              Text(
                                                '3,00€',
                                                style: LightModeTheme()
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      fontSize: 20,
                                                      letterSpacing: 0,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 80,
                                          child: VerticalDivider(
                                            thickness: 1,
                                            color: LightModeTheme().primaryText,
                                          ),
                                        ),
                                        Container(
                                          decoration: const BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                '2',
                                                style: LightModeTheme()
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      fontSize: 20,
                                                      letterSpacing: 0,
                                                    ),
                                              ),
                                              SizedBox(
                                                width: 30,
                                                child: Divider(
                                                  thickness: 1,
                                                  color: LightModeTheme()
                                                      .primaryText,
                                                ),
                                              ),
                                              Text(
                                                '2,50€',
                                                style: LightModeTheme()
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      fontSize: 20,
                                                      letterSpacing: 0,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 80,
                                          child: VerticalDivider(
                                            thickness: 1,
                                            color: LightModeTheme().primaryText,
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: LightModeTheme().aguamarina,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                '3',
                                                style: LightModeTheme()
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      fontSize: 20,
                                                      letterSpacing: 0,
                                                    ),
                                              ),
                                              SizedBox(
                                                width: 30,
                                                child: Divider(
                                                  thickness: 1,
                                                  color: LightModeTheme()
                                                      .primaryText,
                                                ),
                                              ),
                                              Text(
                                                '2,00€',
                                                style: LightModeTheme()
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      fontSize: 20,
                                                      letterSpacing: 0,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 80,
                                          child: VerticalDivider(
                                            thickness: 1,
                                            color: LightModeTheme().primaryText,
                                          ),
                                        ),
                                        Container(
                                          decoration: const BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                '4',
                                                style: LightModeTheme()
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      fontSize: 20,
                                                      letterSpacing: 0,
                                                    ),
                                              ),
                                              SizedBox(
                                                width: 30,
                                                child: Divider(
                                                  thickness: 1,
                                                  color: LightModeTheme()
                                                      .primaryText,
                                                ),
                                              ),
                                              Text(
                                                '1,50€',
                                                style: LightModeTheme()
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      fontSize: 20,
                                                      letterSpacing: 0,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 80,
                                          child: VerticalDivider(
                                            thickness: 1,
                                            color: LightModeTheme().primaryText,
                                          ),
                                        ),
                                        Container(
                                          decoration: const BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                '5',
                                                style: LightModeTheme()
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      fontSize: 20,
                                                      letterSpacing: 0,
                                                    ),
                                              ),
                                              SizedBox(
                                                width: 30,
                                                child: Divider(
                                                  thickness: 1,
                                                  color: LightModeTheme()
                                                      .primaryText,
                                                ),
                                              ),
                                              Text(
                                                '1,00€',
                                                style: LightModeTheme()
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      fontSize: 20,
                                                      letterSpacing: 0,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 80,
                                          child: VerticalDivider(
                                            thickness: 1,
                                            color: LightModeTheme().primaryText,
                                          ),
                                        ),
                                        Container(
                                          decoration: const BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                '6',
                                                style: LightModeTheme()
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      fontSize: 20,
                                                      letterSpacing: 0,
                                                    ),
                                              ),
                                              SizedBox(
                                                width: 30,
                                                child: Divider(
                                                  thickness: 1,
                                                  color: LightModeTheme()
                                                      .primaryText,
                                                ),
                                              ),
                                              Text(
                                                '0,50€',
                                                style: LightModeTheme()
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      fontSize: 20,
                                                      letterSpacing: 0,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 80,
                                          child: VerticalDivider(
                                            thickness: 1,
                                            color: LightModeTheme().primaryText,
                                          ),
                                        ),
                                        Container(
                                          decoration: const BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                '7',
                                                style: LightModeTheme()
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      fontSize: 20,
                                                      letterSpacing: 0,
                                                    ),
                                              ),
                                              SizedBox(
                                                width: 30,
                                                child: Divider(
                                                  thickness: 1,
                                                  color: LightModeTheme()
                                                      .primaryText,
                                                ),
                                              ),
                                              Text(
                                                '0,20€',
                                                style: LightModeTheme()
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      fontSize: 20,
                                                      letterSpacing: 0,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 80,
                                          child: VerticalDivider(
                                            thickness: 1,
                                            color: LightModeTheme().primaryText,
                                          ),
                                        ),
                                        Container(
                                          decoration: const BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                '8',
                                                style: LightModeTheme()
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      fontSize: 20,
                                                      letterSpacing: 0,
                                                    ),
                                              ),
                                              SizedBox(
                                                width: 30,
                                                child: Divider(
                                                  thickness: 1,
                                                  color: LightModeTheme()
                                                      .primaryText,
                                                ),
                                              ),
                                              Text(
                                                '0,10€',
                                                style: LightModeTheme()
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      fontSize: 20,
                                                      letterSpacing: 0,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 80,
                                          child: VerticalDivider(
                                            thickness: 1,
                                            color: LightModeTheme().primaryText,
                                          ),
                                        ),
                                        Container(
                                          decoration: const BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                '9',
                                                style: LightModeTheme()
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      fontSize: 20,
                                                      letterSpacing: 0,
                                                    ),
                                              ),
                                              SizedBox(
                                                width: 30,
                                                child: Divider(
                                                  thickness: 1,
                                                  color: LightModeTheme()
                                                      .primaryText,
                                                ),
                                              ),
                                              Text(
                                                '0,05€',
                                                style: LightModeTheme()
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      fontSize: 20,
                                                      letterSpacing: 0,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(15, 0, 15, 50),
                      child: Container(
                        height: 90,
                        decoration: BoxDecoration(
                          color: LightModeTheme().secondaryBackground,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: LightModeTheme().primaryText,
                            width: 2,
                          ),
                        ),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                height: 80,
                                decoration: BoxDecoration(
                                  color: LightModeTheme().secondaryBackground,
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(8),
                                    bottomRight: Radius.circular(0),
                                    topLeft: Radius.circular(8),
                                    topRight: Radius.circular(0),
                                  ),
                                  border: Border.all(
                                    color: LightModeTheme().secondaryBackground,
                                  ),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Reservas',
                                      style:
                                          LightModeTheme().bodyMedium.override(
                                                fontFamily: 'Readex Pro',
                                                fontSize: 20,
                                                letterSpacing: 0,
                                              ),
                                    ),
                                    SizedBox(
                                      width: 80,
                                      child: Divider(
                                        thickness: 1,
                                        color: LightModeTheme().primaryText,
                                      ),
                                    ),
                                    Text(
                                      'Precio',
                                      style:
                                          LightModeTheme().bodyMedium.override(
                                                fontFamily: 'Readex Pro',
                                                fontSize: 20,
                                                letterSpacing: 0,
                                              ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 80,
                                child: VerticalDivider(
                                  thickness: 1,
                                  color: LightModeTheme().primaryText,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 15, 0),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 0.6,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    color: LightModeTheme().secondaryBackground,
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(0),
                                      bottomRight: Radius.circular(8),
                                      topLeft: Radius.circular(0),
                                      topRight: Radius.circular(8),
                                    ),
                                    border: Border.all(
                                      color:
                                          LightModeTheme().secondaryBackground,
                                      width: 2,
                                    ),
                                  ),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          decoration: const BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                '25',
                                                style: LightModeTheme()
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      fontSize: 20,
                                                      letterSpacing: 0,
                                                    ),
                                              ),
                                              SizedBox(
                                                width: 30,
                                                child: Divider(
                                                  thickness: 1,
                                                  color: LightModeTheme()
                                                      .primaryText,
                                                ),
                                              ),
                                              Text(
                                                '0,50€',
                                                style: LightModeTheme()
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      fontSize: 20,
                                                      letterSpacing: 0,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 80,
                                          child: VerticalDivider(
                                            thickness: 1,
                                            color: LightModeTheme().primaryText,
                                          ),
                                        ),
                                        Container(
                                          decoration: const BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                '50',
                                                style: LightModeTheme()
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      fontSize: 20,
                                                      letterSpacing: 0,
                                                    ),
                                              ),
                                              SizedBox(
                                                width: 30,
                                                child: Divider(
                                                  thickness: 1,
                                                  color: LightModeTheme()
                                                      .primaryText,
                                                ),
                                              ),
                                              Text(
                                                '0,40€',
                                                style: LightModeTheme()
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      fontSize: 20,
                                                      letterSpacing: 0,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 80,
                                          child: VerticalDivider(
                                            thickness: 1,
                                            color: LightModeTheme().primaryText,
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: LightModeTheme().aguamarina,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                '75',
                                                style: LightModeTheme()
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      fontSize: 20,
                                                      letterSpacing: 0,
                                                    ),
                                              ),
                                              SizedBox(
                                                width: 30,
                                                child: Divider(
                                                  thickness: 1,
                                                  color: LightModeTheme()
                                                      .primaryText,
                                                ),
                                              ),
                                              Text(
                                                '0,35€',
                                                style: LightModeTheme()
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      fontSize: 20,
                                                      letterSpacing: 0,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 80,
                                          child: VerticalDivider(
                                            thickness: 1,
                                            color: LightModeTheme().primaryText,
                                          ),
                                        ),
                                        Container(
                                          decoration: const BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                '80',
                                                style: LightModeTheme()
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      fontSize: 20,
                                                      letterSpacing: 0,
                                                    ),
                                              ),
                                              SizedBox(
                                                width: 30,
                                                child: Divider(
                                                  thickness: 1,
                                                  color: LightModeTheme()
                                                      .primaryText,
                                                ),
                                              ),
                                              Text(
                                                '0,25€',
                                                style: LightModeTheme()
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      fontSize: 20,
                                                      letterSpacing: 0,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 80,
                                          child: VerticalDivider(
                                            thickness: 1,
                                            color: LightModeTheme().primaryText,
                                          ),
                                        ),
                                        Container(
                                          decoration: const BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                '200',
                                                style: LightModeTheme()
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      fontSize: 20,
                                                      letterSpacing: 0,
                                                    ),
                                              ),
                                              SizedBox(
                                                width: 30,
                                                child: Divider(
                                                  thickness: 1,
                                                  color: LightModeTheme()
                                                      .primaryText,
                                                ),
                                              ),
                                              Text(
                                                '0,20€',
                                                style: LightModeTheme()
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      fontSize: 20,
                                                      letterSpacing: 0,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 80,
                                          child: VerticalDivider(
                                            thickness: 1,
                                            color: LightModeTheme().primaryText,
                                          ),
                                        ),
                                        Container(
                                          decoration: const BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                '300',
                                                style: LightModeTheme()
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      fontSize: 20,
                                                      letterSpacing: 0,
                                                    ),
                                              ),
                                              SizedBox(
                                                width: 30,
                                                child: Divider(
                                                  thickness: 1,
                                                  color: LightModeTheme()
                                                      .primaryText,
                                                ),
                                              ),
                                              Text(
                                                '0,15€',
                                                style: LightModeTheme()
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      fontSize: 20,
                                                      letterSpacing: 0,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 80,
                                          child: VerticalDivider(
                                            thickness: 1,
                                            color: LightModeTheme().primaryText,
                                          ),
                                        ),
                                        Container(
                                          decoration: const BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                '400',
                                                style: LightModeTheme()
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      fontSize: 20,
                                                      letterSpacing: 0,
                                                    ),
                                              ),
                                              SizedBox(
                                                width: 30,
                                                child: Divider(
                                                  thickness: 1,
                                                  color: LightModeTheme()
                                                      .primaryText,
                                                ),
                                              ),
                                              Text(
                                                '0,10€',
                                                style: LightModeTheme()
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      fontSize: 20,
                                                      letterSpacing: 0,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 80,
                                          child: VerticalDivider(
                                            thickness: 1,
                                            color: LightModeTheme().primaryText,
                                          ),
                                        ),
                                        Container(
                                          decoration: const BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                '500',
                                                style: LightModeTheme()
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      fontSize: 20,
                                                      letterSpacing: 0,
                                                    ),
                                              ),
                                              SizedBox(
                                                width: 30,
                                                child: Divider(
                                                  thickness: 1,
                                                  color: LightModeTheme()
                                                      .primaryText,
                                                ),
                                              ),
                                              Text(
                                                '0,10€',
                                                style: LightModeTheme()
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      fontSize: 20,
                                                      letterSpacing: 0,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 80,
                                          child: VerticalDivider(
                                            thickness: 1,
                                            color: LightModeTheme().primaryText,
                                          ),
                                        ),
                                        Container(
                                          decoration: const BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                '600',
                                                style: LightModeTheme()
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      fontSize: 20,
                                                      letterSpacing: 0,
                                                    ),
                                              ),
                                              SizedBox(
                                                width: 30,
                                                child: Divider(
                                                  thickness: 1,
                                                  color: LightModeTheme()
                                                      .primaryText,
                                                ),
                                              ),
                                              Text(
                                                '0,05€',
                                                style: LightModeTheme()
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      fontSize: 20,
                                                      letterSpacing: 0,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(15, 0, 15, 50),
                      child: Container(
                        height: 90,
                        decoration: BoxDecoration(
                          color: LightModeTheme().secondaryBackground,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: LightModeTheme().primaryText,
                            width: 2,
                          ),
                        ),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                height: 80,
                                decoration: BoxDecoration(
                                  color: LightModeTheme().secondaryBackground,
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(8),
                                    bottomRight: Radius.circular(0),
                                    topLeft: Radius.circular(8),
                                    topRight: Radius.circular(0),
                                  ),
                                  border: Border.all(
                                    color: LightModeTheme().secondaryBackground,
                                  ),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Pagos',
                                      style:
                                          LightModeTheme().bodyMedium.override(
                                                fontFamily: 'Readex Pro',
                                                fontSize: 20,
                                                letterSpacing: 0,
                                              ),
                                    ),
                                    SizedBox(
                                      width: 80,
                                      child: Divider(
                                        thickness: 1,
                                        color: LightModeTheme().primaryText,
                                      ),
                                    ),
                                    Text(
                                      'Precio',
                                      style:
                                          LightModeTheme().bodyMedium.override(
                                                fontFamily: 'Readex Pro',
                                                fontSize: 20,
                                                letterSpacing: 0,
                                              ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 80,
                                child: VerticalDivider(
                                  thickness: 1,
                                  color: LightModeTheme().primaryText,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 15, 0),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 0.6,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    color: LightModeTheme().secondaryBackground,
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(0),
                                      bottomRight: Radius.circular(8),
                                      topLeft: Radius.circular(0),
                                      topRight: Radius.circular(8),
                                    ),
                                    border: Border.all(
                                      color:
                                          LightModeTheme().secondaryBackground,
                                      width: 2,
                                    ),
                                  ),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          decoration: const BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                '25',
                                                style: LightModeTheme()
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      fontSize: 20,
                                                      letterSpacing: 0,
                                                    ),
                                              ),
                                              SizedBox(
                                                width: 30,
                                                child: Divider(
                                                  thickness: 1,
                                                  color: LightModeTheme()
                                                      .primaryText,
                                                ),
                                              ),
                                              Text(
                                                '3%',
                                                style: LightModeTheme()
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      fontSize: 20,
                                                      letterSpacing: 0,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 80,
                                          child: VerticalDivider(
                                            thickness: 1,
                                            color: LightModeTheme().primaryText,
                                          ),
                                        ),
                                        Container(
                                          decoration: const BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                '50',
                                                style: LightModeTheme()
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      fontSize: 20,
                                                      letterSpacing: 0,
                                                    ),
                                              ),
                                              SizedBox(
                                                width: 30,
                                                child: Divider(
                                                  thickness: 1,
                                                  color: LightModeTheme()
                                                      .primaryText,
                                                ),
                                              ),
                                              Text(
                                                '2,75%',
                                                style: LightModeTheme()
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      fontSize: 20,
                                                      letterSpacing: 0,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 80,
                                          child: VerticalDivider(
                                            thickness: 1,
                                            color: LightModeTheme().primaryText,
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: LightModeTheme().aguamarina,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                '75',
                                                style: LightModeTheme()
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      fontSize: 20,
                                                      letterSpacing: 0,
                                                    ),
                                              ),
                                              SizedBox(
                                                width: 30,
                                                child: Divider(
                                                  thickness: 1,
                                                  color: LightModeTheme()
                                                      .primaryText,
                                                ),
                                              ),
                                              Text(
                                                '2,5%',
                                                style: LightModeTheme()
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      fontSize: 20,
                                                      letterSpacing: 0,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 80,
                                          child: VerticalDivider(
                                            thickness: 1,
                                            color: LightModeTheme().primaryText,
                                          ),
                                        ),
                                        Container(
                                          decoration: const BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                '80',
                                                style: LightModeTheme()
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      fontSize: 20,
                                                      letterSpacing: 0,
                                                    ),
                                              ),
                                              SizedBox(
                                                width: 30,
                                                child: Divider(
                                                  thickness: 1,
                                                  color: LightModeTheme()
                                                      .primaryText,
                                                ),
                                              ),
                                              Text(
                                                '2,25%',
                                                style: LightModeTheme()
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      fontSize: 20,
                                                      letterSpacing: 0,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 80,
                                          child: VerticalDivider(
                                            thickness: 1,
                                            color: LightModeTheme().primaryText,
                                          ),
                                        ),
                                        Container(
                                          decoration: const BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                '200',
                                                style: LightModeTheme()
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      fontSize: 20,
                                                      letterSpacing: 0,
                                                    ),
                                              ),
                                              SizedBox(
                                                width: 30,
                                                child: Divider(
                                                  thickness: 1,
                                                  color: LightModeTheme()
                                                      .primaryText,
                                                ),
                                              ),
                                              Text(
                                                '2%',
                                                style: LightModeTheme()
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      fontSize: 20,
                                                      letterSpacing: 0,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 80,
                                          child: VerticalDivider(
                                            thickness: 1,
                                            color: LightModeTheme().primaryText,
                                          ),
                                        ),
                                        Container(
                                          decoration: const BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                '300',
                                                style: LightModeTheme()
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      fontSize: 20,
                                                      letterSpacing: 0,
                                                    ),
                                              ),
                                              SizedBox(
                                                width: 30,
                                                child: Divider(
                                                  thickness: 1,
                                                  color: LightModeTheme()
                                                      .primaryText,
                                                ),
                                              ),
                                              Text(
                                                '1,75%',
                                                style: LightModeTheme()
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      fontSize: 20,
                                                      letterSpacing: 0,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 80,
                                          child: VerticalDivider(
                                            thickness: 1,
                                            color: LightModeTheme().primaryText,
                                          ),
                                        ),
                                        Container(
                                          decoration: const BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                '400',
                                                style: LightModeTheme()
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      fontSize: 20,
                                                      letterSpacing: 0,
                                                    ),
                                              ),
                                              SizedBox(
                                                width: 30,
                                                child: Divider(
                                                  thickness: 1,
                                                  color: LightModeTheme()
                                                      .primaryText,
                                                ),
                                              ),
                                              Text(
                                                '1,50%',
                                                style: LightModeTheme()
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      fontSize: 20,
                                                      letterSpacing: 0,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 80,
                                          child: VerticalDivider(
                                            thickness: 1,
                                            color: LightModeTheme().primaryText,
                                          ),
                                        ),
                                        Container(
                                          decoration: const BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                '500',
                                                style: LightModeTheme()
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      fontSize: 20,
                                                      letterSpacing: 0,
                                                    ),
                                              ),
                                              SizedBox(
                                                width: 30,
                                                child: Divider(
                                                  thickness: 1,
                                                  color: LightModeTheme()
                                                      .primaryText,
                                                ),
                                              ),
                                              Text(
                                                '1,25%',
                                                style: LightModeTheme()
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      fontSize: 20,
                                                      letterSpacing: 0,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 80,
                                          child: VerticalDivider(
                                            thickness: 1,
                                            color: LightModeTheme().primaryText,
                                          ),
                                        ),
                                        Container(
                                          decoration: const BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                '600',
                                                style: LightModeTheme()
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      fontSize: 20,
                                                      letterSpacing: 0,
                                                    ),
                                              ),
                                              SizedBox(
                                                width: 30,
                                                child: Divider(
                                                  thickness: 1,
                                                  color: LightModeTheme()
                                                      .primaryText,
                                                ),
                                              ),
                                              Text(
                                                '1%',
                                                style: LightModeTheme()
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      fontSize: 20,
                                                      letterSpacing: 0,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          Get.to(const FacturaProveedorWidget());
                        },
                        child: Material(
                          color: Colors.transparent,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Container(
                            width: 130,
                            height: 40,
                            decoration: BoxDecoration(
                              color: LightModeTheme().primaryBackground,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4,
                                  color: LightModeTheme().primaryText,
                                  offset: const Offset(
                                    0,
                                    2,
                                  ),
                                )
                              ],
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: LightModeTheme().primaryText,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(0, 0),
                                  child: Text(
                                    'Facturas',
                                    style: LightModeTheme().bodyMedium.override(
                                          fontFamily: 'Readex Pro',
                                          fontSize: 18,
                                          letterSpacing: 0,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      5, 0, 0, 0),
                                  child: Icon(
                                    Icons.event_note_rounded,
                                    color: LightModeTheme().primaryText,
                                    size: 30,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ].addToEnd(75.0.sh),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
