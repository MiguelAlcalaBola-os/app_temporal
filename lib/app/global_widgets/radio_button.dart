import 'package:flutter/material.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_theme.dart';

class CustomRadioButton extends StatelessWidget {
  final int value;
  final int? groupValue;
  final ValueChanged<int> onChanged;
  final String label;

  const CustomRadioButton({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = value == groupValue;

    return GestureDetector(
      onTap: () => onChanged(value),
      child: Row(
        children: <Widget>[
          Container(
            width: 22.0,
            height: 22.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected ? Colors.blue : Colors.grey,
                width: 2.0,
              ),
            ),
            child: isSelected
                ? Center(
                    child: Container(
                      width: 12.0,
                      height: 12.0,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                      ),
                    ),
                  )
                : null,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 3.0),
            child: Text(
              label,
              style: LightModeTheme().bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
