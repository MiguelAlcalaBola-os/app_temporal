import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reservatu_pista/utils/btn_icon.dart';
import '../../../../utils/animations/add_animation_widget.dart';
import '../../../backend/schema/enums/tipo_imagen.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import '../../../../utils/sizer.dart';

class EditarImagen extends StatelessWidget {
  const EditarImagen(
      {super.key, required this.onPressed, this.isProveedor = false});
  final void Function(String?, TipoImagen) onPressed;
  final bool isProveedor;
  @override
  Widget build(BuildContext context) {
    final listaIcons = [
      [
        'icon_sport_padel',
        'icon_sport_sports_women',
        'icon_sport_sports_men',
      ],
      [
        'icon_sport_baseball',
        'icon_sport_basketball',
        'icon_sport_football',
      ],
      [
        'icon_sport_rugby',
        'icon_sport_sports_bottle',
        'icon_sport_swimming',
      ],
      [
        'icon_sport_table_tennis',
        'icon_sport_tennis',
        'icon_sport_trophy',
      ],
      ['icon_sport_wistle', '', '']
    ];
    Widget buildListIcons() {
      return SingleChildScrollView(
        child: Column(
            children: List.generate(
          listaIcons.length,
          (i) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (j) => listaIcons[i][j] == ''
                    ? const SizedBox()
                    : BtnIcon(
                        onPressed: () =>
                            onPressed(listaIcons[i][j], TipoImagen.asset),
                        padding: const EdgeInsets.all(0),
                        borderColor: const Color.fromARGB(255, 226, 6, 255),
                        borderWidth: 3,
                        borderRadius: 30,
                        hoverColor: const Color.fromARGB(255, 226, 6, 255),
                        icon: Image.asset(
                            'assets/images/${listaIcons[i][j]}.png',
                            height: 30.w,
                            width: 30.w),
                      ),
              ).divide(5.0.sw)),
        ).divide(10.0.sh)),
      );
    }

    return SizedBox(
      height: 100.h,
      width: Get.width,
      child: Center(
        child: AddAnimationWidget(
          height: isProveedor ? 350 : 50.h,
          child: Container(
            width: 100.w,
            height: isProveedor ? 350 : 100.h,
            decoration: BoxDecoration(
              color: LightModeTheme().secondaryBackground,
              boxShadow: const [
                BoxShadow(
                  blurRadius: 5,
                  color: Color(0x3B1D2429),
                  offset: Offset(0, -3),
                )
              ],
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0),
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Elige la foto',
                    style: LightModeTheme()
                        .titleLarge
                        .copyWith(decoration: TextDecoration.none),
                  ),
                  5.0.sh,
                  isProveedor ? 0.0.sh : buildListIcons(),
                  buildBtnsImage(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<String?> cargarImagen(ImageSource source) async {
    try {
      final pickedFile = await ImagePicker().pickImage(source: source);
      if (pickedFile != null) {
        return pickedFile.path;
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Widget buildBtnsImage(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          isWeb
              ? const SizedBox.shrink()
              : Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                  child: FFButtonWidget(
                    onPressed: () async => onPressed(
                        await cargarImagen(ImageSource.camera),
                        TipoImagen.file),
                    text: 'Camara',
                    icon: const Icon(
                      Icons.camera_alt,
                      size: 25,
                    ),
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 60,
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      color: LightModeTheme().primaryBackground,
                      textStyle: LightModeTheme().bodyLarge,
                      elevation: 2,
                      splashColor: const Color.fromARGB(65, 0, 0, 0),
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                    ),
                  ),
                ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
            child: FFButtonWidget(
              onPressed: () async => onPressed(
                  await cargarImagen(ImageSource.gallery), TipoImagen.file),
              text: 'Galería',
              icon: const Icon(
                Icons.collections,
                size: 25,
              ),
              options: FFButtonOptions(
                width: double.infinity,
                height: 60,
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                color: LightModeTheme().primaryBackground,
                textStyle: LightModeTheme().bodyLarge,
                elevation: 2,
                splashColor: const Color.fromARGB(65, 0, 0, 0),
                borderSide: const BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
            child: FFButtonWidget(
              onPressed: () async {
                Navigator.pop(context);
              },
              text: 'Cancel',
              options: FFButtonOptions(
                width: double.infinity,
                height: 60,
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                color: LightModeTheme().errorGeneral,
                textStyle: LightModeTheme().titleSmall.override(
                      fontFamily: 'Lexend Deca',
                      color: LightModeTheme().primaryText,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                elevation: 0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
