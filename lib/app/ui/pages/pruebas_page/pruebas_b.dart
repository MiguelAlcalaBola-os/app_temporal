
import 'package:get/get.dart';
import 'pruebas_c.dart';


class PruebasBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PruebasController>(() => PruebasController());
  }
}