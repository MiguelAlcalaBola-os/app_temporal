import 'package:flutter/services.dart';

class SinEspaciosInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final String newText = newValue.text.replaceAll(RegExp(' '), '');
    TextSelection textSelection;
    if (newText == oldValue.text) {
      textSelection = oldValue.selection;
    } else {
      textSelection = newValue.selection;
    }

    return TextEditingValue(text: newText, selection: textSelection);
  }
}

class FilterEmailTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final isPositionOne = newValue.text.length == 1;
    if (isPositionOne) {
      if (newValue.text == '@' || newValue.text == '.') {
        return oldValue;
      }
    }
    return newValue;
  }
}

class SoloNumeros extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text == '') {
      return newValue;
    }
    final RegExp regex = RegExp(r'^[0-9]+$');
    final bool isNumber = regex.hasMatch(newValue.text);
    return isNumber ? newValue : oldValue;
  }
}

class SoloLetras extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text == '') {
      return newValue;
    }
    final RegExp regex = RegExp(r'^[a-zA-Z\u00C0-\u017F\s]+$');
    final bool soloLetras = regex.hasMatch(newValue.text);
    return soloLetras ? newValue : oldValue;
  }
}

class DNI8digitos1Letra extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length < 9) {
      if (newValue.text == '') {
        return newValue;
      }
      final RegExp regex = RegExp(r'^[0-9]+$');
      final bool isNumber = regex.hasMatch(newValue.text);
      return isNumber ? newValue : oldValue;
    } else {
      newValue = TextEditingValue(
          text: newValue.text.toUpperCase(),
          selection: newValue.selection,
          composing: newValue.composing);
      final RegExp regex = RegExp(r'^[A-Z]+$');
      final bool isLetra = regex.hasMatch(newValue.text[8]);

      return isLetra ? newValue : oldValue;
    }
  }
}

class CIFNIFFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isNotEmpty) {
      final val = newValue.text.toUpperCase();
      final newVal = TextEditingValue(
          text: val,
          selection: newValue.selection,
          composing: newValue.composing);
      final regexNumero = RegExp(r'^[0-9]+$');
      final regexLetra = RegExp(r'^[A-Z]+$');
      final isNumber = regexNumero.hasMatch(val);
      final isLetra = regexLetra.hasMatch(val);
      final lengthDNI = val.length;
      if (lengthDNI > 1 && lengthDNI < 9) {
        final isNumber = regexNumero.hasMatch(val.substring(1, lengthDNI));
        if (isNumber) {
          return newVal;
        }
      }
      if (lengthDNI == 1) {
        if (isNumber || isLetra) {
          return newVal;
        }
      }
      if (lengthDNI == 9) {
        if (isNumber) {
          return oldValue;
        }
        final val9 = val.substring(8);
        final isNumber9 = regexNumero.hasMatch(val9);
        final isLetra9 = regexLetra.hasMatch(val9);
        if (isNumber9 || isLetra9) {
          return newVal;
        }
      }
      return oldValue;
    }
    return newValue;
  }
}
