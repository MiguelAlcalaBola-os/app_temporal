import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/app/pages/profesional/mis_socios/chip_data.dart';
import 'package:reservatu_pista/app/pages/profesional/mis_socios/widgets/chips.dart';
import '../../../../flutter_flow/flutter_flow_animations.dart';
import 'socio.dart';

class MisSociosController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final unfocusNode = FocusNode();
  final List<ChipData> chips = Chips.all;

  final _selectChip = (-1).obs;
  int get selectChip => _selectChip.value;
  set selectChip(int value) => _selectChip.value = value;

  void cambiarChip() {}

  int socioSeleccionado = -1;
  final List socios = [
    Socio(
        0,
        "José Martinez Durán",
        "NickUno",
        "123456789A",
        "4.00",
        "Calle Falsa nº1",
        43,
        "Revés",
        "Tarde",
        "jose@reservatupista.com",
        "678123456",
        "15/04/2024",
        "https://images.unsplash.com/photo-1592245734204-6561336cbc6f?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw3fHxpZCUyMHBob3RvfGVufDB8fHx8MTcxMTQ2OTI2OHww&ixlib=rb-4.0.3&q=80&w=1080",
        true,
        72),
    Socio(
        1,
        "Nuria Garcia Robledo",
        "NickDos",
        "123456789A",
        "4.00",
        "Calle Falsa nº1",
        43,
        "Revés",
        "Mañana",
        "jose@reservatupista.com",
        "678123456",
        "15/04/2024",
        "https://images.unsplash.com/photo-1593529467220-9d721ceb9a78?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxOXx8ZmFjZXxlbnwwfHx8fDE3MTM0MTc1MTJ8MA&ixlib=rb-4.0.3&q=80&w=1080",
        true,
        10),
    Socio(
        2,
        "Manolo Martinez Soria",
        "NickTres",
        "123456789A",
        "4.00",
        "Calle Falsa nº1",
        7,
        "Revés",
        "Mañana",
        "manolo@reservatupista.com",
        "678123456",
        "15/04/2024",
        "https://images.unsplash.com/photo-1499996860823-5214fcc65f8f?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw0fHxmYWNlJTIwY2xvc2UlMjB8ZW58MHx8fHwxNzExNDY5NTAwfDA&ixlib=rb-4.0.3&q=80&w=1080",
        true,
        86),
    Socio(
        3,
        "Isabel García García",
        "NickCuatro",
        "123456789B",
        "4.25",
        "Calle Falsa nº6",
        24,
        "Revés",
        "Mañana",
        "isabel@reservatupista.com",
        "678123456",
        "15/04/2024",
        "https://images.unsplash.com/photo-1531746020798-e6953c6e8e04?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxfHxmYWNlJTIwY2xvc2UlMjB1cHxlbnwwfHx8fDE3MTE0Njk1NzZ8MA&ixlib=rb-4.0.3&q=80&w=400",
        true,
        22),
    Socio(
        4,
        "Mariano Rodriguez Durán",
        "NickCinco",
        "123456789A",
        "2.00",
        "Calle Falsa nº1",
        6,
        "Revés",
        "Mañana",
        "jose@reservatupista.com",
        "678123456",
        "15/04/2024",
        "https://images.unsplash.com/photo-1600364768707-1385e68a48f6?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxN3x8ZmFjZSUyMGNsb3NlJTIwdXB8ZW58MHx8fHwxNzEzNDI5NzIzfDA&ixlib=rb-4.0.3&q=80&w=400",
        false,
        -1),
    Socio(
        5,
        "Encarni Bosco Martin",
        "NickSeis",
        "123456789A",
        "3.50",
        "Calle Falsa nº1",
        2,
        "Revés",
        "Mañana",
        "jose@reservatupista.com",
        "678123456",
        "15/04/2024",
        "https://images.unsplash.com/photo-1534528741775-53994a69daeb?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxOHx8ZmFjZSUyMGNsb3NlJTIwdXB8ZW58MHx8fHwxNzExNDY5NTc2fDA&ixlib=rb-4.0.3&q=80&w=400",
        false,
        -1)
  ];
  // State field(s) for searchBar widget.
  FocusNode? searchBarFocusNode;
  TextEditingController? searchBarController;
  String? Function(BuildContext, String?)? searchBarControllerValidator;

  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 800.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 800.ms,
          begin: const Offset(50, 0),
          end: const Offset(0, 0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 800.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 800.ms,
          begin: const Offset(50, 0),
          end: const Offset(0, 0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 800.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 800.ms,
          begin: const Offset(50, 0),
          end: const Offset(0, 0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 800.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 800.ms,
          begin: const Offset(50, 0),
          end: const Offset(0, 0),
        ),
      ],
    ),
  };

  @override
  void onInit() async {
    super.onInit();

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  void setBusquedaState() {}

  @override
  void dispose() {
    unfocusNode.dispose();
    searchBarFocusNode?.dispose();
    searchBarController?.dispose();
    super.dispose();
  }
}
