import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:reservatu_pista/app/pages/administrador/banco_admin/banco_admin_c.dart';
import 'package:reservatu_pista/components/nav_app_administrador/navbar_y_appbar_admin.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:reservatu_pista/utils/responsive_web.dart';
class AdminBancoWidget extends GetView<AdminBancoController> {
  const AdminBancoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return NavbarYAppbarAdmin(
        title: 'Banco',
        isTitleBack: true,
        isNavBar: false,
        child: Expanded(
          child: ResponsiveWeb(
            child: _AdminBancoWidgetState(),
          ),
        ));
  }
}

class _AdminBancoWidgetState extends GetView<AdminBancoController> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 10,
              ),
              Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 5, 16, 0),
                  child: Container(
                    width: double.infinity,
                    height: 120,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).reservaPendiente,
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 2,
                          color: Color(0x33000000),
                          offset: Offset(
                            0,
                            0,
                          ),
                          spreadRadius: 1,
                        )
                      ],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0, -1),
                          child: Container(
                            width: 200,
                            height: 65,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 4,
                                  color: Color(0x33000000),
                                  offset: Offset(
                                    0,
                                    2,
                                  ),
                                )
                              ],
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width,
                          height: 28,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        Align(
                            alignment: const AlignmentDirectional(0, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 0, 0),
                                  child: Text(
                                    '1.500,00 €',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: const Color(0xFF14181B),
                                          fontSize: 32,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                                Text(
                                  'Dinero Total',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .override(
                                        fontFamily: 'Outfit',
                                        letterSpacing: 0,
                                      ),
                                ),
                              ],
                            )),
                      ],
                    ),
                  )),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 8),
                child: TextFormField(
                  autofocus: true,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Buscador de clientes...',
                    labelStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Plus Jakarta Sans',
                              color: const Color(0xFF606A85),
                              fontSize: 14,
                              letterSpacing: 0,
                              fontWeight: FontWeight.w500,
                            ),
                    hintStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Plus Jakarta Sans',
                              color: const Color(0xFF606A85),
                              fontSize: 14,
                              letterSpacing: 0,
                              fontWeight: FontWeight.w500,
                            ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xFFE5E7EB),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xFF6F61EF),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xFFFF5963),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xFFFF5963),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    contentPadding:
                        const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                    suffixIcon: const Icon(
                      Icons.search_rounded,
                      color: Color(0xFF606A85),
                    ),
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Plus Jakarta Sans',
                        color: const Color(0xFF15161E),
                        fontSize: 14,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w500,
                      ),
                  cursorColor: const Color(0xFF6F61EF),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                    ),
                  ]
                      .addToStart(const SizedBox(width: 16))
                      .addToEnd(const SizedBox(width: 16)),
                ),
              ),
              const Divider(
                thickness: 1,
                color: Color(0xFFE5E7EB),
              ),
              Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(7, 15, 7, 8),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Container(
                      height: 140,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 4,
                            color: Color(0x230E151B),
                            offset: Offset(
                              0.0,
                              2,
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).primaryText,
                          width: 2,
                        ),
                      ),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(0),
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                            child: Image.network(
                              'https://images.unsplash.com/photo-1601646761285-65bfa67cd7a3?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw0fHxwYWRlbHxlbnwwfHx8fDE3MTIyMjA1MzR8MA&ixlib=rb-4.0.3&q=80&w=1080',
                              width: MediaQuery.sizeOf(context).width,
                              height: 60,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-0.01, -0.75),
                            child: Text(
                              'Nombre club',
                              style: FlutterFlowTheme.of(context)
                                  .displaySmall
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    fontSize: 25,
                                    letterSpacing: 0,
                                  ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0, 0.56),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  15, 0, 0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 30),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Riolobos',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                fontSize: 20,
                                                letterSpacing: 0,
                                              ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0, 0, 10, 0),
                                          child: Text(
                                            'Ayuntamiento',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  fontSize: 20,
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
                          Align(
                            alignment: const AlignmentDirectional(0, 1),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 0, 5),
                              child: FFButtonWidget(
                                onPressed: () async {},
                                text: 'Ver desglose',
                                options: FFButtonOptions(
                                  height: 40,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 10, 0),
                                  iconPadding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 0),
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        letterSpacing: 0,
                                      ),
                                  elevation: 3,
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
              Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(7, 15, 7, 8),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Container(
                      height: 140,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 4,
                            color: Color(0x230E151B),
                            offset: Offset(
                              0.0,
                              2,
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).primaryText,
                          width: 2,
                        ),
                      ),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(0),
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                            child: Image.network(
                              'https://images.unsplash.com/photo-1574379989050-bfd9e1a8a543?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxNXx8cGFkZWx8ZW58MHx8fHwxNzEyMjIwNTM0fDA&ixlib=rb-4.0.3&q=80&w=1080',
                              width: MediaQuery.sizeOf(context).width,
                              height: 60,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-0.01, -0.75),
                            child: Text(
                              'Nombre club',
                              style: FlutterFlowTheme.of(context)
                                  .displaySmall
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    fontSize: 25,
                                    letterSpacing: 0,
                                  ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0, 0.56),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  15, 0, 0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 30),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Holguera',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                fontSize: 20,
                                                letterSpacing: 0,
                                              ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0, 0, 10, 0),
                                          child: Text(
                                            'Ayuntamiento',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  fontSize: 20,
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
                          Align(
                            alignment: const AlignmentDirectional(0, 1),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 0, 5),
                              child: FFButtonWidget(
                                onPressed: () async {},
                                text: 'Ver desglose',
                                options: FFButtonOptions(
                                  height: 40,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 10, 0),
                                  iconPadding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 0),
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        letterSpacing: 0,
                                      ),
                                  elevation: 3,
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
              Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(7, 15, 7, 8),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Container(
                      height: 140,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 4,
                            color: Color(0x230E151B),
                            offset: Offset(
                              0.0,
                              2,
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).primaryText,
                          width: 2,
                        ),
                      ),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(0),
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                            child: Image.network(
                              'https://images.unsplash.com/photo-1587280501635-a19de238a81e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxM3x8cGFkZWx8ZW58MHx8fHwxNzEyMjIwNTM0fDA&ixlib=rb-4.0.3&q=80&w=1080',
                              width: MediaQuery.sizeOf(context).width,
                              height: 60,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-0.01, -0.75),
                            child: Text(
                              'Nombre club',
                              style: FlutterFlowTheme.of(context)
                                  .displaySmall
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    fontSize: 25,
                                    letterSpacing: 0,
                                  ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0, 0.56),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  15, 0, 0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 30),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Galisteo',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                fontSize: 20,
                                                letterSpacing: 0,
                                              ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0, 0, 10, 0),
                                          child: Text(
                                            'Ayuntamiento',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  fontSize: 20,
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
                          Align(
                            alignment: const AlignmentDirectional(0, 1),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 0, 5),
                              child: FFButtonWidget(
                                onPressed: () async {},
                                text: 'Ver desglose',
                                options: FFButtonOptions(
                                  height: 40,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 10, 0),
                                  iconPadding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 0),
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        letterSpacing: 0,
                                      ),
                                  elevation: 3,
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
