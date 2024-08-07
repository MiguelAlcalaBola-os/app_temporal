import 'package:get/get.dart';
import 'package:reservatu_pista/app/pages/usuario/mis_bonos/widgets/comprar_bonos.dart';
import 'package:reservatu_pista/backend/schema/enums/enums.dart';
import 'package:reservatu_pista/components/navbar_y_appbar_profesional.dart';
import 'package:reservatu_pista/components/navbar_y_appbar_usuario.dart';
import 'package:reservatu_pista/utils/responsive_web.dart';
import 'package:reservatu_pista/utils/sizer.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'mis_bonos_c.dart';

class MisBonosPage extends GetView<MisBonosController> {
  const MisBonosPage(this.isProveedor, {super.key});
  final bool isProveedor;
  @override
  Widget build(BuildContext context) {
    if (isProveedor) {
      return NavbarYAppbarProfesional(
          title: 'Mis bonos',
          page: TypePage.None,
          child: Expanded(child: _MisBonosWidgetState(isProveedor)));
    }
    return NavbarYAppbarUsuario(
        title: 'Mis bonos',
        page: TypePage.None,
        child: Expanded(child: _MisBonosWidgetState(isProveedor)));
  }
}

class _MisBonosWidgetState extends GetView<MisBonosController> {
  _MisBonosWidgetState(this.isProveedor);
  final bool isProveedor;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Text('\nNo se encontraron Bonos.',
        style: LightModeTheme().bodyMedium.copyWith(
            color: Colors.black, fontWeight: FontWeight.w700, fontSize: 16));
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: LightModeTheme().primaryBackground,
      body: ResponsiveWeb(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            buildTitle(),
            10.0.sh,
            Container(
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: LightModeTheme().secondaryBackground,
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 4,
                      color: Color(0x230E151B),
                      offset: Offset(
                        0.0,
                        2,
                      ),
                    )
                  ],
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: LightModeTheme().primaryText,
                    width: 2,
                  ),
                ),
                child: buildDescuentos()),
          ],
        ),
      ),
    );
  }

  Widget buildTitle() {
    return ResponsiveWeb(
      child: Container(
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: const DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    'https://images.unsplash.com/photo-1646649853703-7645147474ba?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyMnx8cGFkZWx8ZW58MHx8fHwxNzExNTM0MTgyfDA&ixlib=rb-4.0.3&q=80&w=1080',
                  ))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Ayto Riolobos',
                style: LightModeTheme().displaySmall.override(
                      fontFamily: 'Outfit',
                      color: Colors.white,
                      fontSize: 25,
                      letterSpacing: 0,
                    ),
              ),
              Text(
                'Riolobos',
                style: LightModeTheme().displaySmall.override(
                      fontFamily: 'Outfit',
                      color: Colors.white,
                      fontSize: 25,
                      letterSpacing: 0,
                    ),
              ),
            ],
          )),
    );
  }

  Widget buildDescuentos() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                  color: LightModeTheme().info,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: LightModeTheme().primaryText,
                    width: 2,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                      child: Text(
                        'Descuento:',
                        style: LightModeTheme().bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0, 0),
                      child: Text(
                        '5%',
                        style: LightModeTheme().bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              fontSize: 40,
                              letterSpacing: 0,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                  color: LightModeTheme().secondaryBackground,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: LightModeTheme().primaryText,
                    width: 2,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                      child: Text(
                        'Bono:',
                        style: LightModeTheme().bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0, 0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(3, 3, 3, 0),
                        child: Text(
                          'Bono 10 partidas por las mañanas',
                          style: LightModeTheme().bodyMedium.override(
                                fontFamily: 'Readex Pro',
                                fontSize: 14,
                                letterSpacing: 0,
                              ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0, 0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 3, 0, 0),
                        child: Text(
                          'Quedan 3',
                          style: LightModeTheme().bodyMedium.override(
                                fontFamily: 'Readex Pro',
                                fontSize: 13,
                                letterSpacing: 0,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                  color: LightModeTheme().secondaryBackground,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: LightModeTheme().primaryText,
                    width: 2,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                      child: Text(
                        'Descuento:',
                        style: LightModeTheme().bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0, 0),
                      child: Text(
                        '3€',
                        style: LightModeTheme().bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              fontSize: 40,
                              letterSpacing: 0,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                  color: LightModeTheme().secondaryBackground,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: LightModeTheme().primaryText,
                    width: 2,
                  ),
                ),
                child: FlutterFlowIconButton(
                  borderColor: LightModeTheme().secondaryBackground,
                  borderRadius: 0,
                  borderWidth: 1,
                  buttonSize: 40,
                  fillColor: LightModeTheme().secondaryBackground,
                  icon: Icon(
                    Icons.add,
                    color: LightModeTheme().primaryText,
                    size: 50,
                  ),
                  onPressed: () async {
                    Get.to(ComprarBonosWidget(isProveedor));
                  },
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
