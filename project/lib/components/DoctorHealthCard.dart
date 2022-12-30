// ignore_for_file: file_names, must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class DoctorHealthCard extends StatefulWidget {
  Color color1, color2, color3;
  Color borderColor;
  String heading, iconimg, avatar;
  DoctorHealthCard(
      {required this.color1,
      required this.color2,
      required this.color3,
      required this.iconimg,
      required this.heading,
      required this.avatar,
      required this.borderColor});

  @override
  State<DoctorHealthCard> createState() => _DoctorHealthCardState();
}

class _DoctorHealthCardState extends State<DoctorHealthCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 185,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          color: widget.borderColor,
          width: 5,
        ),
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            widget.color1,
            widget.color2,
            widget.color3,
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image(
                image: AssetImage(
                  widget.avatar,
                ),
                width: 100,
                height: 90,
              ),
              Image(
                image: AssetImage(
                  widget.iconimg,
                ),
                width: 40,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              widget.heading,
              style: const TextStyle(
                fontSize: 24,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(
            height: 3,
          ),
        ],
      ),
    );
  }
}
