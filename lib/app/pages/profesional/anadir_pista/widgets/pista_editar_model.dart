class PistaEditarModel {
  final IsEdit techada;
  final IsEdit iluminacion;
  final IsEdit tipo;
  final IsEdit cesped;
  final IsEdit automatizada;
  final IsEdit duracionPartida;
  final IsEdit horaInicio;
  final IsEdit horaFin;
  final IsEdit socioTiempoReserva;
  final IsEdit socioTiempoCancelacion;
  final IsEdit socioPrecioConLuz;
  final IsEdit socioPrecioSinLuz;
  final IsEdit noSocioTiempoReserva;
  final IsEdit noSocioTiempoCancelacion;
  final IsEdit noSocioPrecioConLuz;
  final IsEdit noSocioPrecioSinLuz;
  final IsEdit descripcion;
  final IsEdit nombrePatrocinador;
  final IsEdit vestuario;
  final IsEdit duchas;
  final IsEdit? efectivo;
  final IsEdit? tarjeta;
  final IsEdit? bono;
  final IsEdit? reservatupista;
  final IsEdit tarifas = IsEdit('');
  final imagenesPista = IsEdit('');
  final imagenPatrocinador = IsEdit('');

  PistaEditarModel(
      {required this.techada,
      required this.iluminacion,
      required this.tipo,
      required this.cesped,
      required this.automatizada,
      required this.duracionPartida,
      required this.horaInicio,
      required this.horaFin,
      required this.socioTiempoReserva,
      required this.socioTiempoCancelacion,
      required this.socioPrecioConLuz,
      required this.socioPrecioSinLuz,
      required this.noSocioTiempoReserva,
      required this.noSocioTiempoCancelacion,
      required this.noSocioPrecioConLuz,
      required this.noSocioPrecioSinLuz,
      required this.descripcion,
      required this.nombrePatrocinador,
      required this.vestuario,
      required this.duchas,
      this.efectivo,
      this.tarjeta,
      this.bono,
      this.reservatupista});

  Map<String, dynamic> toJson() {
    return {
      ...techada.jsonNewJson('techada'),
      ...iluminacion.jsonNewJson('iluminacion'),
      ...tipo.jsonNewJson('tipo'),
      ...cesped.jsonNewJson('cesped'),
      ...automatizada.jsonNewJson('automatizada'),
      ...duracionPartida.jsonNewJson('duracion_partida'),
      ...horaInicio.jsonNewJson('hora_inicio'),
      ...horaFin.jsonNewJson('hora_fin'),
      ...socioTiempoReserva.jsonNewJson('tiempo_reserva_socio'),
      ...socioTiempoCancelacion.jsonNewJson('tiempo_cancelacion_socio'),
      ...socioPrecioConLuz.jsonNewJson('precio_luz_socio'),
      ...socioPrecioSinLuz.jsonNewJson('precio_sin_luz_socio'),
      ...noSocioTiempoReserva.jsonNewJson('tiempo_reserva_no_socio'),
      ...noSocioTiempoCancelacion.jsonNewJson('tiempo_cancelacion_no_socio'),
      ...noSocioPrecioConLuz.jsonNewJson('precio_luz_no_socio'),
      ...noSocioPrecioSinLuz.jsonNewJson('precio_sin_luz_no_socio'),
      ...descripcion.jsonNewJson('descripcion'),
      ...nombrePatrocinador.jsonNewJson('nombre_patrocinador'),
      ...vestuario.jsonNewJson('vestuario'),
      ...duchas.jsonNewJson('duchas'),
      ...imagenPatrocinador.jsonNewJson('imagen_patrocinador'),
      ...imagenesPista.jsonNewJson('imagenes_pista'),
      ...tarifas.jsonNewJson('tarifas'),
    };
  }

  bool isModificacionesTarifa() {
    return horaInicio.modificar ||
        horaFin.modificar ||
        socioPrecioConLuz.modificar ||
        socioPrecioSinLuz.modificar ||
        noSocioPrecioConLuz.modificar ||
        noSocioPrecioSinLuz.modificar;
  }
}

class IsEdit {
  final dynamic text;
  dynamic textModificado = '';
  bool modificar = false;
  IsEdit(this.text);
  void isModificado(dynamic newText) {
    print('|text:|$text|--newText|$newText|');
    modificar = text != newText;
    if (modificar) {
      textModificado = newText;
    }
  }

  Map<String, dynamic> jsonNewJson(String id) {
    if (modificar) {
      return {id: textModificado};
    } else {
      return {};
    }
  }
}
