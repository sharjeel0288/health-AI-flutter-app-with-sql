// ignore_for_file: depend_on_referenced_packages, use_key_in_widget_constructors, avoid_print, prefer_const_literals_to_create_immutables
import 'dart:math';

import 'package:pedometer/pedometer.dart';
import 'package:flutter/material.dart';
import 'package:project/components/MriCard.dart';
import 'package:project/components/arrowbutton.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:project/components/healthinfoCard.dart';
import 'package:image_picker/image_picker.dart';
import 'package:horizontal_list/horizontal_list.dart';
import 'package:project/components/symptopsCard.dart';
import 'package:project/variables/data.dart';

class AnalyzeScreen extends StatefulWidget {
  static String id = 'AnalyzeScreen';

  @override
  State<AnalyzeScreen> createState() => _AnalyzeScreenState();
}

class _AnalyzeScreenState extends State<AnalyzeScreen> {
  XFile? img;
  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;
  String status = '?', steps = '?';
  double bmi = 0;
  @override
  void initState() {
    super.initState();
    
    bmi = (Gweight / pow((Gheight / 100), 2));
    print('bmi $bmi');
    initPlatformState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void onStepCount(StepCount event) {
    print(event);
    print('afasfasfasf');
    setState(() {
      steps = event.steps.toString();
    });
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    print(event);
    setState(() {
      status = event.status;
    });
  }

  void onPedestrianStatusError(error) {
    print('onPedestrianStatusError: $error');
    setState(() {
      status = 'Pedestrian Status not available';
    });
    print(status);
  }

  void onStepCountError(error) {
    print('onStepCountError: $error');
    setState(() {
      steps = 'NAN';
    });
  }

  void initPlatformState() {
    _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
    _pedestrianStatusStream
        .listen(onPedestrianStatusChanged)
        .onError(onPedestrianStatusError);

    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(onStepCount).onError(onStepCountError);

    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // theme: customLightTheme(),
      // darkTheme: customDarkTheme(),
      // themeMode: ThemeMode.system,
      body: DraggableHome(
        backgroundColor: Colors.white.withOpacity(.94),
        // ignore: prefer_const_constructors
        title: Text(
          "Analyze health",
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        headerWidget: Container(
          // ignore: prefer_const_constructors
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage("images/analyzeScreenBg.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  'Analyze Health',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(4),
                  color: const Color.fromARGB(7, 0, 0, 0),
                  child: HorizontalListView(
                    width: double.maxFinite, //Width of widget
                    height: 150, //Height of widget
                    list: [
                      const SizedBox(
                        width: 4,
                      ),
                      
                      HealthCard(
                        color1: const Color.fromARGB(99, 99, 35, 237),
                        color2: const Color.fromARGB(98, 21, 2, 61),
                        color3: const Color.fromARGB(98, 43, 6, 121),
                        heading: 'BMI',
                        iconimg: 'images/bmi_icon.png',
                        unit: bmi == 0
                            ? 'Nan'
                            : bmi < 18.5
                                ? 'Underweight'
                                : bmi < 25
                                    ? 'Healthy Weight'
                                    : bmi < 30
                                        ? 'Overweight'
                                        : 'Obesity',
                        value: (bmi==0 || bmi==double.nan)? 'nan': bmi.round().toString(),
                      ),
                      HealthCard(
                        color1: const Color.fromARGB(100, 225, 186, 183),
                        color2: const Color.fromARGB(100, 166, 113, 109),
                        color3: const Color.fromARGB(100, 114, 73, 70),
                        heading: 'Heartbeat',
                        iconimg: 'images/heartrate.png',
                        unit: 'bmp',
                        value: '64',
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      HealthCard(
                        color1: const Color.fromARGB(100, 35, 146, 237),
                        color2: const Color.fromARGB(100, 16, 38, 160),
                        color3: const Color.fromARGB(100, 37, 7, 92),
                        heading: 'Steps',
                        iconimg: 'images/steps-icon.png',
                        unit: '',
                        value: steps,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                    ], //List of widget
                    // iconNext:
                    //     Icon(Icons.arrow_forward_ios), // Icon for button next
                    // iconPrevious:
                    //     Icon(Icons.arrow_back_ios), // Icon for button previous
                    curveAnimation: Curves.bounceIn, //Curve for animation
                    durationAnimation: const Duration(
                        milliseconds: 300), //Duration of animation
                    enableManualScroll: true, //Enable manual scroll
                    // onNextPressed: () {
                    //   //On button next pressed
                    //   print('On next pressed');
                    // },
                    // onPreviousPressed: () {
                    //   //On button next pressed
                    //   print('On previous pressed');
                    // },
                  ),
                ),
                const SizedBox(
                  height: 1,
                ),
              ],
            ),
          ),
        ),

        body: [
          Container(
            padding: const EdgeInsets.all(16.0),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Favourites',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                GestureDetector(
                  onTap: () {
                    print('gesture detector invoke');
                  },
                  child: Container(
                    // ignore: prefer_const_constructors
                    decoration: BoxDecoration(
                      boxShadow: [
                        const BoxShadow(
                            color: Color.fromARGB(255, 228, 224, 224), //New
                            blurRadius: 10.0,
                            offset: Offset(0, -1))
                      ],
                      borderRadius: const BorderRadius.all(
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
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Icon(
                                Icons.medical_services,
                                color: Color.fromARGB(255, 237, 237, 74),
                              ),
                              Arrowbutton(
                                onpress: () {},
                              ),
                            ],
                          ),
                          const Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('You are 80% fit '),
                              const Text('last check on 1st jan'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SymptopmsCard(
                    icon: const Icon(
                      Icons.healing,
                      size: 60,
                      color: Color.fromARGB(255, 22, 53, 206),
                    ),
                    headingtext: 'Analyze your symptoms',
                    bodyText: 'For better result input maximum symptoms',
                    modelCode: 'Symptoms'),
                MriCard(
                  icon: const Icon(
                    Icons.local_hospital,
                    size: 60,
                    color: Colors.red,
                  ),
                  headingtext: 'Analyze brain MRI',
                  bodyText: 'For better result scan with scanner',
                  modelCode: 'BrainMri',
                ),
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}
