import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/app/routes/app_pages.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_theme.dart';
import 'not_found_c.dart';

class NotFoundPage extends GetView<NotFoundController> {
  const NotFoundPage({super.key});
  NotFoundController get self => controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PositionedTransition(
            rect: self.relativeRectTween.animate(self.anim),
            child: Image.asset('assets/images/logo_min_size.gif'),
          ),
          Positioned(
            top: 150,
            bottom: 0,
            left: 24,
            right: 24,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  '404',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 50,
                      letterSpacing: 2,
                      color: Color(0xff2f3640),
                      fontFamily: 'Anton',
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Lo sentimos, nosotros no pudimos encontrar la pagina!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    color: Color(0xff2f3640),
                  ),
                ),
                MaterialButton(
                  color: Colors.blue,
                  onPressed: () => Get.offAllNamed(Routes.LOGIN_USUARIO),
                  splashColor: Colors.blueGrey,
                  child: Text('Login',
                      style: LightModeTheme()
                          .bodyLarge
                          .copyWith(color: Colors.white)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
