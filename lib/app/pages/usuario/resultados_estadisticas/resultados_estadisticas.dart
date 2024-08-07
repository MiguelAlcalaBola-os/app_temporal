import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_theme.dart';
import './resultados_estadisticas_c.dart';
import '../../../../components/navbar_y_appbar_usuario.dart';

class ResultadosEstadisticasPage
    extends GetView<ResultadosEstadisticasController> {
  const ResultadosEstadisticasPage({super.key});

  ResultadosEstadisticasController get self => controller;
  @override
  Widget build(BuildContext context) {
    return NavbarYAppbarUsuario(
      title: 'Resultados/Estadísticas',
      isTitleBack: true,
      isNavBar: false,
      child: Text('\nNo se encontraron Resultados/Estadísticas.',
          style: LightModeTheme().bodyMedium.copyWith(
              color: Colors.black, fontWeight: FontWeight.w700, fontSize: 16)),
    );
  }
}
