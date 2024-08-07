import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/app/data/services/db_s.dart';
import 'package:reservatu_pista/app/pages/usuario/mis_clubes/detalles_clubs/detalles_club.dart';
import 'package:reservatu_pista/utils/responsive_web.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../app/routes/app_pages.dart';
import '../../../backend/schema/enums/enums.dart';
import '../../../components/navbar_y_appbar_profesional.dart';
import '../../../utils/btn_icon.dart';
import '../../../utils/colores.dart';
import '../../../utils/server/image_server.dart';
import '../../../utils/sizer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';

class PerfilProveedorPage extends StatefulWidget {
  const PerfilProveedorPage({super.key});

  @override
  State<PerfilProveedorPage> createState() => _PerfilProveedorPageState();
}

class _PerfilProveedorPageState extends State<PerfilProveedorPage> {
  final DBService self = Get.find();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final keyColumn = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(Get.context!).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return NavbarYAppbarProfesional(
        title: 'Perfil Proveedor',
        page: TypePage.Perfil,
        isTitle: true,
        child: Expanded(
          child: Stack(
            children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: 100.h <= 745
                      ? datosPerfil(
                          space: spaceSizedBoxBtnCerrarRes(),
                          subAppBar: subAppBar(true, self.nombreClub),
                          height: 50,
                          top: 10,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 2))
                      : datosPerfil(
                          space: spaceSizedBoxBtnCerrar(),
                          subAppBar: subAppBar(false, self.nombreClub))),
            ],
          ),
        ));
  }

  Widget buildTitle(String text) {
    return Container(
      width: ((context.w) - 140),
      constraints: const BoxConstraints(maxWidth: 500),
      margin: const EdgeInsets.only(left: 20.0),
      child: AutoSizeText(
        text,
        maxLines: 2,
        textAlign: TextAlign.center,
        style: LightModeTheme().headlineSmall,
        minFontSize: 12, // Establece aquí tu tamaño mínimo de fuente
        stepGranularity: 1, // Ajuste granular para el tamaño de la fuente
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget subAppBar(bool responsive, String nombreClub) {
    return ResponsiveWeb(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: LightModeTheme().secondaryBackground,
          boxShadow: const [
            BoxShadow(
              blurRadius: 3,
              color: Color(0x33000000),
              offset: Offset(0, 1),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 3),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: LightModeTheme().tertiary,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colores.proveedor.primary,
                    width: 3,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: BtnIcon(
                    onPressed: dialogImage,
                    borderRadius: 50,
                    padding: const EdgeInsets.all(0),
                    fillColor: Colors.transparent,
                    hoverColor: const Color.fromARGB(68, 255, 255, 255),
                    icon: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: ImageServer()),
                  ),
                ),
              ),
              buildTitle(nombreClub),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox spaceSizedBoxBtnCerrar() {
    const sizeLogo = 122;
    const sizeBtns = 72 * 6;
    const sizeAppbar = 55;
    const sizeBtnCerrar = 45;
    const sizeNavBar = 65;
    const paddingBottom = 10;
    final sizeTotal = 100.h -
        (sizeLogo +
            sizeBtns +
            sizeAppbar +
            sizeBtnCerrar +
            sizeNavBar +
            paddingBottom);
    return sizeTotal.sh;
  }

  SizedBox spaceSizedBoxBtnCerrarRes() {
    const sizeLogo = 86;
    const sizeBtns = 60 * 6;
    const sizeAppbar = 55;
    const sizeBtnCerrar = 45;
    const sizeNavBar = 65;
    const paddingBottom = 10;
    final sizeTotal = 100.h -
        (sizeLogo +
            sizeBtns +
            sizeAppbar +
            sizeBtnCerrar +
            sizeNavBar +
            paddingBottom);
    return sizeTotal <= 0 ? const SizedBox() : sizeTotal.sh;
  }

  List<Widget> datosPerfil(
      {required Widget subAppBar,
      required SizedBox space,
      double? top,
      double? height,
      EdgeInsetsGeometry? padding}) {
    final botones = Expanded(
      child: SingleChildScrollView(
        child: ResponsiveWeb(
            child: Column(children: _buildListaBotones(top, height, padding))),
      ),
    );
    return [subAppBar, botones];
  }

  List<Widget> _buildListaBotones(
      double? top, double? height, EdgeInsetsGeometry? padding) {
    return [
      ButtonPerfil(
        title: 'Caja',
        icon: Icons.credit_card,
        top: top,
        height: height,
        padding: padding,
        onPressed: () async {
          Get.toNamed(Routes.CAJA);
        },
      ),
      ButtonPerfil(
        title: 'Datos',
        icon: Icons.dehaze,
        top: top,
        height: height,
        padding: padding,
        onPressed: () async {
          Get.toNamed(Routes.DATOS_PROVEEDOR);
        },
      ),
      ButtonPerfil(
        title: 'Bonos',
        icon: FontAwesomeIcons.ticketAlt,
        top: top,
        height: height,
        padding: padding,
        onPressed: () async {
          Get.toNamed(Routes.DATOS_PROVEEDOR);
        },
      ),
      ButtonPerfil(
        title: 'Socio',
        icon: Icons.safety_divider,
        top: top,
        height: height,
        padding: padding,
        onPressed: () async {
          Get.toNamed(Routes.MIS_SOCIOS);
        },
      ),
      ButtonPerfil(
        title: 'Mi Club',
        icon: Icons.people,
        top: top,
        height: height,
        padding: padding,
        onPressed: () async {
          Get.to(const DetalleClubWidget(
            isProveedor: true,
          ));
        },
      ),
      ButtonPerfil(
        title: 'Tarifas y facturas',
        icon: Icons.airplane_ticket,
        top: top,
        height: height,
        padding: padding,
        onPressed: () async {
          Get.toNamed(Routes.TARIFAS_PROVEEDOR);
        },
      ),
      ButtonPerfil(
        title: 'Términos de servicio',
        icon: Icons.privacy_tip_rounded,
        top: top,
        height: height,
        padding: padding,
        onPressed: () async {
          final urlPoliticaPrivacidad = Uri.parse(
              'https://reservatupista.com/politica-de-privacidad-proteccion-de-datos-y-politica-de-cookies');
          final canLaunch = await canLaunchUrl(urlPoliticaPrivacidad);
          if (canLaunch) {
            launchUrl(urlPoliticaPrivacidad);
          }
        },
      ),
      ButtonPerfil(
        title: 'Invitar a amigos',
        icon: Icons.ios_share,
        top: top,
        height: height,
        padding: padding,
        onPressed: () async {
          await Share.share(
            'https://reservatupista.com/',
          );
        },
      ),
      20.0.sh,
      buildBtnCerrar(),
      context.paddingBottom.sh
    ];
  }

  Widget buildBtnCerrar() {
    return SizedBox(
      width: Get.width,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          width: 200,
          height: 50,
          margin: const EdgeInsets.only(top: 10.0),
          decoration: BoxDecoration(
            color: const Color(0xFFF77066),
            boxShadow: const [
              BoxShadow(
                blurRadius: 5,
                color: Color(0x3416202A),
                offset: Offset(0, 2),
              )
            ],
            borderRadius: BorderRadius.circular(12),
            shape: BoxShape.rectangle,
          ),
          child: BtnIcon(
            onPressed: () async {
              Get.offAllNamed(Routes.LOGIN_USUARIO, arguments: 1);
            },
            hoverColor: Colores.proveedor.primary69,
            borderRadius: 12,
            icon: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                  child: Text(
                    'Cerrar Sesión',
                    style: LightModeTheme().bodyLarge,
                  ),
                ),
                const Align(
                  alignment: AlignmentDirectional(0.9, 0),
                  child: Icon(
                    Icons.logout,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void dialogImage() {
    Get.dialog(
      GestureDetector(
          onTap: Get.back,
          child: SizedBox(
            child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImageServer(
                    width: null,
                    height: null,
                    fit: BoxFit.fill,
                  ),
                ]),
          )),
    );
  }
}

enum TypeIcon { svg, image, icon }

class ButtonPerfil extends StatelessWidget {
  ButtonPerfil(
      {super.key,
      required this.onPressed,
      required this.title,
      this.padding,
      this.typeIcon,
      this.top,
      this.pathAsset,
      this.height,
      this.icon});
  final void Function() onPressed;
  final Color hoverColor = Colores.proveedor.primary69;
  final Color iconColor = Colores.proveedor.primary;
  final String title;
  final IconData? icon;
  final TypeIcon? typeIcon;
  final String? pathAsset;
  final double? top;
  final double? height;
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16, top ?? 12, 16, 0),
      child: Container(
        width: double.infinity,
        height: height ?? 60,
        decoration: BoxDecoration(
          color: LightModeTheme().secondaryBackground,
          boxShadow: const [
            BoxShadow(
              blurRadius: 5,
              color: Color(0x3416202A),
              offset: Offset(0, 2),
            )
          ],
          borderRadius: BorderRadius.circular(12),
          shape: BoxShape.rectangle,
        ),
        child: BtnIcon(
          onPressed: onPressed,
          hoverColor: hoverColor,
          borderRadius: 12,
          icon: Padding(
            padding: padding ?? const EdgeInsets.all(8),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                buildIcon(context),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                    child: Text(
                      title,
                      style: LightModeTheme().bodyLarge,
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.9, 0),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: LightModeTheme().secondaryText,
                    size: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildIcon(BuildContext context) {
    switch (typeIcon) {
      case TypeIcon.svg:
        return SvgPicture.asset(
          'assets/images/${pathAsset!}.svg',
          height: 26,
          width: 26,
          fit: BoxFit.fill,
          colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
        );
      case TypeIcon.image:
        return Image.asset('assets/images/${pathAsset!}');
      default:
        return Icon(
          icon,
          color: iconColor,
          size: 24,
        );
    }
  }
}

Widget datos(String title, String dato) {
  return RichText(
      text: TextSpan(children: [
    TextSpan(
      text: '$title: ',
      style: LightModeTheme().bodyMedium.copyWith(fontWeight: FontWeight.bold),
    ),
    TextSpan(
      text: dato,
      style:
          LightModeTheme().bodyMedium.copyWith(fontWeight: FontWeight.normal),
    ),
  ]));
}
