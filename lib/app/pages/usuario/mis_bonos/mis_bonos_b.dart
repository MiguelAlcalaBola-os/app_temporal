import 'package:get/get.dart';
import 'mis_bonos_c.dart';

class MisBonosBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MisBonosController>(() => MisBonosController());
  }
}
