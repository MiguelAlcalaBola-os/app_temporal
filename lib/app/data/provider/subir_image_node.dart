import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'datos_server.dart';

Future<void> subirImageNode(File? imageFile,
    {String? destination, String? nameFoto, Uint8List? imageBytes}) async {
  final url = Uri.parse(
      '${DatosServer.urlServer}/subir_imagen'); // Reemplaza con la URL del servidor

  // Crear una solicitud multipart
  var request = http.MultipartRequest(
    'POST',
    url,
  );

  // Agregar campos de formulario (destination y foto)
  request.fields['destination'] = destination!; // Reemplaza con tu valor real
  request.fields['nameFoto'] = nameFoto!; // Reemplaza con tu valor real
  if (imageBytes != null) {
    print("Multipart bytes");
    request.files.add(http.MultipartFile.fromBytes(
      'image', // Nombre del campo en el servidor
      imageBytes,
      contentType: MediaType(
          'image', 'png'), // Ajusta según el tipo de imagen que estás subiendo
    ));
  } else {
    // Adjuntar el archivo de imagen a la solicitud
    request.files.add(await http.MultipartFile.fromPath(
      'image', // Nombre del campo en el servidor
      imageFile!.path,
      contentType: MediaType(
          'image', 'png'), // Ajusta según el tipo de imagen que estás subiendo
    ));
  }
}

Future<void> subirImageNodeBytes(Uint8List? imageBytes) async {
  final url = Uri.parse(
      '${DatosServer.urlServer}/subir_imagen2'); // Reemplaza con la URL del servidor
  const destination = 'usuarios';
  const nameFoto = 'namefoto';
  // Crear una solicitud multipart
  var request = http.MultipartRequest(
    'POST',
    url,
  );

  // Agregar campos de formulario (destination y foto)
  request.fields['destination'] = destination; // Reemplaza con tu valor real
  request.fields['nameFoto'] = nameFoto; // Reemplaza con tu valor real
  if (imageBytes != null) {
    print("Multipart agregar bytes");
    request.files.add(http.MultipartFile.fromBytes(
      'image', // Nombre del campo en el servidor
      imageBytes,
      contentType: MediaType(
          'image', 'png'), // Ajusta según el tipo de imagen que estás subiendo
    ));
  }

  // Enviar la solicitud
  try {
    var response = await request.send();
    if (response.statusCode == 200) {
      print(nameFoto);
      // Éxito, la imagen fue subida exitosamente
      print('Imagen subida correctamente');
      print(await response.stream.bytesToString());
    } else {
      // Manejar el caso en el que la carga no fue exitosa
      print(
          'Error al subir la imagen. Código de estado: ${response.statusCode}');
      print(await response.stream.bytesToString());
    }
  } catch (error) {
    print('Error al subir la imagen: $error');
  }
}

Future<File?> pickImage(ImageSource source) async {
  final pickedFile = await ImagePicker().pickImage(source: source);
  if (pickedFile != null) {
    return File(pickedFile.path);
  } else {
    return null;
  }
}

Future<List<File>> pickImages() async {
  List<XFile> images = await ImagePicker().pickMultiImage();
  if (images.isNotEmpty) {
    return images.map((image) => File(image.path)).toList();
  }
  return [];
}
