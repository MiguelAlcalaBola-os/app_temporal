import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/app/data/provider/datos_server.dart';
import 'package:reservatu_pista/app/data/services/db_s.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageServer extends StatelessWidget {
  ImageServer({
    super.key,
    this.width = 100,
    this.height = 100,
    this.fit = BoxFit.cover,
  });
  final double? width;
  final double? height;
  final BoxFit? fit;
  final DBService db = Get.find();
  final _imageInfo = Rxn<ImageInfo>();

  @override
  Widget build(BuildContext context) {
    print("--dsjn");
    if (isWeb) {
      return buildSizeImage(200, 200);
    }
    final ImageStream newStream = Image.network(
      db.fotoServer, // Reemplaza con la URL de tu imagen
    ).image.resolve(ImageConfiguration.empty);

    newStream.addListener(ImageStreamListener((info, _) {
      _imageInfo.value = info;
    }));
    return Obx(() => Visible(
          isVisible: db.fotoServer != '' && _imageInfo.value != null,
          child: mostrarImage(),
        ));
  }

  Widget mostrarImage() {
    if (_imageInfo.value != null) {
      if (_imageInfo.value!.image.width < 200) {
        return buildSizeImage(200, 200);
      } else {
        return buildSizeImage(width, height);
      }
    }
    return const SizedBox.shrink();
  }

  Widget buildSizeImage(double? width, double? height) {
    return CachedNetworkImage(
      imageUrl: db.fotoServer,
      width: width,
      height: height,
      fit: fit,
      placeholder: (context, url) => const CircularProgressIndicator(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}

class ImageProveedor extends StatelessWidget {
  const ImageProveedor({
    super.key,
    this.width = 100,
    this.height = 100,
    this.fit = BoxFit.cover,
    required this.foto,
  });
  final double? width;
  final double? height;
  final BoxFit? fit;
  final String foto;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: DatosServer.proveedor(foto),
      width: width,
      height: height,
      fit: fit,
      placeholder: (context, url) => const CircularProgressIndicator(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
