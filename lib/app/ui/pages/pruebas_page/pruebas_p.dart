import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/app/global_widgets/favoritos_reservar_pista.dart';
import 'package:reservatu_pista/app/pages/usuario/reservar_pista/widgets/input_select.dart';
import 'package:reservatu_pista/app/ui/pages/pruebas_page/widgets/intro_painter.dart';
import 'package:reservatu_pista/constants.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_theme_modify.dart';
import 'package:reservatu_pista/utils/btn_icon.dart';
import 'package:reservatu_pista/utils/colores.dart';
import 'package:reservatu_pista/utils/page_view_sliding/slider_reservar_pista.dart';
import 'package:reservatu_pista/utils/sizer.dart';
import 'package:reservatu_pista/utils/smoth_page/page_view_sliding_indicator.dart';
import '../../../data/provider/datos_server.dart';
import 'pruebas_c.dart';
import 'dart:io';

// import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class PruebasPage extends GetView<PruebasController> {
  final ScrollController _scrollController = ScrollController();

  void _handlePointerSignal(PointerSignalEvent event) {
    print("dskjnksd");
    if (event is PointerScrollEvent) {
      print(event.scrollDelta);

      // Detecta la dirección del desplazamiento
      if (event.scrollDelta.dy > 0) {
        print('Scrolling down');
      } else if (event.scrollDelta.dy < 0) {
        print('Scrolling up');
      }
    }
    print("handle");
  }

  @override
  Widget build(BuildContext context) {
    return HomePage(title: 'fdsjhfjs');
    // return Scaffold(
    //   body: CustomPaint(
    //     painter: IntroPainter(context),
    //   ),
    // );
  }

  Widget mostrarImagen() {
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: 500,
        width: 400,
        color: Colors.black,
        child: Container(
            height: 500,
            width: 400,
            decoration: BoxDecoration(
                color: Colors.red,
                border: Border.all(width: 1, color: Colors.white)),
            child: Image.file(
              File(controller.imageElegir.imageFile.value!),
            )),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PruebasController self = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: !kIsWeb ? AppBar(title: Text(widget.title)) : null,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).width <= 640 ? 0.0 : 70),
            child: SliderReservarPista(
              widthButtons: MediaQuery.sizeOf(context).width <= 640
                  ? MediaQuery.sizeOf(context).width * 0.45
                  : 250,
              pageCount: 0,
              controller: self.pageViewController,
            ),
          ),
          SizedBox(
            height: 450,
            child: PageView(
              controller: self.pageViewController,
              scrollDirection: Axis.horizontal,
              children: [_buildPageFavoritos(), _buildPageBusqueda()],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPageFavoritos() {
    return Container(
      height: 450,
      padding: paddingHorizontal,
      child: Column(
        children: [buildFavorito()],
      ),
    );
  }

  Widget _buildPageBusqueda() {
    return Container(
      height: 450,
      padding: paddingHorizontal,
      child: Column(
        children: [
          FavoritosReservarPista(
              labelText: 'Localidad',
              textEditingController: TextEditingController(),
              maxLength: 40,
              listSelectMultiType: [
                SelectMultiType<int>("dsf", value: 3),
                SelectMultiType<int>("Sdkj", value: 4)
              ],
              isSelect: true,
              isRequired: false),
          FavoritosReservarPista(
              labelText: 'Deporte',
              textEditingController: TextEditingController(),
              maxLength: 40,
              listSelectMultiType: [
                SelectMultiType<int>("dsf", value: 3),
                SelectMultiType<int>("Sdkj", value: 4)
              ],
              isSelect: true,
              isRequired: false),
          FavoritosReservarPista(
              labelText: 'Club',
              textEditingController: TextEditingController(),
              maxLength: 40,
              listSelectMultiType: [
                SelectMultiType<int>("dsf", value: 3),
                SelectMultiType<int>("Sdkj", value: 4)
              ],
              isSelect: true,
              isRequired: false),
        ],
      ),
    );
  }

  /// Reserva
  Widget buildFavorito() {
    return Container(
        width: context.wMaxHorizontal,
        margin: paddingVertical,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              blurRadius: 3,
              color: MyTheme.primaryText,
              offset: const Offset(
                0,
                2,
              ),
            )
          ],
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(
            color: MyTheme.primary,
            width: 2,
          ),
        ),
        child: BtnIcon(
          hoverColor: Colores.usuario.primary69,
          borderRadius: 10,
          onPressed: null,
          icon: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 25,
                    width: 25,
                    child: Image.network(
                      DatosServer.online('padel'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    'Padel',
                    style: MyTheme.bodyMedium.copyWith(
                      fontFamily: 'Readex Pro',
                      fontSize: 10,
                      letterSpacing: 0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Text(' Club Modular'),
                      Text(' | '),
                      Text('Peraleda de la mata')
                    ],
                  ),
                  Row(
                    children: [
                      Obx(() => _buildCheck(SelectMultiType('s', value: 1))),
                      const Icon(
                        Icons.arrow_drop_down,
                        size: 30,
                        color: Colors.black,
                      ),
                    ],
                  )
                ],
              )),
            ],
          ),
        ));
  }

  /// Construir el checkbox
  Widget _buildCheck(SelectMultiType selectMultiType) {
    return BtnIcon(
      buttonSize: 22,
      padding: EdgeInsets.zero,
      icon: Stack(
        alignment: Alignment.center,
        children: [
          Icon(
            FontAwesomeIcons.solidStar,
            color: selectMultiType.changeCheck.isTrue
                ? Colores.yellowFavorito
                : Colors.transparent,
            size: 22,
          ),
          const Icon(
            FontAwesomeIcons.star,
            color: Colors.black,
            size: 22,
          ),
        ],
      ),
      onPressed: selectMultiType.changeCheck.toggle,
    );
  }
}
