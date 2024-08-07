import 'package:flutter/material.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_theme_modify.dart';
import 'package:reservatu_pista/utils/colores.dart';

class HorizontalCouponExample2 extends StatelessWidget {
  const HorizontalCouponExample2({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xfff1e3d3);

    return CouponCard(
        width: 50,
        height: 30,
        backgroundColor: Colores.azul,
        clockwise: true,
        curvePosition: 135,
        curveRadius: 10,
        curveAxis: Axis.vertical,
        borderRadius: 5,
        firstChild: Padding(
          padding: const EdgeInsets.all(2.0),
          child: CouponCard(
            width: 50 - 10,
            height: 30 - 10,
            backgroundColor: Colors.white,
            clockwise: true,
            curvePosition: 135,
            curveRadius: 10,
            curveAxis: Axis.vertical,
            borderRadius: 5,
            firstChild: Container(
              decoration: const BoxDecoration(
                  // color: Colores.azul,
                  ),
              child: Center(
                child: Text('100%', style: MyTheme.bodyMedium),
              ),
            ),
          ),
        ));
  }
}

/// Provides a coupon card widget
class CouponCard extends StatelessWidget {
  /// Creates a vertical coupon card widget that takes two children
  /// with the properties that defines the shape of the card.
  const CouponCard({
    Key? key,
    required this.firstChild,
    this.width,
    this.height = 150,
    this.borderRadius = 8,
    this.curveRadius = 20,
    this.curvePosition = 100,
    this.curveAxis = Axis.horizontal,
    this.clockwise = false,
    this.backgroundColor,
    this.decoration,
    this.shadow,
    this.border,
  }) : super(key: key);

  /// The small child or first.
  final Widget firstChild;

  final double? width;

  final double height;

  /// Border radius value.
  final double borderRadius;

  /// The curve radius value, which specifies its size.
  final double curveRadius;

  /// The curve position, which specifies the curve position depending
  /// on the its child's size.
  final double curvePosition;

  /// The direction of the curve, whether it's set vertically or
  /// horizontally.
  final Axis curveAxis;

  /// If `false` (by default), then the border radius will be drawn
  /// inside the child, otherwise outside.
  final bool clockwise;

  /// The background color value.
  ///
  /// Ignored if `decoration` property is used.
  final Color? backgroundColor;

  /// The decoration of the entire widget
  ///
  /// Note: `boxShadow` property in the `BoxDecoration` won't do an effect,
  /// and you should use the `shadow` property of `CouponCard` itself instead.
  final Decoration? decoration;

  /// A shadow applied to the widget.
  ///
  /// Usage
  /// ```dart
  /// CouponCard(
  ///   shadow: BoxShadow(
  ///     color: Colors.black56,
  ///     blurRadius: 10,
  ///   ),
  /// )
  /// ```
  final Shadow? shadow;

  /// A custom border applied to the widget.
  ///
  /// Usage
  /// ```dart
  /// CouponCard(
  ///   border: BorderSide(
  ///     width: 2,
  ///     color: Colors.black,
  ///   ),
  /// )
  /// ```
  final BorderSide? border;

  @override
  Widget build(BuildContext context) {
    final clipper = CouponClipper(
      borderRadius: borderRadius,
      clockwise: clockwise,
    );

    return ClipPath(
      clipper: clipper,
      child: Container(
          width: width,
          height: height,
          decoration: decoration ??
              BoxDecoration(color: backgroundColor ?? Colores.azul),
          child: firstChild),
    );
  }
}

class CouponDecorationPainter extends CustomPainter {
  final Shadow? shadow;
  final BorderSide? border;
  final CustomClipper<Path> clipper;

  CouponDecorationPainter({
    this.shadow,
    this.border,
    required this.clipper,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (shadow != null) {
      final paintShadow = shadow!.toPaint();
      final pathShadow = clipper.getClip(size).shift(shadow!.offset);
      canvas.drawPath(pathShadow, paintShadow);
    }

    if (border != null) {
      final paintBorder = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = border!.width
        ..color = border!.color;
      final pathBorder = clipper.getClip(size);
      canvas.drawPath(pathBorder, paintBorder);
    }
  }

  @override
  bool shouldRepaint(CouponDecorationPainter oldDelegate) =>
      this != oldDelegate;

  @override
  bool shouldRebuildSemantics(CouponDecorationPainter oldDelegate) =>
      this != oldDelegate;
}

/// Clips a widget to the form of a coupon card shape
class CouponClipper extends CustomClipper<Path> {
  /// Paints a coupon shape around any widget.
  ///
  /// Usage:
  /// ```dart
  /// ClipPath(
  ///   clipper: CouponClipper(
  ///     // optional (defaults to TextDirection.ltr), works when
  ///     // curveAxis set to Axis.vertical
  ///     direction: Directionality.of(context),
  ///   ),
  ///   // width and height are important depending on the type
  ///   // of the text direction
  ///   child: Container(
  ///     width: 350,
  ///     height: 400,
  ///     color: Colors.purple,
  ///   ),
  /// ),
  /// ```
  const CouponClipper({
    this.borderRadius = 8,
    this.clockwise = false,
  });

  /// Border radius value.
  final double borderRadius;

  /// If `false` (by default), then the border radius will be drawn
  /// inside the child, otherwise outside.
  final bool clockwise;

  @override
  Path getClip(Size size) {
    final Radius arcRadius = Radius.circular(borderRadius);

    // border radius arc points
    final Offset bottomLeftArc = Offset(borderRadius, size.height);
    final Offset bottomRightArc =
        Offset(size.width, size.height - borderRadius);
    final Offset topRightArc = Offset(size.width - borderRadius, 0);
    final Offset topLeftArc = Offset(0, borderRadius);

    final Path path = Path();

    // left line, bottom left arc
    path.lineTo(0, size.height - borderRadius);
    path.arcToPoint(bottomLeftArc, radius: arcRadius, clockwise: clockwise);

    // bottom line, bottom right arc
    path.lineTo(size.width - borderRadius, size.height);
    path.arcToPoint(bottomRightArc, radius: arcRadius, clockwise: clockwise);

    // right line, top right arc
    path.lineTo(size.width, borderRadius);
    path.arcToPoint(topRightArc, radius: arcRadius, clockwise: clockwise);

    // top line, top left arc
    path.lineTo(borderRadius, 0);
    path.arcToPoint(topLeftArc, radius: arcRadius, clockwise: clockwise);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => oldClipper != this;
}
