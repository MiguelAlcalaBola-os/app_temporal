import 'package:get/get.dart';
import 'package:reservatu_pista/app/global_widgets/button_general.dart';
import 'package:reservatu_pista/utils/btn_icon.dart';
import 'package:reservatu_pista/utils/colores.dart';
import 'package:reservatu_pista/utils/responsive_web.dart';
import 'package:reservatu_pista/utils/sizer.dart';
import '../tarifas_pista_c.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ClonarDias extends StatelessWidget {
  ClonarDias({super.key});
  TarifasPistaController self = Get.find();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [Positioned(bottom: 0, child: buildClonarDias())],
    );
  }

  Widget buildClonarDias() {
    return ResponsiveWeb(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            20.0.sh,
            Obx(buildListDias),
            20.0.sh,
            SizedBox(
              width: 100.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ButtonGeneral(
                    onPressed: self.onChangeCopiarDatos,
                    text: '  Copiar  ',
                    isProveedor: true,
                    height: 40,
                  ),
                  ButtonGeneral(
                    onPressed: self.onChangeClonarBorrar,
                    text: '  Borrar  ',
                    fillColor: Colores.rojo,
                    height: 40,
                  ),
                ],
              ),
            ),
            30.0.sh,
          ],
        ),
      ),
    );
  }

  Widget buildListDias() {
    final Map<int, String> diasSelect = {
      0: 'L',
      1: 'M',
      2: 'X',
      3: 'J',
      4: 'V',
      5: 'S',
      6: 'D'
    };
    final keys = diasSelect.keys.toList();
    keys.removeAt(self.indexDias.value);
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: keys
          .map(
            (e) => Padding(
              padding: const EdgeInsets.all(2.0),
              child: BtnIcon(
                onPressed: () => self.onChangeClonarDia(e),
                icon: Text(diasSelect[e]!,
                    style: LightModeTheme().titleSmall.override(
                          fontFamily: 'Readex Pro',
                          color: self.selectedDias.value[e]
                              ? Colors.black
                              : Colors.white,
                          fontSize: 12.0,
                        )),
                width: 46.0,
                height: 46.0,
                padding:
                    const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                fillColor: self.selectedDias.value[e]
                    ? const Color(0xFF46EF98)
                    : LightModeTheme().primary,
                borderColor: Colors.transparent,
                borderWidth: 1.0,
                borderRadius: 24.0,
              ),
            ),
          )
          .toList(),
    );
  }
}
