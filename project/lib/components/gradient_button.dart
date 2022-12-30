import 'package:flutter/material.dart';

class Gradientbutton extends StatelessWidget {
  final GestureTapCallback gestureTapCallback;
 final Color c1,c2;
 final String titleText;
  const Gradientbutton({super.key, 
    required this.gestureTapCallback,
    required this.titleText,
    required this.c1,
    required this.c2
  });
  @override
  Widget build(BuildContext context) {
// Color(0xff374ABE), Color(0xff64B6FF)
    return InkWell(
      onTap: gestureTapCallback,
      child: Container(
               height: 50.0,
               margin: const EdgeInsets.all(10),
               child: Ink(
                 decoration: BoxDecoration(
                     gradient: LinearGradient(
                       colors: [c1, c2],
                       begin: Alignment.centerLeft,
                       end: Alignment.centerRight,
                     ),
                     borderRadius: BorderRadius.circular(30.0)),
                 child: Container(
                   constraints:
                       const BoxConstraints(maxWidth: 250.0, minHeight: 50.0),
                   alignment: Alignment.center,
                   child: Text(
                    titleText,
                     textAlign: TextAlign.center,
                     style: const TextStyle(color: Colors.white, fontSize: 15),
                   ),
                 ),
               ),
             ),
    );
  }
}