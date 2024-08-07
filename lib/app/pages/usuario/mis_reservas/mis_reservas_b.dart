import 'package:get/get.dart';
import 'mis_reservas_c.dart';

class MisReservasBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MisReservasController>(() => MisReservasController());
  }
}
