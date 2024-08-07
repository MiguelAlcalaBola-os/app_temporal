import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/app/ui/pages/eliminar_cuenta_page/eliminar_cuenta_c.dart';
import '../../../../../flutter_flow/flutter_flow_icon_button.dart';
import '../../../../../flutter_flow/flutter_flow_theme.dart';
import '../../../../../flutter_flow/flutter_flow_widgets.dart';

class AlertEliminarCuentaWidget extends GetView<EliminarCuentaController> {
  AlertEliminarCuentaWidget({super.key, required this.user});
  final int user;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    String email = '';
    if (user == 0) {
      email = controller.emailUsuarioController.text;
    } else {
      email = controller.emailProveedorController.text;
    }
    return Scaffold(
        key: scaffoldKey,
        backgroundColor: LightModeTheme().primaryBackground,
        appBar: AppBar(
          backgroundColor: LightModeTheme().primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 60,
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30,
            ),
            onPressed: Get.back,
          ),
          title: Text(
            'Eliminar Cuenta',
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              flex: 1,
                              child: Align(
                                alignment: const AlignmentDirectional(-1, -1),
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Text(
                                    'Lee esta información detenidamente. Es importante.',
                                    textAlign: TextAlign.start,
                                    style:
                                        LightModeTheme().displaySmall.override(
                                              fontFamily: 'Outfit',
                                              fontSize: 20,
                                            ),
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Align(
                                alignment: const AlignmentDirectional(-1, 0),
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: RichText(
                                    textScaler:
                                        MediaQuery.of(context).textScaler,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text:
                                              'Antes de eliminar Email de tu cuenta de Reservatupista, recuerda que si lo haces ya no podrás acceder a  Reservatupista ni en movil y en Web. ',
                                          style: LightModeTheme()
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color: LightModeTheme()
                                                    .primaryText,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                        TextSpan(
                                          text: email,
                                          style: TextStyle(
                                            color: LightModeTheme().primaryText,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      ],
                                      style:
                                          LightModeTheme().bodyMedium.override(
                                                fontFamily: 'Readex Pro',
                                                fontWeight: FontWeight.normal,
                                              ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(-1, 0),
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Text(
                                  'También puede que pierdas el acceso a servicios que no pertenezcan a Reservatupista en los que se use $email  ',
                                  textAlign: TextAlign.justify,
                                  style: LightModeTheme().bodyMedium,
                                ),
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(-1, 0),
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Text(
                                  'Al eliminar Email, se cerrará tu cuenta, se eliminará definitivamente todo su contenido y perderás el acceso a tu cuenta.',
                                  style: LightModeTheme().bodyMedium,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12),
                              child: RichText(
                                textScaler: MediaQuery.of(context).textScaler,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Se eliminarán todo',
                                      style: LightModeTheme()
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: LightModeTheme().primaryText,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                    TextSpan(
                                      text: '',
                                      style:
                                          LightModeTheme().bodyMedium.override(
                                                fontFamily: 'Readex Pro',
                                                fontSize: 17,
                                                fontWeight: FontWeight.w500,
                                              ),
                                    ),
                                    TextSpan(
                                      text: '',
                                      style:
                                          LightModeTheme().bodyMedium.override(
                                                fontFamily: 'Readex Pro',
                                                fontSize: 17,
                                                fontWeight: FontWeight.w500,
                                              ),
                                    )
                                  ],
                                  style: LightModeTheme().bodyMedium,
                                ),
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(-1, 0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    5, 8, 0, 8),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(-1, 0),
                                      child: Obx(() => Theme(
                                            data: ThemeData(
                                              checkboxTheme: CheckboxThemeData(
                                                visualDensity:
                                                    VisualDensity.compact,
                                                materialTapTargetSize:
                                                    MaterialTapTargetSize
                                                        .shrinkWrap,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                ),
                                              ),
                                              unselectedWidgetColor:
                                                  LightModeTheme()
                                                      .secondaryText,
                                            ),
                                            child: Checkbox(
                                              value: controller
                                                  .checkboxEliminarCuenta.value,
                                              onChanged: (newValue) async {
                                                controller
                                                    .checkboxEliminarCuenta
                                                    .toggle();
                                              },
                                              activeColor:
                                                  LightModeTheme().primary,
                                              checkColor: LightModeTheme().info,
                                            ),
                                          )),
                                    ),
                                    Expanded(
                                      child: Text(
                                        'Sí, quiero eliminar definitivamente $email de mi cuenta de Reservatupista.',
                                        style: LightModeTheme().bodyMedium,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12, 50, 0, 20),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 8, 0),
                                    child: Obx(() => FFButtonWidget(
                                          onPressed:
                                              !controller.checkboxEliminarCuenta
                                                      .value
                                                  ? null
                                                  : () async {
                                                      // Confirmación
                                                      await showDialog<bool>(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return AlertDialog(
                                                                title: const Text(
                                                                    '¿Está seguro?'),
                                                                content: const Text(
                                                                    'Esta acción es definitiva, proceda sólo si esta seguro de su decisión.'),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext,
                                                                            false),
                                                                    child: const Text(
                                                                        'Cancelar'),
                                                                  ),
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        controller
                                                                            .onEliminarUser(user),
                                                                    child: const Text(
                                                                        'Eliminar cuenta'),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          ) ??
                                                          false;
                                                    },
                                          text: 'Eliminar',
                                          options: FFButtonOptions(
                                            height: 40,
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(24, 0, 24, 0),
                                            iconPadding:
                                                const EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 0, 0),
                                            color: !controller
                                                    .checkboxEliminarCuenta
                                                    .value
                                                ? Colors.grey
                                                : LightModeTheme().primary,
                                            textStyle: LightModeTheme()
                                                .titleSmall
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: Colors.white,
                                                ),
                                            elevation: 3,
                                            borderSide: const BorderSide(
                                              color: Colors.transparent,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            hoverColor: const Color(0x944B39EF),
                                          ),
                                        )),
                                  ),
                                  FFButtonWidget(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    text: 'Cancelar',
                                    options: FFButtonOptions(
                                      height: 40,
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              24, 0, 24, 0),
                                      iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 0, 0, 0),
                                      color:
                                          LightModeTheme().secondaryBackground,
                                      textStyle:
                                          LightModeTheme().titleSmall.override(
                                                fontFamily: 'Readex Pro',
                                                color: LightModeTheme().primary,
                                              ),
                                      elevation: 0,
                                      borderSide: const BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
}
