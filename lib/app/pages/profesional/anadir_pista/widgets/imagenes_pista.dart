import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/app/data/provider/datos_server.dart';
import 'package:reservatu_pista/app/pages/profesional/anadir_pista/anadir_pista_c.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_animations.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_theme.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_util.dart';
import 'package:reservatu_pista/utils/btn_icon.dart';
import 'package:reservatu_pista/utils/colores.dart';
import 'package:reservatu_pista/utils/loader/color_loader.dart';
import 'package:reservatu_pista/utils/state_getx/state_mixin_demo.dart';

class ImagenesPista extends GetView<AnadirPistaController> {
  const ImagenesPista({super.key});
  AnadirPistaController get self => controller;

  @override
  Widget build(BuildContext context) {
    return VibratingWidget(
      controller: self.imagenesPistaAnim,
      child: self.imagesPista.obx(buildSuccess, onLoading: buildLoading()),
    );
  }

  Widget buildLoading() => BtnIcon(
      borderRadius: 12,
      borderColor: Colores.proveedor.primary,
      hoverColor: Colores.proveedor.primary69,
      borderWidth: 2,
      height: 45,
      padding: const EdgeInsets.all(8.0),
      icon: ColorLoader());

  Widget buildSuccess(List<dynamic>? state) {
    return BtnIcon(
      borderRadius: 12,
      borderColor: self.imagesPista.action == 'validate'
          ? LightModeTheme().error
          : state!.isEmpty
              ? Colores.proveedor.primary
              : Colores.proveedor.primary160,
      hoverColor: Colores.proveedor.primary69,
      borderWidth: 2,
      height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      onPressed: self.pickImagesPista,
      icon: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Icon(
                Icons.add_a_photo_rounded,
                color: self.imagesPista.action == 'validate'
                    ? LightModeTheme().error
                    : Colores.proveedor.primary,
                size: 25.0,
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                child: Text(
                  state!.isEmpty ? 'Subir imagenes de la pista' : 'Fotos',
                  textAlign: TextAlign.center,
                  style: LightModeTheme().labelMedium,
                ),
              ),
            ],
          ),
          buildListaImagenes(state)
        ],
      ),
    );
  }

  Widget buildListaImagenes(List<dynamic>? state) {
    final generarListaImagenes = state!.map(_buildMostrarImagen).toList();
    return Visible(
        isVisible: state.isNotEmpty,
        child: Row(children: generarListaImagenes));
  }

  Widget _buildMostrarImagen(dynamic e) {
    if (e is File) {
      return buildBtnImagen(
          Image.file(e, width: 200, height: 400, fit: BoxFit.fitWidth),
          FileImage(e));
    }
    if (e is Uint8List) {
      return buildBtnImagen(
          Image.memory(e, width: 200, height: 400, fit: BoxFit.fitWidth),
          MemoryImage(e));
    }
    if (e is String) {
      final getImagePista = DatosServer.pista(e);
      return buildBtnImagen(
          Image.network(getImagePista,
              width: 200, height: 400, fit: BoxFit.fitWidth),
          NetworkImage(getImagePista));
    }
    return const SizedBox.shrink();
  }

  Widget buildBtnImagen(
          Widget imageDialog, ImageProvider<Object>? imageBackground) =>
      BtnIcon(
          onPressed: () {
            Get.dialog(GestureDetector(
                onTap: Get.back,
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [imageDialog])));
          },
          borderRadius: 30,
          padding: const EdgeInsets.all(0),
          fillColor: Colors.transparent,
          hoverColor: const Color.fromARGB(68, 255, 255, 255),
          icon: CircleAvatar(
            radius: 20,
            backgroundImage: imageBackground,
          ));
}
