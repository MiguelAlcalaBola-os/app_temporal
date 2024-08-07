import 'package:get/get.dart';
import 'package:reservatu_pista/backend/schema/enums/enums.dart';
import 'package:reservatu_pista/components/navbar_y_appbar_usuario.dart';
import 'package:reservatu_pista/pages/usuario/amigos/amigos_c.dart';
import 'package:reservatu_pista/utils/responsive_web.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'widgets/anadir_amigo.dart';

class AmigosPage extends GetView<AmigosController> {
  AmigosPage({super.key});
  AmigosController get self => controller;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return NavbarYAppbarUsuario(
        title: 'Amigos',
        page: TypePage.None,
        isTitle: true,
        child: _buildColumnAmigos());
  }

  Widget _buildColumnAmigos() {
    return Expanded(
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
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                      child: TextFormField(
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Buscar amigos...',
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
                        // validator: _modelflu
                        //     .textControllerValidator
                        //     .asValidator(context),
                      ),
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: () async {
                      Get.to(AnadirAmigos());
                    },
                    text: 'Añadir amigos',
                    icon: const Icon(
                      Icons.person_sharp,
                      size: 15,
                    ),
                    options: FFButtonOptions(
                      height: 40,
                      padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
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
            Center(
              child: Text('\nNo se encontraron Amigos.',
                  style: LightModeTheme().bodyMedium.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 16)),
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
            padding: const EdgeInsetsDirectional.fromSTEB(16, 4, 16, 8),
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
                padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
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
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 2, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 50, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      FlutterFlowIconButton(
                                        borderColor: LightModeTheme().usuario,
                                        borderRadius: 20,
                                        borderWidth: 1,
                                        buttonSize: 40,
                                        fillColor: LightModeTheme().usuario,
                                        icon: Icon(
                                          Icons.chat_bubble_outline,
                                          color: LightModeTheme().accent4,
                                          size: 24,
                                        ),
                                        onPressed: () {
                                          print('IconButton pressed ...');
                                        },
                                      ),
                                      Text(
                                        'Chat',
                                        style: LightModeTheme()
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              fontSize: 10,
                                              letterSpacing: 0,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    FlutterFlowIconButton(
                                      borderColor: LightModeTheme().usuario,
                                      borderRadius: 20,
                                      borderWidth: 1,
                                      buttonSize: 40,
                                      fillColor: LightModeTheme().usuario,
                                      icon: Icon(
                                        Icons.add,
                                        color: LightModeTheme().accent4,
                                        size: 24,
                                      ),
                                      onPressed: () {
                                        print('IconButton pressed ...');
                                      },
                                    ),
                                    Text(
                                      'Invitar',
                                      style:
                                          LightModeTheme().bodyMedium.override(
                                                fontFamily: 'Readex Pro',
                                                fontSize: 10,
                                                letterSpacing: 0,
                                              ),
                                    ),
                                  ],
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
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 4, 16, 8),
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
                        'https://images.unsplash.com/photo-1547425260-76bcadfb4f2c?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw0fHxwZXJzb258ZW58MHx8fHwxNzExOTA1NTU0fDA&ixlib=rb-4.0.3&q=80&w=1080',
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
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 2, 13, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 50, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    FlutterFlowIconButton(
                                      borderColor: LightModeTheme().usuario,
                                      borderRadius: 20,
                                      borderWidth: 1,
                                      buttonSize: 40,
                                      fillColor: LightModeTheme().usuario,
                                      icon: Icon(
                                        Icons.chat_bubble_outline,
                                        color: LightModeTheme().accent4,
                                        size: 24,
                                      ),
                                      onPressed: () {
                                        print('IconButton pressed ...');
                                      },
                                    ),
                                    Text(
                                      'Chat',
                                      style:
                                          LightModeTheme().bodyMedium.override(
                                                fontFamily: 'Readex Pro',
                                                fontSize: 10,
                                                letterSpacing: 0,
                                              ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  FlutterFlowIconButton(
                                    borderColor: LightModeTheme().usuario,
                                    borderRadius: 20,
                                    borderWidth: 1,
                                    buttonSize: 40,
                                    fillColor: LightModeTheme().alternate,
                                    icon: Icon(
                                      Icons.add,
                                      color: LightModeTheme().accent4,
                                      size: 24,
                                    ),
                                    onPressed: () {
                                      print('IconButton pressed ...');
                                    },
                                  ),
                                  Text(
                                    'Invitar',
                                    style: LightModeTheme().bodyMedium.override(
                                          fontFamily: 'Readex Pro',
                                          fontSize: 10,
                                          letterSpacing: 0,
                                        ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 4, 16, 8),
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
                        'https://images.unsplash.com/photo-1552058544-f2b08422138a?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw1fHxwZXJzb24lMjB8ZW58MHx8fHwxNzExOTcyNjI2fDA&ixlib=rb-4.0.3&q=80&w=1080',
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
                                    '2.25',
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
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 2, 13, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 50, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    FlutterFlowIconButton(
                                      borderColor: LightModeTheme().usuario,
                                      borderRadius: 20,
                                      borderWidth: 1,
                                      buttonSize: 40,
                                      fillColor: LightModeTheme().usuario,
                                      icon: Icon(
                                        Icons.chat_bubble_outline,
                                        color: LightModeTheme().accent4,
                                        size: 24,
                                      ),
                                      onPressed: () {
                                        print('IconButton pressed ...');
                                      },
                                    ),
                                    Text(
                                      'Chat',
                                      style:
                                          LightModeTheme().bodyMedium.override(
                                                fontFamily: 'Readex Pro',
                                                fontSize: 10,
                                                letterSpacing: 0,
                                              ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  FlutterFlowIconButton(
                                    borderColor: LightModeTheme().usuario,
                                    borderRadius: 20,
                                    borderWidth: 1,
                                    buttonSize: 40,
                                    fillColor: LightModeTheme().alternate,
                                    icon: Icon(
                                      Icons.add,
                                      color: LightModeTheme().accent4,
                                      size: 24,
                                    ),
                                    onPressed: () {
                                      print('IconButton pressed ...');
                                    },
                                  ),
                                  Text(
                                    'Invitar',
                                    style: LightModeTheme().bodyMedium.override(
                                          fontFamily: 'Readex Pro',
                                          fontSize: 10,
                                          letterSpacing: 0,
                                        ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 4, 16, 8),
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
                        'https://images.unsplash.com/photo-1599566150163-29194dcaad36?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxNHx8cGVyc29uJTIwfGVufDB8fHx8MTcxMTk3MjYyNnww&ixlib=rb-4.0.3&q=80&w=1080',
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
                                    '2.50',
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
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 2, 13, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 50, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    FlutterFlowIconButton(
                                      borderColor: LightModeTheme().usuario,
                                      borderRadius: 20,
                                      borderWidth: 1,
                                      buttonSize: 40,
                                      fillColor: LightModeTheme().usuario,
                                      icon: Icon(
                                        Icons.chat_bubble_outline,
                                        color: LightModeTheme().accent4,
                                        size: 24,
                                      ),
                                      onPressed: () {
                                        print('IconButton pressed ...');
                                      },
                                    ),
                                    Text(
                                      'Chat',
                                      style:
                                          LightModeTheme().bodyMedium.override(
                                                fontFamily: 'Readex Pro',
                                                fontSize: 10,
                                                letterSpacing: 0,
                                              ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  FlutterFlowIconButton(
                                    borderColor: LightModeTheme().usuario,
                                    borderRadius: 20,
                                    borderWidth: 1,
                                    buttonSize: 40,
                                    fillColor: LightModeTheme().usuario,
                                    icon: Icon(
                                      Icons.add,
                                      color: LightModeTheme().info,
                                      size: 24,
                                    ),
                                    onPressed: () {
                                      print('IconButton pressed ...');
                                    },
                                  ),
                                  Text(
                                    'Invitar',
                                    style: LightModeTheme().bodyMedium.override(
                                          fontFamily: 'Readex Pro',
                                          fontSize: 10,
                                          letterSpacing: 0,
                                        ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
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
