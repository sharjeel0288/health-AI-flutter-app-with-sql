// ignore_for_file: use_key_in_widget_constructors, sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';

class Arrowbutton extends StatelessWidget {
  final void Function() onpress;
  const Arrowbutton({required this.onpress});
  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Icon(
        Icons.arrow_forward_ios_outlined,
        color: Colors.blueAccent,
      ),
      style: TextButton.styleFrom(
          padding: EdgeInsets.all(0),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap),
      onPressed: () => onpress(),
    );
  }
}
