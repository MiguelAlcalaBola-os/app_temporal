import 'package:get/get.dart';
import 'package:reservatu_pista/app/pages/administrador/editar_noticia_admin/editar_noticia_admin_c.dart';
import 'package:reservatu_pista/app/pages/administrador/editar_noticia_admin/noticia_detalle_p.dart';
import 'package:reservatu_pista/components/nav_app_administrador/navbar_y_appbar_admin.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:reservatu_pista/utils/responsive_web.dart';
class EditarNoticiasWidget extends GetView<EditarNoticiasController> {
  const EditarNoticiasWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return NavbarYAppbarAdmin(
        title: 'Editar Noticias',
        isTitleBack: true,
        isNavBar: false,
        child: Expanded(
          child: ResponsiveWeb(
            child: _EditarNoticiasWidgetState(),
          ),
        ));
  }
}

class _EditarNoticiasWidgetState extends GetView<EditarNoticiasController> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: LightModeTheme().primaryBackground,
        body: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  height: 10,
                ),
                Align(
                  alignment: const AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: Material(
                      color: Colors.transparent,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 0.9,
                        height: MediaQuery.sizeOf(context).height * 0.15,
                        decoration: BoxDecoration(
                          color: LightModeTheme().secondaryBackground,
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
                            width: 2,
                          ),
                        ),
                        child: Stack(
                          children: [
                            Opacity(
                              opacity: 0.7,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  'https://images.unsplash.com/photo-1505305976870-c0be1cd39939?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxM3x8c3BvcnQlMjBmaWVsZHxlbnwwfHx8fDE3MTIxMzAwMjJ8MA&ixlib=rb-4.0.3&q=80&w=400',
                                  width: MediaQuery.sizeOf(context).width,
                                  height: MediaQuery.sizeOf(context).height * 1,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    'Apertura pista Riolobos',
                                    style: LightModeTheme().bodyMedium.override(
                                          fontFamily: 'Readex Pro',
                                          color: LightModeTheme().primaryText,
                                          fontSize: 18,
                                          letterSpacing: 0,
                                        ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 30, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          width: 120,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            color:
                                                LightModeTheme().errorGeneral,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            shape: BoxShape.rectangle,
                                            border: Border.all(
                                              color:
                                                  LightModeTheme().primaryText,
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Eliminar',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 16,
                                                          letterSpacing: 0,
                                                        ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(5, 0, 0, 0),
                                                child: Icon(
                                                  Icons.remove_circle,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 24,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Get.to(
                                                const EditarDetallesNoticiaWidget());
                                          },
                                          child: Container(
                                            width: 120,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              color: LightModeTheme()
                                                  .reservaPendiente,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              shape: BoxShape.rectangle,
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Editar',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        fontSize: 16,
                                                        letterSpacing: 0,
                                                      ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(5, 0, 0, 0),
                                                  child: Icon(
                                                    Icons.settings_sharp,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 24,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
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
                ),
                Align(
                  alignment: const AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: Material(
                      color: Colors.transparent,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 0.9,
                        height: MediaQuery.sizeOf(context).height * 0.15,
                        decoration: BoxDecoration(
                          color: LightModeTheme().secondaryBackground,
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
                            width: 2,
                          ),
                        ),
                        child: Stack(
                          children: [
                            Opacity(
                              opacity: 0.7,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  'https://images.unsplash.com/photo-1569597773147-690dfdc3bb4c?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyMXx8cGFkZWx8ZW58MHx8fHwxNzEyMDQ1NDI2fDA&ixlib=rb-4.0.3&q=80&w=400',
                                  width: MediaQuery.sizeOf(context).width,
                                  height: MediaQuery.sizeOf(context).height * 1,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    'Clausura club Cáceres',
                                    style: LightModeTheme().bodyMedium.override(
                                          fontFamily: 'Readex Pro',
                                          color: LightModeTheme().primaryText,
                                          fontSize: 18,
                                          letterSpacing: 0,
                                        ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 30, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          width: 120,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            color:
                                                LightModeTheme().errorGeneral,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            shape: BoxShape.rectangle,
                                            border: Border.all(
                                              color:
                                                  LightModeTheme().primaryText,
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Eliminar',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 16,
                                                          letterSpacing: 0,
                                                        ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(5, 0, 0, 0),
                                                child: Icon(
                                                  Icons.remove_circle,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 24,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: 120,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            color: LightModeTheme()
                                                .reservaPendiente,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            shape: BoxShape.rectangle,
                                            border: Border.all(
                                              color:
                                                  LightModeTheme().primaryText,
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Editar',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 16,
                                                          letterSpacing: 0,
                                                        ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(5, 0, 0, 0),
                                                child: Icon(
                                                  Icons.settings_sharp,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 24,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
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
                ),
                Align(
                  alignment: const AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: Material(
                      color: Colors.transparent,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 0.9,
                        height: MediaQuery.sizeOf(context).height * 0.15,
                        decoration: BoxDecoration(
                          color: LightModeTheme().secondaryBackground,
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
                            width: 2,
                          ),
                        ),
                        child: Stack(
                          children: [
                            Opacity(
                              opacity: 0.7,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  'https://images.unsplash.com/photo-1646343251574-a7b03ee3dbaf?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxfHx0ZW5pcyUyMGN1cHxlbnwwfHx8fDE3MTIxMzAyMTF8MA&ixlib=rb-4.0.3&q=80&w=400',
                                  width: MediaQuery.sizeOf(context).width,
                                  height: MediaQuery.sizeOf(context).height * 1,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    'Torneo de padel Cáceres',
                                    style: LightModeTheme().bodyMedium.override(
                                          fontFamily: 'Readex Pro',
                                          color: LightModeTheme().primaryText,
                                          fontSize: 18,
                                          letterSpacing: 0,
                                        ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 30, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          width: 120,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            color:
                                                LightModeTheme().errorGeneral,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            shape: BoxShape.rectangle,
                                            border: Border.all(
                                              color:
                                                  LightModeTheme().primaryText,
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Eliminar',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 16,
                                                          letterSpacing: 0,
                                                        ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(5, 0, 0, 0),
                                                child: Icon(
                                                  Icons.remove_circle,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 24,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: 120,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            color: LightModeTheme()
                                                .reservaPendiente,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            shape: BoxShape.rectangle,
                                            border: Border.all(
                                              color:
                                                  LightModeTheme().primaryText,
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Editar',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 16,
                                                          letterSpacing: 0,
                                                        ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(5, 0, 0, 0),
                                                child: Icon(
                                                  Icons.settings_sharp,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 24,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
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
                ),
              ],
            ),
            Align(
              alignment: const AlignmentDirectional(1, 1),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: FlutterFlowIconButton(
                  borderColor: LightModeTheme().primaryText,
                  borderRadius: 40,
                  borderWidth: 2,
                  buttonSize: 50,
                  fillColor: LightModeTheme().secondaryBackground,
                  icon: Icon(
                    Icons.add_sharp,
                    color: LightModeTheme().primaryText,
                    size: 30,
                  ),
                  onPressed: () {
                    print('IconButton pressed ...');
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
