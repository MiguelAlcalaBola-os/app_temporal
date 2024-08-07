import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image/image.dart' as img;
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:reservatu_pista/app/data/provider/image_node.dart';
import 'package:reservatu_pista/utils/colores.dart';
import 'package:reservatu_pista/utils/dialog/message_server_dialog.dart';
import 'package:reservatu_pista/utils/image/seleccionar_imagen_dialog.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_util.dart';

class FuncionesImage {
  FuncionesImage({this.isProveedor = false});
  // Guardar imagen del usuario
  final imageFile = Rxn<String>();
  // Obtener imagen en Web
  final imageBytes = Rxn<Uint8List>();
  // Obtener la imagen de los assets ya estan en el servidor
  final imageAsset = Rxn<String>();
  // Controllador para ver el cambio de estado de la imagen
  final controller = TextEditingController();
  // Las imagenes son del proveedor
  final bool isProveedor;
  // Obtener la imagen del servidor
  final imageNetwork = Rxn<String>();
  // Verificar si la imagen se modifico
  bool isImagenModificada = false;

  /// Reducir imagen
  Future<File> imageResize(String path) async {
    // Imagen decoded
    img.Image image = img.decodeImage(File(path).readAsBytesSync())!;
    // Reducir la calidad de la imagen (ajusta el valor 70 según tus necesidades)
    // img.Image compressedImage = img.copyResize(
    //   image,
    // );
    // Regresar la imagen comprimida
    // return File(path)
    //   ..writeAsBytesSync(img.encodeJpg(compressedImage, quality: 80));
    return File(path)..writeAsBytesSync(img.encodeJpg(image, quality: 80));
  }

  /// Reducir imagen en bytes
  Future<Uint8List> imageResizeBytes(Uint8List imageData) async {
    // Decodificar la imagen desde Uint8List
    img.Image image = img.decodeImage(imageData)!;

    // Reducir la calidad de la imagen (ajusta el valor 70 según tus necesidades)
    // img.Image compressedImage = img.copyResize(
    //   image,
    // );

    // Codificar la imagen como Uint8List
    Uint8List compressedImageData =
        Uint8List.fromList(img.encodeJpg(image, quality: 80));

    // Devolver la imagen comprimida
    return compressedImageData;
  }

  /// Guardar el asset en el servidor
  Future<File> copiarAssetAFile(String path) async {
    try {
      // Especifica el path relativo del activo
      String pathAsset = 'assets/images/$path.png';
      // Obtiene el contenido del activo como bytes
      List<int> bytes = await rootBundle
          .load(pathAsset)
          .then((byteData) => byteData.buffer.asUint8List());
      // Obtiene el directorio temporal del sistema
      Directory tempDir = await getTemporaryDirectory();
      // Crea un archivo temporal con el contenido del activo
      File tempFile = File('${tempDir.path}/image_asset.png');
      return await tempFile.writeAsBytes(bytes);
    } catch (error) {
      throw ('Error al copiar el activo a un archivo: $error');
    }
  }

  Future<bool> convertirSubirImagen(String destination, String nameFoto) async {
    if (imageBytes.value != null) {
      // Subir Imagen en nodejs y reducir su tamano en bytes
      return ImageNodeProvider.subirImageBytes(
          await imageResizeBytes(imageBytes.value!),
          destination: destination,
          nameFoto: nameFoto);
    } else if (imageFile.value != null) {
      if (imageFile.value![0] == '@') {
        // Selecciono un asset ya guardado
        return true;
      } else {
        // Subir Imagen en nodejs y reducir su tamano
        return await ImageNodeProvider.subirImageFile(
            await imageResize(imageFile.value!),
            destination: destination,
            nameFoto: nameFoto);
      }
    }
    return false;
  }

  Future<String> subirMultiplesImagenes(
      String destination, String nameFoto, List<dynamic> imagenesPista) async {
    String nombreImagePista = '';
    // Subir imagenes de las fotos de la pista
    for (var i = 0; i < imagenesPista.length; i++) {
      final nombrePista = '${nameFoto}_pi$i';
      if (i != 0) {
        nombreImagePista += ', ';
      }
      nombreImagePista += nombrePista;
      if (isWeb) {
        await ImageNodeProvider.subirImageBytes(imagenesPista[i],
            destination: destination, nameFoto: nombrePista);
      } else {
        await ImageNodeProvider.subirImageFile(imagenesPista[i],
            destination: destination, nameFoto: nombrePista);
      }
    }
    return nombreImagePista;
  }

  Future<void> pickImage(ImageSource source, {String? path}) async {
    try {
      if (path != null) {
        imageAsset.value = path;
        imageFile.value = '@$path';
      } else {
        final pickedFile = await ImagePicker().pickImage(source: source);
        if (pickedFile != null) {
          isImagenModificada = true;
          if (isWeb) {
            imageBytes.value = await pickedFile.readAsBytes();
          } else {
            imageFile.value = pickedFile.path;
          }
        }
      }
    } catch (e) {
      return MessageServerDialog(
              context: Get.context!,
              alertType: error,
              title: 'Imagen',
              subtitle: '$e',
              onPressed: Get.back)
          .dialog();
    }
    Get.back();
  }

  Widget getImageWidget() {
    if (imageBytes.value != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(60),
        child: Image.memory(
          imageBytes.value!,
          width: 100.0,
          height: 100.0,
          fit: BoxFit.cover,
        ),
      );
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(60),
      child: getImageOrAsset(imageFile.value,
          isRegristro: true, isProveedor: isProveedor),
    );
  }

  Widget getImageOrAsset(String? nameFile,
      {bool isRegristro = false,
      bool isProveedor = false,
      double? width,
      double? height,
      IconData? icon}) {
    if (isRegristro) {
      return nameFile != null
          ? nameFile[0] == '@'
              ? Image.asset(
                  'assets/images/${nameFile.substring(1, nameFile.length)}.png',
                  width: width ?? 100.0,
                  height: height ?? 100.0,
                  fit: BoxFit.cover,
                )
              : Image.file(
                  File(nameFile),
                  width: width ?? 100.0,
                  height: height ?? 100.0,
                  fit: BoxFit.cover,
                )
          : Icon(icon ?? Icons.edit_square,
              color: isProveedor
                  ? Colores.proveedor.primary
                  : Colores.usuario.primary,
              size: 40);
    } else {
      return nameFile != null
          ? nameFile[0] == '@'
              ? Image.asset(
                  'assets/images/${nameFile.substring(1, nameFile.length)}.png',
                  width: width ?? 100.0,
                  height: height ?? 100.0,
                  fit: BoxFit.cover,
                )
              : Image.file(
                  File(nameFile),
                  width: width ?? 100.0,
                  height: height ?? 100.0,
                  fit: BoxFit.cover,
                )
          : Image.asset(
              isProveedor
                  ? 'assets/images/logo_reservatupista.png'
                  : 'assets/images/foto_avatar.png',
              width: width ?? 100.0,
              height: height ?? 100.0,
              fit: BoxFit.cover,
            );
    }
  }

  /// Mostrar la seleccion de la imagen
  void dialogSeleccionarImage(BuildContext context) => SeleccionarImagenDialog(
          context: context, pickImage: pickImage, isProveedor: isProveedor)
      .dialog();

  /// Validator para TextEditingController
  String? validatorImage(String? val) {
    print(imageFile.value);
    print(imageBytes.value);
    return imageFile.value != null || imageBytes.value != null ? null : '';
  }

  /// Existe imagen
  bool existeImagen() {
    return imageFile.value != null ||
        imageBytes.value != null ||
        imageNetwork.value != null;
  }

  /// Widget para mostrar la imagen en file o en bytes
  Widget widgetImage({
    final double? width,
    final double? height,
    final BoxFit? fit,
  }) {
    if (imageFile.value != null) {
      return Image.file(File(imageFile.value!),
          height: height, width: width, fit: fit);
    }
    if (imageBytes.value != null) {
      return Image.memory(imageBytes.value!,
          height: height, width: width, fit: fit);
    }
    if (imageNetwork.value != null) {
      return Image.network(imageNetwork.value!,
          height: height, width: width, fit: fit);
    }
    return const SizedBox.shrink();
  }

  /// Widget para mostrar la imagen en file o en bytes
  ImageProvider<Object>? widgetBackgroundImage() {
    if (imageFile.value != null) {
      return FileImage(
        File(imageFile.value!),
      );
    }
    if (imageBytes.value != null) {
      return MemoryImage(imageBytes.value!);
    }
    if (imageNetwork.value != null) {
      return NetworkImage(imageNetwork.value!);
    }
    return null;
  }
}
