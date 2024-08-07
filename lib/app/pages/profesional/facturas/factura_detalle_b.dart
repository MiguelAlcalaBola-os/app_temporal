import 'package:get/get.dart';
import 'package:reservatu_pista/app/pages/profesional/facturas/factura_detalle_c.dart';

class FacturaDetalleBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FacturaDetalleController>(() => FacturaDetalleController());
  }
}
