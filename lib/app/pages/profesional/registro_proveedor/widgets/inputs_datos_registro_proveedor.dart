import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/app/widgets/text_inputters/inputter_registro.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_theme.dart';
import 'package:reservatu_pista/utils/animations/list_animations.dart';
import 'package:reservatu_pista/utils/btn_icon.dart';
import 'package:reservatu_pista/utils/ckeck/noticias_checkbox.dart';
import 'package:reservatu_pista/utils/colores.dart';
import 'package:reservatu_pista/utils/dialog/terminos_condiciones_dialog.dart';
import 'package:reservatu_pista/utils/loader/color_loader.dart';
import 'package:reservatu_pista/utils/state_getx/state_mixin_demo.dart';
import '../registrar_proveedor_c.dart';
import 'build_input.dart';
import 'codigo_iban.dart';

class InputsDatosRegistroProveedor
    extends GetView<RegistrarProveedorController> {
  const InputsDatosRegistroProveedor({super.key});
  // Llamar el controlador
  RegistrarProveedorController get self => controller;
  // Definimos la animacion que viene directamente del controllador
  AnimationController get anim => animVibrate(vsync: self);

  /// Contruir la lista de inputs
  List<Widget> buildListDatosFacturacion() {
    return [
      BuildInput(
          labelText: 'Tipo',
          textEditingController: self.tc.tipo,
          anim: anim,
          maxLength: 20,
          isSelect: true,
          listSelect: const [
            'Club',
            'Ayuntamiento',
            'Comunidad',
            'Asociación'
          ]),
      BuildInput(
          labelText: 'CIF/NIF',
          textEditingController: self.tc.cifNif,
          anim: anim,
          maxLength: 9,
          onValidate: (val) => val!.length < 9 ? '' : null,
          inputFormatters: [SinEspaciosInputFormatter(), CIFNIFFormatter()]),
      BuildInput(
        labelText: 'Dirección Fiscal',
        textEditingController: self.tc.direccionFiscal,
        anim: anim,
        maxLength: 50,
        isRequired: false,
        onValidate: (val) => val!.length < 4 ? '' : null,
      ),
      BuildInput(
          labelText: 'Código Postal',
          textEditingController: self.tc.codigoPostalFiscal,
          anim: anim,
          maxLength: 5,
          keyboardType: TextInputType.number,
          isRequired: false,
          suffixIcon: self.apiCodigoPostalFiscal.obx(
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
              onEmpty: const SizedBox.shrink()),
          onChanged: (val) async {
            self.existeCodigoPostalFiscal(val);
          },
          onValidate: (val) => val!.length < 5 ? '' : null,
          inputFormatters: [SinEspaciosInputFormatter(), SoloNumeros()]),
      BuildInput(
        labelText: 'Localidad',
        textEditingController: self.tc.localidadFiscal,
        anim: anim,
        enabled: false,
        isRequired: false,
        maxLength: 50,
      ),
      BuildInput(
        labelText: 'Provincia',
        textEditingController: self.tc.provinciaFiscal,
        anim: anim,
        enabled: false,
        isRequired: false,
        maxLength: 50,
      ),
      BuildInput(
        labelText: 'Comunidad',
        textEditingController: self.tc.comunidadFiscal,
        anim: anim,
        enabled: false,
        isRequired: false,
        maxLength: 50,
      ),
    ];
  }

  /// Construir la lista de datos de ubicacion
  List<Widget> buildListDatosPago() {
    return [
      const Padding(
        padding: EdgeInsetsDirectional.fromSTEB(5.0, 10.0, 5.0, 0.0),
        child: CodigoIban(),
      ),
      BuildInput(
        labelText: 'Certificado de Cuenta',
        textEditingController: self.imageCertificado.controller,
        anim: anim,
        maxLength: 20,
        isRequired: false,
        prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Icon(Icons.edit_square,
                color: Colores.proveedor.primary, size: 40)),
        suffixIcon: Obx(buildImageCertificado),
        enableInteractiveSelection: false,
        onTap: () => self.imageCertificado.dialogSeleccionarImage(Get.context!),
      ),
    ];
  }

  /// Construir la imagen del certificado
  Widget buildImageCertificado() {
    return self.imageCertificado.existeImagen()
        ? BtnIcon(
            onPressed: () {
              Get.dialog(
                GestureDetector(
                  onTap: Get.back,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: self.imageCertificado.widgetImage(
                      width: 250.0,
                      fit: BoxFit.fitWidth,
                    ),
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
              backgroundImage: self.imageCertificado.widgetBackgroundImage(),
            ))
        : const SizedBox.shrink();
  }

  /// Construir la lista de datos del juego
  List<Widget> buildListDatosContacto() {
    return [
      BuildInput(
          labelText: 'Nombre',
          textEditingController: self.tc.nombre,
          anim: anim,
          maxLength: 40,
          onValidate: (val) => val!.length < 3 ? '' : null,
          inputFormatters: [SoloLetras()]),
      BuildInput(
          labelText: 'Apellidos',
          textEditingController: self.tc.apellidos,
          anim: anim,
          maxLength: 40,
          onValidate: (val) => val!.length < 3 ? '' : null,
          inputFormatters: [SoloLetras()]),
      BuildInput(
          labelText: 'Fijo',
          textEditingController: self.tc.fijo,
          anim: anim,
          isRequired: false,
          keyboardType: TextInputType.number,
          maxLength: 9,
          onValidate: (val) => val!.length < 9 ? '' : null,
          inputFormatters: [SoloNumeros()]),
      Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(5.0, 12.0, 5.0, 0.0),
        child: Row(
          children: [
            SizedBox(
              width: 80,
              child: BuildInput(
                labelText: '',
                textEditingController: self.tc.lada,
                isSelect: true,
                padding: const EdgeInsets.all(0),
                listSelect: const [
                  '🇪🇸 +34',
                  '🇵🇹 +351',
                  '🇲🇫 +33',
                  '🇲🇽 +52'
                ],
                anim: anim,
                maxLength: 8,
              ),
            ),
            Flexible(
              child: BuildInput(
                  labelText: 'Telefono',
                  textEditingController: self.tc.telefono,
                  anim: anim,
                  keyboardType: TextInputType.number,
                  padding: const EdgeInsets.all(0),
                  maxLength: 9,
                  onValidate: (val) => val!.length < 9 ? '' : null,
                  inputFormatters: [SoloNumeros()]),
            )
          ],
        ),
      ),
      BuildInput(
          labelText: 'Email',
          textEditingController: self.tc.email,
          anim: anim,
          maxLength: 40,
          keyboardType: TextInputType.emailAddress,
          inputFormatters: [SinEspaciosInputFormatter()],
          onValidate: (val) {
            // Utilizar una expresión regular para validar el formato de correo electrónico
            if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
                .hasMatch(val!)) {
              return '';
            }
            return null;
          }),
    ];
  }

  /// Construir la lista de datos de ubicacion
  List<Widget> buildListDatosUbicacion() {
    return [
      BuildInput(
        labelText: 'Nombre Club',
        textEditingController: self.tc.nombreComercial,
        anim: anim,
        maxLength: 40,
        onValidate: (val) => val!.length < 3 ? '' : null,
      ),
      BuildInput(
        labelText: 'Dirección',
        textEditingController: self.tc.direccion,
        anim: anim,
        maxLength: 40,
        isRequired: false,
        onValidate: (val) => val!.length < 4 ? '' : null,
      ),
      BuildInput(
          labelText: 'Código Postal',
          textEditingController: self.tc.codigoPostal,
          anim: anim,
          maxLength: 5,
          keyboardType: TextInputType.number,
          isFocusNode: true,
          suffixIcon: self.apiCodigoPostal.obx(
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
              onEmpty: const SizedBox.shrink()),
          onValidate: (val) => val!.length < 5 ? '' : null,
          onChanged: (val) => self.existeCodigoPostal(val),
          inputFormatters: [SinEspaciosInputFormatter(), SoloNumeros()]),
      BuildInput(
        labelText: 'Localidad',
        textEditingController: self.tc.localidad,
        anim: anim,
        enabled: false,
        isRequired: false,
        maxLength: 40,
      ),
      BuildInput(
        labelText: 'Provincia',
        textEditingController: self.tc.provincia,
        anim: anim,
        enabled: false,
        isRequired: false,
        maxLength: 30,
      ),
      BuildInput(
        labelText: 'Comunidad',
        textEditingController: self.tc.comunidad,
        anim: anim,
        enabled: false,
        isRequired: false,
        maxLength: 50,
      ),
    ];
  }

  /// Contruir los inputs de contrasena
  List<Widget> buildListContrasena() {
    final animContrasena = anim;
    final animContrasenaComprobar = anim;
    return [
      buildContrasena(
          anim: animContrasena,
          labelText: 'Contraseña',
          textEditingController: self.tc.contrasena,
          visibility: self.contrasenaVisibility,
          validator: self.validateTextFieldContrasena),
      buildContrasena(
          anim: animContrasenaComprobar,
          labelText: 'Comprobar Contraseña',
          textEditingController: self.tc.contrasenaComprobar,
          visibility: self.comprobarContrasenaVisibility,
          validator: self.validateTextFieldContrasenaComprobar),
    ];
  }

  /// Construir el input contrasena
  Widget buildContrasena(
      {required String labelText,
      required AnimationController anim,
      required RxBool visibility,
      required TextEditingController textEditingController,
      required String? Function(AnimationController, FocusNode) validator}) {
    return Obx(() => BuildInput(
        labelText: labelText,
        anim: anim,
        maxLength: 15,
        errorStyle: const TextStyle(fontSize: 12),
        obscureText: !visibility.value,
        textEditingController: textEditingController,
        prefixIcon: Icon(
          visibility.value ? Icons.lock_open : Icons.lock,
        ),
        prefixIconColor: Colores.proveedor.primary,
        suffixIcon: InkWell(
          onTap: () => visibility.toggle(),
          child: Icon(
            visibility.value
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
            color: Colores.proveedor.primary,
            size: 22,
          ),
        ),
        validator: (val) => validator(anim, FocusNode())));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildSubtitle('Datos de facturación'),
        ...buildListDatosFacturacion(),
        buildSubtitle('Datos de pago/cobro'),
        ...buildListDatosPago(),
        buildSubtitle('Datos de contacto'),
        ...buildListDatosContacto(),
        buildSubtitle('Datos ubicación'),
        ...buildListDatosUbicacion(),
        buildSubtitle('Datos de contraseña'),
        ...buildListContrasena(),
        TerminosCondicionesDialog(
          self.animTerminos,
          Colores.proveedor.primary,
          Colors.white,
          paddingTop: 10.0,
        ),
        NoticiasCheckbox(
          onChanged: (val) {
            self.noticia = val!;
          },
          animTerminos: anim,
          focusedColor: Colores.proveedor.primary,
          palomita: Colors.white,
          paddingTop: 5.0,
        ),
      ],
    );
  }

  Widget buildSubtitle(String title) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 0.0, 0.0),
      child: Text(
        title,
        style: LightModeTheme().labelLarge.copyWith(color: Colors.black),
      ),
    );
  }
}
