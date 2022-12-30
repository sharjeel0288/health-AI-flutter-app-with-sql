import 'package:flutter/material.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  Offset _offset = Offset.zero;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('My Health'),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios, // add custom icons also
          ),
        ),
      ),
      body: MaterialApp(
        home: Center(
          child: Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001) // perspective
              ..rotateX(0.01 * _offset.dy) // changed
              ..rotateY(-0.01 * _offset.dx), // changed
            alignment: FractionalOffset.center,
            child: GestureDetector(
              // new
              onPanUpdate: (details) =>
                  setState(() => _offset += details.delta),
              onDoubleTap: () => setState(() => _offset = Offset.zero),
              child: const FractionallySizedBox(
                widthFactor: 0.7,
                heightFactor: 0.9,
                child: Image(image: AssetImage('images/developer.png')),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
