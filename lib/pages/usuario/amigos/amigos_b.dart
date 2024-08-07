import 'package:get/get.dart';

import 'amigos_c.dart';

class AmigosBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AmigosController>(() => AmigosController());
  }
}
