// ignore_for_file: depend_on_referenced_packages, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/components/DoctorHealthCard.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:horizontal_list/horizontal_list.dart';
import 'package:project/utils/helper_functions.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selected = '';
  List<Widget>? doctorsCards = [];
  void updateDoctorCardList() {
    setState(() {
      doctorsCards = getDoctors(selected);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // theme: customLightTheme(),
      // darkTheme: customDarkTheme(),
      // themeMode: ThemeMode.system,
      body: DraggableHome(
        title: const Text('Home'),
        headerWidget: Container(
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage("images/doctorsHomebackground.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: ListView(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                SizedBox(
                  height: 25,
                ),
                const Text(
                  textAlign: TextAlign.center,
                  'HOME',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(4),
                  color: Color.fromARGB(7, 0, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HorizontalListView(
                        width: double.maxFinite, //Width of widget
                        height: 170, //Height of widget
                        list: [
                          GestureDetector(
                            onTap: () {
                              if (selected == 'orthopedic') {
                                setState(() {
                                  selected = '';
                                });
                              } else
                                // ignore: curly_braces_in_flow_control_structures
                                setState(() {
                                  selected = 'orthopedic';
                                });
                            },
                            child: DoctorHealthCard(
                              color1: Color.fromARGB(255, 48, 77, 91),
                              color2: Color.fromARGB(255, 13, 60, 82),
                              color3: Color.fromARGB(255, 17, 89, 184),
                              borderColor: selected == 'orthopedic'
                                  ? Colors.white
                                  : Colors.transparent,
                              iconimg: 'images/bone-fracture-icon.png',
                              heading: 'Orthopedic',
                              avatar: 'images/orthopedicDoctor.png',
                            ),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          GestureDetector(
                            onTap: () {
                              if (selected == 'cardiologist') {
                                setState(() {
                                  selected = '';
                                });
                              } else {
                                setState(() {
                                  selected = 'cardiologist';
                                });
                              }
                            },
                            child: DoctorHealthCard(
                               color1: Color.fromARGB(255, 32, 116, 212),
                              color2: Color.fromARGB(255, 24, 52, 108),
                              color3: Color.fromARGB(255, 17, 87, 184),
                              borderColor: selected == 'cardiologist'
                                  ? Colors.white
                                  : Colors.transparent,
                              iconimg: 'images/cardioIcon.png',
                              heading: 'cardiologist',
                              avatar: 'images/cardiologistDoctor.png',
                            ),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          GestureDetector(
                            onTap: () {
                              if (selected == 'pulmonologist') {
                                setState(() {
                                  selected = '';
                                });
                              } else
                                // ignore: curly_braces_in_flow_control_structures
                                setState(() {
                                  selected = 'pulmonologist';
                                });
                            },
                            child: DoctorHealthCard(
                               color1: Color.fromARGB(255, 5, 167, 242),
                              color2: Color.fromARGB(255, 1, 100, 145),
                              color3: Color.fromARGB(255, 0, 20, 29),
                              borderColor: selected == 'pulmonologist'
                                  ? Colors.white
                                  : Colors.transparent,
                              iconimg: 'images/pulmonolyIcon.png',
                              heading: 'pulmonologist',
                              avatar: 'images/pulmonologistDoctor.png',
                            ),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          GestureDetector(
                            onTap: () {
                              if (selected == 'gynaecologist') {
                                setState(() {
                                  selected = '';
                                });
                              } else {
                                setState(() {
                                  selected = 'gynaecologist';
                                });
                              }
                            },
                            child: DoctorHealthCard(
                              color1: Color.fromARGB(255, 8, 239, 243),
                              color2: Color.fromARGB(255, 1, 137, 139),
                              color3: Color.fromARGB(255, 2, 62, 60),
                              borderColor: selected == 'gynaecologist'
                                  ? Colors.white
                                  : Colors.transparent,
                              iconimg: 'images/gynaeIcon.png',
                              heading: 'gynaecologist',
                              avatar: 'images/gynaecologistDoctor.png',
                            ),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          GestureDetector(
                            onTap: () {
                              if (selected == 'dermatologist') {
                                setState(() {
                                  selected = '';
                                });
                              } else {
                                setState(() {
                                  selected = 'dermatologist';
                                });
                              }
                            },
                            child: DoctorHealthCard(
                              borderColor: selected == 'dermatologist'
                                  ? Colors.white
                                  : Colors.transparent,
                              color1: Color.fromARGB(255, 54, 161, 211),
                              color2: Color.fromARGB(255, 24, 82, 108),
                              color3: Color.fromARGB(255, 17, 131, 184),
                              iconimg: 'images/dermaIcon.png',
                              heading: 'Dermatologist',
                              avatar: 'images/dermatologistDoctor.png',
                            ),
                          ),
                        ], //List of widget
                        // iconNext:
                        //     Icon(Icons.arrow_forward_ios), // Icon for button next
                        // iconPrevious:
                        //     Icon(Icons.arrow_back_ios), // Icon for button previous
                        curveAnimation: Curves.bounceIn, //Curve for animation
                        durationAnimation:
                            Duration(milliseconds: 300), //Duration of animation
                        enableManualScroll: true, //Enable manual scroll
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.white.withOpacity(.94),
        body: getDoctors(selected),
      ),
    );
  }
}
