import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:reservatu_pista/backend/schema/enums/enums.dart';
import 'package:reservatu_pista/components/navbar_y_appbar_usuario.dart';
import 'package:reservatu_pista/pages/usuario/inicio/inicio_c.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';

class DetalleNoticia extends GetView<InicioController> {
  const DetalleNoticia({super.key});

  @override
  Widget build(BuildContext context) {
    return NavbarYAppbarUsuario(
        title: 'Noticia',
        page: TypePage.None,
        child: Expanded(child: buildNoticia(context)));
  }

  Widget buildNoticia(BuildContext context) {
    return Scaffold(
      backgroundColor: LightModeTheme().primaryBackground,
      body: Builder(
        builder: (context) {
          return SafeArea(
            top: false,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 200,
                      width: double.infinity,
                      child: Image.network(
                          'https://www.sportbs.es/wp-content/uploads/2018/07/Instalacion-de-pistas-de-padel-en-Extremadura.jpg'),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20, 16, 0, 0),
                      child: Text(
                        'Apertura de pista',
                        style: LightModeTheme().headlineMedium.override(
                              fontFamily: 'Outfit',
                              letterSpacing: 0,
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20, 8, 0, 0),
                      child: Text(
                        '02/04/2024',
                        style: LightModeTheme().titleSmall.override(
                              fontFamily: 'Lexend Deca',
                              color: LightModeTheme().usuario,
                              fontSize: 16,
                              letterSpacing: 0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20, 2, 0, 0),
                      child: Text(
                        'Riolobos',
                        style: LightModeTheme().titleSmall.override(
                              fontFamily: 'Lexend Deca',
                              color: LightModeTheme().usuario,
                              fontSize: 16,
                              letterSpacing: 0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20, 12, 20, 14),
                      child: Text(
                        'En el pintoresco pueblo de Riolobos, la emoción se apoderó de sus habitantes con la inauguración de la primera pista de pádel. El sonido de las palas golpeando la pelota resonaba en el aire, mientras se daban cita tanto jóvenes como mayores para disfrutar de este deporte en un ambiente comunitario y festivo. La pista impecablemente iluminada ofrecía un escenario perfecto para los partidos emocionantes que se sucedían a lo largo del día, convirtiendo el pádel en la nueva pasión de esta pequeña localidad.\n',
                        style: LightModeTheme().labelLarge.override(
                              fontFamily: 'Readex Pro',
                              color: LightModeTheme().secondaryText,
                              letterSpacing: 0,
                            ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
