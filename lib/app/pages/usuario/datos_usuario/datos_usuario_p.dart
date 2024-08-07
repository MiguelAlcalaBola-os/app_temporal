import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/app/global_widgets/button_general.dart';
import 'package:reservatu_pista/app/pages/usuario/datos_usuario/widgets/select_datos.dart';
import 'package:reservatu_pista/components/navbar_y_appbar_usuario.dart';
import 'package:reservatu_pista/utils/animations/list_animations.dart';
import 'package:reservatu_pista/utils/ckeck/noticias_checkbox.dart';
import 'package:reservatu_pista/utils/loader/color_loader_3.dart';
import 'package:reservatu_pista/utils/responsive_web.dart';
import 'package:reservatu_pista/utils/server/image_server.dart';
import 'package:reservatu_pista/utils/sizer.dart';
import '../../../../flutter_flow/flutter_flow_animations.dart';
import '../../../../utils/btn_icon.dart';
import '../../../../utils/colores.dart';
import '../../../../utils/loader/color_loader.dart';
import '../../../../utils/state_getx/state_mixin_demo.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/services.dart';
import 'datos_usuario_c.dart';

class DatosUsuarioPage extends GetView<DatosUsuarioController> {
  DatosUsuarioPage({super.key});
  DatosUsuarioController get self => controller;
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
    return NavbarYAppbarUsuario(
      title: 'Datos Usuario',
      isTitleBack: true,
      isNavBar: false,
      child: Expanded(
        child: Column(
          children: [
            self.apidatosUsuario.obx((state) => getFomData(),
                onLoading: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: ColorLoader3(),
                )),
            ResponsiveWeb(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Obx(buildBtnModificarGuardar),
                    ButtonGeneral(
                      text: 'Eliminar Cuenta',
                      hoverColor: Colores.usuario.primary69,
                      fillColor: Colores.rojo,
                      onPressed: self.onOpenDialogEliminarCuenta,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildBtnModificarGuardar() {
    return ButtonGeneral(
      text: self.modificarDatos.value ? 'Guardar Cambios' : 'Modificar Datos',
      hoverColor: Colores.usuario.primary69,
      fillColor: Colores.usuario.primary,
      onPressed: () {
        if (self.modificarDatos.value) {
          self.onPressedGuardarCambios();
        }
        self.modificarDatos.toggle();
        self.apidatosUsuario.rx.refresh();
      },
    );
  }

  Widget getFomData() {
    final datosPersonales = self.datosPersonales();
    final datosUbicacion = self.datosUbicacion();
    final datosJuego = self.datosJuego();

    return Form(
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
                    'Datos Personales',
                    style: LightModeTheme()
                        .labelLarge
                        .copyWith(color: Colors.black),
                  ),
                ),
                Builder(builder: (BuildContext context) {
                  final listTopProperty = List.generate(
                      datosPersonales.listTopProperty().length,
                      (index) => buildInput(
                          context: context,
                          propertiesTextField:
                              datosPersonales.listTopProperty()[index]));
                  return Column(
                    children: [
                      ...listTopProperty,
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            5.0, 12.0, 5.0, 0.0),
                        child: Row(
                          children: [
                            Expanded(
                                child: buildInput(
                                    context: context,
                                    padding: const EdgeInsets.all(0),
                                    propertiesTextField:
                                        datosPersonales.sexo!)),
                            4.0.sw,
                            Flexible(
                                child: buildInput(
                                    context: context,
                                    padding: const EdgeInsets.all(0),
                                    propertiesTextField: datosPersonales.dni!))
                          ],
                        ),
                      ),
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
                                        datosPersonales.lada!)),
                            4.0.sw,
                            Flexible(
                                child: buildInput(
                                    context: context,
                                    padding: const EdgeInsets.all(0),
                                    propertiesTextField:
                                        datosPersonales.telefono!))
                          ],
                        ),
                      ),
                      buildInput(
                          context: context,
                          propertiesTextField: datosPersonales.email!),
                    ],
                  );
                }),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                      16.0, 16.0, 0.0, 0.0),
                  child: Text(
                    'Datos Ubicacion',
                    style: LightModeTheme()
                        .labelLarge
                        .copyWith(color: Colors.black),
                  ),
                ),
                ...List<Widget>.generate(
                    datosUbicacion.length,
                    (index) => buildInput(
                        context: Get.context!,
                        propertiesTextField: datosUbicacion[index])),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                      16.0, 16.0, 0.0, 0.0),
                  child: Text(
                    'Datos de Juego',
                    style: LightModeTheme()
                        .labelLarge
                        .copyWith(color: Colors.black),
                  ),
                ),
                buildNick(
                    context: Get.context!,
                    propertiesTextField: datosJuego.nick!),
                ...List<Widget>.generate(
                    datosJuego.listProperty().length,
                    (index) => buildInput(
                        context: Get.context!,
                        propertiesTextField: datosJuego.listProperty()[index])),
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
                  onChanged: self.modificarEmailNoticia,
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
    );
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
                      self.image.dialogSeleccionarImage(Get.context!),
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

  Widget buildInput(
      {required BuildContext context,
      required PropertiesTextField propertiesTextField,
      String? Function(String?)? validator,
      EdgeInsetsGeometry? padding}) {
    final bool isRequired = !propertiesTextField.isRequired;
    return VibratingWidget(
      controller: propertiesTextField.anim,
      child: Padding(
          padding: padding ??
              const EdgeInsetsDirectional.fromSTEB(5.0, 10.0, 5.0, 0.0),
          child: propertiesTextField.isSelect
              ? LayoutBuilder(builder: (context, boxContrains) {
                  return TextFormField(
                    controller: propertiesTextField.textEditingController,
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
                          color: LightModeTheme().primary,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colores.usuario.primary69,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: LightModeTheme().primary,
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
                      fillColor: LightModeTheme().secondaryBackground,
                      contentPadding: const EdgeInsetsDirectional.fromSTEB(
                          16.0, 12.0, 16.0, 12.0),
                    ),
                    style: LightModeTheme().bodyMedium,
                    cursorColor: LightModeTheme().primary,
                    readOnly: true,
                    enabled: self.modificarDatos.value
                        ? isRequired
                        : self.modificarDatos.value,
                    onTap: () => SelectDatos(
                      context: context,
                      itemsDD: propertiesTextField.listSelect,
                      paddingDialogLeft: 5,
                      paddingSelect: const EdgeInsets.only(left: 15),
                      onChanged: (val) =>
                          propertiesTextField.textEditingController.text = val,
                    ).handleTap(),
                    enableInteractiveSelection: false,
                    onChanged: (val) =>
                        propertiesTextField.textEditingController.text = val,
                  );
                })
              : TextFormField(
                  controller: propertiesTextField.textEditingController,
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
                        color: LightModeTheme().primary,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colores.usuario.primary69,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: LightModeTheme().primary,
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
                    enabled: self.modificarDatos.value
                        ? isRequired
                        : self.modificarDatos.value,
                    filled: true,
                    suffixIcon: propertiesTextField.labelText == 'Código Postal'
                        ? self.apiCodigoPostal.obx(
                            (state) => state!
                                ? const Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : const Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                            onLoading: SizedBox(
                                width: 20,
                                child: ColorLoader(
                                  radius: 8,
                                  padding: const EdgeInsets.only(right: 1),
                                )),
                            onEmpty: const SizedBox.shrink())
                        : null,
                    fillColor: LightModeTheme().secondaryBackground,
                    contentPadding: const EdgeInsetsDirectional.fromSTEB(
                        16.0, 12.0, 16.0, 12.0),
                  ),
                  style: LightModeTheme().bodyMedium,
                  onChanged: (val) async {
                    if (propertiesTextField.labelText == 'Código Postal') {
                      self.existeCodigoPostal(val);
                    }
                  },
                )),
    );
  }

  Widget buildNick(
      {required BuildContext context,
      required PropertiesTextField propertiesTextField,
      String? Function(String?)? validator,
      EdgeInsetsGeometry? padding}) {
    return VibratingWidget(
      controller: propertiesTextField.anim,
      child: Padding(
          padding: padding ??
              const EdgeInsetsDirectional.fromSTEB(5.0, 10.0, 5.0, 0.0),
          child: TextFormField(
            controller: propertiesTextField.textEditingController,
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
                  color: LightModeTheme().primary,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colores.usuario.primary69,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: LightModeTheme().primary,
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
              fillColor: LightModeTheme().secondaryBackground,
              contentPadding:
                  const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
            ),
            enabled: false,
            style: LightModeTheme().bodyMedium,
          )),
    );
  }
}
