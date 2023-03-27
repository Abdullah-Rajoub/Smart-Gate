import 'package:flutter/material.dart';

class CustomCheckBox extends StatelessWidget {
  late bool value;
  late var onChanged;
  late String label;
  CustomCheckBox(
      {required this.onChanged, required this.value, required this.label});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Checkbox(
            splashRadius: 11,
            value: value,
            onChanged: onChanged,
            side: BorderSide(color: Color.fromRGBO(215, 221, 233, 1)),
          ),
          Text(
            label,
            style: TextStyle(
                fontSize: 18, color: Color.fromRGBO(140, 187, 241, 1)),
          ),
        ],
      ),
    );
  }
}
