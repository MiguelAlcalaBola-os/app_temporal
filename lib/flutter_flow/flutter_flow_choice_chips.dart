import 'form_field_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChipData<T> {
  const ChipData(this.label, {this.value, this.icon});
  final String label;
  final IconData? icon;
  final T? value;
}

class ChipStyle {
  const ChipStyle({
    this.backgroundColor,
    this.textStyle,
    this.iconColor,
    this.iconSize,
    this.labelPadding,
    this.elevation,
    this.borderColor,
    this.borderWidth,
    this.borderRadius,
  });
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final Color? iconColor;
  final double? iconSize;
  final EdgeInsetsGeometry? labelPadding;
  final double? elevation;
  final Color? borderColor;
  final double? borderWidth;
  final BorderRadius? borderRadius;
}

class FlutterFlowChoiceChips<T> extends StatefulWidget {
  const FlutterFlowChoiceChips({
    super.key,
    required this.options,
    required this.onChanged,
    required this.controller,
    required this.selectedChipStyle,
    required this.unselectedChipStyle,
    required this.chipSpacing,
    this.rowSpacing = 0.0,
    required this.multiselect,
    this.initialized = true,
    this.alignment = WrapAlignment.start,
    this.disabledColor,
    this.wrapped = true,
  });

  final List<ChipData<T>> options;
  final void Function(List<T>?)? onChanged;
  final FormFieldController<List<T>> controller;
  final ChipStyle selectedChipStyle;
  final ChipStyle unselectedChipStyle;
  final double chipSpacing;
  final double rowSpacing;
  final bool multiselect;
  final bool initialized;
  final WrapAlignment alignment;
  final Color? disabledColor;
  final bool wrapped;

  @override
  State<FlutterFlowChoiceChips<T>> createState() =>
      _FlutterFlowChoiceChipsState<T>();
}

class _FlutterFlowChoiceChipsState<T> extends State<FlutterFlowChoiceChips<T>> {
  late List<T> choiceChipValues;
  ValueListenable<List<T>?> get changeSelectedValues => widget.controller;
  List<T> get selectedValues => widget.controller.value ?? [];

  @override
  void initState() {
    super.initState();
    choiceChipValues = selectedValues;
    if (!widget.initialized && choiceChipValues.isNotEmpty) {
      SchedulerBinding.instance.addPostFrameCallback(
        (_) {
          if (widget.onChanged != null) {
            widget.onChanged!(choiceChipValues);
          }
        },
      );
    }
    changeSelectedValues.addListener(() {
      if (widget.onChanged != null) {
        widget.onChanged!(selectedValues);
      }
    });
  }

  @override
  void dispose() {
    changeSelectedValues.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final children = widget.options.map<Widget>(
      (option) {
        final selected = selectedValues.contains(option.value);
        final style =
            selected ? widget.selectedChipStyle : widget.unselectedChipStyle;
        return Theme(
          data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
          child: ChoiceChip(
            selected: selected,
            onSelected: (isSelected) {
              print('isSelected ${isSelected}');
              setState(() {
                if (isSelected) {
                  if (widget.multiselect) {
                    choiceChipValues.add(option.value as T);
                  } else {
                    choiceChipValues = [option.value as T];
                  }
                  widget.controller.value = List.from(choiceChipValues);
                  widget.onChanged!([option.value!]);
                } else {
                  if (widget.multiselect) {
                    choiceChipValues.remove(option.value);
                    widget.controller.value = List.from(choiceChipValues);
                  }
                }
              });
            },
            label: Text(
              option.label,
              style: style.textStyle,
            ),
            // padding: EdgeInsets.symmetric(horizontal: 20.0),
            // labelPadding: const EdgeInsets.all(10.0),
            // avatar: option.icon != null ? Icon(option.icon!) : null,
            showCheckmark: false,
            elevation: style.elevation,
            disabledColor: widget.disabledColor,
            selectedColor:
                selected ? widget.selectedChipStyle.backgroundColor : null,
            backgroundColor:
                selected ? null : widget.unselectedChipStyle.backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: style.borderRadius ?? BorderRadius.circular(16),
              side: BorderSide(
                color: style.borderColor ?? Colors.transparent,
                width: style.borderWidth ?? 0,
              ),
            ),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        );
      },
    ).toList();

    if (widget.wrapped) {
      return Wrap(
        spacing: widget.chipSpacing,
        runSpacing: widget.rowSpacing,
        alignment: widget.alignment,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: children,
      );
    } else {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: children.divide(
            SizedBox(width: widget.chipSpacing),
          ),
        ),
      );
    }
  }
}
