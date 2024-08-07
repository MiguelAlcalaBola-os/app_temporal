import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:reservatu_pista/backend/schema/enums/enums.dart';
import 'package:reservatu_pista/components/navbar_y_appbar_usuario.dart';
import 'package:flutter/material.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_theme.dart';
import 'package:reservatu_pista/pages/usuario/inicio/inicio_c.dart';
import '../../../../../flutter_flow/flutter_flow_widgets.dart';

class Oferta extends GetView<InicioController> {
  const Oferta({super.key});
  InicioController get self => controller;

  @override
  Widget build(BuildContext context) {
    return NavbarYAppbarUsuario(
        title: 'Oferta',
        page: TypePage.None,
        child: Expanded(child: buildOferta(context)));
  }

  Widget buildOferta(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Scaffold(
        backgroundColor: Colors.white,
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, _) => [],
          body: Builder(
            builder: (context) {
              return Column(
                children: [
                  Align(
                    alignment: const AlignmentDirectional(0, -1),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            'https://www.padelnuestro.com/media/catalog/product/2/9/29585_nox_ultimate_power_carbon_ltd_21_pexultltdc21odp_1500x1500_vista1_9fdb.jpg?optimize=high&bg-color=255,255,255&fit=bounds&height=&width=&canvas=:',
                            width: double.infinity,
                            height: 320,
                            fit: BoxFit.contain,
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24, 0, 0, 0),
                            child: Text(
                              'NOX ULTIMATE POWER LTD CARBON',
                              style: LightModeTheme().headlineMedium.override(
                                    fontFamily: 'Outfit',
                                    color: const Color(0xFF14181B),
                                    fontSize: 24,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24, 10, 0, 4),
                            child: Text(
                              'Pala marca: Nox',
                              style: LightModeTheme().labelMedium.override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: const Color(0xFF57636C),
                                    fontSize: 14,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 10, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24, 4, 0, 0),
                                  child: Text(
                                    '299€',
                                    style:
                                        LightModeTheme().headlineSmall.override(
                                              fontFamily: 'Outfit',
                                              color: const Color(0xFF8B8B8B),
                                              fontSize: 24,
                                              letterSpacing: 0,
                                              fontWeight: FontWeight.w500,
                                              decoration:
                                                  TextDecoration.lineThrough,
                                            ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      15, 4, 0, 0),
                                  child: Text(
                                    '112,95€',
                                    style:
                                        LightModeTheme().headlineSmall.override(
                                              fontFamily: 'Outfit',
                                              color: const Color(0xFF14181B),
                                              fontSize: 24,
                                              letterSpacing: 0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24, 20, 24, 0),
                              child: Text(
                                'Disfruta de la resistencia gracia a su composición de carbono en toda la estructura. Su forma diamante maximizará tu potencia en cada golpe.',
                                textAlign: TextAlign.center,
                                style: LightModeTheme().labelMedium.override(
                                      fontFamily: 'Plus Jakarta Sans',
                                      color: const Color(0xFF57636C),
                                      fontSize: 14,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.normal,
                                    ),
                              )),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0, 1),
                    child: Container(
                      width: double.infinity,
                      height: 140,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xCCFFFFFF), Colors.white],
                          stops: [0, 0.7],
                          begin: AlignmentDirectional(0, -1),
                          end: AlignmentDirectional(0, 1),
                        ),
                      ),
                      alignment: const AlignmentDirectional(0, -0.45),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(35, 0, 24, 0),
                        child: FFButtonWidget(
                          onPressed: () {
                            print('Button pressed ...');
                          },
                          text: 'Comprar',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 60,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 0, 0, 0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0, 0, 0, 0),
                            color: LightModeTheme().successGeneral,
                            textStyle: LightModeTheme().titleSmall.override(
                                  fontFamily: 'Plus Jakarta Sans',
                                  color: LightModeTheme().primaryText,
                                  fontSize: 20,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.bold,
                                ),
                            elevation: 3,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
