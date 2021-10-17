import 'package:flutter/material.dart';

import 'custom_check_box.dart';

class GroupedCheckbox extends StatefulWidget {
  const GroupedCheckbox({
    Key? key,
    required this.values,
    this.initialValues,
    required this.onChanged,
  }) : super(key: key);
  final List<String> values;
  final List<String>? initialValues;
  final void Function(List<String>) onChanged;

  @override
  State<GroupedCheckbox> createState() => _GroupedCheckboxState();
}

class _GroupedCheckboxState extends State<GroupedCheckbox> {
  final List<String> _values = [];
  final List<bool> _checkedStates = [];

  List<String> get _checkedValues {
    var checkedValues = <String>[];
    for (var i = 0; i < _checkedStates.length; i++) {
      if (_checkedStates[i]) {
        checkedValues.add(_values[i]);
      }
    }
    return checkedValues;
  }

  @override
  void initState() {
    super.initState();
    var uniqueValues = [
      ...{...widget.values}
    ];

    _values.addAll(uniqueValues);

    if (widget.initialValues != null) {
      for (var i = 0; i < _values.length; i++) {
        _checkedStates.add(widget.initialValues!.contains(_values[i]));
      }
    } else {
      _checkedStates.addAll(_values.map((e) => false).toList());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _values
          .map((e) => Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomCheckBox(
                    value: _checkedStates[_values.indexOf(e)],
                    onChanged: (value) {
                      setState(() {
                        _checkedStates[_values.indexOf(e)] = value;
                      });
                      widget.onChanged(_checkedValues);
                    },
                  ),
                  Text(e),
                ],
              ))
          .toList(),
      spacing: 16,
      runSpacing: 12,
    );
  }
}
