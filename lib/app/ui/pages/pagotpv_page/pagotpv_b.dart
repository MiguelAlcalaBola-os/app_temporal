
import 'package:get/get.dart';
import 'pagotpv_c.dart';


class PagoTpvBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PagoTpvController>(() => PagoTpvController());
  }
}