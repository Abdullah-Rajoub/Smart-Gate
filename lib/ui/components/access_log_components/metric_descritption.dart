import 'package:flutter/material.dart';

class MetricDescription extends StatelessWidget {
  String leading = '';
  String trailing = '';
  Icon icon;
  MetricDescription(
      {required this.trailing, required this.leading, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: VisualDensity(vertical: -4, horizontal: -4),
      leading: icon,
      title: Text(
        this.leading,
        style: TextStyle(
          fontFamily: 'Roboto',
          color: Colors.blue,
          fontSize: 11,
        ),
      ),
      trailing: Text(
        this.trailing,
        style: TextStyle(
          fontSize: 10,
        ),
      ),
    );
  }
}
