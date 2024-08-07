import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_theme.dart';
import '../../../../components/navbar_y_appbar_usuario.dart';
import './chat_c.dart';

class ChatPage extends GetView<ChatController> {
  const ChatPage({super.key});

  ChatController get self => controller;
  @override
  Widget build(BuildContext context) {
    return NavbarYAppbarUsuario(
      title: 'Chat',
      isTitleBack: true,
      isNavBar: false,
      child: Text('\nNo se encontraron Chats.',
          style: LightModeTheme().bodyMedium.copyWith(
              color: Colors.black, fontWeight: FontWeight.w700, fontSize: 16)),
    );
  }
}
