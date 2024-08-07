import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/app/global_widgets/button_general.dart';
import 'package:reservatu_pista/app/pages/profesional/registro_proveedor/widgets/inputs_datos_registro_proveedor.dart';
import 'package:reservatu_pista/components/navbar_y_appbar_profesional.dart';
import 'package:reservatu_pista/utils/colores.dart';
import 'package:reservatu_pista/utils/responsive_web.dart';
import 'registrar_proveedor_c.dart';
import '../../../../utils/btn_icon.dart';
import '../../../widgets/appbar_general.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/services.dart';

class RegistrarProveedorPage extends GetView<RegistrarProveedorController> {
  RegistrarProveedorPage({super.key});
  RegistrarProveedorController get self => controller;
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
        title: 'Registro Proveedor',
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
                    controller: self.scrollController,
                    child: ResponsiveWeb(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const InputsDatosRegistroProveedor(),
                          ButtonGeneral(
                            onPressed: self.onPressedRegistrar,
                            fillColor: Colores.proveedor.primary,
                            isProveedor: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
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
                        controller: self.imageProveedor.controller,
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
                                    width: 3, color: Colores.proveedor.primary),
                                borderRadius: BorderRadius.circular(50)),
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(width: 3),
                                borderRadius: BorderRadius.circular(50)),
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 34)),
                        enableInteractiveSelection: false,
                        readOnly: true,
                        validator: self.imageProveedor.validatorImage,
                      ),
                    ),
                    Container(
                      width: 90.0,
                      height: 90.0,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: BtnIcon(
                        onPressed: () => self.imageProveedor
                            .dialogSeleccionarImage(Get.context!),
                        borderRadius: 50,
                        padding: const EdgeInsets.all(0),
                        fillColor: Colors.transparent,
                        hoverColor: const Color.fromARGB(68, 255, 255, 255),
                        icon: Obx(self.imageProveedor.getImageWidget),
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
