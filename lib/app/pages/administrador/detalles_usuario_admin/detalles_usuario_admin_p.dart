import 'package:get/get.dart';
import 'package:reservatu_pista/app/pages/profesional/mis_socios/mis_socios_c.dart';
import 'package:reservatu_pista/components/nav_app_administrador/navbar_y_appbar_admin.dart';
import 'package:reservatu_pista/constants.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_util.dart';
import 'package:reservatu_pista/utils/sizer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'detalles_usuario_admin_c.dart';

class DetallesUsuarioPage extends GetView<DetallesUsuarioController> {
  const DetallesUsuarioPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<MisSociosController>(() => MisSociosController());
    return NavbarYAppbarAdmin(
        title: 'Detalles Usuarios',
        isTitleBack: true,
        isNavBar: false,
        child: Expanded(child: DetallesUsuariosWidget()));
  }
}

class DetallesUsuariosWidget extends StatefulWidget {
  const DetallesUsuariosWidget({super.key});

  @override
  State<DetallesUsuariosWidget> createState() => _DetallesUsuariosWidgetState();
}

class _DetallesUsuariosWidgetState extends State<DetallesUsuariosWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddingAll,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 12, 10, 12),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(2),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: CachedNetworkImage(
                        fadeInDuration: Duration(milliseconds: 500),
                        fadeOutDuration: Duration(milliseconds: 500),
                        imageUrl:
                            'https://images.unsplash.com/photo-1592245734204-6561336cbc6f?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw3fHxpZCUyMHBob3RvfGVufDB8fHx8MTcxMTQ2OTI2OHww&ixlib=rb-4.0.3&q=80&w=1080',
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Adrián García',
                          style: FlutterFlowTheme.of(context)
                              .headlineLarge
                              .override(
                                fontFamily: 'Outfit',
                                letterSpacing: 0,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 12, 0, 12),
                    child: Text(
                      'Datos personales:',
                      style:
                          FlutterFlowTheme.of(context).headlineSmall.override(
                                fontFamily: 'Outfit',
                                letterSpacing: 0,
                              ),
                    ),
                  ),
                ],
              ),
              _buildDatosPersonales(),
              _buildBonos()
            ],
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildBoton('Mensaje', Icons.message, () => print("Mensaje")),
                _buildBoton('Email', Icons.email, () => print("Email")),
                _buildBoton(
                    'Historial', Icons.history_edu, () => print("Historial")),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Datos personales
  Widget _buildDatosPersonales() {
    return Column(
      children: [
        _buildDatoPersonal('Nombre', 'Adrián García Sanchez'),
        _buildDatoPersonal('Nick', 'mike'),
        _buildDatoPersonal('Nivel', '4.00'),
        _buildDatoPersonal('DNI', '123456789D'),
        _buildDatoPersonal('Dirección', 'Calle Falsa n1, Riolobos, Cáceres'),
        _buildDatoPersonal('Partidas Jugadas', '48'),
        _buildDatoPersonal('Posición', 'Revés'),
        _buildDatoPersonal('Horario', 'Manaña'),
        _buildDatoPersonal('Teléfono', '645276736'),
        _buildDatoPersonal('Monedero', '50,00 €'),
      ].divide(5.0.sh),
    );
  }

  ///   Dato Personal
  Widget _buildDatoPersonal(String title, String text) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          '$title: ',
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Readex Pro',
                letterSpacing: 0,
                fontWeight: FontWeight.bold,
              ),
        ),
        Text(
          text,
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Readex Pro',
                letterSpacing: 0,
              ),
        ),
      ],
    );
  }

  /// Bonos
  Widget _buildBonos() {
    return Column(
      children: [
        _buildDatoPersonal('Bonos', ''),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              _buildBono('Descuento', '3€'),
              _buildBono('Descuento', '5%'),
              _buildBono('Partidas', '3'),
              _buildBono('Descuento', '5€'),
              _buildBono('Descuento', '3€'),
              _buildAddBono()
            ].divide(5.0.sw),
          ),
        ),
      ],
    );
  }

  /// Bono
  Widget _buildBono(String title, String text) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: FlutterFlowTheme.of(context).primaryText,
          width: 2,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
            child: Text(
              '$title:',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Readex Pro',
                    fontSize: 10,
                    letterSpacing: 0,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          Text(
            text,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Readex Pro',
                  fontSize: 20,
                  letterSpacing: 0,
                ),
          ),
        ],
      ),
    );
  }

  /// Agregar bono
  Widget _buildAddBono() {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: FlutterFlowTheme.of(context).primaryText,
          width: 2,
        ),
      ),
      child: Icon(
        Icons.add,
        color: FlutterFlowTheme.of(context).primaryText,
        size: 24,
      ),
    );
  }

  /// Contruir boton
  Widget _buildBoton(
      String text, IconData icon, dynamic Function()? onPressed) {
    return FFButtonWidget(
      onPressed: onPressed,
      text: text,
      icon: Icon(
        icon,
        size: 15,
      ),
      options: FFButtonOptions(
        height: 40,
        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
        iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
        color: FlutterFlowTheme.of(context).successGeneral,
        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
              fontFamily: 'Readex Pro',
              color: FlutterFlowTheme.of(context).primaryText,
              letterSpacing: 0,
            ),
        elevation: 3,
        borderSide: BorderSide(
          color: Colors.transparent,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
