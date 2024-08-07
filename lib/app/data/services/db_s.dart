import 'package:get/get.dart';
import 'package:reservatu_pista/app/data/provider/usuario_node.dart';
import 'package:reservatu_pista/backend/storage/storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/usuario_model.dart';
import '../provider/datos_server.dart';

class DBService extends GetxService {
  // Version de la app
  final version = '2.2.33';
  // final version = '%Version';
  // Base de datos en web
  late SharedPreferences storage;
  // Verificar si es proveedor
  bool isProveedor = false;
  // Variable para almacenar el servicio
  /// Datos del usuario
  int idUsuario = 0;
  String tokenUsuario = '';
  String nick = '';
  String fotoUsuario = '';
  String nombre = '';
  String email = '';
  String apellidos = '';
  String nivel = '';

  /// Datos del Proveedor
  int idProveedor = 0;
  String tokenProveedor = '';
  String fotoProveedor = '';

  /// Datos del club
  String nombreClub = '';

  /// Datos de la reserva
  String idReserva = '';

  /// Obtener el dinero total que cambia
  final _dineroTotal = 0.obs;
  int get dineroTotal => _dineroTotal.value;
  set dineroTotal(int value) => _dineroTotal.value = value;
  // Verificar si los datos son cargados
  bool cargarVariables = true;

  // Obtener la imagen cambiante
  final _fotoServer = ''.obs;
  String get fotoServer => _fotoServer.value;
  set fotoServer(String value) => _fotoServer.value = value;

  // // Todos los datos del usuario
  // final _datosUsuario = Rx<UsuarioModel>(UsuarioModel());
  // UsuarioModel get datosUsuario => _datosUsuario.value;
  // set datosUsuario(UsuarioModel value) => _datosUsuario.value = value;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    if (cargarVariables) {
      getDB();
    }
  }

  // Método para incrementar el contador
  Future<void> getDB({final bool isUsuario = true}) async {
    try {
      storage = await SharedPreferences.getInstance();
      isProveedor = storage.isProveedor.read() ?? isProveedor;
      if (!isProveedor) {
        idUsuario = storage.idUsuario.read() ?? idUsuario;
        tokenUsuario = storage.tokenUsuario.read() ?? tokenUsuario;
        fotoUsuario = storage.fotoUsuario.read() ?? fotoUsuario;
        nombre = storage.nombre.read() ?? nombre;
        apellidos = storage.apellidos.read() ?? apellidos;
        nick = storage.nick.read() ?? nick;
        email = storage.email.read() ?? email;
        idReserva = storage.idReserva.read() ?? idReserva;
        nivel = storage.nivel.read() ?? nivel;
        if (fotoUsuario != '') {
          fotoServer = fotoUsuario;
        }
      } else {
        idProveedor = storage.idProveedor.read() ?? idProveedor;
        tokenProveedor = storage.tokenProveedor.read() ?? tokenProveedor;
        fotoProveedor = storage.fotoProveedor.read() ?? fotoProveedor;
        nombreClub = storage.nombreClub.read() ?? nombreClub;
        // Cambiar la foto
        if (fotoProveedor != '') {
          fotoServer = fotoProveedor;
        }
      }
      cargarVariables = false;
      Get.forceAppUpdate();
    } catch (e) {
      print(e);
    }
  }

  // Obtener el dinero del usuario
  Future<void> getMoney() async {
    try {
      final List<String> listTypes = [dinero_total, foto];
      final result = await UsuarioProvider().getUsuarioDatos(listTypes);
      if (result is UsuarioModel) {
        dineroTotal = result.dineroTotal;
        print(
            '$dineroTotal -------------------------------------------------------------------====================');
      }
    } catch (e, stack) {
      print('e  $e');
      print('stack: $stack');
    }
  }

  setNivel(String newNivel) {
    if (!cargarVariables) {
      storage.nivel.write(newNivel);
      nivel = newNivel;
      Get.forceAppUpdate();
    }
  }
}

class DBBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<DBService>(DBService());
  }
}
