import 'package:get/get.dart';
import 'validar_email_c.dart';

class ValidarEmailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ValidarEmailController>(() => ValidarEmailController());
  }
}
