import 'package:get/get.dart';
import 'package:reservatu_pista/app/data/provider/pista_node.dart';
import '../../../data/models/tarifas_model.dart';

class TarifasPistaController extends GetxController {
  // Saber si obtener los datos de la tarifa son del servidor
  final idPista = Get.parameters['id_pista'] ?? '';
  // Lista de todas las tarifas
  List<List<Tarifa>> listTarifas = [];
  // Indice de todos los dias
  RxInt indexDias = 0.obs;
  // Actualizar toda la tabla los campos de activado y desactivado
  Rx<List<bool>> listActive = Rx<List<bool>>([]);
  RxBool changeAllActive = false.obs;
  // Actualizar las fila de clases
  List<RxBool> listClase = [];
  RxBool changeAllClase = false.obs;
  // Actualizar las fila de luz
  List<RxBool> listLuz = [];
  RxBool changeAllLuz = false.obs;
  // Clonar los dias
  Rx<List<bool>> selectedDias = Rx<List<bool>>([
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ]);

  /// Lista de dias en formato letra
  final listDiaSemana = ['L', 'M', 'X', 'J', 'V', 'S', 'D'];
  // Verificar si los datos estan guardados
  RxBool datosGuardados = false.obs;

  bool exiteHorario(List<String> lh, String h) {
    for (final element in lh) {
      if (element == h) {
        return true;
      }
    }
    return false;
  }

  Future<void> onEditarTarifas({
    required final String horaInicio,
    required final String horaFin,
    required final List<String> horariosTarifas,
    required final String socioPrecioConLuz,
    required final String socioPrecioSinLuz,
    required final String noSocioPrecioConLuz,
    required final String noSocioPrecioSinLuz,
    required final bool isSocioPrecioConLuz,
    required final bool isSocioPrecioSinLuz,
    required final bool isNoSocioPrecioConLuz,
    required final bool isNoSocioPrecioSinLuz,
  }) async {
    List<List<Tarifa>> newListTarifas = [];
    final result = await PistaProvider().getTarifas(idPista: idPista);

    // Si es true es mayor, y si lo niegas en menor
    bool esMayorOrMenorDuration(String horario1, String horario2) {
      if (horario1 == '' || horario2 == '') {
        return false;
      }
      // Convertimos los horarios a listas de enteros [hora, minuto]
      List<int> tiempo1 = horario1.split(':').map(int.parse).toList();
      List<int> tiempo2 = horario2.split(':').map(int.parse).toList();
      print('esMayorOrMenor $horario1 > $horario2');
      // Comparar primero las horas
      if (tiempo1[0] > tiempo2[0]) {
        return true;
      } else if (tiempo1[0] < tiempo2[0]) {
        return false;
      } else {
        // Si las horas son iguales, comparar los minutos
        return tiempo1[1] > tiempo2[1];
      }
    }

    if (result is List<dynamic>) {
      /// Estos son los dias ordenados de Lunes a Domingo
      for (var i = 0; i < result.length; i++) {
        const listDiasSemana = ["L", "M", "X", "J", "V", "S", "D"];
        final diaSemana = listDiasSemana[i];
        final tarifa = result[i];

        if (tarifa is List<dynamic>) {
          final horaInicioApi = tarifa.length > 1
              ? tarifa[0]['hora_inicio'].toString().substring(0, 5)
              : '';
          final horaFinApi = tarifa.length > 1
              ? tarifa[tarifa.length - 1]['hora_inicio']
                  .toString()
                  .substring(0, 5)
              : '';

          /// Agregar si hay nuevas tarifas ponemos los nuevos datos
          final List<Tarifa> tarifasInicio = [];
          final List<Tarifa> tarifasFin = [];
          if (!esMayorOrMenorDuration(horaInicio, horaInicioApi)) {
            print('Si es menor la hora de inicio');
            for (final elht in horariosTarifas) {
              if (elht != horaInicioApi) {
                tarifasInicio.add(Tarifa(
                    changeTarifa: true,
                    horaInicio: elht,
                    diaSemana: diaSemana,
                    precioConLuzSocio: socioPrecioConLuz,
                    precioSinLuzSocio: socioPrecioSinLuz,
                    precioConLuzNoSocio: noSocioPrecioConLuz,
                    precioSinLuzNoSocio: noSocioPrecioSinLuz));
              } else {
                break;
              }
            }
          }
          if (esMayorOrMenorDuration(horaFin, horaFinApi)) {
            bool agregarTarifasFinal = false;
            for (final elht in horariosTarifas) {
              if (agregarTarifasFinal) {
                print('finesmayor la hora de fin $horaFin > $horaFinApi');
                tarifasFin.add(Tarifa(
                    changeTarifa: true,
                    horaInicio: elht,
                    diaSemana: diaSemana,
                    precioConLuzSocio: socioPrecioConLuz,
                    precioSinLuzSocio: socioPrecioSinLuz,
                    precioConLuzNoSocio: noSocioPrecioConLuz,
                    precioSinLuzNoSocio: noSocioPrecioSinLuz));
              } else if (elht == horaFinApi) {
                agregarTarifasFinal = true;
              }
            }
          }

          print('tarifa---- $tarifa');
          final modelTarifa = tarifa
              .map((e) => Tarifa.fromJson(
                    e,
                    socioPrecioConLuz,
                    socioPrecioSinLuz,
                    noSocioPrecioConLuz,
                    noSocioPrecioSinLuz,
                    isSocioPrecioConLuz,
                    isSocioPrecioSinLuz,
                    isNoSocioPrecioConLuz,
                    isNoSocioPrecioSinLuz,
                  ))
              .toList();
          newListTarifas.add([...tarifasInicio, ...modelTarifa, ...tarifasFin]);
        }
      }
      indexDias.value = 0;
      onCrearPistas(newListTarifas);
    }
  }

  // init al momento de precionar crear pistas
  void onCrearPistas(List<List<Tarifa>> newListTarifas) {
    listTarifas = newListTarifas;
    listActive.value =
        newListTarifas[indexDias.value].map((e) => e.disponible).toList();
    listClase =
        newListTarifas[indexDias.value].map((e) => e.clases.obs).toList();
    listLuz = newListTarifas[indexDias.value].map((e) => e.luz.obs).toList();
  }

  // Cambiar el dia
  void changeDia(int index) {
    indexDias.value = index;
    listActive.value =
        listTarifas[indexDias.value].map((e) => e.disponible).toList();
    listClase = listTarifas[indexDias.value].map((e) => e.clases.obs).toList();
    listLuz = listTarifas[indexDias.value].map((e) => e.luz.obs).toList();
    changeAllActive.value = false;
  }

  // Cambiar de disponible de todo activado a desactivado
  void onChangeAllActive() {
    changeAllActive.value = !changeAllActive.value;
    listActive.value =
        listActive.value.map((e) => changeAllActive.value).toList();
    if (!changeAllActive.value) {
      for (var i = 0; i < listClase.length; i++) {
        listClase[i].value = false;
      }
      for (var i = 0; i < listLuz.length; i++) {
        listLuz[i].value = false;
      }
      // Cambiar los datos y guardarlos
      for (var i = 0; i < listActive.value.length; i++) {
        listTarifas[indexDias.value][i].disponible = false;
        listTarifas[indexDias.value][i].changeTarifa = true;
      }
    } else {
      // Cambiar los datos y guardarlos
      for (var i = 0; i < listActive.value.length; i++) {
        listTarifas[indexDias.value][i].disponible = true;
        listTarifas[indexDias.value][i].changeTarifa = true;
      }
    }
  }

  // Cambiar de disponible activado a desactivado
  void onChangeActive(bool activeOrDesactive, int index) {
    if (activeOrDesactive) {
      listTarifas[indexDias.value][index].clases = false;
      listTarifas[indexDias.value][index].luz = false;
      listClase[index].value = false;
      listLuz[index].value = false;
    }
    listTarifas[indexDias.value][index].disponible = !activeOrDesactive;
    listTarifas[indexDias.value][index].changeTarifa = true;
    listActive.value[index] = !listActive.value[index];
    listActive.refresh();
  }

  // Cambiar de clases de todo activas o desactivas
  onChangeAllClase() {
    bool isChanges = false;
    for (var i = 0; i < listActive.value.length; i++) {
      if (listActive.value[i]) {
        isChanges = true;
        listClase[i].value = changeAllClase.value;
        listTarifas[indexDias.value][i].clases = changeAllClase.value;
        listTarifas[indexDias.value][i].changeTarifa = true;
      }
    }
    if (isChanges) {
      changeAllClase.value = !changeAllClase.value;
    }
  }

  // Cambiar de clase activa o desactiva
  onChangeClase(bool activeOrDesactive, int index) {
    if (activeOrDesactive) {
      listClase[index].value = !listClase[index].value;
      listTarifas[indexDias.value][index].clases = listClase[index].value;
      listTarifas[indexDias.value][index].changeTarifa = true;
    }
  }

  // Cambiar de clases de todo activas o desactivas
  onChangeAllLuz() {
    bool isChanges = false;
    for (var i = 0; i < listActive.value.length; i++) {
      if (listActive.value[i]) {
        isChanges = true;
        listLuz[i].value = changeAllLuz.value;
        listTarifas[indexDias.value][i].luz = changeAllLuz.value;
        listTarifas[indexDias.value][i].changeTarifa = true;
      }
    }
    if (isChanges) {
      changeAllLuz.value = !changeAllLuz.value;
    }
  }

  // Cambiar de clase activa o desactiva
  onChangeLuz(bool activeOrDesactive, int index) {
    if (activeOrDesactive) {
      listLuz[index].value = !listLuz[index].value;
      listTarifas[indexDias.value][index].luz = listLuz[index].value;
      listTarifas[indexDias.value][index].changeTarifa = true;
    }
  }

  // Cambiar el precio de la tarifa socio
  onChangePrecioSocio(bool luz, int index, String precio) {
    if (luz) {
      listTarifas[indexDias.value][index].precioConLuzSocio = precio;
    } else {
      listTarifas[indexDias.value][index].precioSinLuzSocio = precio;
    }
    listTarifas[indexDias.value][index].changeTarifa = true;
  }

  // Cambiar el precio de la tarifa no socio
  onChangePrecioNoSocio(bool luz, int index, String precio) {
    if (luz) {
      listTarifas[indexDias.value][index].precioConLuzNoSocio = precio;
    } else {
      listTarifas[indexDias.value][index].precioSinLuzNoSocio = precio;
    }
    listTarifas[indexDias.value][index].changeTarifa = true;
  }

  // Cambiar los dias al clonar el dia
  onChangeClonarDia(int index) {
    selectedDias.value[index] = !selectedDias.value[index];
    selectedDias.refresh();
  }

  // Cambiar los dias al clonar el dia
  onChangeClonarBorrar() {
    selectedDias.value =
        List.generate(selectedDias.value.length, (index) => false);
  }

  // Cambiar los dias al clonar el dia
  onChangeCopiarDatos() {
    for (var i = 0; i < selectedDias.value.length; i++) {
      if (selectedDias.value[i]) {
        List<Tarifa> newListTarifas = [];
        for (Tarifa element in listTarifas[indexDias.value]) {
          if (element.disponible) {
            newListTarifas.add(Tarifa(
                changeTarifa: true,
                disponible: true,
                clases: element.clases,
                diaSemana: listDiaSemana[i],
                luz: element.luz,
                horaInicio: element.horaInicio,
                precioConLuzSocio: element.precioConLuzSocio,
                precioConLuzNoSocio: element.precioConLuzNoSocio,
                precioSinLuzNoSocio: element.precioSinLuzNoSocio,
                precioSinLuzSocio: element.precioSinLuzSocio));
          } else {
            newListTarifas.add(Tarifa(
                changeTarifa: true,
                horaInicio: element.horaInicio,
                diaSemana: listDiaSemana[i],
                precioConLuzSocio: element.precioConLuzSocio,
                precioConLuzNoSocio: element.precioConLuzNoSocio,
                precioSinLuzNoSocio: element.precioSinLuzNoSocio,
                precioSinLuzSocio: element.precioSinLuzSocio));
          }
        }
        listTarifas[i] = newListTarifas;
      }
    }
    Get.back();
  }

  // Guardar los datos de la tarifa
  onGuardar() {
    datosGuardados.value = true;
    Get.back();
  }
}

class VerificarTarifaExiste {
  final String horario;
  bool existe = false;
  VerificarTarifaExiste(this.horario);
  List<VerificarTarifaExiste> getVerificarTarifaExiste(List<String> lh) {
    final List<VerificarTarifaExiste> listVerificarTarifaExiste = [];
    for (final element in lh) {
      listVerificarTarifaExiste.add(VerificarTarifaExiste(element));
    }
    return listVerificarTarifaExiste;
  }
}
