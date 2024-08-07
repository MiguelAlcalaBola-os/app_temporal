import 'dart:io';

import 'package:flutter/material.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_theme.dart';
import 'package:reservatu_pista/utils/btn_icon.dart';
import 'package:reservatu_pista/utils/colores.dart';
import 'package:reservatu_pista/utils/server/image_server.dart';

class ImagenChipPista extends StatelessWidget {
  const ImagenChipPista(
      {super.key,
      required this.index,
      required this.imagen,
      this.imageFile,
      required this.onPressed,
      required this.isSelect});

  final int index;
  final String imagen;
  final dynamic Function()? onPressed;
  final bool isSelect;
  final File? imageFile;

  @override
  Widget build(BuildContext context) {
    const width = 100.0;
    const heightImage = 65.0;
    const heightNPista = 20.0;

    return Card(
      elevation: 5.0,
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: width,
                height: heightNPista,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      bottom: BorderSide(color: Color.fromARGB(255, 0, 0, 0))),
                ),
                child: Center(
                  child: Text(
                    'Pista ${(index + 1)}',
                    textAlign: TextAlign.center,
                    style: LightModeTheme().bodyMedium.copyWith(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontSize: 14),
                  ),
                ),
              ),
              Container(
                width: width,
                height: heightImage,
                // decoration: BoxDecoration(
                //     image: DecorationImage(
                //   image: NetworkImage(
                //     imagen,
                //   ),
                //   fit: BoxFit.fill,
                // )),
                child: Image.network(imagen,
                    errorBuilder: (context, error, stackTrace) =>
                        const SizedBox.shrink(),
                    fit: BoxFit.fill),
              ),
            ],
          ),
          BtnIcon(
              onPressed: onPressed,
              hoverColor: Colores.usuario.primary69,
              padding: const EdgeInsets.all(0),
              fillColor: Colors.transparent,
              borderWidth: isSelect ? 2 : 1,
              borderColor: isSelect
                  ? Colores.usuario.primary
                  : const Color.fromARGB(255, 0, 0, 0),
              borderRadius: 5,
              width: width,
              height: heightImage + heightNPista,
              icon: const SizedBox.shrink()),
        ],
      ),
    );
  }
}

class ImagenPistaEnReservas extends StatelessWidget {
  const ImagenPistaEnReservas({super.key, required this.image, this.imageFile});
  final File? imageFile;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          child: _buildImageSelect()),
    );
  }

  Widget _buildImageSelect() {
    if (imageFile is File) {
      return Image.file(
        imageFile!,
        width: 50,
        height: 50,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => const SizedBox.shrink(),
      );
    }

    return ImageProveedor(
      foto: image,
      width: 50,
      height: 50,
      fit: BoxFit.cover,
    );
  }
}
