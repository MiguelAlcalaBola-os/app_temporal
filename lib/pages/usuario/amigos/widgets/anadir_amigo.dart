import 'package:get/get.dart';
import 'package:reservatu_pista/backend/schema/enums/enums.dart';
import 'package:reservatu_pista/components/navbar_y_appbar_usuario.dart';
import 'package:reservatu_pista/utils/responsive_web.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';

class AnadirAmigos extends StatefulWidget {
  const AnadirAmigos({super.key});

  @override
  State<AnadirAmigos> createState() => _BuscadorAmigoWidgetState();
}

class _BuscadorAmigoWidgetState extends State<AnadirAmigos> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return NavbarYAppbarUsuario(
        title: 'Añadir Amigos',
        page: TypePage.None,
        isTitle: true,
        isTitleBack: true,
        child: SingleChildScrollView(
          child: ResponsiveWeb(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 12),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      // Te aparecen solo los que ya han jugado contigo.
                      //
                      // Tomas los usuarios de la tabla reservas de la base de datos
                      Expanded(
                        child: Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                          child: TextFormField(
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Buscar',
                              labelStyle: LightModeTheme().labelMedium.override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: const Color(0xFF57636C),
                                    fontSize: 14,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: LightModeTheme().usuario,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: LightModeTheme().usuario,
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
                              filled: true,
                              fillColor: Colors.white,
                            ),
                            style: LightModeTheme().bodyMedium.override(
                                  fontFamily: 'Plus Jakarta Sans',
                                  color: const Color(0xFF14181B),
                                  fontSize: 14,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                        ),
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          Get.back();
                        },
                        text: 'Amigos',
                        icon: const Icon(
                          Icons.person_sharp,
                          size: 15,
                        ),
                        options: FFButtonOptions(
                          height: 40,
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                          iconPadding:
                              const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          color: LightModeTheme().usuario,
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
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget _buildAmigos() {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 44),
      child: ListView(
        padding: EdgeInsets.zero,
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 4, 16, 0),
            child: Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 4,
                    color: Color(0x32000000),
                    offset: Offset(
                      0.0,
                      2,
                    ),
                  )
                ],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: LightModeTheme().usuario,
                  width: 2,
                ),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(26),
                      child: Image.network(
                        'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fHByb2ZpbGV8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60',
                        width: 36,
                        height: 36,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'NickUno',
                              style: LightModeTheme().bodyMedium.override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: const Color(0xFF14181B),
                                    fontSize: 14,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 4, 0, 0),
                                  child: Text(
                                    '4.00',
                                    style:
                                        LightModeTheme().labelMedium.override(
                                              fontFamily: 'Plus Jakarta Sans',
                                              color: const Color(0xFF57636C),
                                              fontSize: 14,
                                              letterSpacing: 0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    FFButtonWidget(
                      onPressed: () {},
                      text: 'Añadir',
                      options: FFButtonOptions(
                        width: 70,
                        height: 36,
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        color: LightModeTheme().usuario,
                        textStyle: LightModeTheme().bodyMedium.override(
                              fontFamily: 'Outfit',
                              color: Colors.white,
                              fontSize: 14,
                              letterSpacing: 0,
                              fontWeight: FontWeight.normal,
                            ),
                        elevation: 2,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 4, 16, 0),
            child: Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 4,
                    color: Color(0x32000000),
                    offset: Offset(
                      0.0,
                      2,
                    ),
                  )
                ],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: LightModeTheme().usuario,
                  width: 2,
                ),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(26),
                      child: Image.network(
                        'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fHByb2ZpbGV8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60',
                        width: 36,
                        height: 36,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'NickDos',
                              style: LightModeTheme().bodyMedium.override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: const Color(0xFF14181B),
                                    fontSize: 14,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 4, 0, 0),
                                  child: Text(
                                    '3.25',
                                    style:
                                        LightModeTheme().labelMedium.override(
                                              fontFamily: 'Plus Jakarta Sans',
                                              color: const Color(0xFF57636C),
                                              fontSize: 14,
                                              letterSpacing: 0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    FFButtonWidget(
                      onPressed: () {},
                      text: 'Añadir',
                      options: FFButtonOptions(
                        width: 70,
                        height: 36,
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        color: LightModeTheme().usuario,
                        textStyle: LightModeTheme().bodyMedium.override(
                              fontFamily: 'Outfit',
                              color: Colors.white,
                              fontSize: 14,
                              letterSpacing: 0,
                              fontWeight: FontWeight.normal,
                            ),
                        elevation: 2,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 4, 16, 0),
            child: Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 4,
                    color: Color(0x32000000),
                    offset: Offset(
                      0.0,
                      2,
                    ),
                  )
                ],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: LightModeTheme().usuario,
                  width: 2,
                ),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(26),
                      child: Image.network(
                        'https://images.unsplash.com/photo-1521572267360-ee0c2909d518?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjJ8fHByb2ZpbGV8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60',
                        width: 36,
                        height: 36,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'NickTres',
                              style: LightModeTheme().bodyMedium.override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: const Color(0xFF14181B),
                                    fontSize: 14,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 4, 0, 0),
                                  child: Text(
                                    '3.00',
                                    style:
                                        LightModeTheme().labelMedium.override(
                                              fontFamily: 'Plus Jakarta Sans',
                                              color: const Color(0xFF57636C),
                                              fontSize: 14,
                                              letterSpacing: 0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    FFButtonWidget(
                      onPressed: () {
                        print('Button pressed ...');
                      },
                      text: 'Añadir',
                      options: FFButtonOptions(
                        width: 70,
                        height: 36,
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        color: LightModeTheme().usuario,
                        textStyle: LightModeTheme().bodyMedium.override(
                              fontFamily: 'Outfit',
                              color: Colors.white,
                              fontSize: 14,
                              letterSpacing: 0,
                              fontWeight: FontWeight.normal,
                            ),
                        elevation: 2,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 4, 16, 0),
            child: Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  const BoxShadow(
                    blurRadius: 4,
                    color: Color(0x32000000),
                    offset: Offset(
                      0.0,
                      2,
                    ),
                  )
                ],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: LightModeTheme().usuario,
                  width: 2,
                ),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(26),
                      child: Image.network(
                        'https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fHByb2ZpbGV8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60',
                        width: 36,
                        height: 36,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'NickCuatro',
                              style: LightModeTheme().bodyMedium.override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: const Color(0xFF14181B),
                                    fontSize: 14,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 4, 0, 0),
                                  child: Text(
                                    '4.25',
                                    style:
                                        LightModeTheme().labelMedium.override(
                                              fontFamily: 'Plus Jakarta Sans',
                                              color: const Color(0xFF57636C),
                                              fontSize: 14,
                                              letterSpacing: 0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    FFButtonWidget(
                      onPressed: () {
                        print('Button pressed ...');
                      },
                      text: 'Añadir',
                      options: FFButtonOptions(
                        width: 70,
                        height: 36,
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        color: LightModeTheme().usuario,
                        textStyle: LightModeTheme().bodyMedium.override(
                              fontFamily: 'Outfit',
                              color: Colors.white,
                              fontSize: 14,
                              letterSpacing: 0,
                              fontWeight: FontWeight.normal,
                            ),
                        elevation: 2,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 4, 16, 0),
            child: Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  const BoxShadow(
                    blurRadius: 4,
                    color: Color(0x32000000),
                    offset: Offset(
                      0.0,
                      2,
                    ),
                  )
                ],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: LightModeTheme().usuario,
                  width: 2,
                ),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(26),
                      child: Image.network(
                        'https://images.unsplash.com/photo-1463453091185-61582044d556?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzJ8fHVzZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60',
                        width: 36,
                        height: 36,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'NickCinco',
                              style: LightModeTheme().bodyMedium.override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: const Color(0xFF14181B),
                                    fontSize: 14,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 4, 0, 0),
                                  child: Text(
                                    '4.75',
                                    style:
                                        LightModeTheme().labelMedium.override(
                                              fontFamily: 'Plus Jakarta Sans',
                                              color: const Color(0xFF57636C),
                                              fontSize: 14,
                                              letterSpacing: 0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    FFButtonWidget(
                      onPressed: () {
                        print('Button pressed ...');
                      },
                      text: 'Añadir',
                      options: FFButtonOptions(
                        width: 70,
                        height: 36,
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        color: LightModeTheme().usuario,
                        textStyle: LightModeTheme().bodyMedium.override(
                              fontFamily: 'Outfit',
                              color: Colors.white,
                              fontSize: 14,
                              letterSpacing: 0,
                              fontWeight: FontWeight.normal,
                            ),
                        elevation: 2,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ].divide(const SizedBox(height: 10)),
      ),
    );
  }
}
