import 'package:flutter/material.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_theme.dart';
import 'package:reservatu_pista/utils/btn_icon.dart';

class DropList extends StatefulWidget {
  const DropList({super.key, required this.width});
  final double width;

  @override
  DropListState createState() => DropListState();
}

class DropListState extends State<DropList>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _heightAnimation;

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
        return // Generated code for this Container Widget...
            Container(
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
            color: LightModeTheme().secondaryBackground,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: LightModeTheme().primary,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: 100,
                  height: 45,
                  decoration: BoxDecoration(
                    color: LightModeTheme().secondaryBackground,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: LightModeTheme().primary,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1, 0),
                        child: Text(
                          'Hello World',
                          style: LightModeTheme().bodyMedium.override(
                                fontFamily: 'Readex Pro',
                                letterSpacing: 0,
                              ),
                        ),
                      ),
                      BtnIcon(
                        borderRadius: 20,
                        borderWidth: 0,
                        buttonSize: 40,
                        fillColor: Color(0xFFDCFF00),
                        icon: const Icon(
                          Icons.stars_outlined,
                          color: Colors.black,
                          size: 25,
                        ),
                        onPressed: () {
                          print('IconButton pressed ...');
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: LightModeTheme().secondaryBackground,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: LightModeTheme().primary,
                    ),
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(-1, 0),
                    child: Text(
                      'Hello World',
                      style: LightModeTheme().bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            letterSpacing: 0,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
