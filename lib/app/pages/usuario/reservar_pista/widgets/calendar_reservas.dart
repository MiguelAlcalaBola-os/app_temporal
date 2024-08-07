import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_theme.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_util.dart';
import 'package:reservatu_pista/utils/btn_icon.dart';
import 'package:reservatu_pista/utils/colores.dart';
import 'package:reservatu_pista/utils/format_date.dart';
import '../reservar_pista_c.dart';

class CalendarioReservas extends StatefulWidget {
  const CalendarioReservas({super.key, required this.tiempoReserva});
  final int tiempoReserva;

  @override
  CalendarioReservasState createState() => CalendarioReservasState();
}

class CalendarioReservasState extends State<CalendarioReservas> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  final ReservarPistaController self = Get.find();
  final rc = GlobalKey();

  void _previousMonth() {
    setState(() {
      _focusedDay = DateTime(_focusedDay.year, _focusedDay.month - 1);
    });
  }

  void _nextMonth() {
    setState(() {
      _focusedDay = DateTime(_focusedDay.year, _focusedDay.month + 1);
    });
  }

  List<Widget> _buildDaysOfWeek() {
    final List<String> daysOfWeek = [
      'Lun',
      'Mar',
      'Mié',
      'Jue',
      'Vie',
      'Sáb',
      'Dom'
    ];
    return daysOfWeek.map((day) {
      return Expanded(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          color: const Color(0XFF459e00),
          alignment: Alignment.center,
          child: Text(
            '$day.',
            style: LightModeTheme()
                .bodyMedium
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      );
    }).toList();
  }

  List<Widget> _buildCalendar() {
    final firstDayOfMonth = DateTime(_focusedDay.year, _focusedDay.month, 0);
    final lastDayOfMonth = DateTime(_focusedDay.year, _focusedDay.month + 1, 0);
    final daysBefore = firstDayOfMonth.weekday % 7;
    final daysInMonth = List<DateTime>.generate(
      lastDayOfMonth.day,
      (index) => DateTime(_focusedDay.year, _focusedDay.month, index + 1),
    );

    final days = [
      ...List<DateTime>.generate(
          daysBefore,
          (index) =>
              firstDayOfMonth.subtract(Duration(days: daysBefore - index))),
      ...daysInMonth,
    ];

    return days.map((DateTime day) {
      final dateNow = DateTime.now();
      final isToday = dateNow.day == day.day &&
          dateNow.month == day.month &&
          dateNow.year == day.year;
      final isSameMonth = day.month == _focusedDay.month;
      bool isDaysTimeCancelation = false;
      // Verificamos si la fecha es menor que el tiempo de cancelacion
      final DateTime endDateTimeCancelation =
          dateNow.add(Duration(days: widget.tiempoReserva - 1));
      if (day.isAfter(dateNow.subtract(const Duration(days: 1))) &&
          day.isBefore(endDateTimeCancelation)) {
        isDaysTimeCancelation = true;
      }
      final buildText = Visible(
        isVisible: isSameMonth,
        child: Text(
          '${day.day}',
          style: LightModeTheme().bodyMedium.copyWith(
              color:
                  day == _selectedDay || isToday ? Colors.white : Colors.black,
              fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
              shadows: [const Shadow(blurRadius: 1.0, color: Colors.white)]),
        ),
      );
      return Expanded(
        child: BtnIcon(
          height: 50,
          padding: const EdgeInsets.all(0),
          hoverColor: Colores.usuario.primary160,
          fillColor: (day == _selectedDay || (_selectedDay == null && isToday))
              ? Colores.usuario.primary
              : (isDaysTimeCancelation
                  ? const Color.fromARGB(255, 0, 255, 21)
                  : const Color(0xffc0c0c0)),
          borderColor:
              (!isSameMonth || !isDaysTimeCancelation) ? null : Colors.white,
          borderWidth: (!isSameMonth || !isDaysTimeCancelation)
              ? null
              : day == _selectedDay
                  ? 2
                  : 1,
          onPressed: isDaysTimeCancelation
              ? () {
                  setState(() {
                    _selectedDay = day;
                  });
                  self.onChangedDay(day);
                }
              : null,
          icon: isToday
              ? CircleAvatar(
                  backgroundColor: Colores.usuario.primary200,
                  child: buildText,
                )
              : buildText,
        ),
      );
    }).toList();
  }

  List<Row> _buildRows(List<Widget> items, int crossAxisCount) {
    List<Row> rows = [];
    for (int i = 0; i < items.length; i += crossAxisCount) {
      List<Widget> rowChildren = [];
      for (int j = 0; j < crossAxisCount; j++) {
        if (i + j < items.length) {
          rowChildren.add(items[i + j]);
        } else {
          rowChildren
              .add(const Expanded(child: SizedBox.shrink())); // Tamaño fijo
        }
      }
      rows.add(Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: rowChildren,
      ));
    }
    return rows;
  }

  @override
  Widget build(BuildContext context) {
    final allDays = _buildCalendar();
    return Container(
      height: self.sm.setCalendar(allDays.length),
      color: const Color(0xffc0c0c0),
      child: Column(
        children: [
          Container(
            color: Colors.black,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    FormatDate.traduceMes(
                        DateFormat.yMMMM().format(_focusedDay)),
                    style: LightModeTheme().headlineLarge.copyWith(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios),
                      color: Colors.white,
                      onPressed: _previousMonth,
                    ),
                    IconButton(
                      icon: const Icon(Icons.arrow_forward_ios),
                      color: Colors.white,
                      onPressed: _nextMonth,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            children: _buildDaysOfWeek(),
          ),
          Column(
            children: _buildRows(allDays, 7),
          )
        ],
      ),
    );
    // print(getSizeOfWidget(rc));
    // return getWidget;
  }

  Size getSizeOfWidget(GlobalKey key) {
    final RenderObject? renderBox = key.currentContext!.findRenderObject();
    final Size size = renderBox!.paintBounds.size;
    return size;
  }
}
