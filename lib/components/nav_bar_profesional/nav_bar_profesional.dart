import 'package:get/route_manager.dart';
import 'package:reservatu_pista/utils/sizer.dart';
import '../../app/routes/app_pages.dart';
import '../../utils/btn_icon.dart';
import '../../utils/colores.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

// Texto navBar
const p1 = 'Inicio';
const p2 = 'Reservas';
const p3 = 'Pistas';
const p4 = 'Socios';
const p5 = 'Perfil';

class NavBarProfesionalWidget extends StatefulWidget {
  const NavBarProfesionalWidget({
    super.key,
    this.tipoDePagina,
  });

  final TypePage? tipoDePagina;

  @override
  // ignore: library_private_types_in_public_api
  _NavBarProfesionalWidgetState createState() =>
      _NavBarProfesionalWidgetState();
}

class _NavBarProfesionalWidgetState extends State<NavBarProfesionalWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'iconButtonOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.bounceOut,
          delay: 0.ms,
          duration: 550.ms,
          begin: 0.155,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.bounceOut,
          delay: 0.ms,
          duration: 550.ms,
          begin: const Offset(0.0, -17.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
  }

  @override
  void initState() {
    super.initState();

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  Widget build(BuildContext context) {
    EdgeInsets padding = MediaQuery.of(context).padding;
    final paddingBottom = padding.bottom > 10 ? 10.0 : padding.bottom;

    return SizedBox(
      width: double.infinity,
      height: 65.0 + paddingBottom,
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Material(
                color: Colors.transparent,
                elevation: 0.0,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: Container(
                  width: double.infinity,
                  height: 50.0 + paddingBottom,
                  decoration: BoxDecoration(
                    color: LightModeTheme().primaryBackground,
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 10.0,
                        color: Color(0x1A57636C),
                        offset: Offset(0.0, -10.0),
                        spreadRadius: 0.1,
                      )
                    ],
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(bottom: paddingBottom),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                buildIconButtonMin(
                  onPressed: () async {
                    Get.offAllNamed(Routes.INICIO_PROVEEDOR);
                  },
                  isPage: widget.tipoDePagina == TypePage.Inicio,
                  icon: Icons.home_rounded,
                  title: p1,
                ),
                buildIconButtonMin(
                  onPressed: () async {
                    Get.offAllNamed(Routes.MIS_PISTAS);
                  },
                  isPage: widget.tipoDePagina == TypePage.MisReservas,
                  icon: Icons.calendar_month,
                  title: p2,
                ),
                buildIconCenter(
                  onPressed: () async {
                    Get.offAllNamed(Routes.PISTAS_PROVEEDOR);
                  },
                  isPage: widget.tipoDePagina == TypePage.ReservarPista,
                  icon: Icons.add,
                  title: p3,
                ),
                buildIconButtonMin(
                  onPressed: () async {
                    Get.offAllNamed(Routes.MIS_SOCIOS);
                  },
                  isPage: widget.tipoDePagina == TypePage.Monedero,
                  icon: Icons.safety_divider,
                  title: p4,
                ),
                buildIconButtonMin(
                  onPressed: () async {
                    Get.offAllNamed(Routes.PERFIL_PROVEEDOR);
                  },
                  isPage: widget.tipoDePagina == TypePage.Perfil,
                  icon: Icons.person,
                  title: p5,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildIconCenter(
      {required String title,
      required IconData icon,
      required void Function() onPressed,
      isPage = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Column(
        children: [
          isPage
              ? FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 25.0,
                  borderWidth: 1.0,
                  buttonSize: 45.0,
                  fillColor: Colores.proveedor.primary,
                  hoverColor: Colores.proveedor.primary69,
                  icon: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 30.0,
                  ),
                  onPressed: onPressed,
                ).animateOnPageLoad(
                  animationsMap['iconButtonOnPageLoadAnimation1']!)
              : BtnIcon(
                  borderColor: Colors.transparent,
                  borderRadius: 25.0,
                  hoverColor: Colores.proveedor.primary69,
                  borderWidth: 1.0,
                  buttonSize: 45.0,
                  fillColor: const Color(0xFF9299A1),
                  icon: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 30.0,
                  ),
                  onPressed: onPressed,
                ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: LightModeTheme().bodyMedium.override(
                  fontFamily: 'Readex Pro',
                  color: isPage
                      ? Colores.proveedor.primary
                      : LightModeTheme().primaryText,
                  fontSize: 10.0,
                ),
          ),
        ],
      ),
    );
  }

  Widget buildIconButtonMin(
      {required String title,
      required IconData icon,
      required void Function() onPressed,
      isPage = false}) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: BtnIcon(
        onPressed: onPressed,
        hoverColor: Colores.proveedor.primary69,
        borderRadius: 12,
        icon: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            isPage
                ? Icon(
                    icon,
                    color: Colores.proveedor.primary,
                    size: 24.0,
                  ).animateOnPageLoad(
                    animationsMap['iconButtonOnPageLoadAnimation1']!)
                : Icon(
                    icon,
                    color: const Color(0xFF9299A1),
                    size: 24.0,
                  ),
            Text(
              title,
              style: LightModeTheme().bodyMedium.override(
                    fontFamily: 'Readex Pro',
                    color: isPage
                        ? Colores.proveedor.primary
                        : LightModeTheme().primaryText,
                    fontSize: 10.0,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
