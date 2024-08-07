import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/utils/auto_size_text/auto_size_text.dart';
import 'package:reservatu_pista/utils/colores.dart';
import 'package:reservatu_pista/utils/responsive_web.dart';
import 'package:reservatu_pista/utils/sizer.dart';
import '../../../../flutter_flow/flutter_flow_animations.dart';
import '../../../../utils/btn_icon.dart';
import '../../../../utils/dialog/terminos_condiciones_dialog.dart';
import '../../../routes/app_pages.dart';
import 'login_administrador_c.dart';
import '../../../../components/navbar_login.dart';
import '/components/app_bar_login_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/services.dart';

class LoginAdministradorPage extends GetView<LoginAdministradorController> {
  LoginAdministradorPage({super.key});
  LoginAdministradorController get self => controller;
  final Color colorProfesional = const Color(0xFF46EF98);
  final Color colorUsuario = const Color(0xFF2B78DC);
  bool movilPequeno = false;
  late bool isMin;

  @override
  Widget build(BuildContext context) {
    isMin = context.h < 655.0;
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          // systemStatusBarContrastEnforced: true,
        ),
      );
    }
    const lineColorUsuario = Colores.rojo;
    const focusedColorUsuario = Colores.rojo;
    // Declarar si el movil es pequeno
    final height = MediaQuery.sizeOf(context).height;
    movilPequeno = height <= 688;

    return Scaffold(
      backgroundColor: LightModeTheme().primaryText,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        top: true,
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          height: height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [LightModeTheme().tertiary, LightModeTheme().accent4],
              stops: const [0, 1],
              begin: const AlignmentDirectional(0, -1),
              end: const AlignmentDirectional(0, 1),
            ),
          ),
          child: ResponsiveWeb(
            child: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0, 0),
                      child: AppBarLoginWidget(
                        movilPequeno: movilPequeno,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: lineColorUsuario,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Color.fromARGB(255, 45, 53, 66),
                            width: 1,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.admin_panel_settings,
                              color: Colors.white,
                              size: 30,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              'Administrador',
                              style: LightModeTheme().bodyMedium.override(
                                    fontFamily: 'Outfit',
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 450,
                      child: buildInputsLogin(
                          context,
                          formKey: self.formKey,
                          self.emailController,
                          self.passwordController,
                          self.emailFocusNode,
                          self.passwordFocusNode,
                          self.passwordVisibility,
                          'Usuario',
                          'Administrador',
                          self.checkboxValueRecordar,
                          Routes.INICIO,
                          Routes.REGISTRAR_USUARIO,
                          self.animTerminos,
                          lineColor: lineColorUsuario,
                          focusedColor: focusedColorUsuario,
                          typeUser: 0,
                          palomita: Colors.white,
                          onPressed: self.onPressedAdministrador,
                          isProveedor: false),
                    ),
                  ],
                ),
                NavBarLogin(
                  isMin: isMin,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildInputsLogin(
      BuildContext context,
      TextEditingController email,
      TextEditingController contrasena,
      FocusNode emailFocus,
      FocusNode contrasenaFocus,
      RxBool passwordVisibility,
      String title,
      String subtitle,
      RxBool checkboxRecordar,
      String accederPage,
      String registroPage,
      AnimationController animTerminos,
      {required Color lineColor,
      required Color focusedColor,
      required Color palomita,
      required int typeUser,
      required dynamic Function()? onPressed,
      required Key formKey,
      required isProveedor}) {
    final fontSize = context.w < 355 ? 12.0 : 16.0;
    return Form(
      key: formKey,
      child: Column(
        children: [
          FittedBox(
            child: AutoSizeText(
              subtitle,
              textAlign: TextAlign.center,
              style: LightModeTheme().bodyMedium.override(
                    fontFamily: 'Readex Pro',
                    fontSize: 12,
                  ),
              minFontSize: 10,
            ),
          ),
          isMin ? 0.0.sh : 5.0.sh,
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(
                20, movilPequeno ? 5 : 10, 20, 0),
            child: VibratingWidget(
              controller: self.anim,
              child: TextFormField(
                controller: email,
                focusNode: emailFocus,
                obscureText: false,
                maxLength: 40,
                decoration: InputDecoration(
                  counterText: '',
                  errorStyle: const TextStyle(
                      fontSize: 0, decoration: TextDecoration.none),
                  labelText: 'Email',
                  hintText: 'Ingresa tu email aquí...',
                  hintStyle: LightModeTheme().bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        color: const Color(0xFF95A1AC),
                      ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: lineColor,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: focusedColor,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: LightModeTheme().error,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: LightModeTheme().error,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: LightModeTheme().secondaryBackground,
                  contentPadding:
                      const EdgeInsetsDirectional.fromSTEB(16, 24, 0, 24),
                  prefixIcon: const Icon(
                    Icons.person,
                  ),
                  prefixIconColor: focusedColor,
                ),
                inputFormatters: const [
                  // FilterEmailTextInputFormatter(),
                  // FilteringTextInputFormatter.deny(RegExp('[^a-zA-Z0-9@.]')),
                ],
                style: LightModeTheme().bodyMedium,
                onChanged: self.onChangeTextField,
                validator: (val) {
                  return self.validateTextField(val, self.anim);
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(
                20, movilPequeno ? 10 : 16, 20, 0),
            child: Obx(() => VibratingWidget(
                  controller: self.animContrasena,
                  child: TextFormField(
                    controller: contrasena,
                    focusNode: contrasenaFocus,
                    maxLength: 15,
                    obscureText: !passwordVisibility.value,
                    decoration: InputDecoration(
                      counterText: '',
                      labelText: 'Contraseña',
                      hintText: 'Ingresa tu contraseña aqui...',
                      hintStyle: LightModeTheme().bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            color: const Color(0xFF95A1AC),
                          ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: lineColor,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: focusedColor,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: LightModeTheme().error,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: LightModeTheme().error,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                      fillColor: LightModeTheme().secondaryBackground,
                      contentPadding:
                          const EdgeInsetsDirectional.fromSTEB(16, 24, 0, 24),
                      prefixIcon: Icon(
                        passwordVisibility.value ? Icons.lock_open : Icons.lock,
                      ),
                      prefixIconColor: focusedColor,
                      suffixIcon: InkWell(
                        onTap: () => passwordVisibility.value =
                            !passwordVisibility.value,
                        focusNode: FocusNode(skipTraversal: true),
                        child: Icon(
                          passwordVisibility.value
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: const Color(0xFF95A1AC),
                          size: 22,
                        ),
                      ),
                    ),
                    style: LightModeTheme().bodyMedium,
                    onChanged: self.onChangeTextField,
                    validator: (val) =>
                        self.validateTextField(val, self.animContrasena),
                  ),
                )),
          ),
          Padding(
            padding: isMin
                ? EdgeInsets.zero
                : EdgeInsetsDirectional.fromSTEB(
                    5, movilPequeno ? 0 : 5, movilPequeno ? 0 : 5, 10),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Theme(
                      data: ThemeData(
                        checkboxTheme: CheckboxThemeData(
                          visualDensity: VisualDensity.compact,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        unselectedWidgetColor: LightModeTheme().secondaryText,
                      ),
                      child: Obx(() => Checkbox(
                            value: checkboxRecordar.value,
                            onChanged: (newValue) async {
                              checkboxRecordar.value = newValue!;
                            },
                            activeColor: focusedColor,
                            checkColor: palomita,
                          )),
                    ),
                    10.0.sw,
                    Text(
                      'Recordar contraseña',
                      style: LightModeTheme()
                          .bodyMedium
                          .copyWith(fontSize: fontSize),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: BtnIcon(
                    onPressed: () async {
                      Get.toNamed(Routes.OLVIDE_CONTRASENA,
                          parameters: {'tipo_usuario': typeUser.toString()});
                    },
                    borderRadius: 12,
                    icon: Text(
                      '¿Has olvidado\nla contraseña?',
                      style: LightModeTheme().bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          color: LightModeTheme().primary,
                          fontSize: fontSize),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: isMin
                ? const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0)
                : const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 5),
            child: FFButtonWidget(
              onPressed: onPressed,
              text: 'Acceder',
              options: FFButtonOptions(
                height: 40,
                width: 200,
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                color: focusedColor,
                textStyle: LightModeTheme().bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      color: LightModeTheme().tertiary,
                    ),
                elevation: 2,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          TerminosCondicionesDialog(
            animTerminos,
            focusedColor,
            palomita,
            paddingTop: isMin ? 5.0 : (movilPequeno ? 10 : 20),
          ),
          const SizedBox(
            height: 5.0,
          ),
          FFButtonWidget(
            onPressed: () => Get.offAllNamed(Routes.LOGIN_USUARIO),
            text: 'Regresar',
            options: FFButtonOptions(
              height: 40,
              width: 200,
              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
              iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
              color: focusedColor,
              textStyle: LightModeTheme().bodyMedium.override(
                    fontFamily: 'Readex Pro',
                    color: LightModeTheme().tertiary,
                  ),
              elevation: 2,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Divider(
            height: 2,
            thickness: 2,
            indent: 20,
            endIndent: 20,
            color: LightModeTheme().lineColor,
          ),
        ],
      ),
    );
  }
}
