import 'package:get/get.dart';
import 'package:reservatu_pista/app/pages/profesional/mis_bonos_proveedor/widgets/crear_bono_c.dart';
import 'mis_bonos_proveedor_c.dart';

class MisBonosProveedorBinding implements Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut<MisBonosProveedorController>(
          () => MisBonosProveedorController())
      ..lazyPut<CrearBonoController>(() => CrearBonoController());
  }
}
