import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:get/get.dart';
import 'datos_server.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

abstract class ImageNodeProvider {
  static Future<bool> subirImageFile(File imageFile,
      {required String destination, required String nameFoto}) async {
    try {
      final url = Uri.parse(
          '${DatosServer.urlServer}/subir_imagen'); // Reemplaza con la URL del servidor

      // Crear una solicitud multipart
      var request = http.MultipartRequest(
        'POST',
        url,
      );

      // Agregar campos de formulario (destination y foto)
      request.fields['destination'] =
          destination; // Reemplaza con tu valor real
      request.fields['nameFoto'] = nameFoto; // Reemplaza con tu valor real
      // Adjuntar el archivo de imagen a la solicitud
      request.files.add(await http.MultipartFile.fromPath(
        'image', // Nombre del campo en el servidor
        imageFile.path,
        contentType: MediaType('image',
            'png'), // Ajusta según el tipo de imagen que estás subiendo
      ));

      /// Response Al enviar imagen
      final response = await request.send();
      if (response.statusCode == 200) {
        // Éxito, la imagen fue subida exitosamente
        print('Imagen subida correctamente');
        return true;
      } else {
        // Manejar el caso en el que la carga no fue exitosa
        print(
            'Error al subir la imagen. Código de estado: ${response.statusCode}');
        print(await response.stream.bytesToString());
      }
    } catch (error) {
      print('Error al subir la imagen: $error');
    }
    return false;
  }

  static Future<bool> subirImageBytes(Uint8List bytesDeImagen,
      {required String destination, required String nameFoto}) async {
    try {
      // Convertir los bytes de la imagen a base64
      final base64Image = base64Encode(bytesDeImagen);

      // Crear el cuerpo de la solicitud con los bytes de la imagen
      final body = {
        'imagen': base64Image,
        'destination': destination,
        'nameFoto': nameFoto
      };

      // Realizar la solicitud POST al servidor
      final response = await GetConnect().post(
        '${DatosServer.urlServer}/subir_imagen_bytes',
        body,
      );

      // Verificar si la solicitud fue exitosa
      if (response.statusCode == 200) {
        print('La imagen se ha enviado correctamente.');
        return true;
      } else {
        print(
            'Error al enviar la imagen. Código de estado: ${response.statusCode}');
      }
    } catch (error) {
      print('Error al enviar la imagen: $error');
    }
    return false;
  }
}
