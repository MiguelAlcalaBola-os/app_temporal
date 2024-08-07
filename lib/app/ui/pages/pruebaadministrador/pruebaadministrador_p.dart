import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pruebaadministrador_c.dart';

class PruebaAdministradorPage extends GetView<PruebaAdministradorController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PruebaAdministradorPage'),
      ),
      body: Column(
        children: [
          SafeArea(
            child: Text('PruebaAdministradorController'),
          ),
          MaterialButton(
            color: Colors.blue,
            onPressed: () => {},
            splashColor: Colors.blueGrey,
            child: Text(
              'OK',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
