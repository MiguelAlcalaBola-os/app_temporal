import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/app/global_widgets/button_general.dart';
import 'package:reservatu_pista/components/navbar_y_appbar_usuario.dart';
import 'package:reservatu_pista/utils/sizer.dart';
import '../../../../utils/btn_icon.dart';
import '../../../../utils/colores.dart';
import './registrar_usuario_c.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/services.dart';
import 'widgets/inputs_datos_registro_usuario.dart';
import 'package:reservatu_pista/utils/responsive_web.dart';

class RegistrarUsuarioPage extends StatefulWidget {
  const RegistrarUsuarioPage({super.key});

  @override
  State<RegistrarUsuarioPage> createState() => _RegistrarUsuarioPageState();
}

class _RegistrarUsuarioPageState extends State<RegistrarUsuarioPage> {
  RegistrarUsuarioController self = Get.find();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final pageIndexNotifier = ValueNotifier(0);

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
    return NavbarYAppbarUsuario(
        title: 'Registro Usuario',
        isTitleBack: true,
        isNavBar: false,
        child: Expanded(
            child: Form(
                key: self.formKey,
                child: Column(
                  children: [
                    buildSelectImage(),
                    Expanded(
                      child: SingleChildScrollView(
                        child: ResponsiveWeb(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const InputsDatosRegistroUsuario(),
                              ButtonGeneral(
                                onPressed: self.onPressedRegistrar,
                                fillColor: Colores.usuario.primary,
                              ),
                              10.0.sh
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ))));
  }

  Widget buildSelectImage() {
    return ResponsiveWeb(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: LightModeTheme().secondaryBackground,
          boxShadow: const [
            BoxShadow(
              blurRadius: 3.0,
              color: Color(0x33000000),
              offset: Offset(0.0, 1.0),
            )
          ],
        ),
        child: Align(
          alignment: const AlignmentDirectional(0.0, 0.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Selecciona tu foto de perfil',
                  style:
                      LightModeTheme().labelLarge.copyWith(color: Colors.black),
                ),
                Stack(
                  children: [
                    SizedBox(
                      width: 90,
                      child: TextFormField(
                        focusNode: self.tc.fotoFocusNode,
                        decoration: InputDecoration(
                            errorStyle: const TextStyle(fontSize: 0),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: LightModeTheme().error,
                                width: 3.0,
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 3, color: Colores.usuario.primary),
                                borderRadius: BorderRadius.circular(50)),
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(width: 3),
                                borderRadius: BorderRadius.circular(50)),
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 34)),
                        enableInteractiveSelection: false,
                        readOnly: true,
                        validator: self.image.validatorImage,
                      ),
                    ),
                    Container(
                      width: 90.0,
                      height: 90.0,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: BtnIcon(
                        onPressed: () =>
                            self.image.dialogSeleccionarImage(context),
                        borderRadius: 50,
                        padding: const EdgeInsets.all(0),
                        fillColor: Colors.transparent,
                        hoverColor: const Color.fromARGB(68, 255, 255, 255),
                        icon: Obx(self.image.getImageWidget),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
