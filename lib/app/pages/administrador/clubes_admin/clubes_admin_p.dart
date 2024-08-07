import 'package:reservatu_pista/app/pages/administrador/admin_page/pagina_administrador_c.dart';
import 'package:reservatu_pista/app/pages/administrador/clubes_admin/clubes_admin_c.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/components/nav_app_administrador/navbar_y_appbar_admin.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:reservatu_pista/utils/responsive_web.dart';
class ClubesAdmin extends GetView<ClubesAdminController> {
  const ClubesAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return NavbarYAppbarAdmin(
        title: 'Clubes',
        isTitleBack: true,
        isNavBar: false,
        child: Expanded(
          child: ResponsiveWeb(
            child: _ClubesAdminState(),
          ),
        ),);
  }
}

class _ClubesAdminState extends GetView<ClubesAdminController> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  ClubesAdminController get _model => controller;

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ClubesAdminController());
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: LightModeTheme().primaryBackground,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Obx(() => Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    height: 10,
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 10),
                    child: SearchAnchor(
                        viewConstraints: const BoxConstraints(
                            minHeight: 100, maxHeight: 325),
                        isFullScreen: false,
                        viewSurfaceTintColor:
                            LightModeTheme().secondaryBackground,
                        viewBackgroundColor:
                            LightModeTheme().secondaryBackground,
                        builder: (BuildContext context,
                            SearchController controller) {
                          return SearchBar(
                            hintText: "Buscar club...",
                            backgroundColor: MaterialStateProperty.all(
                                LightModeTheme().secondaryBackground),
                            controller: controller,
                            surfaceTintColor: MaterialStateProperty.all(
                                LightModeTheme().secondaryBackground),
                            overlayColor:
                                MaterialStateColor.resolveWith((states) {
                              if (states.contains(MaterialState.pressed)) {
                                return LightModeTheme().primaryBackground;
                              }
                              return LightModeTheme().secondaryBackground;
                            }),
                            padding: const MaterialStatePropertyAll<EdgeInsets>(
                                EdgeInsets.symmetric(horizontal: 16.0)),
                            onTap: () {
                              controller.openView();
                            },
                            onChanged: (_) {
                              controller.openView();
                            },
                            leading: const Icon(Icons.search),
                          );
                        },
                        suggestionsBuilder: (BuildContext context,
                            SearchController suggestcontroller) {
                          return List.generate(
                              controller.clubes.length,
                              (i) => Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Material(
                                      elevation: 2,
                                      color: Colors.transparent,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(24)),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(24),
                                          border:
                                              Border.all(color: Colors.black),
                                          color: LightModeTheme()
                                              .primaryBackground,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(20),
                                          child: Text(
                                            controller.clubes[i].nombre,
                                            style: LightModeTheme().bodyLarge,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ));
                        }),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ...List.generate(controller.chips.length,
                            (i) => buildChips(controller.chips[i], i))
                      ],
                    ),
                  ),
                  ...List.generate(controller.clubes.length,
                      (i) => buildClub(context, controller.clubes[i])),
                  Container(
                    height: 70,
                  )
                ],
              )),
        ),
      ),
    );
  }

  Padding buildClub(BuildContext context, Club club) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(7, 15, 7, 8),
      child: GestureDetector(
        onTap: () {
          // Get.to(const DetalleClubWidget());
        },
        child: Material(
          color: Colors.transparent,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
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
                    padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
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
                          'Miembro desde hace ${club.antiguedad} años',
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
                Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                        onPressed: () {
                          club.esFavorito.value = !club.esFavorito.value;
                        },
                        iconSize: 50,
                        color: Colors.amber,
                        icon: club.esFavorito.value
                            ? const Icon(Icons.star)
                            : const Icon(Icons.star_border))),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildChips(ChipData chip, int i) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ChipTheme(
          data: (const ChipThemeData(selectedColor: Colors.amber)),
          child: FilterChip(
              onDeleted: () {
                controller.borrarChip();
              },
              showCheckmark: false,
              avatar: CircleAvatar(
                backgroundColor: controller.selectChip == i
                    ? LightModeTheme().primaryBackground
                    : LightModeTheme().secondaryBackground,
                child: Icon(controller.selectChip == i
                    ? Icons.expand_more_outlined
                    : Icons.expand_less_outlined),
              ),
              padding: const EdgeInsets.all(4),
              backgroundColor: controller.selectChip == i
                  ? LightModeTheme().proveedor
                  : LightModeTheme().secondaryBackground,
              label: Text(chip.label),
              deleteIcon: const Icon(Icons.cancel),
              deleteIconColor: Colors.red,
              selectedColor: LightModeTheme().proveedor,
              onSelected: (value) {
                controller.selectChip = i;
                controller.cambiarChip();
              })),
    );
  }
}
