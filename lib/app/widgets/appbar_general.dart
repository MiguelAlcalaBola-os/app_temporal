import 'package:get/get.dart';
import 'package:reservatu_pista/utils/responsive_web.dart';
import '../../utils/btn_icon.dart';
import '../routes/app_pages.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import '/flutter_flow/flutter_flow_icon_button.dart';

class AppbarGeneral extends StatelessWidget {
  const AppbarGeneral(
      {super.key,
      this.title = '',
      this.isTitle = false,
      this.isTitleBack = false,
      this.isTitleInfo = false,
      this.onBack,
      this.imagePath});
  final String title;
  final bool isTitle;
  final bool isTitleBack;
  final void Function()? onBack;
  final bool isTitleInfo;
  final String? imagePath;
  @override
  Widget build(BuildContext context) {
    return ResponsiveWeb(
      child: Stack(
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
                color: Color.fromARGB(67, 0, 0, 0),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 1,
                    color: Color(0x33000000),
                    offset: Offset(0, 2),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> buildRow(BuildContext context) {
    if (isTitle) {
      return [
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
    if (isTitleBack) {
      return [
        FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30.0,
          borderWidth: 1.0,
          buttonSize: 55.0,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: LightModeTheme().primaryText,
            size: 30.0,
          ),
          onPressed: onBack ?? (Get.back),
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
    if (isTitleInfo) {
      return [
        Row(
          mainAxisSize: MainAxisSize.max,
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
                    buttonSize: 50,
                    iconColor: LightModeTheme().secondaryText,
                    iconSize: 24,
                    icon: badges.Badge(
                      badgeContent: Text(
                        '',
                        style: LightModeTheme().bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              color: Colors.white,
                            ),
                      ),
                      showBadge: true,
                      shape: badges.BadgeShape.circle,
                      badgeColor: LightModeTheme().primary,
                      elevation: 4,
                      padding: const EdgeInsets.all(8),
                      position: badges.BadgePosition.topEnd(),
                      animationType: badges.BadgeAnimationType.scale,
                      toAnimate: true,
                      child: const Icon(
                        Icons.chat_bubble_outline_outlined,
                      ),
                    ),
                    onPressed: () async {
                      Get.toNamed(Routes.NOTIFICACIONES);
                    },
                  ),
                  BtnIcon(
                    borderRadius: 30,
                    buttonSize: 60,
                    iconColor: LightModeTheme().secondaryText,
                    iconSize: 24,
                    icon: Container(
                      width: 40,
                      height: 40,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        'assets/images/foto_avatar.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    onPressed: () async {
                      Get.toNamed(Routes.DATOS);
                    },
                  ),
                ],
              ),
            ),
          ],
        )
      ];
    }
    return [];
  }
}
