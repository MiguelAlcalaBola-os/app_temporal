import 'package:reservatu_pista/utils/colores.dart';
import 'package:reservatu_pista/utils/responsive_web.dart';
import '../../../components/navbar_y_appbar_profesional.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NotificacionesProfesionalPage extends StatefulWidget {
  const NotificacionesProfesionalPage({super.key});

  @override
  NotificacionesProfesionalPageState createState() =>
      NotificacionesProfesionalPageState();
}

class NotificacionesProfesionalPageState
    extends State<NotificacionesProfesionalPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return NavbarYAppbarProfesional(
        title: 'Notificaciones',
        isTitleBack: true,
        isNavBar: false,
        child: Expanded(
            child: SingleChildScrollView(
                child: ResponsiveWeb(
          child: Column(
            children: [
              Text('\nNo se encontraron Notificaciones.',
                  style: LightModeTheme().bodyMedium.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 16)),
              ...List.generate(0, (index) => buildNotificacion())
            ],
          ),
        ))));
  }

  Widget buildNotificacion() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: LightModeTheme().secondaryBackground,
        boxShadow: const [
          BoxShadow(
            blurRadius: 0.0,
            color: Color(0xFFE0E3E7),
            offset: Offset(0.0, 1.0),
          )
        ],
        borderRadius: BorderRadius.circular(0.0),
        shape: BoxShape.rectangle,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 4.0,
              height: 50.0,
              decoration: BoxDecoration(
                color: Colores.proveedor.primary,
                borderRadius: BorderRadius.circular(2.0),
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                child: Text(
                  'Pista Agregada',
                  textAlign: TextAlign.start,
                  style: LightModeTheme().bodyLarge,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                child: Text(
                  '#7676742',
                  style: LightModeTheme().bodyLarge,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
              child: Text(
                'Mar 8, 2023',
                style: LightModeTheme().labelMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
