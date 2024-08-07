import 'package:get/get.dart';
import 'package:reservatu_pista/app/global_widgets/button_general.dart';
import 'package:reservatu_pista/utils/colores.dart';
import 'package:reservatu_pista/utils/responsive_web.dart';
import 'package:reservatu_pista/utils/sizer.dart';
import '../../../../components/navbar_y_appbar_profesional.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './widgets/list_inputs.dart';
import 'anadir_pista_c.dart';

// ignore: must_be_immutable
class AnadirPistaPage extends GetView<AnadirPistaController> {
  AnadirPistaPage({super.key});
  AnadirPistaController get self => controller;
  final scaffoldKey = GlobalKey<ScaffoldState>();
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
      title: '${self.isModificar ? 'Editar' : 'Crear'} Pista',
      page: TypePage.ReservarPista,
      isTitleBack: true,
      child: Expanded(
        child: SingleChildScrollView(
          controller: self.scrollController,
          child: ResponsiveWeb(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Form(
                  key: self.formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: const Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: SingleChildScrollView(child: ListInputs()),
                  ),
                ),
                10.0.sh,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonGeneral(
                      onPressed:
                          self.isModificar ? self.editarPista : self.crearPista,
                      text: '${self.isModificar ? 'Editar' : 'Crear'} Pista',
                      height: 45.0,
                      fillColor: LightModeTheme().successGeneral,
                    ),
                    Visible(
                      isVisible: self.isModificar,
                      child: 20.0.sw,
                    ),
                    Visible(
                      isVisible: self.isModificar,
                      child: ButtonGeneral(
                        onPressed: self.eliminarPista,
                        text: 'Eliminar Pista',
                        height: 45.0,
                        fillColor: Colores.rojo,
                      ),
                    )
                  ],
                ),
                context.paddingBottom.sh
              ],
            ),
          ),
        ),
      ),
    );
  }
}
