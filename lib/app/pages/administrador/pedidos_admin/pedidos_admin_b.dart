import 'package:get/get.dart';
import 'package:reservatu_pista/app/pages/administrador/pedidos_admin/pedidos_admin_c.dart';

class AdminPedidosBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminPedidosController>(() => AdminPedidosController());
  }
}
