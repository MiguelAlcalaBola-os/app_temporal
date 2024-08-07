import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:reservatu_pista/app/pages/usuario/mis_pedidos/mis_pedidos_c.dart';

class MisPedidosBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MisPedidosController>(() => MisPedidosController());
  }
}
