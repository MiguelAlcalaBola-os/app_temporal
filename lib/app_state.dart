import 'dart:io';
import 'package:flutter/material.dart';
import 'app/data/models/tarifas_model.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String version = '1.2.32';
  double moneyMonederoVirtual = 0.0;
  double moneyBancoVirtual = 500.0;

  TextEditingController preciosinluzController = TextEditingController();
  TextEditingController precioconluzController = TextEditingController();
  TextEditingController preciosinluzNoSocioController = TextEditingController();
  TextEditingController precioconluzNoSocioController = TextEditingController();

  File? imageUsuario;

  List<List<Tarifa>> listaTarifas = [];
  String prueba = 'vacio';
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
