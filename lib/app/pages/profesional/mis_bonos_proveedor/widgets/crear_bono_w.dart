import 'package:reservatu_pista/app/global_widgets/button_cerrar_dialog.dart';
import 'package:reservatu_pista/app/global_widgets/input_general.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_theme_modify.dart';
import 'package:reservatu_pista/library/page_general.dart';
import 'package:reservatu_pista/utils/animations/list_animations.dart';
import 'package:reservatu_pista/utils/colores.dart';
import 'package:reservatu_pista/utils/sizer.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'crear_bono_c.dart';
import 'crear_bono_m.dart';
export 'crear_bono_m.dart';

class CrearBono extends StatefulWidget {
  const CrearBono(this.self, {super.key});
  final CrearBonoController self;

  @override
  State<CrearBono> createState() => _MisBonoProveedorState();
}

class _MisBonoProveedorState extends State<CrearBono> {
  late CrearBonoModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  CrearBonoController get self => widget.self;

  // Definimos la animacion que viene directamente del controllador
  AnimationController get anim => animVibrate(vsync: self);

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CrearBonoModel());
    _model.initState(context);
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: MyTheme.secondaryBackground,
        appBar: _buildAppBar(),
        body: SafeArea(
          top: true,
          child: Form(
              key: _model.formKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: _buildColumnDatos()),
        ),
      ),
    );
  }

  /// Mostrar a lista de inputs
  List<Widget> _buildListCrearBono() {
    return [
      InputGeneral(
          labelText: 'Nombre del cupon*',
          textEditingController: _model.nombreCupon!,
          anim: anim,
          maxLength: 40,
          isRequired: false),
      InputGeneral(
          labelText: 'Fecha límite *',
          textEditingController: _model.fechaLimite!,
          anim: anim,
          maxLength: 40,
          isRequired: false),
      Row(
        children: [
          Expanded(
            child: InputGeneral(
                labelText: 'Nº de cupones*',
                textEditingController: _model.nCupones!,
                anim: anim,
                maxLength: 40,
                isRequired: false),
          ),
          Expanded(
            child: InputGeneral(
                labelText: 'Nº de usos*',
                textEditingController: _model.nUsos!,
                anim: anim,
                maxLength: 40,
                isRequired: false),
          ),
        ],
      ),
      _buildSelectTipoCuponCheck(),
      Obx(_buildSliderTipoCupon),
      _buildSelectTipoPartidaCheck(),
      InputGeneral(
          labelText: 'Deporte *',
          textEditingController: _model.fechaLimite!,
          anim: anim,
          maxLength: 40,
          listSelectMultiType: [SelectMultiType<int>("dsf", value: 3)],
          isSelect: true,
          isRequired: false),
      InputGeneral(
          labelText: 'Pista *',
          textEditingController: _model.fechaLimite!,
          anim: anim,
          maxLength: 40,
          isSelect: true,
          isRequired: false),
      // buildInputClubs(),
      // Column(
      //   mainAxisSize: MainAxisSize.max,
      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   children: [
      //     Expanded(
      //       child: SingleChildScrollView(
      //         child: Column(
      //           mainAxisSize: MainAxisSize.max,
      //           children: [
      //             ..._buildListCrearBono(),
      //             Row(
      //               mainAxisSize: MainAxisSize.max,
      //               children: [
      //                 Align(
      //                   alignment: const AlignmentDirectional(0, -1),
      //                   child: Container(
      //                     constraints: const BoxConstraints(
      //                       maxWidth: 770,
      //                     ),
      //                     decoration: const BoxDecoration(),
      //                     child: Padding(
      //                       padding: const EdgeInsetsDirectional.fromSTEB(
      //                           16, 12, 16, 0),
      //                       child: Column(
      //                         mainAxisSize: MainAxisSize.max,
      //                         crossAxisAlignment: CrossAxisAlignment.start,
      //                         children: [
      //                          Text(
      //                             'Tipo de Partida:',
      //                             style: MyTheme
      //                                 .labelMedium
      //                                 .override(
      //                                   fontFamily: 'Readex Pro',
      //                                   fontSize: 16,
      //                                   letterSpacing: 0,
      //                                 ),
      //                           ),
      //                           FlutterFlowChoiceChips(
      //                             options: [
      //                               const ChipData(
      //                                 'Total',
      //                                 null,
      //                               ),
      //                               const ChipData('Parcial', null)
      //                             ],
      //                             onChanged: (val) => setState(() => _model
      //                                 .choiceChipsValue2 = val?.firstOrNull),
      //                             selectedChipStyle: ChipStyle(
      //                               backgroundColor: Colores.verdeCheck,
      //                               textStyle: MyTheme
      //                                   .bodyMedium
      //                                   .override(
      //                                     fontFamily: 'Readex Pro',
      //                                     color: MyTheme
      //                                         .primaryText,
      //                                     letterSpacing: 0,
      //                                   ),
      //                               iconColor: MyTheme
      //                                   .primaryText,
      //                               iconSize: 18,
      //                               elevation: 0,
      //                               borderColor:
      //                                   MyTheme.secondary,
      //                               borderWidth: 2,
      //                               borderRadius: BorderRadius.circular(8),
      //                             ),
      //                             unselectedChipStyle: ChipStyle(
      //                               backgroundColor:
      //                                   MyTheme
      //                                       .primaryBackground,
      //                               textStyle: MyTheme
      //                                   .bodyMedium
      //                                   .override(
      //                                     fontFamily: 'Readex Pro',
      //                                     color: MyTheme
      //                                         .secondaryText,
      //                                     letterSpacing: 0,
      //                                   ),
      //                               iconColor: MyTheme
      //                                   .secondaryText,
      //                               iconSize: 18,
      //                               elevation: 0,
      //                               borderColor:
      //                                   MyTheme.alternate,
      //                               borderWidth: 2,
      //                               borderRadius: BorderRadius.circular(8),
      //                             ),
      //                             chipSpacing: 12,
      //                             rowSpacing: 12,
      //                             multiselect: false,
      //                             alignment: WrapAlignment.start,
      //                             controller:
      //                                 _model.choiceChipsValueController2 ??=
      //                                     FormFieldController<List<String>>(
      //                               [],
      //                             ),
      //                             wrapped: true,
      //                           ),
      //                           FlutterFlowDropDown<String>(
      //                             controller:
      //                                 _model.dropDownValueController1 ??=
      //                                     FormFieldController<String>(null),
      //                             options: [
      //                               'Insurance Provider 1',
      //                               'Insurance Provider 2',
      //                               'Insurance Provider 3'
      //                             ],
      //                             onChanged: (val) => setState(
      //                                 () => _model.dropDownValue1 = val),
      //                             width: double.infinity,
      //                             height: 52,
      //                             searchHintTextStyle:
      //                                 MyTheme
      //                                     .labelMedium
      //                                     .override(
      //                                       fontFamily: 'Readex Pro',
      //                                       letterSpacing: 0,
      //                                     ),
      //                             textStyle: MyTheme
      //                                 .bodyLarge
      //                                 .override(
      //                                   fontFamily: 'Readex Pro',
      //                                   letterSpacing: 0,
      //                                 ),
      //                             hintText: 'Deporte',
      //                             searchHintText: 'Search for an item...',
      //                             searchCursorColor:
      //                                 MyTheme.primary,
      //                             icon: Icon(
      //                               Icons.keyboard_arrow_down_rounded,
      //                               color: MyTheme
      //                                   .secondaryText,
      //                               size: 24,
      //                             ),
      //                             fillColor: MyTheme
      //                                 .secondaryBackground,
      //                             elevation: 2,
      //                             borderColor:
      //                                 MyTheme.alternate,
      //                             borderWidth: 2,
      //                             borderRadius: 12,
      //                             margin: const EdgeInsetsDirectional.fromSTEB(
      //                                 12, 4, 8, 4),
      //                             hidesUnderline: true,
      //                             isOverButton: true,
      //                             isSearchable: true,
      //                             isMultiSelect: false,
      //                           ),
      //                           FlutterFlowDropDown<String>(
      //                             controller:
      //                                 _model.dropDownValueController2 ??=
      //                                     FormFieldController<String>(null),
      //                             options: [
      //                               'Insurance Provider 1',
      //                               'Insurance Provider 2',
      //                               'Insurance Provider 3'
      //                             ],
      //                             onChanged: (val) => setState(
      //                                 () => _model.dropDownValue2 = val),
      //                             width: double.infinity,
      //                             height: 52,
      //                             searchHintTextStyle:
      //                                 MyTheme
      //                                     .labelMedium
      //                                     .override(
      //                                       fontFamily: 'Readex Pro',
      //                                       letterSpacing: 0,
      //                                     ),
      //                             textStyle: MyTheme
      //                                 .bodyLarge
      //                                 .override(
      //                                   fontFamily: 'Readex Pro',
      //                                   letterSpacing: 0,
      //                                 ),
      //                             hintText: 'Pista',
      //                             searchHintText: 'Search for an item...',
      //                             searchCursorColor:
      //                                 MyTheme.primary,
      //                             icon: Icon(
      //                               Icons.keyboard_arrow_down_rounded,
      //                               color: MyTheme
      //                                   .secondaryText,
      //                               size: 24,
      //                             ),
      //                             fillColor: MyTheme
      //                                 .secondaryBackground,
      //                             elevation: 2,
      //                             borderColor:
      //                                 MyTheme.alternate,
      //                             borderWidth: 2,
      //                             borderRadius: 12,
      //                             margin: const EdgeInsetsDirectional.fromSTEB(
      //                                 12, 4, 8, 4),
      //                             hidesUnderline: true,
      //                             isOverButton: true,
      //                             isSearchable: true,
      //                             isMultiSelect: false,
      //                           ),
      //                         ]
      //                             .divide(const SizedBox(height: 12))
      //                             .addToEnd(const SizedBox(height: 32)),
      //                       ),
      //                     ),
      //                   ),
      //                 ),
      //                 Text(
      //                   '100',
      //                   style: MyTheme.bodyMedium.override(
      //                         fontFamily: 'Readex Pro',
      //                         letterSpacing: 0,
      //                       ),
      //                 ),
      //               ],
      //             ),
      //           ],
      //         ),
      //       ),
      //     ),
      //     Container(
      //       constraints: const BoxConstraints(
      //         maxWidth: 770,
      //       ),
      //       decoration: const BoxDecoration(),
      //       child: Padding(
      //         padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 12),
      //         child: FFButtonWidget(
      //           onPressed: () async {
      //             if (_model.formKey.currentState == null ||
      //                 !_model.formKey.currentState!.validate()) {
      //               return;
      //             }
      //           },
      //           text: 'Generar Códigos',
      //           options: FFButtonOptions(
      //             width: double.infinity,
      //             height: 48,
      //             padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
      //             iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
      //             color: MyTheme.primary,
      //             textStyle: MyTheme.titleSmall.override(
      //                   fontFamily: 'Readex Pro',
      //                   color: Colors.white,
      //                   letterSpacing: 0,
      //                 ),
      //             elevation: 3,
      //             borderSide: const BorderSide(
      //               color: Colors.transparent,
      //               width: 1,
      //             ),
      //             borderRadius: BorderRadius.circular(8),
      //           ),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    ];
  }

  /// Appbar Mostrar el tituo t subtitulo
  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: MyTheme.secondaryBackground,
      automaticallyImplyLeading: false,
      title: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Crear Cupon',
            style: MyTheme.headlineMedium.override(
              fontFamily: 'Outfit',
              letterSpacing: 0,
            ),
          ),
          Text(
            'Por favor complete el formulario.',
            style: MyTheme.labelMedium.override(
              fontFamily: 'Readex Pro',
              letterSpacing: 0,
            ),
          ),
        ].divide(const SizedBox(height: 4)),
      ),
      actions: [ButtonCerrarDialog(contextDialog: context)],
      centerTitle: false,
      elevation: 0,
    );
  }

  /// Seleccion de tipo de cupon
  Widget _buildSelectTipoCuponCheck() {
    return SizedBox(
      width: context.w,
      child: Column(
        children: [
          5.0.sh,
          Text(
            'Tipo de Cupon:',
            style: MyTheme.labelMedium.override(
              fontFamily: 'Readex Pro',
              fontSize: 16,
              letterSpacing: 0,
            ),
          ),
          5.0.sh,
          FlutterFlowChoiceChips<bool>(
            options: const [
              ChipData<bool>('Porcentaje %', value: true),
              ChipData<bool>('Dinero  €', value: false)
            ],
            onChanged: (val) {
              self.typeCupon = val != null ? val[0] : false;
              self.sliderCupon = 0.0;
            },
            selectedChipStyle: ChipStyle(
              backgroundColor: Colores.verdeCheck,
              textStyle: MyTheme.bodyMedium.override(
                fontFamily: 'Readex Pro',
                color: MyTheme.primaryText,
                letterSpacing: 0,
              ),
              iconColor: MyTheme.primaryText,
              iconSize: 18,
              elevation: 0,
              borderColor: Colores.verdeBorderCheck,
              borderWidth: 2,
              borderRadius: BorderRadius.circular(6),
            ),
            unselectedChipStyle: ChipStyle(
              backgroundColor: MyTheme.primaryBackground,
              textStyle: MyTheme.bodyMedium.override(
                fontFamily: 'Readex Pro',
                color: MyTheme.secondaryText,
                letterSpacing: 0,
              ),
              iconColor: MyTheme.secondaryText,
              iconSize: 20,
              elevation: 0,
              borderColor: MyTheme.alternate,
              borderWidth: 2,
              borderRadius: BorderRadius.circular(8),
            ),
            chipSpacing: 15,
            rowSpacing: 12,
            multiselect: false,
            alignment: WrapAlignment.start,
            controller: FormFieldController<List<bool>>(
              [true],
            ),
            wrapped: true,
          ),
        ],
      ),
    );
  }

  /// Mostrar slider de porcentaje y dinero
  Widget _buildSliderTipoCupon() {
    print('self.typeCupon: ${self.typeCupon}');
    final dineroOrPorcentaje =
        (self.typeCupon ? '${self.sliderCupon} %' : '${self.sliderCupon}0 €');
    return Column(
      children: [
        Text(
          dineroOrPorcentaje,
          style: MyTheme.bodyMedium.override(
            fontFamily: 'Readex Pro',
            fontSize: 20,
            letterSpacing: 0,
          ),
        ),
        SizedBox(
          height: 20,
          child: Slider(
            activeColor: Colores.proveedor.primary,
            thumbColor: Colores.verde,
            value: self.sliderCupon!,
            min: 0,
            max: 100,
            divisions: self.typeCupon! ? 20 : 100,
            label: self.sliderCupon!.round().toString(),
            onChanged: (double value) {
              self.sliderCupon = value.toPrecision(0);
            },
          ),
        ),
      ],
    );
  }

  /// Seleccion de tipo de partida
  Widget _buildSelectTipoPartidaCheck() {
    return SizedBox(
      width: context.w,
      child: Column(
        children: [
          5.0.sh,
          Text(
            'Tipo de Partida:',
            style: MyTheme.labelMedium.override(
              fontFamily: 'Readex Pro',
              fontSize: 16,
              letterSpacing: 0,
            ),
          ),
          5.0.sh,
          FlutterFlowChoiceChips<bool>(
            options: const [
              ChipData<bool>('Total', value: true),
              ChipData<bool>('Parcial', value: false)
            ],
            onChanged: (val) {
              self.typeCupon = val != null ? val[0] : false;
              self.sliderCupon = 0.0;
            },
            selectedChipStyle: ChipStyle(
              backgroundColor: Colores.verdeCheck,
              textStyle: MyTheme.bodyMedium.override(
                fontFamily: 'Readex Pro',
                color: MyTheme.primaryText,
                letterSpacing: 0,
              ),
              iconColor: MyTheme.primaryText,
              iconSize: 18,
              elevation: 0,
              borderColor: Colores.verdeBorderCheck,
              borderWidth: 2,
              borderRadius: BorderRadius.circular(6),
            ),
            unselectedChipStyle: ChipStyle(
              backgroundColor: MyTheme.primaryBackground,
              textStyle: MyTheme.bodyMedium.override(
                fontFamily: 'Readex Pro',
                color: MyTheme.secondaryText,
                letterSpacing: 0,
              ),
              iconColor: MyTheme.secondaryText,
              iconSize: 20,
              elevation: 0,
              borderColor: MyTheme.alternate,
              borderWidth: 2,
              borderRadius: BorderRadius.circular(8),
            ),
            chipSpacing: 15,
            rowSpacing: 12,
            multiselect: false,
            alignment: WrapAlignment.start,
            controller: FormFieldController<List<bool>>(
              [],
            ),
            wrapped: true,
          ),
        ],
      ),
    );
  }

  /// Seleccionar Deporte
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
                    // Positioned(
                    //     left: position.dx,
                    //     top: position.dy,
                    //     child: SelectMultiBono(
                    //         width: itemBox.size.width,
                    //         height: itemBox.size.height)
                    //         ),
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

  Widget _buildColumnDatos() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                ..._buildListCrearBono(),
              ],
            ),
          ),
        ),
        Container(
          constraints: const BoxConstraints(
            maxWidth: 770,
          ),
          decoration: const BoxDecoration(),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 12),
            child: FFButtonWidget(
              onPressed: () async {
                if (_model.formKey.currentState == null ||
                    !_model.formKey.currentState!.validate()) {
                  return;
                }
              },
              text: 'Generar Códigos',
              options: FFButtonOptions(
                width: double.infinity,
                height: 48,
                padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                color: MyTheme.primary,
                textStyle: MyTheme.titleSmall.override(
                  fontFamily: 'Readex Pro',
                  color: Colors.white,
                  letterSpacing: 0,
                ),
                elevation: 3,
                borderSide: const BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
