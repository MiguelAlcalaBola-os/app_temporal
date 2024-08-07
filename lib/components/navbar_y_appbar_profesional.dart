import 'package:reservatu_pista/utils/responsive_web.dart';
import 'package:reservatu_pista/utils/sizer.dart';
import '../../../components/appbar_profesional.dart';
import '/backend/schema/enums/enums.dart';
import 'nav_bar_profesional/nav_bar_profesional.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NavbarYAppbarProfesional extends StatelessWidget {
  const NavbarYAppbarProfesional(
      {super.key,
      required this.child,
      required this.title,
      this.page,
      this.isTitle = false,
      this.isTitleBack = false,
      this.isNavBar = true,
      this.bottomNavigatorBar});
  final String title;
  final bool isTitle;
  final bool isTitleBack;
  final Widget child;
  final TypePage? page;
  final bool isNavBar;
  final Widget? bottomNavigatorBar;
  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }
    final padding = MediaQuery.of(context).padding;
    final paddingTop =
        isiOS ? (padding.top > 28.0 ? 28.0 : padding.top) : padding.top;
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              paddingTop.sh,
              ResponsiveWeb(
                child: AppbarProfesional(
                  title: title,
                  isTitle: isTitle,
                  isTitleBack: isTitleBack,
                ),
              ),
              child,
            ],
          ),
          Visible(
            isVisible: isNavBar && context.isNotKeyboardVisible,
            child: ResponsiveWeb(
                child: Align(
              alignment: Alignment.bottomCenter,
              child: NavBarProfesionalWidget(
                tipoDePagina: page,
              ),
            )),
          ),
        ],
      ),
      bottomNavigationBar: bottomNavigatorBar,
    );
  }
}
