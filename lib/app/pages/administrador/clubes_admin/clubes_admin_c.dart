import 'package:get/get.dart';
import 'package:reservatu_pista/app/pages/administrador/admin_page/pagina_administrador_c.dart';

class ClubesAdminController extends GetxController {
  List clubes = ClubesFavoritos.clubes;
  List todosClubes = ClubesFavoritos.clubes;
  List chips = [
    ChipData(label: ClubesFavoritos.tipos[0]),
    ChipData(label: ClubesFavoritos.tipos[1]),
    ChipData(label: ClubesFavoritos.tipos[2])
  ];
  final _selectChip = (-1).obs;
  int get selectChip => _selectChip.value;
  set selectChip(int value) => _selectChip.value = value;

  void cambiarChip() {
    var aux = todosClubes.where((element) {
      return element.tipo == ClubesFavoritos.tipos[_selectChip.value];
    });
    clubes = aux.toList();
  }

  void borrarChip() {
    selectChip = -1;
    clubes = todosClubes;
  }
}
