import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/app/routes/app_pages.dart';
import 'pistas_proveedor_c.dart';
import 'package:reservatu_pista/app/data/models/mis_pistas_model.dart';
import 'package:reservatu_pista/app/data/provider/datos_server.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_animations.dart';
import 'package:reservatu_pista/utils/btn_icon.dart';
import 'package:reservatu_pista/utils/colores.dart';
import 'package:reservatu_pista/utils/loader/color_loader.dart';
import 'package:reservatu_pista/utils/responsive_web.dart';
import 'package:reservatu_pista/utils/sizer.dart';
import 'package:reservatu_pista/utils/state_getx/state_mixin_demo.dart';
import '../../../../backend/schema/enums/enums.dart';
import '../../../../components/navbar_y_appbar_profesional.dart';
import '../../../../flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PistasProveedorPage extends GetView<PistasProveedorController> {
  PistasProveedorPage({super.key});
  PistasProveedorController get self => controller;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return NavbarYAppbarProfesional(
        title: 'Pistas',
        page: TypePage.ReservarPista,
        child: Expanded(
          child: ResponsiveWeb(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildButtonCrear(),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Obx(buildPageDeportes)),
                  5.0.sh,
                  buildPistas(),
                ],
              ),
            ),
          ),
        ));
  }

  Widget _buildButtonCrear() {
    return ResponsiveWeb(
      child: Padding(
        padding: const EdgeInsetsDirectional.only(bottom: 10.0),
        child: BtnIcon(
          onPressed: () {
            Get.toNamed(Routes.ANADIR_PISTA);
          },
          height: 50,
          fillColor: Colores.proveedor.primary,
          padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
          borderRadius: 8.0,
          icon: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Crear Pista',
                style: LightModeTheme().titleMedium.copyWith(
                  fontFamily: 'Readex Pro',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0,
                  shadows: [
                    const Shadow(
                      blurRadius: 5.0,
                      color: Color.fromARGB(151, 0, 0, 0),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.add,
                size: 40,
                color: Colors.white,
                shadows: [
                  Shadow(
                    blurRadius: 2.0,
                    color: Color.fromARGB(151, 0, 0, 0),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPageDeportes() => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: buildListDeportes())
            .animateOnPageLoad(self.animationPistaDeporte),
      );

  /// Build LIsta deportes
  List<Widget> buildListDeportes() {
    final imagenes = {
      'Pádel': 'padel',
      'Tenis': 'tenis',
      'Badminton': 'badminton',
      'P. climatizada': 'p.climatizada',
      'Piscina': 'piscina',
      'Baloncesto': 'baloncesto',
      'Futbol sala': 'futbolsala',
      'Futbol 7': 'futbol7',
      'Futbol 11': 'futbol11',
      'Pickleball': 'pickleball',
      'Squash': 'squash',
      'Tenis de mesa': 'tenisdemesa',
      'Fronton': 'fronton',
      'Balomano': 'balomano',
      'Rugby': 'rugby',
      'Multideporte': 'multideporte'
    };
    return self.misDeportes.map((e) {
      String texto = e;
      final style = LightModeTheme().bodyMedium.override(
            fontFamily: 'Readex Pro',
            letterSpacing: 0,
          );

      final width = calcularAnchoTexto(texto, style);
      return buildDeporte(
          DatosDeporte(e, imagenes[e]!, width < 60.0 ? 60.0 : (width + 10)),
          style);
    }).toList();
  }

  /// Build Deporte
  Widget buildDeporte(DatosDeporte e, TextStyle style) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: 50,
                width: 50,
                child: Image.network(
                  DatosServer.online(e.image),
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                e.nombre,
                style: style,
              ),
            ],
          ),
        ),
        BtnIcon(
          onPressed: () => self.onPressDeporte(e.nombre),
          padding: const EdgeInsets.all(0.0),
          hoverColor: Colores.proveedor.primary69,
          borderRadius: 10,
          borderWidth: self.deporte == e.nombre ? 1 : null,
          borderColor:
              self.deporte == e.nombre ? Colores.proveedor.primary : null,
          icon: Container(
            height: 70,
            width: e.width,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
          ),
        )
      ],
    );
  }

  Widget buildPistas() {
    return self.misPistas.obx(
        (state) => Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(
                    state!.length,
                    (i) => buildPista(state[i]),
                  ).divide(10.0.sh).addToEnd(65.0.sh),
                ),
              ),
            ),
        onLoading: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Center(
            child: SizedBox(
                width: 100,
                child: ColorLoader(
                  radius: 12,
                  padding: const EdgeInsets.only(right: 10),
                )),
          ),
        ),
        onEmpty: Center(
          child: Text('\nNo se encontraron pistas.',
              style: LightModeTheme().bodyMedium.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 16)),
        ));
  }

  /// Widget Pista
  Widget buildPista(MiPista pista) {
    return InkWell(
      splashColor: const Color.fromARGB(0, 156, 137, 137),
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        height: 90,
        decoration: BoxDecoration(
          color: LightModeTheme().secondaryBackground,
          boxShadow: const [
            BoxShadow(
              blurRadius: 4,
              color: Color.fromARGB(51, 0, 0, 0),
              offset: Offset(
                0,
                2,
              ),
            )
          ],
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          border: Border.all(width: 1, color: Colores.grisClaro),
        ),
        child: Align(
          alignment: const AlignmentDirectional(0, 0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(0),
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(0),
                      ),
                      child: Image.network(
                          DatosServer.pista(pista.imagenPatrocinador),
                          width: 50,
                          height: 50,
                          fit: BoxFit.fill, errorBuilder: (BuildContext context,
                              Object exception, StackTrace? stackTrace) {
                        return Container(
                            height: 50,
                            width: 50,
                            color: Colores.proveedor.primary);
                      }),
                    ),
                  ),
                  Text(
                    pista.deporte,
                    style: LightModeTheme().bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 10, 10, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  10, 0, 0, 0),
                              child: Text(
                                pista.nombrePatrocinador == ''
                                    ? 'Pista ${pista.numeroPista}'
                                    : 'Pista ${pista.numeroPista} - ${pista.nombrePatrocinador}',
                                style: LightModeTheme().bodyMedium.override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 16,
                                      letterSpacing: 0,
                                    ),
                              ),
                            ),
                          ),
                          BtnIcon(
                            hoverColor: Colores.usuario.primary69,
                            fillColor: Colores.orange,
                            onPressed: () {
                              Get.toNamed(Routes.ANADIR_PISTA, parameters: {
                                'id_pista': pista.idPista.toString()
                              });
                            },
                            borderRadius: 10,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 5.0),
                            icon: Column(
                              children: [
                                const Icon(
                                  Icons.edit,
                                  size: 45,
                                  color: Colors.white,
                                ),
                                Text(
                                  'Editar',
                                  style: LightModeTheme().bodyMedium.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ).animateOnPageLoad(self.animationPistaDeporte);
  }
}

class DatosDeporte {
  final String nombre;
  final String image;
  final double width;
  DatosDeporte(this.nombre, this.image, this.width);
}
