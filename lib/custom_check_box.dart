import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:grouped_checkbox_example/colors.dart';

class CustomCheckBox extends StatefulWidget {
  final bool value;
  final void Function(bool)? onChanged;
  final Color? checkedIconColor;
  final Color? checkedFillColor;
  final IconData checkedIcon;
  final Color? uncheckedIconColor;
  final Color? uncheckedFillColor;
  final IconData uncheckedIcon;
  final double? borderWidth;
  final double? checkBoxSize;
  final bool shouldShowBorder;
  final Color borderColor;
  final double? borderRadius;

  const CustomCheckBox({
    Key? key,
    required this.value,
    required this.onChanged,
    this.checkedIconColor,
    this.checkedFillColor,
    this.checkedIcon = Icons.check,
    this.uncheckedIconColor,
    this.uncheckedFillColor,
    this.uncheckedIcon = Icons.close,
    this.borderWidth,
    this.checkBoxSize,
    this.shouldShowBorder = true,
    this.borderColor = nineE9E9E,
    this.borderRadius,
  }) : super(key: key);

  @override
  _CustomCheckBoxState createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  late bool _checked;
  late CheckStatus _status;

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  void didUpdateWidget(CustomCheckBox oldWidget) {
    super.didUpdateWidget(oldWidget);
    _init();
  }

  void _init() {
    _checked = widget.value;

    // ignore: unnecessary_null_comparison
    if (_checked == null) {
      _status = CheckStatus.empty;
    } else if (_checked == true) {
      _status = CheckStatus.checked;
    } else {
      _status = CheckStatus.unchecked;
    }
  }

  Widget _buildIcon() {
    late Color fillColor;
    late Color iconColor;
    late IconData iconData;

    final theme = Theme.of(context);

    switch (_status) {
      case CheckStatus.empty:
        break;
      case CheckStatus.checked:
        fillColor = widget.checkedFillColor ?? Colors.white;
        iconColor = widget.checkedIconColor ?? theme.colorScheme.secondary;
        iconData = widget.checkedIcon;
        break;
      case CheckStatus.unchecked:
        fillColor = widget.uncheckedFillColor ?? Colors.white;
        iconColor = widget.uncheckedIconColor ?? Colors.white;
        iconData = widget.uncheckedIcon;
        break;
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius:
            BorderRadius.all(Radius.circular(widget.borderRadius ?? 4)),
        border: Border.all(
          color: widget.shouldShowBorder
              ? (widget.borderColor)
              : (!widget.value ? (widget.borderColor) : Colors.transparent),
          width: widget.shouldShowBorder ? (widget.borderWidth ?? 1.0) : 1.0,
        ),
      ),
      child: Icon(
        iconData,
        color: iconColor,
        size: widget.checkBoxSize ?? 17,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      visualDensity: VisualDensity.compact,
      icon: _buildIcon(),
      onPressed: () {
        if (widget.onChanged != null) {
          // ignore: unnecessary_null_comparison
          widget.onChanged!(_checked == null ? true : !_checked);
        }
      },
    );
  }
}

enum CheckStatus {
  empty,
  checked,
  unchecked,
}
