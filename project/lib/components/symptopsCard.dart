// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:project/screens/symtopsAnalyze_screen.dart';

// ignore: must_be_immutable
class SymptopmsCard extends StatefulWidget {
  Icon icon;
  // final void Function() onpress;
  String headingtext, bodyText, modelCode;
  SymptopmsCard({
    super.key,
    required this.icon,
    required this.headingtext,
    required this.bodyText,
    required this.modelCode,
    // required this.onpress
  });

  @override
  State<SymptopmsCard> createState() => _SymptopmsCardState();
}

class _SymptopmsCardState extends State<SymptopmsCard> {
  

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Color.fromARGB(255, 228, 224, 224), //New
              blurRadius: 10.0,
              offset: Offset(0, -1))
        ],
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          color: Color.fromARGB(255, 250, 249, 249),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                widget.icon,
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Text(
                widget.headingtext,
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Text(
                widget.bodyText,
              ),
            ),
            const SizedBox(
              height: 1,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                border: Border.all(color: Colors.white),
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              width: double.infinity,
              child: TextButton(
                onPressed: () {
    
                  Navigator.push(context,MaterialPageRoute(builder: (context) =>  SymptomsAnalyzeScreen()));
  
                },
                child: const Text(
                  'Analyze',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

