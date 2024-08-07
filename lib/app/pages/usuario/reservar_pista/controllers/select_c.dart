import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectController extends GetxController {
  final RxList<String> selects = RxList<String>([]);
  final RxList<bool> starts = RxList<bool>([]);

  Widget createSelect(String option) {
    final RxBool star = false.obs;
    return Row(
      children: [
        Text(option),
        Obx(() => InkWell(
            onTap: () => star.toggle(),
            splashColor: Colors.blueGrey,
            child: Icon(
              Icons.star,
              color: star.value ? Colors.yellow : Colors.black,
            ))),
      ],
    );
  }
}
