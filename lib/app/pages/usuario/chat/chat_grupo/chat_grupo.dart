import 'package:get/route_manager.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';

class ChatGrupoWidget extends StatefulWidget {
  const ChatGrupoWidget({super.key});

  @override
  State<ChatGrupoWidget> createState() => _ChatGrupoWidgetState();
}

class _ChatGrupoWidgetState extends State<ChatGrupoWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: LightModeTheme().primaryBackground,
        appBar: AppBar(
          backgroundColor: LightModeTheme().secondaryBackground,
          iconTheme: IconThemeData(color: LightModeTheme().primaryText),
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderRadius: 30,
            buttonSize: 60,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: LightModeTheme().primaryText,
              size: 30,
            ),
            onPressed: () async {
              Get.back();
            },
          ),
          title: Align(
            alignment: AlignmentDirectional(-1, 0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                  child: Container(
                    width: 40,
                    height: 40,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.network(
                      'https://images.unsplash.com/photo-1631495634750-0f14320bc0a7?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyfHxzcG9ydCUyMHRlYW18ZW58MHx8fHwxNzEyNTY4Mjc1fDA&ixlib=rb-4.0.3&q=80&w=400',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                  child: Text(
                    'Grupo',
                    style: LightModeTheme().bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          fontSize: 18,
                          letterSpacing: 0,
                        ),
                  ),
                ),
                Flexible(
                  child: Align(
                    alignment: AlignmentDirectional(1, 0),
                    child: FlutterFlowIconButton(
                      borderColor: LightModeTheme().secondaryBackground,
                      borderRadius: 30,
                      borderWidth: 1,
                      buttonSize: 40,
                      fillColor: LightModeTheme().secondaryBackground,
                      icon: Icon(
                        Icons.group_add,
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
          actions: [],
          centerTitle: false,
          elevation: 2,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 10, 0),
                                      child: Container(
                                        width: 40,
                                        height: 40,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.network(
                                          'https://images.unsplash.com/photo-1531746020798-e6953c6e8e04?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxN3x8ZmFjZXxlbnwwfHx8fDE3MTI1NjQ0MDB8MA&ixlib=rb-4.0.3&q=80&w=400',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 8, 0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: LightModeTheme().accent3,
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Text(
                                            'Quien juega hoy?',
                                            style: LightModeTheme()
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  letterSpacing: 0,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 5),
                                    child: Text(
                                      'Isabel',
                                      style:
                                          LightModeTheme().bodyMedium.override(
                                                fontFamily: 'Readex Pro',
                                                fontSize: 14,
                                                letterSpacing: 0,
                                              ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 0, 8, 0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: LightModeTheme().usuario,
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Text(
                                        'Yo me apunto',
                                        style: LightModeTheme()
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color: LightModeTheme()
                                                  .primaryBackground,
                                              letterSpacing: 0,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 10, 0),
                                      child: Container(
                                        width: 40,
                                        height: 40,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.network(
                                          'https://images.unsplash.com/photo-1592245734204-6561336cbc6f?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw3fHxpZCUyMHBob3RvfGVufDB8fHx8MTcxMTQ2OTI2OHww&ixlib=rb-4.0.3&q=80&w=1080',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 8, 0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: LightModeTheme().accent3,
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Text(
                                            'No puedo',
                                            style: LightModeTheme()
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  letterSpacing: 0,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 5),
                                    child: Text(
                                      'Adrian',
                                      style:
                                          LightModeTheme().bodyMedium.override(
                                                fontFamily: 'Readex Pro',
                                                fontSize: 14,
                                                letterSpacing: 0,
                                              ),
                                    ),
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
              ),
              Align(
                alignment: AlignmentDirectional(0, 1),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: LightModeTheme().primaryBackground,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                            child: TextFormField(
                              autofocus: false,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                labelStyle:
                                    LightModeTheme().labelMedium.override(
                                          fontFamily: 'Readex Pro',
                                          letterSpacing: 0,
                                        ),
                                hintText: 'Escribe un mensaje...',
                                hintStyle:
                                    LightModeTheme().labelMedium.override(
                                          fontFamily: 'Readex Pro',
                                          letterSpacing: 0,
                                        ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: LightModeTheme().usuario,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: LightModeTheme().usuario,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: LightModeTheme().usuario,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: LightModeTheme().usuario,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              style: LightModeTheme().bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0,
                                  ),
                            ),
                          ),
                        ),
                        FlutterFlowIconButton(
                          buttonSize: 40,
                          icon: Icon(
                            Icons.send,
                            color: LightModeTheme().usuario,
                            size: 24,
                          ),
                          onPressed: () {
                            print('IconButton pressed ...');
                          },
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
    );
  }
}
