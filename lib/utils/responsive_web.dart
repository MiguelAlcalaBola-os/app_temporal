import 'package:flutter/material.dart';

class ResponsiveWeb extends StatelessWidget {
  final Widget child;
  const ResponsiveWeb({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width >= 640) {
      return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Container(
            width: 640,
            constraints: const BoxConstraints(
                minWidth: 500, // Ajusta este valor según tus necesidades
                maxWidth: 900),
            child: child,
          ),
        ),
      );
    }
    return child;
  }
}
