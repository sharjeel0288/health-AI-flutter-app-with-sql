// ignore_for_file: depend_on_referenced_packages, must_be_immutable

import 'package:flutter/material.dart';
import 'package:project/components/arrowbutton.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:project/components/doctor_info.dart';

class Cards extends StatelessWidget {
  String drName,
      image,
      designation,
      description,
      about,
      address,
      dailytimings,
      mail,
      contact;
  Cards({super.key, 
    required this.drName,
    required this.description,
    required this.designation,
    required this.image,
    required this.about,
    required this.address,
    required this.dailytimings,
    required this.contact,
    required this.mail,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
      elevation: 10.0,
      child: SizedBox(
        width: 350.0,
        height: 200.0,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            // This will hold the Image in the back ground:
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                color: const Color.fromARGB(255, 239, 241, 243),
              ),
              child: Image.asset(image),
            ),
            // This is the Custom Shape Container
            Positioned(
              bottom: 0.0,
              left: 0.0,
              child: Container(
                color: const Color.fromARGB(255, 221, 215, 215),
                child: CustomPaint(
                  painter: CustomContainerShapeBorder(
                    height: 100.0,
                    width: 350.0,
                    fillColor: const Color.fromARGB(255, 228, 222, 222),
                    radius: 50.0,
                  ),
                ),
              ),
            ),
            // This Holds the Widgets Inside the the custom Container;
            Positioned(
              bottom: 10.0,
              width: 300,
              height: 85,
              child: Container(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(drName),
                        Arrowbutton(
                          onpress: () {
                            showCupertinoModalBottomSheet(
                                context: context,
                                builder: (context) => DoctorInfo(
                                      drName: drName,
                                      designation: designation,
                                      image: image,
                                      about: about,
                                      address: address,
                                      dailytimings: dailytimings,
                                      contact: contact,
                                      mail: mail,
                                    ));
                          },
                        ),
                      ],
                    ),
                    Text(
                      designation,
                      style: const TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                      ),
                    ),
                    Text(description),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// const double _kCurveHeight = 70;

// class ShapesPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final p = Path();
//     p.lineTo(0, size.height - _kCurveHeight);
//     p.relativeQuadraticBezierTo(
//         size.width, size.width / 2, 2 * _kCurveHeight, 0);
//     p.lineTo(size.width, 1);
//     p.close();

//     canvas.drawPath(p, Paint()..color = Color.fromARGB(255, 240, 234, 234));
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return true;
//   }
// }

class CustomContainerShapeBorder extends CustomPainter {
  final double height;
  final double width;
  final Color fillColor;
  final double radius;

  CustomContainerShapeBorder({
    this.height = 400.0,
    this.width = 300.0,
    this.fillColor = Colors.white,
    this.radius = 50.0,
  });
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    path.moveTo(0.0, -radius);
    path.lineTo(0.0, -(height - radius));
    path.conicTo(0.0, -height, radius, -height, 1);
    path.lineTo(width - radius, -height);
    path.conicTo(width, -height, width, -(height + radius), 1);
    path.lineTo(width, -(height - radius));
    path.lineTo(width, -radius);

    path.conicTo(width, 0.0, width - radius, 0.0, 1);
    path.lineTo(radius, 0.0);
    path.conicTo(0.0, 0.0, 0.0, -radius, 1);
    path.close();
    canvas.drawPath(path, Paint()..color = fillColor);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
