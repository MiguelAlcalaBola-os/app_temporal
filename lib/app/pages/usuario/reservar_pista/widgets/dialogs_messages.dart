import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/app/global_widgets/button_general.dart';
import 'package:reservatu_pista/app/global_widgets/dialog/answer_dialog.dart';
import 'package:reservatu_pista/app/routes/app_pages.dart';
import 'package:reservatu_pista/utils/dialog/message_server_dialog.dart';

class DialogsMessages {
  DialogsMessages(this.context);
  final BuildContext context;
  final title = 'Reservar Pista';
  void reservarTarjeta({
    required final void Function() onPressedButton,
    required final String precio,
  }) {
    AnswerDialog(
            isProveedor: false,
            context: context,
            title: title,
            subtitle: '¿Desea Reservar la Pista\ncon Tarjeta?',
            textButton: 'Aceptar',
            precio: precio,
            onPressedButton: onPressedButton,
            isBack: true)
        .dialog();
  }

  void reservarMonedero({
    required final void Function() onPressedButton,
    required final String precio,
  }) {
    AnswerDialog(
            isProveedor: false,
            context: context,
            title: title,
            subtitle: '¿Desea Reservar la Pista\ncon Monedero Virtual?',
            textButton: 'Aceptar',
            precio: precio,
            onPressedButton: onPressedButton,
            isBack: true)
        .dialog();
  }

  void reservarProceso() {
    MessageServerDialog(
      isProveedor: false,
      context: context,
      alertType: warning,
      title: title,
      subtitle:
          'Alguien está en proceso de reservar esta pista.\nIntente reservar en 10 minutos.',
    ).dialog();
  }

  void reservarSuccess({required final void Function() onPressed}) {
    MessageServerDialog(
            isProveedor: false,
            context: context,
            alertType: success,
            title: title,
            subtitle: 'La Pista se ha Reservado Correctamente.',
            onPressed: onPressed)
        .dialog();
  }

  void reservaNoMoney() {
    MessageServerDialog(
        isProveedor: false,
        context: context,
        alertType: warning,
        title: title,
        subtitle:
            'No tienes saldo suficiente, debes recargar para poder reservar.',
        navBar: ButtonGeneral(
          text: 'Recargar',
          onPressed: () => Get.offAllNamed(Routes.MONEDERO),
        )).dialog();
  }

  void reservaError() {
    MessageServerDialog(
            isProveedor: false,
            context: context,
            alertType: warning,
            title: title,
            subtitle: 'Error La pista no se ha podido Reservar.')
        .dialog();
  }

  void metodoPagoErrorTarjeta() {
    MessageServerDialog(
            isProveedor: false,
            context: context,
            alertType: warning,
            title: 'Método de pago',
            subtitle:
                'Para reservar con tarjeta necesitas ocupar todas las plazas de la pista.')
        .dialog();
  }

  void faltaCreditosError() {
    MessageServerDialog(
        isProveedor: false,
        context: context,
        alertType: warning,
        title: 'Falta de créditos',
        subtitle: 'Necesitas recargar créditos en tu monedero virtual.',
        navBar: ButtonGeneral(
          text: 'Monedero Virtual',
          onPressed: () => Get.offAllNamed(Routes.MONEDERO),
        )).dialog();
  }

  void saldoInsuficienteError() {
    MessageServerDialog(
            isProveedor: false,
            context: context,
            alertType: warning,
            title: 'Saldo insuficiente',
            subtitle:
                'El precio de la reserva es superior al dinero de su monedero virtual')
        .dialog();
  }
}
