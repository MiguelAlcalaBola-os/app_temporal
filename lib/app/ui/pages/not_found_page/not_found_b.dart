import 'package:get/get.dart';
import 'not_found_c.dart';

class NotFoundBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotFoundController>(() => NotFoundController());
  }
}
