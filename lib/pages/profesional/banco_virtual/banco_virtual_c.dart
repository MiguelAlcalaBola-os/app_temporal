import 'package:get/get.dart';

enum TypeHistorial { reserva, tranferencia, all }

class BancoVirtualController extends GetxController {
  final isFiltrar = false.obs;

  final _typeFiltro = Rx<TypeHistorial>(TypeHistorial.all);
  TypeHistorial get typeFiltro => _typeFiltro.value;
  set typeFiltro(TypeHistorial value) => _typeFiltro.value = value;
}
