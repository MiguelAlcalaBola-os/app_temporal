import 'package:get/get.dart';
import 'dart:async';
import 'package:reservatu_pista/app/data/models/mis_reservas_usuario_model.dart';
import 'package:reservatu_pista/app/data/provider/execute_node.dart';
import 'package:reservatu_pista/app/data/services/db_s.dart';
import 'package:reservatu_pista/app/mixin/reservas_mixin.dart';
import 'package:reservatu_pista/utils/state_getx/state_mixin_demo.dart';

class HistorialController extends GetxController with ReservasMixin {
  /// Base de datos global
  final DBService db = Get.find();

  @override
  void onReady() async {
    try {
      await db.getDB();
      await cargarDatos();
    } catch (e) {
      print(e);
    }
    super.onReady();
  }

  Future<void> cargarDatos() async {
    print('entra cargar datos');
    //if (isLoading.value || !hasMoreItems) return;
    if (isLoading.value) return;
    try {
      isLoading.value = true;
      misReservasUsuario.loading();
      final result = await ExecuteProvider().misReservas(deporte,
          page: currentPage, itemsPerPage: itemsPerPage, isHistorial: true);
      print('entra cargar datos3');
      if (result is List<MisReservasUsuarioModel>) {
        isLoading.value = false;
        print('entra cargar datos3.2');
        if (result.isEmpty) {
          print('entra cargar datos4');
          misReservasUsuario.empty();
          // hasMoreItems = false;
          return;
        }
        misReservasUsuario.success(result);
        //hasMoreItems = result.length == itemsPerPage;
      } else {
        print('entra elseeeeeeeeeeeeeee');
      }
    } catch (e) {
      print('errorrrrrrrrrr $e');
    } finally {
      isLoading.value = false;
      print('entra cargar datos finally');
    }
  }
}
