import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;
import '../../../../../utils/colores.dart';
import '/flutter_flow/flutter_flow_theme.dart';

class InputClubFavorito extends FormField<String> {
  InputClubFavorito({
    super.key,
    this.controller,
    this.icon,
    this.changeIcon = false,
    this.labelText,
    this.labelStyle,
    this.errorStyle,
    this.hintText,
    this.dialogTitle,
    this.dialogSearchHint,
    this.dialogCancelBtn,
    this.enableSearch = false,
    this.itemsDD,
    this.hint,
    this.itemTextstyle,
    this.itemWidth,
    this.boxHeight,
    this.boxWidth,
    this.boxPadding,
    this.boxTextstyle,
    this.onBoxStateChanged,
    this.boxDecoration,
    this.dropdownColor,
    this.elevation = 8,
    this.enableInput,
    this.isDense = false,
    this.readOnly = true,
    this.enableInteractiveSelection = false,
    required this.context,
    required this.clubsFavoritos,
    this.onValidator,
    this.inputFormatters,
    FocusNode? focusNode,
    TextInputType? keyboardType,
    int? maxLength,
    String? Function(String?)? validator,
    required this.onChanged,
  }) : super(
          initialValue: controller!.text,
          builder: (FormFieldState<String> field) {
            final _InputClubFavoritoState state =
                field as _InputClubFavoritoState;

            // void onChangedHandler(String value) {
            //   onChanged(value);
            //   field.didChange(value);
            // }
            bool searchStar() {
              for (var i = 0; i < itemsDD!.length; i++) {
                if (itemsDD[i] == controller.text && clubsFavoritos[i]) {
                  print("Si es igual");

                  return true;
                }
              }
              return false;
            }

            Widget buildField(lfOnTap) {
              return SizedBox(
                height: 45,
                child: TextFormField(
                  controller: controller,
                  focusNode: focusNode,
                  // autofocus: true,
                  obscureText: false,
                  decoration: InputDecoration(
                    counterText: '',
                    labelText: labelText,
                    labelStyle: LightModeTheme().labelMedium,
                    hintStyle: LightModeTheme().labelMedium,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: LightModeTheme().alternate,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colores.usuario.primary69,
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
                    suffixIcon: SizedBox(
                      width: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          searchStar()
                              ? Icon(
                                  Icons.star,
                                  color: Colors.yellow.shade400,
                                  size: 30,
                                )
                              : const SizedBox(),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: Icon(
                              Icons.arrow_drop_down,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                    contentPadding: const EdgeInsetsDirectional.fromSTEB(
                        16.0, 12.0, 16.0, 12.0),
                  ),
                  style: LightModeTheme().bodyMedium,
                  cursorColor: LightModeTheme().primary,
                  maxLength: maxLength,
                  keyboardType: keyboardType,
                  // onChanged: onChangedHandler,
                  onTap: lfOnTap,
                  readOnly: readOnly,
                  enableInteractiveSelection: enableInteractiveSelection,
                  enabled: itemsDD!.isNotEmpty,
                  inputFormatters: inputFormatters,
                  validator: onValidator,
                ),
              );
            }

            return buildField(state._handleTap);
          },
        );
  final String? Function(String?)? onValidator;
  final BuildContext context;
  final bool? enableInput;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? icon;
  final bool changeIcon;
  final bool readOnly;
  final bool enableInteractiveSelection;
  final String? labelText;
  final String? hintText;
  final TextStyle? labelStyle;
  final TextStyle? errorStyle;
  final List<bool> clubsFavoritos;

  /// The title of the dialog window.
  final String? dialogTitle;

  /// The search field hint text
  final String? dialogSearchHint;

  /// The cancel button label on dialog
  final String? dialogCancelBtn;

  final bool enableSearch;

  final void Function(
    String?,
    List<bool>,
  ) onChanged;
  final List<String>? itemsDD;

  /// printed value

  final double? itemWidth;

  /// each item width

  final double? boxHeight;

  /// whole box height

  final double? boxWidth;

  /// whole box width

  final EdgeInsetsGeometry? boxPadding;

  /// default box padding

  final TextStyle? boxTextstyle;

  /// default box text style

  final TextStyle? itemTextstyle;

  /// default each item's text style

  final Widget? hint;

  final Function(bool)? onBoxStateChanged;

  /// click item then, function triggered

  final BoxDecoration? boxDecoration;

  /// box decoration like border, borderRadius, color

  final int elevation;

  final bool isDense;

  /// The background color of the dropdown.
  ///
  /// If it is not provided, the theme's [Colors.white] will be used
  /// instead.
  final Color? dropdownColor;

  @override
  _InputClubFavoritoState createState() => _InputClubFavoritoState();
}

class _InputClubFavoritoState extends FormFieldState<String> {
  TextEditingController? _stateController;

  @override
  InputClubFavorito get widget => super.widget as InputClubFavorito;

  TextEditingController? get _effectiveController =>
      widget.controller ?? _stateController;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _handleTap() {
    final RenderBox itemBox = context.findRenderObject() as RenderBox;
    final Rect itemRect = itemBox.localToGlobal(Offset.zero) & itemBox.size;
    final TextDirection textDirection = Directionality.of(context);
    final EdgeInsetsGeometry menuMargin =
        ButtonTheme.of(context).alignedDropdown
            ? _kAlignedMenuMargin
            : _kUnalignedMenuMargin;

    var _dropdownRoute = _DropdownRoute<String>(
      itemWidth: itemBox.size.width,
      clubsFavoritos: widget.clubsFavoritos,
      onChanged: (val, favorito) {
        if (val != null) {
          _effectiveController!.text = val;
          didChange(_effectiveController?.text);
          didChange(val);
        }
        widget.onChanged(val, favorito);
      },
      items: List.generate(
          widget.itemsDD!.length,
          (index) => DropdownMenuItem<String>(
                value: widget.itemsDD![index],
                child: Text(widget.itemsDD![index],
                    style: LightModeTheme().labelMedium),
              )),
      buttonRect: menuMargin.resolve(textDirection).inflateRect(itemRect),
      padding: _kMenuItemPadding.resolve(textDirection),
      selectedIndex: -1,
      elevation: widget.elevation,
      dropdownColor: widget.dropdownColor,
      style: widget.itemTextstyle ?? const TextStyle(),
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    );

    Navigator.push(context, _dropdownRoute);
  }
}

const Duration _kDropdownMenuDuration = Duration(milliseconds: 300);

/// *[_kDropdownMenuDuration] which is dropdown button's drop down duration.

const double _kMenuItemHeight = 48.0;

/// *[_kMenuItemHeight] which is dropdown item's default height

const EdgeInsets _kMenuItemPadding = EdgeInsets.symmetric(horizontal: 10.0);

/// *[_kMenuItemPadding] which is dropdown item's default padding.

const EdgeInsets _kAlignedMenuMargin = EdgeInsets.zero;

/// *[_kAlignedMenuMargin] which is dropdown item's default margin

const EdgeInsetsGeometry _kUnalignedMenuMargin =
    EdgeInsetsDirectional.only(start: 16.0, end: 24.0);

/// *[_kAlignedMenuMargin] which is dropdown item's default margin for align rule.

class _DropdownMenuPainter extends CustomPainter {
  _DropdownMenuPainter({
    this.color,
    this.elevation,
    this.selectedIndex,
    this.resize,
  })  : _painter = BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(5),
                boxShadow: kElevationToShadow[elevation!])
            .createBoxPainter(),
        super(repaint: resize);

  final Color? color;

  /// *[color] which is dropdown item's background color

  final int? elevation;

  /// *[elevation] which is dropdown whole item list's elevation

  final int? selectedIndex;

  /// *[selectedIndex] which is selected item's index

  final Animation<double>? resize;

  /// *[resize] which is resized animation value

  final BoxPainter _painter;

  /// *[_painter] which is panting value

  @override
  void paint(Canvas canvas, Size size) {
    final double selectedItemOffset =
        selectedIndex! * _kMenuItemHeight + kMaterialListPadding.top;
    final Tween<double> top = Tween<double>(
      begin: selectedItemOffset.clamp(0.0, size.height - _kMenuItemHeight),
      end: 0.0,
    );

    final Tween<double> bottom = Tween<double>(
      begin:
          (top.begin! + _kMenuItemHeight).clamp(_kMenuItemHeight, size.height),
      end: size.height,
    );

    final Rect rect = Rect.fromLTRB(
        0.0, top.evaluate(resize!), size.width, bottom.evaluate(resize!));

    _painter.paint(canvas, rect.topLeft, ImageConfiguration(size: rect.size));
  }

  @override
  bool shouldRepaint(_DropdownMenuPainter oldPainter) {
    return oldPainter.color != color ||
        oldPainter.elevation != elevation ||
        oldPainter.selectedIndex != selectedIndex ||
        oldPainter.resize != resize;
  }
}

class _DropdownMenu<T> extends StatefulWidget {
  const _DropdownMenu({
    Key? key,
    this.padding,
    this.dropdownColor,
    this.route,
    this.isScroll = false,
    required this.onChanged,
    required this.clubsFavoritos,
  }) : super(key: key);

  final void Function(String?, List<bool>) onChanged;
  final _DropdownRoute<T>? route;
  final bool isScroll;
  final EdgeInsets? padding;
  final Color? dropdownColor;
  final List<bool> clubsFavoritos;

  @override
  _DropdownMenuState<T> createState() => _DropdownMenuState<T>();
}

class _DropdownMenuState<T> extends State<_DropdownMenu<T>> {
  late CurvedAnimation _fadeOpacity;
  CurvedAnimation? _resize;

  late List<bool> star;

  @override
  void initState() {
    super.initState();
    star = widget.clubsFavoritos;
    _fadeOpacity = CurvedAnimation(
      parent: widget.route!.animation!,
      curve: const Interval(0.0, 0.25),
      reverseCurve: const Interval(0.75, 1.0),
    );
    _resize = CurvedAnimation(
      parent: widget.route!.animation!,
      curve: const Interval(0.25, 0.5),
      reverseCurve: const Threshold(0.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _DropdownRoute<T> route = widget.route!;
    final double unit = 0.5 / (route.items!.length + 1.5);
    final List<Widget> children = <Widget>[];
    for (int itemIndex = 0; itemIndex < route.items!.length; ++itemIndex) {
      CurvedAnimation opacity;
      if (itemIndex == route.selectedIndex) {
        opacity = CurvedAnimation(
            parent: route.animation!, curve: const Threshold(0.0));
      } else {
        final double start = (0.5 + (itemIndex + 1) * unit).clamp(0.0, 1.0);
        final double end = (start + 1.5 * unit).clamp(0.0, 1.0);
        opacity = CurvedAnimation(
            parent: route.animation!, curve: Interval(start, end));
      }
      children.add(FadeTransition(
        opacity: opacity,
        child: Row(
          children: [
            Expanded(
              child: InkWell(
                child: Container(
                  padding: widget.padding,
                  child: route.items![itemIndex],
                ),
                onTap: () => {
                  widget.onChanged(
                      route.items![itemIndex].value!.toString(), star),
                  Navigator.pop(
                    context,
                  )
                },
              ),
            ),
            InkWell(
              child: !star[itemIndex]
                  ? const Icon(
                      Icons.star_border,
                      size: 30,
                    )
                  : Icon(
                      Icons.star,
                      color: Colors.yellow.shade400,
                      size: 30,
                    ),
              onTap: () => {
                setState(() {
                  star[itemIndex] = !star[itemIndex];
                }),
                widget.onChanged(null, star),
              },
            ),
          ],
        ),
      ));
    }
    return FadeTransition(
      opacity: _fadeOpacity,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: LightModeTheme().alternate, width: 2),
            borderRadius: const BorderRadius.all(Radius.circular(5))),
        child: CustomPaint(
          painter: _DropdownMenuPainter(
            color: widget.dropdownColor ??
                const Color.fromARGB(255, 255, 255, 255),
            elevation: 2,
            selectedIndex: route.selectedIndex,
            resize: _resize,
          ),
          child: Material(
            type: MaterialType.transparency,
            textStyle: route.style,
            child: widget.isScroll
                ? Container(
                    height: 200,
                    child: Scrollbar(
                      thumbVisibility: true,
                      child: SingleChildScrollView(
                        child: Column(
                          children: children,
                        ),
                      ),
                    ))
                : ListView(
                    padding: EdgeInsets.all(0),
                    itemExtent: _kMenuItemHeight,
                    shrinkWrap: true,
                    children: children,
                  ),
          ),
        ),
      ),
    );
  }
}

class _DropdownMenuRouteLayout<T> extends SingleChildLayoutDelegate {
  _DropdownMenuRouteLayout({
    required this.buttonRect,
    required this.menuTop,
    required this.menuHeight,
    required this.textDirection,
    required this.itemWidth,
  });
  final double? itemWidth;
  final Rect? buttonRect;
  final double menuTop;
  final double menuHeight;
  final TextDirection textDirection;
  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    final double maxHeight =
        math.max(0.0, constraints.maxHeight - 2 * _kMenuItemHeight);
    return BoxConstraints(
      minWidth: itemWidth!,
      maxWidth: itemWidth!,
      minHeight: 0.0,
      maxHeight: maxHeight,
    );
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    assert(() {
      final Rect container = Offset.zero & size;
      if (container.intersect(buttonRect!) == buttonRect) {
        assert(menuTop >= 0.0);
        assert(menuTop + menuHeight <= size.height);
      }
      return true;
    }());
    late double left;
    switch (textDirection) {
      case TextDirection.rtl:
        left = buttonRect!.right.clamp(0.0, size.width) - childSize.width;
        break;
      case TextDirection.ltr:
        left = buttonRect!.left.clamp(0.0, size.width - childSize.width);
        break;
    }
    if (left >= 10) {
      return Offset(left + 15, menuTop + 13);
    } else {
      return Offset(left + 3, menuTop + 13);
    }
  }

  @override
  bool shouldRelayout(_DropdownMenuRouteLayout<T> oldDelegate) {
    return buttonRect != oldDelegate.buttonRect ||
        menuTop != oldDelegate.menuTop ||
        menuHeight != oldDelegate.menuHeight ||
        textDirection != oldDelegate.textDirection;
  }
}

class _DropdownRouteResult<T> {
  const _DropdownRouteResult(this.result);

  final T result;

  @override
  bool operator ==(dynamic other) {
    if (other is! _DropdownRouteResult<T>) return false;
    final _DropdownRouteResult<T> typedOther = other;
    return result == typedOther.result;
  }

  @override
  int get hashCode => result.hashCode;
}

class _DropdownRoute<T> extends PopupRoute<_DropdownRouteResult<T>> {
  _DropdownRoute(
      {this.items,
      this.itemWidth,
      this.padding,
      this.buttonRect,
      this.selectedIndex,
      this.dropdownColor,
      this.elevation = 8,
      required this.onChanged,
      required this.style,
      this.barrierLabel,
      required this.clubsFavoritos});

  final List<DropdownMenuItem<T>>? items;

  final List<bool> clubsFavoritos;

  /// item's list
  final void Function(String?, List<bool>) onChanged;
  final EdgeInsetsGeometry? padding;
  final Rect? buttonRect;
  final int? selectedIndex;
  final int elevation;
  final TextStyle style;
  final Color? dropdownColor;
  ScrollController? scrollController;
  @override
  Duration get transitionDuration => _kDropdownMenuDuration;

  @override
  bool get barrierDismissible => true;

  @override
  Color? get barrierColor => null;

  @override
  final String? barrierLabel;

  final double? itemWidth;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    assert(debugCheckHasDirectionality(context));
    final double screenHeight = MediaQuery.of(context).size.height;
    final double maxMenuHeight = screenHeight - 2.0 * _kMenuItemHeight;
    final double preferredMenuHeight =
        (items!.length * _kMenuItemHeight) + kMaterialListPadding.vertical;
    final double menuHeight = math.min(maxMenuHeight, preferredMenuHeight);

    final double buttonTop = buttonRect!.top;
    final double selectedItemOffset =
        selectedIndex! * _kMenuItemHeight + kMaterialListPadding.top;
    double menuTop = (buttonTop - selectedItemOffset) -
        (_kMenuItemHeight - buttonRect!.height) / 2.0;
    const double topPreferredLimit = _kMenuItemHeight;
    if (menuTop < topPreferredLimit) {
      menuTop = math.min(buttonTop, topPreferredLimit);
    }
    double bottom = menuTop;
    final double bottomPreferredLimit = screenHeight - _kMenuItemHeight;
    if (bottom > bottomPreferredLimit) {
      bottom = math.max(buttonTop + _kMenuItemHeight, bottomPreferredLimit);
      menuTop = bottom;
    }
    if (scrollController == null) {
      double scrollOffset = 0.0;
      if (preferredMenuHeight > maxMenuHeight) {
        scrollOffset = selectedItemOffset - (buttonTop - menuTop);
      }
      scrollController = ScrollController(initialScrollOffset: scrollOffset);
    }

    final TextDirection textDirection = Directionality.of(context);
    Widget menu = _DropdownMenu<T>(
      route: this,
      padding: padding!.resolve(textDirection),
      onChanged: onChanged,
      clubsFavoritos: clubsFavoritos,
      dropdownColor: dropdownColor,
      isScroll: menuHeight >= 300,
    );

    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      removeBottom: true,
      removeLeft: true,
      removeRight: true,
      child: Padding(
        //// Padding mostrar panel de abajo importante
        padding: const EdgeInsets.only(left: 2.0),
        child: Builder(
          builder: (BuildContext context) {
            return CustomSingleChildLayout(
              delegate: _DropdownMenuRouteLayout<T>(
                itemWidth: itemWidth,
                buttonRect: buttonRect,
                menuTop: menuTop - 6,
                menuHeight: menuHeight,
                textDirection: textDirection,
              ),
              child: menu,
            );
          },
        ),
      ),
    );
  }

  void _dismiss() {
    navigator?.removeRoute(this);
  }
}
