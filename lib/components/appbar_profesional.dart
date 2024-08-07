import 'package:get/route_manager.dart';
import 'package:reservatu_pista/web/web.dart';
import '../app/routes/app_pages.dart';
import '../utils/btn_icon.dart';
import '../utils/colores.dart';
import '../utils/server/image_server.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class AppbarProfesional extends StatelessWidget {
  const AppbarProfesional(
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
            decoration: BoxDecoration(
              color: Colores.proveedor.primary,
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
          hoverColor: Colores.proveedor.primary69,
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 30),
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
                  buttonSize: 55,
                  iconColor: LightModeTheme().secondaryText,
                  hoverColor: Colores.proveedor.primary69,
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
                    badgeColor: Colores.proveedor.primary,
                    elevation: 4,
                    padding: EdgeInsets.all(6),
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
                  buttonSize: 55,
                  iconColor: LightModeTheme().secondaryText,
                  hoverColor: Colores.proveedor.primary69,
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
                    badgeColor: Colores.proveedor.primary,
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
                    Get.toNamed(notify);
                  },
                ),
                BtnIcon(
                  borderRadius: 30,
                  buttonSize: 55,
                  iconColor: LightModeTheme().secondaryText,
                  iconSize: 24,
                  hoverColor: Colores.proveedor.primary69,
                  icon: Container(
                      width: 40,
                      height: 40,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border:
                              Border.all(color: LightModeTheme().secondary)),
                      child: ImageServer()),
                  onPressed: () async {
                    Get.toNamed(Routes.PERFIL_PROVEEDOR);
                  },
                ),
              ],
            ),
          ),
        ],
      )
    ];
  }
}
