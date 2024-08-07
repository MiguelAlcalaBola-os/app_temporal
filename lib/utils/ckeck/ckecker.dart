import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_theme.dart';

class Checker extends StatelessWidget {
  const Checker({super.key});

  @override
  Widget build(BuildContext context) {
    final selected = false.obs;
    return Obx(() {
      return Checkbox(
          side: const BorderSide(width: 2, color: Colors.black),
          activeColor: LightModeTheme().successGeneral,
          checkColor: Colors.black,
          value: selected.value,
          onChanged: (val) {
            selected.toggle();
          });
    });
  }
}
