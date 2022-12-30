// ignore_for_file: file_names, depend_on_referenced_packages, avoid_print

import 'package:flutter/material.dart';
import 'package:project/variables/data.dart';
import 'package:clay_containers/clay_containers.dart';

class PredictionTable extends StatefulWidget {
  const PredictionTable({super.key});

  @override
  State<PredictionTable> createState() => _PredictionTableState();
}

class _PredictionTableState extends State<PredictionTable> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Health History'),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios, // add custom icons also
            ),
          ),
        ),
        body: ListView(
          children: tableData(),
        ),
      ),
    );
  }
}

List<Widget> tableData() {
  List<Widget> temp = [];
  for (int i = 0; i < Gpredictions.length; i++) {
    print('${Gpredictions[i].prediction}   ${Gpredictions[i].date}');
  }
  for (int i = 0; i < Gpredictions.length; i++) {
    temp.add(Container(
      padding: const EdgeInsets.all(8),
      color: const Color(0xFFF2F2F2),
      child: Center(
        child: ClayContainer(
          emboss: true,
          color: const Color(0xFFF2F2F2),
          height: 75,
          width: 400,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ClayText(
              "Date : ${Gpredictions[i].date}\nAnalyzed disease : ${Gpredictions[i].prediction}",
              emboss: true,
              size: 14,
              style: TextStyle(
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 1
                  ..color = const Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ),
        ),
      ),
    ));
  }
  return temp;
}
