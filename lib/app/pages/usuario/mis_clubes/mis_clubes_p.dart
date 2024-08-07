import 'package:reservatu_pista/app/pages/usuario/mis_clubes/buscarclub_p.dart';
import 'package:reservatu_pista/app/pages/usuario/mis_clubes/detalles_clubs/detalles_club.dart';
import 'package:reservatu_pista/app/pages/usuario/mis_clubes/mis_clubes_c.dart';
import 'package:reservatu_pista/app/pages/usuario/mis_clubes/modelos/club.dart';
import 'package:reservatu_pista/backend/schema/enums/enums.dart';
import 'package:reservatu_pista/components/navbar_y_appbar_usuario.dart';
import 'package:get/get.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';

class MisClubesPage extends GetView<MisClubesController> {
  const MisClubesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return NavbarYAppbarUsuario(
        title: 'Mis clubes',
        page: TypePage.None,
        child: Expanded(child: _MisClubesPageState()));
  }
}

class _MisClubesPageState extends GetView<MisClubesController> {
  MisClubesController get _model => controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GestureDetector(
        child: Builder(
          builder: (context) {
            return SafeArea(
              top: false,
              child: Stack(
                children: [
                  Align(
                    alignment: const AlignmentDirectional(1, 1),
                    child: Obx(() => Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ...List.generate(
                                controller.clubes.length,
                                (i) =>
                                    buildClub(context, controller.clubes[i])),
                            Flexible(
                              child: Align(
                                alignment: const AlignmentDirectional(1, 1),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 20, 10, 20),
                                  child: FlutterFlowIconButton(
                                    borderColor:
                                        LightModeTheme().primaryBackground,
                                    borderRadius: 100,
                                    borderWidth: 0,
                                    buttonSize: 70,
                                    fillColor: LightModeTheme().secondaryText,
                                    icon: Icon(
                                      Icons.add,
                                      color: LightModeTheme().primaryBackground,
                                      size: 40,
                                    ),
                                    onPressed: () async {
                                      Get.to(const BuscarClubWidget());
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 50,
                            )
                          ],
                        )),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Padding buildClub(BuildContext context, Club club) {
    if (club.esFavorito.value) {
      String miembroDesde = 'Miembro desde hace ${club.antiguedad} años';
      return Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(7, 15, 7, 0),
        child: Material(
          color: Colors.transparent,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          child: GestureDetector(
            onTap: () => Get.to(const DetalleClubWidget(
              isProveedor: false,
            )),
            child: Container(
              height: 180,
              decoration: BoxDecoration(
                color: LightModeTheme().secondaryBackground,
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
                  color: LightModeTheme().primaryText,
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
                      club.urlImagen,
                      width: MediaQuery.sizeOf(context).width,
                      height: 83,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(-0.01, -0.75),
                    child: Text(
                      club.nombre,
                      style: LightModeTheme().displaySmall.override(
                            fontFamily: 'Outfit',
                            color: LightModeTheme().secondaryBackground,
                            fontSize: 25,
                            letterSpacing: 0,
                          ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0, 0.56),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 0, 0, 10),
                            child: Text(
                              club.localidad,
                              style: LightModeTheme().bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 20,
                                    letterSpacing: 0,
                                  ),
                            ),
                          ),
                          Text(
                            miembroDesde,
                            style: LightModeTheme().bodyMedium.override(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 20,
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
          ),
        ),
      );
    } else {
      return const Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 0));
    }
  }
}
