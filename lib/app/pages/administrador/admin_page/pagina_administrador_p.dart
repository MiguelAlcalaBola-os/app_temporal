import 'package:get/get.dart';
import 'package:reservatu_pista/app/pages/administrador/admin_page/pagina_administrador_c.dart';
import 'package:reservatu_pista/app/pages/administrador/banco_admin/banco_admin_p.dart';
import 'package:reservatu_pista/app/pages/administrador/clubes_admin/clubes_admin_p.dart';
import 'package:reservatu_pista/app/pages/administrador/editar_noticia_admin/editar_noticia_admin_p.dart';
import 'package:reservatu_pista/app/pages/administrador/editar_ofertas_admin/editar_ofertas_admin_p.dart';
import 'package:reservatu_pista/app/pages/administrador/partidas_admin/partidas_admin_p.dart';
import 'package:reservatu_pista/app/pages/administrador/tarifas_admin/tarifa_admin_p.dart';
import 'package:reservatu_pista/app/pages/administrador/usuarios_admin/usuarios_admin_p.dart';
import 'package:reservatu_pista/app/routes/app_pages.dart';
import 'package:reservatu_pista/components/nav_app_administrador/navbar_y_appbar_admin.dart';
import 'package:reservatu_pista/utils/btn_icon.dart';
import 'package:reservatu_pista/utils/colores.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:reservatu_pista/utils/responsive_web.dart';

class AdminPageWidget extends GetView<AdminPageController> {
  const AdminPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWeb(
      child: NavbarYAppbarAdmin(
        title: 'Administrador',
        child: _AdminPageWidgetState(),
      ),
    );
  }
}

class _AdminPageWidgetState extends GetView<AdminPageController> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: LightModeTheme().secondaryBackground,
              boxShadow: const [
                BoxShadow(
                  blurRadius: 3,
                  color: Color(0x33000000),
                  offset: Offset(
                    0,
                    1,
                  ),
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      color: LightModeTheme().accent2,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: LightModeTheme().secondary,
                        width: 2,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.network(
                          'https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyfHxwZXJzb258ZW58MHx8fHwxNzExOTk2MjE0fDA&ixlib=rb-4.0.3&q=80&w=1080',
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Administrador',
                          style: LightModeTheme().headlineSmall.override(
                            fontFamily: 'Outfit',
                            letterSpacing: 0,
                          ),
                        ),
                        Text(
                          'Reservatupista',
                          style: LightModeTheme().headlineSmall.override(
                            fontFamily: 'Outfit',
                            letterSpacing: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: buildLista(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> buildLista() {
    return [
      bB(Icons.class_, 'Clubes', ClubesAdmin()),
      bB(Icons.person, 'Usuarios', AdminUsuarioWidget()),
      bB(Icons.sports_baseball_sharp, 'Reservas', AdminPartidasWidget()),
      bB(Icons.wallet, 'Tarifas', AdminTarifasWidget()),
      bB(Icons.newspaper_sharp, 'Noticias', EditarNoticiasWidget()),
      bB(Icons.local_offer_sharp, 'Ofertas', EditarOfertaWidget()),
      bB(Icons.euro, 'Banco', AdminBancoWidget()),
    ];
  }

  Widget bB(IconData icon, String nombre, Widget page) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          Get.to(page);
        },
        child: Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            color: LightModeTheme().secondaryBackground,
            boxShadow: const [
              BoxShadow(
                blurRadius: 5,
                color: Color(0x3416202A),
                offset: Offset(
                  0.0,
                  2,
                ),
              )
            ],
            borderRadius: BorderRadius.circular(12),
            shape: BoxShape.rectangle,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(
                  icon,
                  color: LightModeTheme().secondaryText,
                  size: 24,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                    child: Text(
                      nombre,
                      style: LightModeTheme().bodyLarge.override(
                        fontFamily: 'Readex Pro',
                        letterSpacing: 0,
                      ),
                    ),
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: LightModeTheme().secondaryText,
                  size: 18,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
