import 'package:get/get.dart';

import 'banco_virtual_c.dart';

class BancoVirtualBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BancoVirtualController>(() => BancoVirtualController());
  }
}
