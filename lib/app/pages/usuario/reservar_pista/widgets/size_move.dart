import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SizeMove {
  final inputs = 155.0;
  double calendar = 0.0;
  final pistas = 100.0;
  double horarios = 0.0;
  final datos = 530.0;
  RxDouble heightEnd = 0.0.obs;
  double _scrollChange = 0.0;
  double _heightEndChange = 0.0;
  final _scrollHeight = 0.0.obs;
  double get scrollHeight => _scrollHeight.value;
  set scrollHeight(double value) => _scrollHeight.value = value;
  final ScrollController scrollController = ScrollController();

  void insertDebounce() {
    debounce(
        _scrollHeight,
        (callback) => scrollController.animateTo(
              callback,
              duration: const Duration(milliseconds: 200),
              curve: Curves.decelerate,
            ),
        time: const Duration(milliseconds: 200));
  }

  void setHorarios(int length) {
    int numero = length;
    int divisor = 4;
    int cupo = numero ~/ divisor;
    double tamanoTotal = numero / divisor;
    if (tamanoTotal > cupo) {
      cupo++;
    }
    horarios = 40.0 + (cupo * 40);
    if (_heightEndChange != 0.0) {
      spaceAndMove(newHorarios: horarios);
    }
  }

  double setCalendar(int length) {
    final height = length > 35 ? 388.0 : 338.0;
    calendar = height;
    return calendar;
  }

  void moveCalendar() {
    setChange(inputs + pistas, calendar);
  }

  void movePista() {
    setChange(0, pistas + calendar);
    spaceAndMove();
  }

  void moveHorarios() {
    setChange(calendar + inputs + pistas, datos + horarios);
    spaceAndMove();
  }

  void moveDeporte() {
    setChange(calendar + inputs + pistas, 0);
    spaceAndMove();
  }

  void setChange(double scrollChange, double heightEndChange) {
    _heightEndChange = heightEndChange;
    _scrollChange = scrollChange;
  }

  void spaceAndMove({final double newHorarios = 0.0}) {
    /// Poner el espacio
    final heightAll = Get.height - 165.0;
    final endSize = heightAll - (_heightEndChange + newHorarios);
    heightEnd.value = heightAll < 0 ? 0.0 : (endSize < 0 ? 0.0 : endSize);
    if (scrollHeight == _scrollChange && heightEnd.value != 0.0) {
      _scrollHeight.refresh();
    } else {
      scrollHeight = _scrollChange;
    }
  }
}
