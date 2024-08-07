import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/app/data/models/localidad_model.dart';
import 'package:reservatu_pista/app/data/provider/datos_server.dart';
import 'package:reservatu_pista/app/global_widgets/imagenes_pista.dart';
import 'package:reservatu_pista/constants.dart';
import 'package:reservatu_pista/utils/responsive_web.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_util.dart';
import '../../../../flutter_flow/flutter_flow_theme.dart';
import '../../../../utils/search_droptown/dropdown_search.dart';
import './reservar_pista_c.dart';
import '../../../../components/navbar_y_appbar_usuario.dart';
import '../../../../utils/sizer.dart';
import '/backend/schema/enums/enums.dart';
import 'controllers/db_alvaro_c.dart';
import 'widgets/calendar_reservas.dart';
import 'widgets/datos_pista_w.dart';
import 'widgets/dialogs_messages.dart';
import 'widgets/favoritos_input.dart';
import 'widgets/horarios_w.dart';
import 'widgets/input_club_favoritos.dart';
import 'widgets/input_select.dart';

class ReservarPistaPage extends GetView<ReservarPistaController> {
  ReservarPistaPage({super.key});

  ReservarPistaController get self => controller;
  final DBAlvaroController db = Get.find();

  @override
  Widget build(BuildContext context) {
    self.dm = DialogsMessages(context);
    return NavbarYAppbarUsuario(
        title: 'Reservar Pista',
        page: TypePage.ReservarPista,
        child: Expanded(
            child: Padding(
                padding: paddingAll,
                child: SingleChildScrollView(
                    controller: self.sm.scrollController,
                    child: buildColumnReserva(context)))));
  }

  Widget buildColumnReserva(BuildContext context) {
    return ResponsiveWeb(
      child: Column(
        children: [
          SizedBox(
            height: 155,
            child: Column(
              children: [
                _buildLocalidades(),
                5.0.sh,
                Obx(buildInputClubs2),
                // buildInputClubs(),
                // Obx(buildInputClubs),
                5.0.sh,
                Obx(buildInputDeportes),
              ],
            ),
          ),
          Obx(buildPistas),
          Obx(buildCalendar),
          5.0.sh,
          HorariosW(),
          DatosPistaW(),
          Obx(() => self.sm.heightEnd.value.sh),
          context.paddingBottom.sh
        ],
      ),
    );
  }

  /// Input de las pistas
  Widget _buildLocalidades() {
    return Padding(
        padding: const EdgeInsets.only(top: paddingSize),
        child: SizedBox(
          height: 45,
          child: Obx(buildInputLocalidad),
        ));
  }

  /// Construir el input de la localidad
  Widget buildInputLocalidad() {
    return DropdownSearch<String>(
      onChanged: (value) {
        if (value != null) {
          List<Localidad> codigosPostales = self.listLocalidades.localidades
              .where((element) => element.localidad == value)
              .toList();
          self.localidad_seleccionada = value;
          self.visibilidadWidget(0);
          self.generarListaClubes(
              self.cod_postal.value, codigosPostales[0].codPostal);
        }
      },
      popupProps: PopupProps.menu(
        emptyBuilder: (context, searchEntry) =>
            const Center(child: Text('No se encontraron resultados')),
        showSelectedItems: true,
        showSearchBox: true,
        disabledItemFn: (String s) => s.startsWith('I'),
      ),
      items: self.localidades.value,
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          labelText: 'Localidad',
          hintText: "Selecciona la localidad.",
          labelStyle: LightModeTheme().labelMedium,
          hintStyle: LightModeTheme().labelMedium,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: LightModeTheme().alternate,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: LightModeTheme().primary,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: LightModeTheme().error,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: LightModeTheme().error,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
          contentPadding:
              const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
        ),
      ),
    );
  }

  /// Input de los Clubss
  Widget buildInputClubs2() {
    return InputClubFavorito(
      controller: self.clubController,
      focusNode: self.clubFocusNode,
      context: Get.context!,
      labelText: 'Club',
      enableInput: self.clubes.value.isEmpty,
      onChanged: (val, favorito) {
        self.deporteController.text = '';
        String idClub = self.mapClubes[val] ?? '';
        self.generarListaDeportes(idClub);
        self.id_club_seleccionado.value = idClub;
        self.visibilidadWidget(0);
      },
      clubsFavoritos: List.generate(self.clubes.value.length, (index) => false),
      itemsDD: self.clubes.value,
    );
  }

  /// Input de los Clubss
  Widget buildInputClubs() {
    return Builder(builder: (context) {
      return InkWell(
          onTap: () {
            final RenderBox itemBox = context.findRenderObject() as RenderBox;
            final position = itemBox.localToGlobal(Offset.zero);
            print(itemBox.size.width);
            Get.dialog(
                Stack(
                  children: [
                    Positioned(
                        left: position.dx,
                        top: position.dy - 2,
                        child: DropList(width: itemBox.size.width)),
                  ],
                ),
                barrierColor: Colors.transparent);
          },
          child: Container(
            color: Colors.red,
            height: 40,
          ));
    });
  }

  // Input Deportes
  Widget buildInputDeportes() {
    return InputSelect(
      controller: self.deporteController,
      focusNode: self.deporteFocusNode,
      context: Get.context!,
      labelText: 'Deporte',
      onChanged: (val) {
        self.deporte_seleccionado.value = val;
        self.generarListaPistas(
            self.id_club_seleccionado.value, self.deporte_seleccionado.value);
        self.visibilidadWidget(1);
        self.sm.moveHorarios();
      },
      itemsDD: self.deportes.value,
    );
  }

  // Widget Calendar
  Widget buildCalendar() {
    return Visible(
        isVisible: self.tiempoReserva != 0,
        child: CalendarioReservas(
          tiempoReserva: self.tiempoReserva,
        ));
  }

  // Widget Pistas
  Widget buildPistas() {
    return Visible(
      isVisible: self.deporte_seleccionado.value != '',
      child: SizedBox(
          height: 100,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(
                  self.pistas.value.length,
                  (index) => buildPista(
                      self.pistas.value[index].idPista.toString(),
                      self.pistas.value[index].imagenPatrocinador,
                      index)).divide(3.0.sw).around(4.0.sw),
            ),
          )),
    );
  }

  Widget buildPista(
    String idPista,
    String fotoPista,
    int index,
  ) {
    try {
      return Obx(() {
        final bool isSelect = index == self.selectPista.value;
        return ImagenChipPista(
          imagen: DatosServer.pista(fotoPista),
          index: index,
          isSelect: isSelect,
          onPressed: () => self.onPressedPista(index, idPista),
        );
      });
    } catch (error, stack) {
      print(error);
      print(stack);
      rethrow;
    }
  }
}
//