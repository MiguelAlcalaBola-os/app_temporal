import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'crear_bono_w.dart' show CrearBono;
import 'package:flutter/material.dart';

class CrearBonoModel extends FlutterFlowModel<CrearBono> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for fullName widget.
  TextEditingController? nombreCupon;

  String? Function(BuildContext, String?)? nombreCuponValidator;
  String? _nombreCuponValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter the patients full name.';
    }

    return null;
  }

  // State field(s) for dateOfBirth widget.
  TextEditingController? fechaLimite;
  // final dateOfBirthMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? fechaLimiteValidator;
  String? _fechaLimiteValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter the date of birth of the patient.';
    }

    return null;
  }

  // State field(s) for age widget.
  TextEditingController? nCupones;
  String? Function(BuildContext, String?)? nCuponesValidator;
  String? _nCuponesValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter an age for the patient.';
    }

    return null;
  }

  // State field(s) for phoneNumber widget.
  TextEditingController? nUsos;
  String? Function(BuildContext, String?)? nUsosValidator;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController1;
  String? get choiceChipsValue1 =>
      choiceChipsValueController1?.value?.firstOrNull;
  set choiceChipsValue1(String? val) =>
      choiceChipsValueController1?.value = val != null ? [val] : [];
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController2;
  String? get choiceChipsValue2 =>
      choiceChipsValueController2?.value?.firstOrNull;
  set choiceChipsValue2(String? val) =>
      choiceChipsValueController2?.value = val != null ? [val] : [];
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;

  @override
  void initState(BuildContext context) {
    nombreCuponValidator = _nombreCuponValidator;
    fechaLimiteValidator = _fechaLimiteValidator;
    nCuponesValidator = _nCuponesValidator;
    nombreCupon ??= TextEditingController();
    fechaLimite ??= TextEditingController();
    nCupones ??= TextEditingController();
    nUsos ??= TextEditingController();
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    nombreCupon?.dispose();
    fechaLimite?.dispose();
    nCupones?.dispose();
    nUsos?.dispose();
  }
}
