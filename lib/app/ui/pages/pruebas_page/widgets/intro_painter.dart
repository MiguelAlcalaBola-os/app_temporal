import 'package:flutter/material.dart';
import 'responsive.dart';

class IntroPainter extends CustomPainter {
  final BuildContext context;
  late Responsive responsive;

  IntroPainter(this.context) {
    responsive = Responsive(context);
  }

  @override
  void paint(Canvas canvas, Size size) {
    // Fondo gris
    final fondoGris = Paint()
      ..strokeWidth = 1
      ..color = const Color(0xffE6E6E6);
    final a = Offset(0, responsive.safeBlockVertical);
    final b = Offset(responsive.screenWidth, responsive.screenHeight);
    final rect = Rect.fromPoints(a, b);

    // Dibujo del fondo gris
    canvas.drawRect(rect, fondoGris);

    // Crear el path del recuadro blanco
    Path pathWhiteBox = Path();
    pathWhiteBox.moveTo(-200, responsive.screenHeight * 0.6);
    pathWhiteBox.lineTo(responsive.screenWidth, -200);
    pathWhiteBox.lineTo(
        responsive.screenWidth, responsive.screenHeight * 0.065);
    pathWhiteBox.lineTo(-50, responsive.screenHeight * 0.71);
    pathWhiteBox.close();

    Paint paintWhiteBox = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

// Dibujar el recuadro
    canvas.drawPath(pathWhiteBox, paintWhiteBox);

    // Definir el Paint para la línea roja
    Paint paintRedLine = Paint()
      ..color = const Color(0xffC22820)
      ..strokeWidth = 4;

    Offset startLine = Offset(-50, responsive.screenHeight * 0.71);
    Offset endLine =
        Offset(responsive.screenWidth, responsive.screenHeight * 0.065);

    // Dibujar la línea roja
    canvas.drawLine(startLine, endLine, paintRedLine);

    // Segundo triángulo (espejo del primero)
    canvas.save();

    Path pathMirror = Path();
    pathMirror.moveTo(0, 0);
    pathMirror.lineTo(
        responsive.screenWidth * responsive.blockSizeHorizontal / 5, 0);
    pathMirror.lineTo(-35, responsive.screenHeight * 0.45);
    pathMirror.close();

    Paint paintMirror = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFF003366),
          Color(0xff1485C1),
          Color(0xFF336699),
        ],
        stops: [0.0, 0.3, 1.0],
      ).createShader(rect);

    canvas.drawPath(pathMirror, paintMirror);
    canvas.restore();
    canvas.save();

    //TODO:  Líneas ajustadas para alinearse con la curva y la línea roja
    /* Dibujar todas las lineas desde el centro a las orillas */

    for (int i = 0; i < 100; i++) {
      double opacity = 1;
      /* Espacio entre las lineas */
      const spaceLine = 5.0;

      final paint = Paint()
        ..strokeWidth = responsive.getSafeBlockSizeVertical(0.1)
        ..color = const Color(0xff5597FD).withOpacity(opacity)
        ..style = PaintingStyle.stroke;

      // Ajustar las coordenadas para que las líneas se alineen con la curva y la línea roja
      final pathDemo = Path()
        ..moveTo((responsive.screenWidth + 38) - (spaceLine * i),
            0) /* Linea posicion arriba */
        ..lineTo((responsive.screenWidth * 0.4) - (spaceLine * i),
            responsive.screenHeight * 0.4) /* Posicion central de la linea */
        ..lineTo((responsive.screenWidth + 70) - (spaceLine * i),
            responsive.screenHeight); /* Posicion final de la linea */

      canvas.drawPath(pathDemo, paint);
    }

    canvas.restore();
    //END TODO: Fin de las líneas

    // Primer triángulo
    canvas.save();
    canvas.translate(responsive.screenWidth / 2, responsive.screenHeight);
    canvas.rotate(180);
    canvas.translate(
        -responsive.screenWidth / 3, -responsive.screenHeight / 2.2);

    Path path = Path();
    path.moveTo(responsive.screenWidth / 2, 0);
    path.lineTo(responsive.screenWidth * responsive.blockSizeHorizontal / 5,
        responsive.screenHeight);
    path.lineTo(-100, responsive.screenHeight);
    path.close();

// Definir el degradado y pintar el triángulo
    Paint paintT = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.bottomRight,
        end: Alignment.topLeft,
        colors: [Color(0xff1485C1), Color(0xFF336699), Color(0xFF003366)],
        stops: [0.0, 0.4, 1.0],
      ).createShader(rect);

// Dibujar el triángulo de abajo
    canvas.drawPath(path, paintT);
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
