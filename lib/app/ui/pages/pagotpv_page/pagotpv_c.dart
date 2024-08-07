import 'dart:convert';

import 'package:get/get.dart';

import 'package:http/http.dart' as http;

class PagoTpvController extends GetxController {
  final _htmlContent = ''.obs;
  get htmlContent => _htmlContent.value;
  set htmlContent(value) => _htmlContent.value = value;
  Future<dynamic> pagarTpv() async {
    try {
      final url = Uri.parse('https://tpv.modularbox.com/pago_tpv');
      var request = http.post(url,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "cantidad": 2000,
          }));

      // Enviar la solicitud
      var response = await request;
      if (response.statusCode == 200) {
        htmlContent = response.body;
        print(response.body);
      } else {
        print(response.body);
      }
    } catch (error) {
      print('Error al usuario anadida: $error');
    }
  }
}
