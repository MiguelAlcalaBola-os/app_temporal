import 'package:get/get.dart';

class CrearBonoController extends GetxController
    with GetTickerProviderStateMixin {
  /* Tipo de cupo true: Porcentaje %, false: Dinero € */
  final _typeCupon = false.obs;
  set typeCupon(bool value) => _typeCupon.value = value;
  bool get typeCupon => _typeCupon.value;
  /* Slider seleccionar el procentaje o el dinero */
  final _sliderCupon = 0.0.obs;
  double get sliderCupon => _sliderCupon.value;
  set sliderCupon(double value) => _sliderCupon.value = value;
}
