import 'dart:convert';
import 'dart:math';
import 'package:get/get.dart';
import 'package:reservatu_pista/backend/storage/storage.dart';
import 'package:reservatu_pista/utils/state_getx/state_mixin_demo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:reservatu_pista/app/data/provider/proveedor_node.dart';
import 'package:reservatu_pista/app/data/provider/usuario_node.dart';
import '../data/models/club_model.dart';
import '../data/models/datos_reservas_pista.dart';
import '../data/models/proveedor_model.dart';
import '../data/models/usuario_model.dart';

class DatabaseBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<DatabaseController>(DatabaseController());
  }
}

class DatabaseController extends GetxController {
  String version = '2.2.8';
  Rx<String> imageServer = ''.obs;
  late DatosReservaPista datosReserva;
  UsuarioModel? datosUsuario;
  UsuarioModel? datosUsuarioPerfil;
  ProveedorModel? datosProveedor;
  RxDouble money = 0.0.obs;
  // Datos para cargar los datos de perfil
  final datosPerfilUsuario = StateRx(Rxn<UsuarioModel?>());
  final datosPerfilClub = StateRx(Rxn<ClubModel>());

  @override
  void onInit() async {
    super.onInit();
    // Muestra el estado de carga
    datosPerfilUsuario.loading();
    datosPerfilClub.loading();
    try {
      datosReserva = datosReservaPistaFromJson(jsonEncode(
          {"clubsFavoritos": [], "tiempoReserva": 7, "reservas": generate()}));
    } catch (e) {
      print(e);
    }
    print("sd");
  }

  Future<bool> getDatosUsuario() async {
    try {
      final result = await UsuarioNode().getUsuarioNode('1');
      if (result is UsuarioModel) {
        imageServer.value = UsuarioNode().getImageNode(result.foto);
        datosUsuario = result;
        return true;
      }
    } catch (e) {
      print(e);
    }
    return false;
  }

  Future<void> getImageServer() async {
    try {
      final storage = await SharedPreferences.getInstance();
      imageServer.value = storage.fotoUsuario.read();
    } catch (e) {
      print(e);
    }
  }

  Future<bool> getDatosUsuarioId() async {
    try {
      final storage = await SharedPreferences.getInstance();
      final List<String> listTypes = [
        'apellidos',
        'nombre',
        'nick',
        'nivel',
        'foto'
      ];
      final result = await UsuarioProvider()
          .getUsuario(storage.idUsuario.read(), listTypes);
      if (result is UsuarioModel) {
        imageServer.value = UsuarioNode().getImageNode(result.foto);
        datosUsuarioPerfil = result;
        datosPerfilUsuario.success(result);
        return true;
      }
    } catch (e) {
      print(e);
    }
    return false;
  }

  Future<void> getDatosClubId() async {
    try {
      final result = await ProveedorProvider().getClub(['nombre']);
      if (result is ClubModel) {
        datosPerfilClub.success(result);
      }
    } catch (e) {
      print(e);
    }
  }

  void setDatosUsuario(UsuarioModel result) {
    imageServer.value = UsuarioNode().getImageNode(result.foto);
    datosUsuario = result;
  }

  void setDatosProveedor(ProveedorModel result) {
    imageServer.value = ProveedorNode().getImageNode(result.foto);
    datosProveedor = result;
  }

  Future<bool> getDatosProveedor() async {
    try {
      final result = await ProveedorNode().getProveedorNode('1');
      if (result is ProveedorModel) {
        imageServer.value = ProveedorNode().getImageNode(result.foto);
        datosProveedor = result;
        return true;
      }
    } catch (e) {
      print(e);
    }
    return false;
  }
}

List generate() {
  final localidades = [
    'Navalmoral de la mata',
    'Belvis de Monroy',
    'Riolobos',
    'Casar de Palomaro',
    'Cheles',
    'Helechosa de los Montes',
    'Orellana La Vieja',
    'Aldea del Cano',
    'Tayuela',
    'Tayuela Club',
  ];
  final clubs = [
    'Club 1',
    'Club 2',
    'Club 3',
    'Club 4',
    'Club 5',
    'Club 6',
    'Club 7',
    'Club 8',
    'Club 9',
  ];

  List<Map> mapa = [];
  for (var l = 0; l < 9; l++) {
    final mapj = {};
    mapj['localidad'] = localidades[l];
    // List listCompleta = [];
    // for (var i = 0; i < clubs.length; i++) {
    List listaClubs = [];
    if (l == 0) {
      listaClubs.add({
        'name': 'Ayuntamiento',
        'favorito': false,
        'deportes': getDeportesPiscina(l + 1)
      });
    } else {
      for (var j = 0; j < l + 1; j++) {
        listaClubs.add({
          'name': clubs[j] + ' ${localidades[l]}',
          'favorito': false,
          'deportes': getDeportes(l + 1)
        });
      }
    }
    mapj['clubs'] = listaClubs;
    mapa.add(mapj);
    // }
  }
  return mapa;
  // printInfo(info: jsonEncode(mapa).toString());
}

List getDeportesPiscina(int index) {
  final deportes = [
    '🎾 Pádel',
    '🎾 Tenis',
    '🏊‍♀️ P. Climatizada',
  ];
  final lentdeportes = [
    2,
    1,
    4,
  ];
  final newLista = [];
  for (var i = 0; i < deportes.length; i++) {
    newLista.add({
      'name': deportes[i],
      'semana':
          List.generate(7, (index) => getSemanaPiscina(index, lentdeportes[i]))
    });
  }
  return newLista;
}

Map getSemanaPiscina(int index, int pistasLengts) {
  final pistas = [
    'Reservatupista',
    'Modularbox',
    'Miragredos',
    'Fibrabox',
  ];
  // const image = 'logo_reservatupista.png';
  final images = [
    'logo_reservatupista_title.jpg',
    'logo_modularbox.jpg',
    'logo_miragredos.jpg',
    'logo_fibrabox.jpg'
  ];
  List listacom = [];
  for (var j = 0; j < pistasLengts; j++) {
    // pistas[j]
    final random = Random();
    final horariosAleatorio = [
      {"horario": "07:30", "estatus": "reservada"},
      {"horario": "09:00", "estatus": "reservada"},
      {"horario": "10:30", "estatus": "reservada"},
      {"horario": "12:00", "estatus": "reservada"},
      {"horario": "13:30", "estatus": "ocupada"},
      {"horario": "15:00", "estatus": "ocupada"},
      {"horario": "16:30", "estatus": "reservada"},
      {"horario": "18:00", "estatus": "reservada"},
      {"horario": "19:30", "estatus": "reservada"},
      {"horario": "21:00", "estatus": "reservada"},
      {"horario": "22:30", "estatus": "reservada"}
    ];
    final estatus = ['desocupada', 'reservada', 'ocupada', 'abierta'];
    for (var i = 0; i < horariosAleatorio.length; i++) {
      int indiceAleatorio = random.nextInt(4);
      if (index == 0 && pistas[j] == "Modularbox") {
        horariosAleatorio[i]['estatus'] = 'reservada';
      } else {
        horariosAleatorio[i]['estatus'] = estatus[indiceAleatorio];
      }
    }
    listacom.add(
        {'name': pistas[j], 'image': images[j], 'horarios': horariosAleatorio});
  }
  return {'pistas': listacom};
}

List getDeportes(int index) {
  final deportes = [
    '🎾 Pádel',
    '🎾 Tenis',
    '🏸 Badminton',
    '🏊‍♀️ P. Climatizada',
    '🏊‍♀️ Piscina',
    '🏀 Baloncesto',
    '⚽ Futbol sala',
    '⚽ Futbol 7',
    '⚽ Futbol 11',
    '🥍 Pickleball',
    '🏸 Squash',
    '🏓 Tenis de mesa',
    '🏓 Fronton',
    '⚽ Balomano',
    '🏉 Rugby',
    '🥅 Multideporte',
  ];
  final deportesPiscina = [
    '🎾 Pádel',
    '🎾 Tenis',
    '🏸 Badminton',
    '🏊‍♀️ P. Climatizada',
  ];
  final newLista = [];
  final RAD = Random();
  final id = RAD.nextInt(16);
  for (var i = 0; i < index; i++) {
    newLista.add({
      'name': deportes[i],
      'semana': List.generate(7, (index) => getSemana(index))
    });
  }
  return newLista;
}

Map getSemana(int index) {
  final pistas = [
    'Reservatupista',
    'Modularbox',
    'Miragredos',
    'Fibrabox',
  ];
  // const image = 'logo_reservatupista.png';
  final images = [
    'logo_reservatupista_title.jpg',
    'logo_modularbox.jpg',
    'logo_miragredos.jpg',
    'logo_fibrabox.jpg'
  ];
  List listacom = [];
  for (var j = 0; j < pistas.length; j++) {
    // pistas[j]
    final random = Random();
    final horariosAleatorio = [
      {"horario": "07:30", "estatus": "reservada"},
      {"horario": "09:00", "estatus": "reservada"},
      {"horario": "10:30", "estatus": "reservada"},
      {"horario": "12:00", "estatus": "reservada"},
      {"horario": "13:30", "estatus": "ocupada"},
      {"horario": "15:00", "estatus": "ocupada"},
      {"horario": "16:30", "estatus": "reservada"},
      {"horario": "18:00", "estatus": "reservada"},
      {"horario": "19:30", "estatus": "reservada"},
      {"horario": "21:00", "estatus": "reservada"},
      {"horario": "22:30", "estatus": "reservada"}
    ];
    final estatus = ['desocupada', 'reservada', 'ocupada', 'abierta'];
    for (var i = 0; i < horariosAleatorio.length; i++) {
      int indiceAleatorio = random.nextInt(4);
      if (index == 0 && pistas[j] == "Modularbox") {
        horariosAleatorio[i]['estatus'] = 'reservada';
      } else {
        horariosAleatorio[i]['estatus'] = estatus[indiceAleatorio];
      }
    }
    listacom.add(
        {'name': pistas[j], 'image': images[j], 'horarios': horariosAleatorio});
  }
  return {'pistas': listacom};
}
// final localidades = {
//   "clubsFavoritos": [],
//   "tiempoReserva": 7,

//   };
// {
//   "localidad": "Riolobos",
//   "clubs": [
//     {
//       "club": "Club 1",
//       "favorito": false,
//       "deportes": [
//         {
//           "name": "Padel",
//           "semana": [
//             {
//               "pistas": [
//                 {
//                   "name": "ModularBox",
//                   "horarios": [
//                     {"horario": "07:30", "estatus": "reservada"},
//                     {"horario": "09:00", "estatus": "ocupada"},
//                     {"horario": "10:30", "estatus": "ocupada"},
//                     {"horario": "12:00", "estatus": "reservada"},
//                     {"horario": "13:30", "estatus": "reservada"},
//                     {"horario": "15:00", "estatus": "reservada"},
//                     {"horario": "16:30", "estatus": "reservada"},
//                     {"horario": "18:00", "estatus": "reservada"},
//                     {"horario": "19:30", "estatus": "ocupada"},
//                     {"horario": "21:00", "estatus": "ocupada"},
//                     {"horario": "22:30", "estatus": "ocupada"}
//                   ]
//                 }
//               ]
//             }
//           ]
//         },
//         {
//           "name": "Tenis",
//           "semana": [
//             {
//               "pistas": [
//                 {
//                   "name": "ModularBox",
//                   "horarios": [
//                     {"horario": "07:30", "estatus": "reservada"},
//                     {"horario": "09:00", "estatus": "ocupada"},
//                     {"horario": "10:30", "estatus": "ocupada"},
//                     {"horario": "12:00", "estatus": "reservada"},
//                     {"horario": "13:30", "estatus": "reservada"},
//                     {"horario": "15:00", "estatus": "reservada"},
//                     {"horario": "16:30", "estatus": "reservada"},
//                     {"horario": "18:00", "estatus": "reservada"},
//                     {"horario": "19:30", "estatus": "ocupada"},
//                     {"horario": "21:00", "estatus": "ocupada"},
//                     {"horario": "22:30", "estatus": "ocupada"}
//                   ]
//                 }
//               ]
//             }
//           ]
//         }
//       ]
//     },
//     {
//       "club": "Club 2",
//       "favorito": "reservada",
//       "deportes": [
//         {
//           "name": "Padel",
//           "semana": [
//             {
//               "pistas": [
//                 {
//                   "name": "Reservatupista",
//                   "horarios": [
//                     {"horario": "07:30", "estatus": "reservada"},
//                     {"horario": "09:00", "estatus": "ocupada"},
//                     {"horario": "10:30", "estatus": "ocupada"},
//                     {"horario": "12:00", "estatus": "reservada"},
//                     {"horario": "13:30", "estatus": "reservada"},
//                     {"horario": "15:00", "estatus": "ocupada"},
//                     {"horario": "16:30", "estatus": "ocupada"},
//                     {"horario": "18:00", "estatus": "reservada"},
//                     {"horario": "19:30", "estatus": "ocupada"},
//                     {"horario": "21:00", "estatus": "reservada"},
//                     {"horario": "22:30", "estatus": "reservada"}
//                   ]
//                 }
//               ]
//             }
//           ]
//         },
//       ]
//     }
//   ]
// },
// {
//   "localidad": "Casar de Palomaro",
//   "clubs": [
//     {
//       "club": "Club 1",
//       "favorito": "reservada",
//       "deportes": [
//         {
//           "name": "padel",
//           "semana": [
//             {
//               "pistas": [
//                 {
//                   "name": "ModularBox",
//                   "horarios": [
//                     {"horario": "07:30", "estatus": "reservada"},
//                     {"horario": "09:00", "estatus": "ocupada"},
//                     {"horario": "10:30", "estatus": "ocupada"},
//                     {"horario": "12:00", "estatus": "reservada"},
//                     {"horario": "13:30", "estatus": "reservada"},
//                     {"horario": "15:00", "estatus": "reservada"},
//                     {"horario": "16:30", "estatus": "reservada"},
//                     {"horario": "18:00", "estatus": "reservada"},
//                     {"horario": "19:30", "estatus": "ocupada"},
//                     {"horario": "21:00", "estatus": "ocupada"},
//                     {"horario": "22:30", "estatus": "ocupada"}
//                   ]
//                 }
//               ]
//             }
//           ]
//         }
//       ]
//     },
//     {
//       "club": "Club 2",
//       "favorito": false,
//       "deportes": [
//         {
//           "name": "Casar de Palomaro",
//           "semana": [
//             {
//               "pistas": [
//                 {
//                   "name": "Reservatupista",
//                   "horarios": [
//                     {"horario": "07:30", "estatus": "desocupada"},
//                     {"horario": "09:00", "estatus": "ocupada"},
//                     {"horario": "10:30", "estatus": "ocupada"},
//                     {"horario": "12:00", "estatus": "desocupada"},
//                     {"horario": "13:30", "estatus": "desocupada"},
//                     {"horario": "15:00", "estatus": "ocupada"},
//                     {"horario": "16:30", "estatus": "ocupada"},
//                     {"horario": "18:00", "estatus": "desocupada"},
//                     {"horario": "19:30", "estatus": "ocupada"},
//                     {"horario": "21:00", "estatus": "desocupada"},
//                     {"horario": "22:30", "estatus": "desocupada"}
//                   ]
//                 }
//               ]
//             }
//           ]
//         }
//       ]
//     },
//     {
//       "club": "Club 3",
//       "favorito": false,
//       "deportes": [
//         {
//           "name": "Casar de Palomaro",
//           "semana": [
//             {
//               "pistas": [
//                 {
//                   "name": "Reservatupista",
//                   "horarios": [
//                     {"horario": "07:30", "estatus": "desocupada"},
//                     {"horario": "09:00", "estatus": "ocupada"},
//                     {"horario": "10:30", "estatus": "ocupada"},
//                     {"horario": "12:00", "estatus": "desocupada"},
//                     {"horario": "13:30", "estatus": "desocupada"},
//                     {"horario": "15:00", "estatus": "ocupada"},
//                     {"horario": "16:30", "estatus": "ocupada"},
//                     {"horario": "18:00", "estatus": "desocupada"},
//                     {"horario": "19:30", "estatus": "ocupada"},
//                     {"horario": "21:00", "estatus": "desocupada"},
//                     {"horario": "22:30", "estatus": "desocupada"}
//                   ]
//                 }
//               ]
//             }
//           ]
//         }
//       ]
//     }
//   ]
// },
// {
//   "localidad": "Riolobos",
//   "clubs": [
//     {
//       "club": "Club 1",
//       "favorito": false,
//       "deportes": [
//         {
//           "name": "padel",
//           "semana": [
//             {
//               "pistas": [
//                 {
//                   "name": "ModularBox",
//                   "horarios": [
//                     {"horario": "07:30", "estatus": "desocupada"},
//                     {"horario": "09:00", "estatus": "ocupada"},
//                     {"horario": "10:30", "estatus": "ocupada"},
//                     {"horario": "12:00", "estatus": "desocupada"},
//                     {"horario": "13:30", "estatus": "desocupada"},
//                     {"horario": "15:00", "estatus": "desocupada"},
//                     {"horario": "16:30", "estatus": "desocupada"},
//                     {"horario": "18:00", "estatus": "desocupada"},
//                     {"horario": "19:30", "estatus": "ocupada"},
//                     {"horario": "21:00", "estatus": "ocupada"},
//                     {"horario": "22:30", "estatus": "ocupada"}
//                   ]
//                 }
//               ]
//             }
//           ]
//         }
//       ]
//     },
//     {
//       "club": "Club 2",
//       "favorito": false,
//       "deportes": [
//         {
//           "name": "Casar de Palomaro",
//           "semana": [
//             {
//               "pistas": [
//                 {
//                   "name": "Reservatupista",
//                   "horarios": [
//                     {"horario": "07:30", "estatus": "desocupada"},
//                     {"horario": "09:00", "estatus": "ocupada"},
//                     {"horario": "10:30", "estatus": "ocupada"},
//                     {"horario": "12:00", "estatus": "desocupada"},
//                     {"horario": "13:30", "estatus": "desocupada"},
//                     {"horario": "15:00", "estatus": "ocupada"},
//                     {"horario": "16:30", "estatus": "ocupada"},
//                     {"horario": "18:00", "estatus": "desocupada"},
//                     {"horario": "19:30", "estatus": "ocupada"},
//                     {"horario": "21:00", "estatus": "desocupada"},
//                     {"horario": "22:30", "estatus": "desocupada"}
//                   ]
//                 }
//               ]
//             }
//           ]
//         }
//       ]
//     }
//   ]
// }
