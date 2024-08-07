import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/app/global_widgets/button_general.dart';
import 'package:reservatu_pista/components/navbar_y_appbar_profesional.dart';
import 'package:reservatu_pista/components/navbar_y_appbar_usuario.dart';
import 'package:reservatu_pista/utils/animations/list_animations.dart';
import 'package:reservatu_pista/utils/ckeck/noticias_checkbox.dart';
import 'package:reservatu_pista/utils/colores.dart';
import 'package:reservatu_pista/utils/responsive_web.dart';
import 'package:reservatu_pista/utils/state_getx/state_mixin_demo.dart';
import '../../../../utils/loader/color_loader_3.dart';
import '../../../../utils/server/image_server.dart';
import './datos_proveedor_c.dart';
import '../../../../flutter_flow/flutter_flow_animations.dart';
import '../../../../utils/btn_icon.dart';
import '../../../widgets/appbar_general.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/services.dart';
import 'widgets/codigo_iban.dart';
import 'widgets/input_registrar.dart';

class DatosProveedorPage extends GetView<DatosProveedorController> {
  DatosProveedorPage({super.key});
  DatosProveedorController get self => controller;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final focusedColor = const Color(0xFF46EF98);
  final lineColor = const Color.fromARGB(160, 70, 239, 152);
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
    final datosFacturacion = self.datosFacturacion().listProperty();
    final datosPago = self.datosPago().listProperty();
    final datosContacto = self.datosContacto();
    final datosUbicacion = self.datosUbicacion();
    return NavbarYAppbarProfesional(
        title: 'Datos Proveedor',
        isTitleBack: true,
        isNavBar: false,
        child: Expanded(
            child: Column(
          children: [
            self.apiDatosProveedor.obx(
                (state) => Form(
                      key: self.formKey,
                      child: Expanded(
                        child: SingleChildScrollView(
                          child: ResponsiveWeb(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                seleccionarImage(),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 16.0, 0.0, 0.0),
                                  child: Text(
                                    'Datos de facturación',
                                    style: LightModeTheme()
                                        .labelLarge
                                        .copyWith(color: Colors.black),
                                  ),
                                ),
                                ...List<Widget>.generate(
                                    datosFacturacion.length,
                                    (index) => buildInput(
                                        context: context,
                                        propertiesTextField:
                                            datosFacturacion[index])),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 16.0, 0.0, 0.0),
                                  child: Text(
                                    'Datos de pago/cobro',
                                    style: LightModeTheme()
                                        .labelLarge
                                        .copyWith(color: Colors.black),
                                  ),
                                ),
                                ...List<Widget>.generate(
                                    datosPago.length,
                                    (index) => buildInput(
                                        context: context,
                                        propertiesTextField: datosPago[index])),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 16.0, 0.0, 0.0),
                                  child: Text(
                                    'Datos de contacto',
                                    style: LightModeTheme()
                                        .labelLarge
                                        .copyWith(color: Colors.black),
                                  ),
                                ),
                                ...List<Widget>.generate(
                                    datosContacto.listProperty().length,
                                    (index) => buildInput(
                                        context: context,
                                        propertiesTextField: datosContacto
                                            .listProperty()[index])),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      5.0, 12.0, 5.0, 0.0),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                          width: 80,
                                          child: buildInput(
                                              context: context,
                                              padding: const EdgeInsets.all(0),
                                              propertiesTextField:
                                                  datosContacto.lada)),
                                      Flexible(
                                          child: buildInput(
                                              context: context,
                                              padding: const EdgeInsets.all(0),
                                              propertiesTextField:
                                                  datosContacto.movil))
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 16.0, 0.0, 0.0),
                                  child: Text(
                                    'Datos ubicación',
                                    style: LightModeTheme()
                                        .labelLarge
                                        .copyWith(color: Colors.black),
                                  ),
                                ),
                                ...List<Widget>.generate(
                                    datosUbicacion.length,
                                    (index) => buildInput(
                                        context: context,
                                        propertiesTextField:
                                            datosUbicacion[index])),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 16.0, 0.0, 0.0),
                                  child: Text(
                                    'Email',
                                    style: LightModeTheme()
                                        .labelLarge
                                        .copyWith(color: Colors.black),
                                  ),
                                ),
                                NoticiasCheckbox(
                                  initialValue: self.noticia,
                                  onChanged: (val) {
                                    self.noticia = val!;
                                  },
                                  animTerminos: animVibrate(vsync: self),
                                  focusedColor: Colores.usuario.primary,
                                  palomita: Colors.white,
                                  paddingTop: 0.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                onLoading: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: ColorLoader3(),
                )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: ButtonGeneral(
                text: 'Eliminar Cuenta',
                hoverColor: Colores.proveedor.primary69,
                fillColor: Colores.rojo,
                onPressed: self.onOpenDialogEliminarCuenta,
              ),
            ),
          ],
        )));
  }

  Widget seleccionarImage() {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
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
                Container(
                  width: 90.0,
                  height: 90.0,
                  decoration: BoxDecoration(
                    border: Border.fromBorderSide(
                        BorderSide(color: Colores.usuario.primary69)),
                    shape: BoxShape.circle,
                  ),
                  child: BtnIcon(
                    onPressed: mostrarImagen,
                    borderRadius: 50,
                    padding: const EdgeInsets.all(0),
                    fillColor: Colors.transparent,
                    hoverColor: const Color.fromARGB(68, 255, 255, 255),
                    icon: ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: SizedBox(
                        width: 200,
                        child: ImageServer(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void mostrarImagen() {
    Get.dialog(
      GestureDetector(
        onTap: Get.back,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageServer(
              width: null,
              height: null,
              fit: BoxFit.fitWidth,
            ),
            ResponsiveWeb(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: FFButtonWidget(
                  onPressed: () =>
                      self.imageProveedor.dialogSeleccionarImage(Get.context!),
                  text: 'Editar foto',
                  icon: const Icon(
                    Icons.edit,
                    size: 25,
                  ),
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 60,
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    color: LightModeTheme().primaryBackground,
                    textStyle:
                        LightModeTheme().bodyLarge.copyWith(fontSize: 18.0),
                    elevation: 2,
                    splashColor: const Color.fromARGB(65, 0, 0, 0),
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInput({
    required BuildContext context,
    EdgeInsetsGeometry? padding,
    required PropertiesTextField propertiesTextField,
  }) {
    if (propertiesTextField.labelText == 'Número de cuenta') {
      return const Padding(
        padding: EdgeInsetsDirectional.fromSTEB(5.0, 10.0, 5.0, 0.0),
        child: CodigoIban(),
      );
    }
    return VibratingWidget(
        controller: propertiesTextField.anim,
        child: Padding(
            padding: padding ??
                const EdgeInsetsDirectional.fromSTEB(5.0, 10.0, 5.0, 0.0),
            child: propertiesTextField.isSelect
                ? LayoutBuilder(builder: (context, boxContrains) {
                    return TextFormField(
                      controller: propertiesTextField.controller,
                      focusNode: propertiesTextField.focusNode,
                      maxLength: propertiesTextField.maxLength,
                      keyboardType: propertiesTextField.keyboardType,
                      decoration: InputDecoration(
                        counterText: '',
                        errorStyle: const TextStyle(fontSize: 0),
                        labelText: propertiesTextField.labelText,
                        hintStyle: LightModeTheme().bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              color: const Color(0xFF95A1AC),
                            ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colores.proveedor.primary,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colores.proveedor.primary69,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: focusedColor,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: LightModeTheme().error,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: LightModeTheme().error,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        filled: true,
                        contentPadding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 12.0, 16.0, 12.0),
                        fillColor: LightModeTheme().secondaryBackground,
                      ),
                      style: LightModeTheme().bodyMedium,
                      validator: propertiesTextField.validateTextField,
                      cursorColor: LightModeTheme().primary,
                      readOnly: true,
                      enabled: false,
                      onTap: () => SelectInputRegistrar(
                        context: context,
                        itemsDD: propertiesTextField.listSelect,
                        paddingDialogLeft: 5,
                        paddingSelect:
                            const EdgeInsets.only(left: 10.0, top: 0),
                        onChanged: (val) =>
                            propertiesTextField.controller.text = val,
                      ).handleTap(),
                      enableInteractiveSelection: propertiesTextField.isSelect,
                    );
                  })
                : (propertiesTextField.labelText == 'Certificado de Cuenta'
                    ? buildUploadImage(
                        context: context,
                        propertiesTextField: propertiesTextField)
                    : TextFormField(
                        controller: propertiesTextField.controller,
                        focusNode: propertiesTextField.focusNode,
                        maxLength: propertiesTextField.maxLength,
                        keyboardType: propertiesTextField.keyboardType,
                        decoration: InputDecoration(
                          counterText: '',
                          errorStyle: const TextStyle(fontSize: 0),
                          labelText: propertiesTextField.labelText,
                          hintStyle: LightModeTheme().bodyMedium.override(
                                fontFamily: 'Readex Pro',
                                color: const Color(0xFF95A1AC),
                              ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: lineColor,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colores.proveedor.primary69,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: focusedColor,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: LightModeTheme().error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: LightModeTheme().error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          suffixIcon: propertiesTextField.suffixIcon,
                          filled: true,
                          fillColor: LightModeTheme().secondaryBackground,
                          contentPadding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 12.0, 16.0, 12.0),
                        ),
                        style: LightModeTheme().bodyMedium,
                        inputFormatters: propertiesTextField.inputFormatters,
                        enabled: false,
                        onChanged: propertiesTextField.onChange,
                        validator: propertiesTextField.validateTextField))));
  }

  TextFormField buildUploadImage({
    required BuildContext context,
    required PropertiesTextField propertiesTextField,
  }) {
    return TextFormField(
      controller: propertiesTextField.controller,
      focusNode: propertiesTextField.focusNode,
      maxLength: propertiesTextField.maxLength,
      keyboardType: propertiesTextField.keyboardType,
      decoration: InputDecoration(
        counterText: '',
        errorStyle: const TextStyle(fontSize: 0),
        labelText: propertiesTextField.labelText,
        hintStyle: LightModeTheme().bodyMedium.override(
              fontFamily: 'Readex Pro',
              color: const Color(0xFF95A1AC),
            ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colores.proveedor.primary69,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colores.proveedor.primary69,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: LightModeTheme().error,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: LightModeTheme().error,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Icon(Icons.edit_square, color: focusedColor, size: 30)),
        suffixIcon: Obx(() => self.imageCertificado.existeImagen()
            ? BtnIcon(
                onPressed: () {
                  Get.dialog(
                    GestureDetector(
                      onTap: Get.back,
                      child: ResponsiveWeb(
                        child: self.imageCertificado
                            .widgetImage(width: 100.0, fit: BoxFit.fitWidth),
                      ),
                    ),
                  );
                },
                borderRadius: 30,
                padding: const EdgeInsets.all(0),
                fillColor: Colors.transparent,
                hoverColor: const Color.fromARGB(68, 255, 255, 255),
                icon: CircleAvatar(
                    radius: 20,
                    backgroundImage:
                        self.imageCertificado.widgetBackgroundImage()),
              )
            : const SizedBox.shrink()),
        filled: true,
        fillColor: LightModeTheme().secondaryBackground,
        contentPadding:
            const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
      ),
      style: LightModeTheme().bodyMedium,
      readOnly: true,
      enableInteractiveSelection: false,
      validator: self.imageCertificado.validatorImage,
    );
  }
}
