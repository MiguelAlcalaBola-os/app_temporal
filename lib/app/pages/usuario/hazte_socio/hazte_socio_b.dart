import 'package:get/get.dart';
import 'package:reservatu_pista/app/pages/usuario/hazte_socio/hazte_socio_c.dart';

class HazteSocioBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HazteSocioController>(() => HazteSocioController());
  }
}
