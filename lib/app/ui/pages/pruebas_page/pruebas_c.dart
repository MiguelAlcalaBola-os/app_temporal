import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/utils/image/funciones_image.dart';

class PruebasController extends GetxController {
  final imageElegir = FuncionesImage(isProveedor: true);

  final pageViewController = PageController(
      initialPage: Get.arguments == null ? 0 : Get.arguments as int);
}
