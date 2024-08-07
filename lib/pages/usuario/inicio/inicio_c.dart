import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/app/data/models/mis_reservas_usuario_model.dart';
import 'package:reservatu_pista/app/data/models/reservas_usuario_model.dart';
import 'package:reservatu_pista/app/data/provider/execute_node.dart';
import 'package:reservatu_pista/app/data/services/db_s.dart';
import 'package:reservatu_pista/app/mixin/reservas_mixin.dart';
import 'package:reservatu_pista/utils/carousel/carousel_controller.dart';
import 'package:reservatu_pista/utils/state_getx/state_mixin_demo.dart';

class InicioController extends GetxController with ReservasMixin {
  final DBService db = Get.find();
  int carouselCurrentIndex = 1;

  /// Initialization and disposal methods.
  final carouselController = CarouselController();
  final carouselOfertasController = CarouselController();
  final List<ReservasUsuarios> listReservasUsuarios = [];

  final deporteKey = List.generate(
      16, (index) => GlobalKey()); // Asegúrate de tener esta línea
  final deportesWidth = Rx<List<double>>(List.generate(16, (index) => 30.0));

  // final _currentPage = 1.obs;
  // int get currentPage => _currentPage.value;
  // set currentPage(int value) => _currentPage.value = value;
  // final pageHaschanged = false.obs;
  // final isThrottling = false.obs;
  // int lastPageSelected = 1;
  // final int itemsPerPage = 10;
  //bool hasMoreItems = true;
  bool isLoadingData = false;
  // late int initialLength;
  // Timer? debounceTimer;
  // double previousScrollPosition = 0.0;
  // final ScrollController scrollController = ScrollController();
  // List<String> listaDeportes = RxList([]);
  // late List<MisReservasUsuarioModel> globalResult;
  @override
  void onReady() async {
    try {
      await db.getDB();
      obtenerReservasTotales();
      cargarDatos();
    } catch (e) {
      print(e);
    }
    super.onReady();
  }

  void obtenerReservasTotales() async {
    initialLength = await ExecuteProvider().obtenerTotalReservas();
    print('initialLengthhhhhhh $initialLength');
  }

  Future<void> cargarDatos() async {
    print('entra cargar datos');
    //if (isLoading.value || !hasMoreItems) return;
    if (isLoading.value) return;
    try {
      isLoading.value = true;
      misReservasUsuario.loading();
      final result = await ExecuteProvider().misReservas(deporte,
          page: currentPage,
          itemsPerPage: itemsPerPage,
          isHistorial: false,
          isReservasAbiertas: true);
      print('entra cargar datos3');
      if (result is List<MisReservasUsuarioModel>) {
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
