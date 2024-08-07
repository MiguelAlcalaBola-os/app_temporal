import 'package:get/get.dart';
import 'package:reservatu_pista/app/pages/usuario/mis_pedidos/widgets/detalles_pedido.dart';
import 'package:reservatu_pista/app/pages/usuario/mis_pedidos/mis_pedidos_c.dart';
import 'package:reservatu_pista/backend/schema/enums/enums.dart';
import 'package:reservatu_pista/components/navbar_y_appbar_usuario.dart';
import 'package:reservatu_pista/utils/responsive_web.dart';
import 'package:standard_searchbar/new/standard_search_anchor.dart';
import 'package:standard_searchbar/new/standard_search_bar.dart';
import 'package:standard_searchbar/new/standard_suggestion.dart';
import 'package:standard_searchbar/new/standard_suggestions.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';

class MisPedidosPage extends GetView<MisPedidosController> {
  const MisPedidosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return NavbarYAppbarUsuario(
        title: 'Pedidos',
        page: TypePage.None,
        child: Expanded(child: _MisPedidosPageState()));
  }
}

class _MisPedidosPageState extends GetView<MisPedidosController> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: LightModeTheme().primaryBackground,
      body: SingleChildScrollView(
        child: ResponsiveWeb(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                child: Material(
                  color: Colors.transparent,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: LightModeTheme().secondaryBackground,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: LightModeTheme().secondaryBackground,
                        width: 2,
                      ),
                    ),
                    child: const Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        StandardSearchAnchor(
                          searchBar: StandardSearchBar(
                            bgColor: Color.fromARGB(255, 255, 255, 255),
                          ),
                          suggestions: StandardSuggestions(
                            suggestions: [
                              StandardSuggestion(text: 'Pedido #12345'),
                              StandardSuggestion(text: 'Pedido #67890'),
                              StandardSuggestion(text: 'Pedido #24680'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 0, 4),
                child: Text(
                  'Pedidos Recientes',
                  style: LightModeTheme().labelMedium.override(
                        fontFamily: 'Readex Pro',
                        letterSpacing: 0,
                      ),
                ),
              ),
              Center(
                child: Text('\nNo se encontraron Pedidos.',
                    style: LightModeTheme().bodyMedium.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPedidos() {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 44),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Builder(
            builder: (context) => Padding(
              padding: const EdgeInsets.all(10),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  Get.dialog(const DetallesPedidoWidget());
                },
                child: Material(
                  color: Colors.transparent,
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: LightModeTheme().secondaryBackground,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: LightModeTheme().reservaPendiente,
                        width: 2,
                      ),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16, 8, 16, 12),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.network(
                                'https://www.padelnuestro.com/media/catalog/product/2/9/29585_nox_ultimate_power_carbon_ltd_21_pexultltdc21odp_1500x1500_vista1_9fdb.jpg?optimize=high&bg-color=255,255,255&fit=bounds&height=&width=&canvas=:',
                                width: double.infinity,
                                height: 200,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16, 0, 16, 4),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Pedido #12345',
                                  style: LightModeTheme().bodyLarge.override(
                                        fontFamily: 'Readex Pro',
                                        letterSpacing: 0,
                                      ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16, 0, 0, 0),
                                  child: Text(
                                    'En proceso',
                                    style: LightModeTheme().titleLarge.override(
                                          fontFamily: 'Outfit',
                                          color:
                                              LightModeTheme().reservaPendiente,
                                          letterSpacing: 0,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16, 4, 16, 0),
                            child: Text(
                              'Detalles del pedido: 1x Pala Nox Ultimate Power LTD Carbon',
                              style: LightModeTheme().labelMedium.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Material(
              color: Colors.transparent,
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: LightModeTheme().secondaryBackground,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: LightModeTheme().successGeneral,
                    width: 2,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 12),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.network(
                            'https://images.unsplash.com/photo-1699641097303-e1778ca6e2f8?w=1280&h=720',
                            width: double.infinity,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 4),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Pedido #67890',
                              style: LightModeTheme().bodyLarge.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0,
                                  ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16, 0, 0, 0),
                              child: Text(
                                'Completado',
                                style: LightModeTheme().titleLarge.override(
                                      fontFamily: 'Outfit',
                                      color: LightModeTheme().successGeneral,
                                      letterSpacing: 0,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(16, 4, 16, 0),
                        child: Text(
                          'Detalles del pedido: 1x Zapatillas deportivas, 1x Mochila de hidratación.',
                          style: LightModeTheme().labelMedium.override(
                                fontFamily: 'Readex Pro',
                                letterSpacing: 0,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Material(
              color: Colors.transparent,
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: LightModeTheme().secondaryBackground,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: LightModeTheme().errorGeneral,
                    width: 2,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 12),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.network(
                            'https://images.unsplash.com/photo-1608111283055-2c8b619664ea?w=1280&h=720',
                            width: double.infinity,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 4),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Pedido #24680',
                              style: LightModeTheme().bodyLarge.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0,
                                  ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16, 0, 0, 0),
                              child: Text(
                                'Cancelado',
                                style: LightModeTheme().titleLarge.override(
                                      fontFamily: 'Outfit',
                                      color: LightModeTheme().errorGeneral,
                                      letterSpacing: 0,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(16, 4, 16, 0),
                        child: Text(
                          'Detalles del pedido: 1x Gorra deportiva, 1x Pulsera de actividad.',
                          style: LightModeTheme().labelMedium.override(
                                fontFamily: 'Readex Pro',
                                letterSpacing: 0,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
