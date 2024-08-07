import 'package:get/get.dart';
import 'package:reservatu_pista/utils/carousel/carousel_controller.dart';

class InicioProveedorController extends GetxController {
  int carouselCurrentIndex = 1;

  /// Initialization and disposal methods.
  final carouselController = CarouselController();
  final carouselOfertasController = CarouselController();
}
