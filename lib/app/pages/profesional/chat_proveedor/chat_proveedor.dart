import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_theme.dart';
import '../../../../components/navbar_y_appbar_profesional.dart';
import './chat_proveedor_c.dart';

class ChatProveedorPage extends GetView<ChatProveedorController> {
  const ChatProveedorPage({super.key});

  ChatProveedorController get self => controller;
  @override
  Widget build(BuildContext context) {
    return NavbarYAppbarProfesional(
      title: 'Chat Proveedor',
      isTitleBack: true,
      isNavBar: false,
      child: Text('\nNo se encontraron Chats.',
          style: LightModeTheme().bodyMedium.copyWith(
              color: Colors.black, fontWeight: FontWeight.w700, fontSize: 16)),
    );
  }
}
