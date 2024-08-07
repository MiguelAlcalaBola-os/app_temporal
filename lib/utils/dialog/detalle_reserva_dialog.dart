import 'package:image_picker/image_picker.dart';
import 'package:reservatu_pista/app/global_widgets/button_cerrar_dialog.dart';
import 'package:reservatu_pista/app/global_widgets/button_general.dart';
import 'package:reservatu_pista/utils/btn_icon.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import '../sizer.dart';
import 'package:reservatu_pista/utils/auto_size_text/auto_size_text.dart';
import '../../../../utils/colores.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class DetalleReservaDialog {
  DetalleReservaDialog(
      {required this.context,
      required this.pickImage,
      this.isProveedor = false});
  final Future<void> Function(ImageSource, {String? path}) pickImage;
  final bool isProveedor;
  final BuildContext context;
  final pageIndexNotifier = ValueNotifier(0);

  void dialog() {
    WoltModalSheet.show<void>(
      pageIndexNotifier: pageIndexNotifier,
      context: context,
      pageListBuilder: (modalSheetContext) {
        final textTheme = Theme.of(context).textTheme;
        return [
          page1(modalSheetContext, textTheme),
        ];
      },
      modalTypeBuilder: (context) {
        return WoltModalType.dialog;
      },
      onModalDismissedWithBarrierTap: () {
        debugPrint('Closed modal sheet with barrier tap');
        Navigator.of(context).pop();
        pageIndexNotifier.value = 0;
      },
      barrierDismissible: false,
      maxDialogWidth: 630,
      minDialogWidth: context.w < 650 ? context.w - 20 : 650,
      minPageHeight: isProveedor ? null : 0.0,
      maxPageHeight: isProveedor ? 0.23 : (context.h > 900 ? 0.8 : 0.9),
    );
  }

  SliverWoltModalSheetPage page1(
      BuildContext modalSheetContext, TextTheme textTheme) {
    return SliverWoltModalSheetPage(
      stickyActionBar: buildBtnsImage(modalSheetContext),
      hasTopBarLayer: true,
      topBarTitle: buildTitle(),
      isTopBarLayerAlwaysVisible: true,
      forceMaxHeight: !isProveedor ? false : true,
      enableDrag: false,
      trailingNavBarWidget: buildCerrar(modalSheetContext),
      resizeToAvoidBottomInset: false,
      hasSabGradient: true,
      mainContentSlivers: isProveedor
          ? []
          : [
              buildListIcons(),
              const SliverPadding(
                padding: EdgeInsets.only(bottom: 100.0),
              ),
            ],
    );
  }

  Widget buildListIcons() {
    final listaIconsGrid = [
      'icon_sport_padel',
      'icon_sport_sports_women',
      'icon_sport_sports_men',
      'icon_sport_baseball',
      'icon_sport_basketball',
      'icon_sport_football',
      'icon_sport_rugby',
      'icon_sport_sports_bottle',
      'icon_sport_swimming',
      'icon_sport_table_tennis',
      'icon_sport_tennis',
      'icon_sport_trophy',
      'icon_sport_wistle',
    ];
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (_, i) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: BtnIcon(
            onPressed: () =>
                pickImage(ImageSource.camera, path: listaIconsGrid[i]),
            // onPressed: () =>
            //     pageIndexNotifier.value = pageIndexNotifier.value + 1,
            padding: const EdgeInsets.all(0),
            borderColor: const Color.fromARGB(255, 226, 6, 255),
            borderWidth: 3,
            borderRadius: 30,
            hoverColor: const Color.fromARGB(255, 226, 6, 255),
            icon: Image.asset(
              'assets/images/${listaIconsGrid[i]}.png',
            ),
          ),
        ),
        childCount: listaIconsGrid.length,
      ),
      // padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        childAspectRatio: 1,
      ),
    );
  }

  Widget buildBtnsImage(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        child: Row(
          mainAxisAlignment:
              isWeb ? MainAxisAlignment.center : MainAxisAlignment.spaceAround,
          children: [
            Visible(
              isVisible: !isWeb,
              child: ButtonGeneral(
                onPressed: () => pickImage(ImageSource.camera),
                text: 'Camara',
                prefixIcon: const Icon(
                  Icons.camera_alt,
                  size: 25,
                  color: Colors.white,
                ),
                fillColor: Colores.proveedor.primary,
                hoverColor: const Color.fromARGB(91, 255, 255, 255),
              ),
            ),
            ButtonGeneral(
              onPressed: () => pickImage(ImageSource.gallery),
              // onPressed: () {},
              text: 'Galería',
              prefixIcon: const Icon(
                Icons.collections,
                size: 25,
                color: Colors.white,
              ),
              fillColor: Colores.usuario.primary,
              hoverColor: const Color.fromARGB(91, 255, 255, 255),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTitle() {
    return AutoSizeText(
      'Elije la foto',
      maxLines: 1,
      textAlign: TextAlign.center,
      style: LightModeTheme().displaySmall,
      minFontSize: 12, // Establece aquí tu tamaño mínimo de fuente
      maxFontSize: 28,
      stepGranularity: 1, // Ajuste granular para el tamaño de la fuente
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget buildCerrar(BuildContext context) {
    return ButtonCerrarDialog(
      contextDialog: context,
    );
  }
}
