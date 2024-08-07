import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:reservatu_pista/app/pages/usuario/registrar_usuario/registrar_usuario_c.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_util.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_animations.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_theme.dart';
import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:reservatu_pista/utils/btn_icon.dart';
import 'package:reservatu_pista/utils/colores.dart';
import 'package:reservatu_pista/library/page_general.dart';

class FavoritosReservarPista extends StatelessWidget {
  FavoritosReservarPista(
      {super.key,
      this.validator,
      this.padding,
      required this.labelText,
      this.anim,
      required this.maxLength,
      this.keyboardType,
      required this.textEditingController,
      this.isSelect = false,
      this.onValidate,
      this.listSelect,
      this.inputFormatters,
      this.enabled = true,
      this.isRequired = true,
      this.suffixIcon,
      this.prefixIcon,
      this.errorStyle,
      this.obscureText = false,
      this.isFocusNode = false,
      this.prefixIconColor,
      this.listSelectMultiType,
      this.onChanged});

  final String? Function(String?)? validator;
  final EdgeInsetsGeometry? padding;
  final String labelText;
  final bool isSelect;
  final AnimationController? anim;
  final int maxLength;
  final List<String>? listSelect;
  final TextInputType? keyboardType;
  final FocusNode focusNode = FocusNode();
  final TextEditingController textEditingController;
  final bool isRequired;
  final bool isFocusNode;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? onValidate;
  final bool enabled;
  final Widget? suffixIcon;
  final void Function(String)? onChanged;
  final Widget? prefixIcon;
  final TextStyle? errorStyle;
  final bool obscureText;
  final Color? prefixIconColor;
  final List<SelectMultiType>? listSelectMultiType;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      animValidate(Padding(
          padding: padding ??
              const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
          child: isSelect ? _buildSelect() : _buildInputOrSelect(false))),
      Visible(
        isVisible: isRequired,
        child: const Positioned(
            right: 10,
            top: 10,
            child: Text(
              "*",
              style: TextStyle(fontSize: 20, color: Colores.rojo),
            )),
      ),
    ]);
  }

  Widget animValidate(Widget child) {
    return anim != null
        ? VibratingWidget(controller: anim!, child: child)
        : child;
  }

  String? validateTextField(String? text) {
    if (text == null || text.isEmpty) {
      if (isFocusNode) {
        focusNode.requestFocus();
        showOkAlertDialog(
          context: Get.context!,
          title: '"ReservatuPista" Me gustaría saber tu ubicación',
          message:
              '''La aplicación necesita acceder a tu ubicación para proporcionarte servicios basados en la ubicación, 
      como encontrar pistas cercanas, obtener direcciones y mejorar tu experiencia de usuario. 
      Tu ubicación se utilizará únicamente dentro de la aplicación y no será compartida con terceros sin tu consentimiento. 
      Al permitir el acceso a tu ubicación, podrás disfrutar plenamente de todas las funciones de la aplicación.''',
          barrierDismissible: false,
        );
      }
      if (anim != null) anim!.forward();
      return '';
    }
    return onValidate == null ? null : onValidate!(text);
  }

  Widget _buildSelect() {
    return Builder(
        builder: (context) => _buildInputOrSelect(true, context: context));
  }

  /// Contruir input or select
  Widget _buildInputOrSelect(bool isSelect, {BuildContext? context}) {
    return TextFormField(
      controller: textEditingController,
      focusNode: focusNode,
      maxLength: maxLength,
      keyboardType: keyboardType,
      obscureText: obscureText,
      enabled: enabled,
      decoration: InputDecoration(
        counterText: '',
        errorStyle: const TextStyle(fontSize: 0),
        labelText: labelText,
        hintStyle: LightModeTheme().bodyMedium.override(
              fontFamily: 'Readex Pro',
              color: const Color(0xFF95A1AC),
            ),
        disabledBorder: _buildBorder(Colores.usuario.primary160),
        enabledBorder: _buildBorder(LightModeTheme().primary),
        focusedBorder: _buildBorder(LightModeTheme().primary),
        errorBorder: _buildBorder(LightModeTheme().error),
        focusedErrorBorder: _buildBorder(LightModeTheme().error),
        suffixIcon: const Icon(
          Icons.arrow_drop_down,
          size: 30,
        ),
        prefixIconColor: prefixIconColor,
        filled: true,
        fillColor: LightModeTheme().secondaryBackground,
        contentPadding:
            const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
      ),
      style: LightModeTheme().bodyMedium,
      inputFormatters: inputFormatters,
      onTap: isSelect ? () => _onTapSelect(context) : null,
      onChanged: onChanged,
      validator: validator ?? (isRequired ? validateTextField : null),
    );
  }

  OutlineInputBorder _buildBorder(Color color) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: color,
        width: 2.0,
      ),
      borderRadius: BorderRadius.circular(8.0),
    );
  }

  void _onTapSelect(context) {
    final RenderBox itemBox = context.findRenderObject() as RenderBox;
    final position = itemBox.localToGlobal(Offset.zero);
    Get.dialog(
        Stack(
          children: [
            Positioned(
                left: position.dx,
                top: position.dy + 5.0,
                child: SelectMulti(
                  width: itemBox.size.width,
                  height: itemBox.size.height,
                  listSelectMultiType: listSelectMultiType!,
                )),
          ],
        ),
        barrierColor: Colors.transparent);
  }
}

class SelectMulti extends StatefulWidget {
  const SelectMulti(
      {super.key,
      required this.width,
      required this.height,
      required this.listSelectMultiType});
  final double width;
  final double height;
  final List<SelectMultiType> listSelectMultiType;

  @override
  SelectMultiState createState() => SelectMultiState();
}

class SelectMultiState extends State<SelectMulti>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _heightAnimation;
  final Set<int> selectedIndices = {};

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _heightAnimation =
        Tween<double>(begin: 0, end: 200).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    // Iniciar la animación al construir el widget
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _heightAnimation,
      builder: (context, child) {
        return Container(
          width: widget.width,
          height: 200,
          decoration: BoxDecoration(
            color: LightModeTheme().secondaryBackground,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: LightModeTheme().primary, width: 2),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: _buildListSelect(),
            ),
          ),
        );
      },
    );
  }

  List<Widget> _buildListSelect() {
    // return [_buildSelect(SelectMultiType('Pista 1', value: 1))];
    return List.generate(
        10, (index) => _buildSelect(SelectMultiType('Padel ', value: index)));
  }

  Widget _buildSelect(SelectMultiType selectMultiType) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 16.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            selectMultiType.title,
            style: LightModeTheme().bodyMedium.override(
                fontFamily: 'Readex Pro',
                letterSpacing: 0,
                decoration: TextDecoration.none),
          ),
          Row(
            children: [
              Obx(() => _buildCheck(selectMultiType)),
              const SizedBox(
                width: 30,
              ),
            ],
          ),
        ],
      ),
    );
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

class SelectMultiType<T> {
  SelectMultiType(
    this.title, {
    required this.value,
  });
  final String title;
  final T value;
  final changeCheck = false.obs;
}
