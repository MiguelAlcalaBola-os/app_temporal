import 'package:get/route_manager.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_theme_modify.dart';
import 'package:reservatu_pista/web/web.dart';
import '../../app/routes/app_pages.dart';
import '../../utils/btn_icon.dart';
import '../../utils/colores.dart';
import '../../utils/server/image_server.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class AppBarAdmin extends StatelessWidget {
  const AppBarAdmin(
      {super.key,
      required this.title,
      required this.isTitle,
      required this.isTitleBack});
  final String title;
  final bool isTitle;
  final bool isTitleBack;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width,
          height: 55,
          decoration: BoxDecoration(
            color: LightModeTheme().secondaryBackground,
          ),
        ),
        ...buildRow(context),
        Positioned(
          bottom: 0,
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            height: 1,
            decoration: const BoxDecoration(
              color: Colores.rojo,
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> buildRow(BuildContext context) {
    final String notify = Routes.NOTIFICACIONES_PROVEEDOR;

    if (isTitleBack) {
      return [
        BtnIcon(
          borderColor: Colors.transparent,
          hoverColor: Colores.admin.primary69,
          borderRadius: 30.0,
          borderWidth: 1.0,
          buttonSize: 55.0,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: LightModeTheme().primaryText,
            size: 30.0,
          ),
          onPressed: moverRoutes,
        ),
        SizedBox(
          height: 55,
          child: Align(
            alignment: const Alignment(0, 0),
            child: Text(
              title,
              style: LightModeTheme().bodyLarge,
            ),
          ),
        ),
      ];
    }
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 10),
            child: Text(
              title,
              style: LightModeTheme().bodyLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                BtnIcon(
                  borderRadius: 30,
                  buttonSize: 50,
                  iconColor: Colores.usuario.primary,
                  hoverColor: Colores.admin.primary69,
                  iconSize: 24,
                  icon: badges.Badge(
                    badgeContent: Text(
                      '',
                      style: LightModeTheme().bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          color: Colors.white,
                          fontSize: 10),
                    ),
                    showBadge: false,
                    shape: badges.BadgeShape.circle,
                    badgeColor: Colores.admin.primary,
                    elevation: 4,
                    padding: const EdgeInsets.all(6),
                    position: badges.BadgePosition.topEnd(),
                    animationType: badges.BadgeAnimationType.scale,
                    toAnimate: false,
                    child: const Icon(
                      Icons.chat_bubble_outline_outlined,
                    ),
                  ),
                  onPressed: () async {
                    Get.toNamed(Routes.CHAT_PROVEEDOR);
                  },
                ),
                BtnIcon(
                  borderRadius: 30,
                  buttonSize: 50,
                  iconColor: Colores.proveedor.primary,
                  hoverColor: Colores.admin.primary69,
                  iconSize: 24,
                  icon: badges.Badge(
                    badgeContent: Text(
                      '',
                      style: LightModeTheme().bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          color: Colors.white,
                          fontSize: 10),
                    ),
                    showBadge: false,
                    shape: badges.BadgeShape.circle,
                    badgeColor: Colores.admin.primary,
                    elevation: 4,
                    padding: const EdgeInsets.all(6),
                    position: badges.BadgePosition.topEnd(),
                    animationType: badges.BadgeAnimationType.scale,
                    toAnimate: false,
                    child: const Icon(
                      Icons.chat_bubble_outline_outlined,
                    ),
                  ),
                  onPressed: () async {
                    Get.toNamed(Routes.CHAT_PROVEEDOR);
                  },
                ),
                BtnIcon(
                  borderRadius: 30,
                  buttonSize: 50,
                  iconColor: LightModeTheme().secondaryText,
                  hoverColor: Colores.admin.primary69,
                  iconSize: 24,
                  icon: badges.Badge(
                    badgeContent: Text(
                      '1',
                      style: LightModeTheme().bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          color: Colors.white,
                          fontSize: 10),
                    ),
                    showBadge: false,
                    shape: badges.BadgeShape.circle,
                    badgeColor: Colores.admin.primary,
                    elevation: 4,
                    padding: const EdgeInsets.all(6),
                    position: badges.BadgePosition.topEnd(),
                    animationType: badges.BadgeAnimationType.scale,
                    toAnimate: false,
                    child: const Icon(
                      Icons.notifications_active_outlined,
                    ),
                  ),
                  onPressed: () async {
                    // Get.toNamed(notify);
                  },
                ),
                BtnIcon(
                  borderRadius: 10,
                  buttonSize: 55,
                  hoverColor: Colores.admin.primary,
                  fillColor: Colores.rojo,
                  height: 40,
                  width: 70,
                  iconSize: 24,
                  borderWidth: 1,
                  padding: EdgeInsets.zero,
                  borderColor: Colores.rojo,
                  icon: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                        child: Text(
                          'Cerrar\nSesión',
                          style: LightModeTheme().bodyLarge.override(
                                fontFamily: 'Readex Pro',
                                fontSize: 10,
                                letterSpacing: 0,
                              ),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.9, 0),
                        child: Icon(
                          Icons.logout,
                          color: LightModeTheme().primaryText,
                          size: 10,
                        ),
                      ),
                    ],
                  ),
                  onPressed: () => Get.offAllNamed(Routes.LOGIN_ADMINISTRADOR),
                ),
              ],
            ),
          ),
        ],
      )
    ];
  }
}
