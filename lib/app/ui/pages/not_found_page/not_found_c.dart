import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotFoundController extends GetxController
    with GetTickerProviderStateMixin {
  late AnimationController anim;
  final RelativeRectTween relativeRectTween = RelativeRectTween(
    begin: const RelativeRect.fromLTRB(24, 24, 24, 200),
    end: const RelativeRect.fromLTRB(24, 24, 24, 280),
  );
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    anim =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..repeat(reverse: true);
  }
}
