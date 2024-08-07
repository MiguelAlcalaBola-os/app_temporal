import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_theme.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_util.dart';
import 'package:reservatu_pista/utils/btn_icon.dart';
import 'package:reservatu_pista/utils/loader/color_loader_3.dart';
import 'validar_email_c.dart';

class ValidarEmailPage extends GetView<ValidarEmailController> {
  ValidarEmailPage({super.key});
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        backgroundColor: LightModeTheme().primaryBackground,
        appBar: AppBar(
          backgroundColor: LightModeTheme().primary,
          automaticallyImplyLeading: false,
          title: Text(
            'Validar Email',
            style: LightModeTheme().headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 22,
                ),
          ),
          centerTitle: false,
          elevation: 2,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: const AlignmentDirectional(0, 0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 70, 0, 0),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 5,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(0),
                      ),
                    ),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 0.8,
                      height: 200,
                      constraints: BoxConstraints(
                        maxHeight: MediaQuery.sizeOf(context).height * 0.7,
                      ),
                      decoration: BoxDecoration(
                        color: LightModeTheme().secondaryBackground,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 4,
                            color: Color(0x33000000),
                            offset: Offset(0, 2),
                          )
                        ],
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0),
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(0),
                        ),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Text(
                                  'Estamos validadon su email...',
                                  style: LightModeTheme().displaySmall.override(
                                        fontFamily: 'Outfit',
                                        fontSize: 25,
                                      ),
                                ),
                              ),
                            ),
                            Obx(() => Visible(
                                isVisible: controller.loadingValidar.value,
                                child: ColorLoader3()))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Widget buildBtnAceptar(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
      child: BtnIcon(
        onPressed: controller.onValidarEmail,
        icon: Text(
          'Validar Email',
          style: LightModeTheme().titleSmall.override(
                fontFamily: 'Readex Pro',
                color: Colors.white,
              ),
        ),
        height: 40,
        padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
        fillColor: LightModeTheme().primary,
        borderRadius: 8.0,
        hoverColor: const Color(0x944B39EF),
      ),
    );
  }
}
