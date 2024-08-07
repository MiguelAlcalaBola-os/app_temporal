import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class TPVPage extends StatelessWidget {
  final String htmlContent; // Aquí debes pasar el contenido HTML
  TPVPage({required this.htmlContent});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(kIsWeb ? 'Pago TPV WEB' : 'Pago TPV'),
        ),
        body: Text('TPV')
        // WebView(
        //   initialUrl: kIsWeb
        //       ? Uri.dataFromString(
        //           htmlContent,
        //           mimeType: 'text/html',
        //           encoding: Encoding.getByName('utf-8')!,
        //         ).toString()
        //       : 'https://facebook.com',
        //   onWebViewCreated: (WebViewController webViewController) {
        //     if (!kIsWeb) {
        //       // Si no es web, carga el HTML
        //       webViewController.loadUrl(Uri.dataFromString(
        //         htmlContent,
        //         mimeType: 'text/html',
        //         encoding: Encoding.getByName('utf-8')!,
        //       ).toString());
        //     }
        //   },
        // ),
        );
  }
}
