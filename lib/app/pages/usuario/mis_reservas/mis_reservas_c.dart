import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/app/data/models/mis_reservas_usuario_model.dart';
import 'package:reservatu_pista/app/data/models/reservas_usuario_model.dart';
import 'package:reservatu_pista/app/data/provider/execute_node.dart';
import 'package:reservatu_pista/app/data/provider/reservas_node.dart';
import 'package:reservatu_pista/app/data/services/db_s.dart';
import 'package:reservatu_pista/app/mixin/reservas_mixin.dart';
import 'package:reservatu_pista/utils/state_getx/state_mixin_demo.dart';

class MisReservasController extends GetxController
    with GetSingleTickerProviderStateMixin, ReservasMixin {
  final DBService db = Get.find();
  final List<ReservasUsuarios> listReservasUsuarios = [];

  List<GlobalKey> deporteKey = List.generate(
      16, (index) => GlobalKey()); // Asegúrate de tener esta línea
  Rx<List<double>> deportesWidth =
      Rx<List<double>>(List.generate(16, (index) => 30.0));

  @override
  void onReady() async {
    try {
      await db.getDB();
      obtenerReservasTotales();
      cargarTotalReservas();
      loadMoreData();
    } catch (e) {
      print(e);
    }
    super.onReady();
  }

  @override
  void onInit() async {
    super.onInit();
    debounce(pageHaschanged, (val) => cargarDatos(),
        time: const Duration(milliseconds: 1000));
  }

  // Método para indicar que se está cargando datos
  void startLoading() {
    isLoading.value = true;
  }

  // Método para indicar que se ha completado la carga de datos
  void stopLoading() {
    isLoading.value = false;
  }

  void obtenerReservasTotales() async {
    initialLength = await ExecuteProvider().obtenerTotalReservas();
    print('initialLengthhhhhhh $initialLength');
  }

  Future<void> cargarTotalReservas() async {
    final result = await ExecuteProvider().misReservasTotal(deporte,
        page: currentPage + 1, itemsPerPage: itemsPerPage, isHistorial: false);
    totalReservas.value = result;
  }

  Future<void> cargarDatos() async {
    print('entra cargar datos');
    //if (isLoading.value || !hasMoreItems) return;
    if (isLoading.value) return;
    try {
      isLoading.value = true;
      misReservasUsuario.loading();
      final result = await ExecuteProvider().misReservas(deporte,
          page: currentPage, itemsPerPage: itemsPerPage, isHistorial: false);
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
        //VOY POR AQUI ALVARO

        for (var i = 0; i < result.length; i++) {
          final element = result[i];

          if (listaDeportes.indexOf(element.deporte) == -1)
            listaDeportes.add(element.deporte);
        }
        print('result.length ${result.length}');
        print('listaDeporteslistaDeportes ${listaDeportes}');
        print(
            'missReservasUsuario.rx.value.length ${misReservasUsuario.rx.value.length}');
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

  void mostrarDatos() {
    isLoading.value = true;
    misReservasUsuario.success(globalResult);
    List<MisReservasUsuarioModel> finalResult = [];
    int length = 10;
    if (itemsPerPage * currentPage > initialLength) {
      print('initialLength $initialLength');
      length = initialLength;
    } else {
      print('currentPagee $currentPage');
      length = itemsPerPage * currentPage;
    }
    print(
        'misReservasUsuario.rx.value.lengthhhh ${misReservasUsuario.rx.value.length}');
    print('lengthh $length');
    for (var i = 0; i < length; i++) {
      finalResult.add(misReservasUsuario.rx.value[i]);
      print('iiii $i');
    }
    if (finalResult.isEmpty) {
      misReservasUsuario.empty();
      //hasMoreItems = false;
      return;
    }
    isLoading.value = false;
    misReservasUsuario.success(finalResult);

    /*if (currentPage == 1) {
      print('ENTRA IGUAL A 1');
      misReservasUsuario.success(result);
      print(
          'misReservasUsuario.rx.value.length ${misReservasUsuario.rx.value.length}');
    } else {
      print('ENTRA ELSE A 1');
      final List<MisReservasUsuarioModel> currentList =
          misReservasUsuario.rx.value;
      misReservasUsuario.success(currentList);
    } */
    //currentPage++;
    //hasMoreItems = finalResult.length == itemsPerPage;
  }

  void loadMoreData() {
    // Añadir un debounce para evitar múltiples llamadas rápidas consecutivas
    cargarDatos();
    print('currentPage');
    print('currentPage $currentPage');
  }

  void onPressDeporte(String val) => {deporte = val};

  Future<ReservasUsuarios?> obtenerPlazasLibres(
      String idPista, String fecha, String horaInicio) async {
    try {
      final result = await ReservasProvider()
          .obtenerPlazasLibres(idPista, fecha, horaInicio);
      if (result is ReservasUsuarios) {
        return result;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
