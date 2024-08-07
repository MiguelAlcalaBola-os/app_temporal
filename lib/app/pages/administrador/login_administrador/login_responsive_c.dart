import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginResponsiveController extends GetxController {
  double heightAppBar = 100.0;
  @override
  void onInit() {
    super.onInit();
  }

  cargarResponsive(context) {
    // final height = MediaQuery.of(context).size.height;
    final height = 615;
    final width = MediaQuery.of(context).size.width;

    if (height <= 630) {
      heightAppBar = 80;
    }
  }
}
