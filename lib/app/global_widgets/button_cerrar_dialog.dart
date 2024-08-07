import 'package:flutter/material.dart';
import 'package:reservatu_pista/utils/btn_icon.dart';
import 'package:reservatu_pista/utils/sizer.dart';

class ButtonCerrarDialog extends StatelessWidget {
  const ButtonCerrarDialog(
      {super.key, required this.contextDialog, this.onPressed});
  final BuildContext contextDialog;
  final dynamic Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: context.w < 450 ? 20.0 : 10.0),
      child: BtnIcon(
        borderColor: Colors.black45,
        elevation: 5.0,
        borderRadius: 10,
        borderWidth: 1,
        fillColor: const Color(0xFFF77066),
        hoverColor: const Color.fromARGB(62, 0, 0, 0),
        buttonSize: context.w < 450 ? 45 : 55,
        padding: const EdgeInsets.all(0),
        icon: Icon(
          Icons.close_rounded,
          color: Colors.black87,
          size: context.w < 450 ? 32 : 42,
        ),
        onPressed: onPressed ?? Navigator.of(contextDialog).pop,
      ),
    );
  }
}
