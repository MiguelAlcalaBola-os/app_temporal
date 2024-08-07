import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'pagotpv_c.dart';
import 'widgets/tpv_web.dart';

import 'package:http/http.dart' as http;

class PagoTpvPage extends GetView<PagoTpvController> {
  PagoTpvController get self => controller;
  @override
  Widget build(BuildContext context) {
    return MyHomePage(
      title: 'hgvhjgvhjv',
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('PagoTpvPage'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            MaterialButton(
              color: Colors.blue,
              onPressed: () async => {await self.pagarTpv()},
              splashColor: Colors.blueGrey,
              child: Text(
                'TPV  Monto: 20.00 €',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
            Obx(() => self.htmlContent == ''
                ? Text("No hay pagina")
                : TPVPage(htmlContent: self.htmlContent)),
          ],
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String claveEncriptacion = "1YQ1WLLM";
  String merchantID = "243034469";
  String acquirerBIN = "0000270488";
  String terminalID = "00000003";
  String numeroOperacion = "0";
  String tipoMoneda = "978";
  String exponente = "2";
  String cifrado = "SHA2";
  String urlOK = "https://pgw.ceca.es/ok";
  String urlNOK = "https://pgw.ceca.es/nok";
  String amount = "";
  String firma = "";
  String strFirma = "";
  String htmlContent = '''
<HTML>
    <HEAD>
      <TITLE>P&aacute;gina de pago</TITLE>
    </HEAD>
    <BODY style="background:black;">
      <FORM id="form" ACTION="https://tpv.ceca.es/tpvweb/tpv/compra.action" METHOD="POST"
      ENCTYPE="application/x-www-form-urlencoded">
        <INPUT NAME="MerchantID" TYPE=hidden VALUE="243034469">
        <INPUT NAME="AcquirerBIN" TYPE=hidden VALUE="0000270488">
        <INPUT NAME="TerminalID" TYPE=hidden VALUE="00000003">
        <INPUT NAME="URL_OK" TYPE=hidden VALUE="https://pgw.ceca.es/ok">
        <INPUT NAME="URL_NOK" TYPE=hidden VALUE="https://pgw.ceca.es/nok">
        <INPUT NAME="Firma" TYPE=hidden VALUE="a93596eca7911f0557bb213a237bdc049dfb0f58e3cee671fce630f4d488c499">
        <INPUT NAME="Cifrado" TYPE=hidden VALUE="SHA2">
        <INPUT NAME="Num_operacion" TYPE=hidden VALUE="11111">
        <INPUT NAME="Importe" TYPE=hidden VALUE="2000">
        <INPUT NAME="TipoMoneda" TYPE=hidden VALUE="978">
        <INPUT NAME="Exponente" TYPE=hidden VALUE="2">
        <INPUT NAME="Pago_soportado" TYPE=hidden VALUE="SSL">
        <INPUT NAME="Idioma" TYPE=hidden VALUE="1">
        <INPUT NAME="datos_acs_20" TYPE=hidden VALUE="">
        <INPUT NAME="firma_acs_20" TYPE=hidden VALUE="">
        <INPUT TYPE="submit" VALUE="Comprar">
      </FORM>
    </BODY>
    </HTML>
    ''';

  @override
  void initState() {
    super.initState();
    cargarTPV();
  }

  Future<void> cargarTPV() async {
    final response = await obtenerTPV();
    setState(() {
      //htmlContent = response;
      return;
    });
  }

  void _incrementCounter() {
    setState(() {
      //_counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            MaterialButton(
              color: Colors.blue,
              onPressed: () => Get.back(),
              splashColor: Colors.blueGrey,
              child: Text(
                'Regresar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Column(
                children: [
                  Text("Ir a pago."),
                  Text("Monto: 10.00 €."),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: launchWhatsApp,
        tooltip: 'Increment',
        child: Text('Pagar'),
      ),
    );
  }

  void launchWhatsApp() async {
    String url = "https://tpv.modularbox.com/pago_tpv?cantidad=1000";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'No se pudo abrir WhatsApp.';
    }
  }
}

Future<int> obtenerTPV() async {
  const claveEncriptacion = "1YQ1WLLM";
  const merchantID = "243034469";
  const acquirerBIN = "0000270488";
  const terminalID = "00000003";
  const numeroOperacion = "222";
  const importe = "2000";
  const tipoMoneda = "978";
  const exponente = "2";
  const cifrado = "SHA2";
  const urlOK = "http://www.ceca.es";
  const urlNOK = "http://www.ceca.es";
  final bytes = utf8.encode(
      "$claveEncriptacion$merchantID$acquirerBIN$terminalID$numeroOperacion$importe$tipoMoneda$exponente$cifrado$urlOK$urlNOK");
// data being hashed

  final firma = sha256.convert(bytes).toString();
  print(firma);
  final url = Uri.parse('https://tpv.ceca.es/tpvweb/tpv/compra.action');
  final response = await http.post(
    url,
    body: {
      'MerchantID': merchantID,
      'AcquirerBIN': acquirerBIN,
      'TerminalID': terminalID,
      'URL_OK': urlOK,
      'URL_NOK': urlNOK,
      'Firma': firma,
      'Cifrado': cifrado,
      'Num_operacion': numeroOperacion,
      'Importe': importe,
      'TipoMoneda': tipoMoneda,
      'Exponente': exponente,
      'Pago_soportado': 'SSL',
      'Idioma': '1',
      'datos_acs_20': '',
      'firma_acs_20': ' ',
    },
  );

  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
  print("firma as hex string: $firma");

  return response.statusCode;
}
