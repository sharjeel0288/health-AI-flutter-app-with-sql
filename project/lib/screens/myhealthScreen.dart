// ignore_for_file: depend_on_referenced_packages, use_key_in_widget_constructors, file_names, avoid_print


import 'package:card_settings/card_settings.dart';
import 'package:flutter/material.dart';
import 'package:project/api_connection/api_connection.dart';
import 'package:project/components/gradient_button.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:project/users/model/health.dart';
import 'dart:convert';
import 'package:project/variables/data.dart';

class MyHealth extends StatefulWidget {
  static String id = 'MyHealth';
  @override
  State<MyHealth> createState() => _MyHealthState();
}

class _MyHealthState extends State<MyHealth> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // theme: ThemeData(
      //   primaryColor: Colors.teal, // app header background
      //   secondaryHeaderColor: Colors.indigo[400], // card header background
      //   cardColor: Colors.white, // card field background
      //   backgroundColor: Colors.indigo[100], // app background color
      //   buttonColor: Colors.lightBlueAccent[100], // button background color
      //   textTheme: TextTheme(
      //     button: TextStyle(color: Colors.deepPurple[900]), // button text
      //     subtitle1: TextStyle(color: Colors.grey[800]), // input text
      //     headline6: TextStyle(color: Colors.white), // card header text
      //   ),
      //   primaryTextTheme: TextTheme(
      //     headline6: TextStyle(color: Colors.lightBlue[50]), // app header text
      //   ),
      //   inputDecorationTheme: InputDecorationTheme(
      //     labelStyle: TextStyle(color: Colors.indigo[400]), // style for labels
      //   ),
      // ),
      body: Scaffold(
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
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CardSettings(
                children: [
                  CardSettingsSection(
                    header: CardSettingsHeader(
                      label: 'Biometrics',
                    ),
                    children: <CardSettingsWidget>[
                      CardSettingsNumberPicker(
                        min: 80,
                        max: 240,
                        label: 'height in cm',
                        initialValue: Gheight,
                        validator: (value) {
                          if (value == 0) return 'this field is required';
                          return null;
                        },
                        onChanged: (value) {
                          print(value);
                          Gheight = value!;
                          print(Gheight);
                        },
                      ),
                      CardSettingsNumberPicker(
                        min: 5,
                        max: 100,
                        label: 'Age',
                        initialValue: Gage,
                        validator: (value) {
                          if (value == 0) return 'this field is required';
                          return null;
                        },
                        onChanged: (value) {
                          Gage = value!;
                        },
                      ),
                      CardSettingsNumberPicker(
                        min: 20,
                        max: 240,
                        label: 'weight in kg',
                        initialValue: Gweight,
                        validator: (value) {
                          if (value == 0) return 'this field is required';
                          return null;
                        },
                        onChanged: (value) {
                          Gweight = value!;
                        },
                      ),
                    ],
                  ),
                  CardSettingsSection(
                    header: CardSettingsHeader(
                      label: 'General',
                    ),
                    children: [
                      CardSettingsListPicker(
                        initialItem: Gsex,
                        label: 'Sex',
                        validator: (value) {
                          if (value == null || Gsex == '') {
                            'this field is required';
                          }
                          return null;
                        },
                        items: const ['Male', 'Female'],
                        onChanged: (value) {
                          Gsex = value.toString();
                          print(Gsex);
                        },
                      )
                    ],
                  )
                ],
              ),
              Gradientbutton(
                  gestureTapCallback: () async {
                    // print(title);
                    if (Gage == 0 ||
                        Gweight == 0 ||
                        Gheight == 0 ||
                        Gsex == '') {
                      Fluttertoast.showToast(msg: 'Please enter the values');
                    } else {
                      print(Gheight);
                      print(Gweight);
                      print(Gage);
                      print(Gsex);
                      Health healthModel =
                          Health(GuserId, Gheight, Gweight, Gage, Gsex);
                      try {
                        var res = await http.post(
                          Uri.parse(API.storeHealthData),
                          body: healthModel.toJason(),
                        );
                        if (res.statusCode == 200)
                        //from flutter app connection with api to server successfull
                        {
                          var resBodyOfHealthData = json.decode(res.body);
                          if (resBodyOfHealthData['success']) {
                            Fluttertoast.showToast(msg: 'Saved!');
                          } else {
                            Fluttertoast.showToast(msg: 'Error: try again');
                          }
                        }
                      } catch (e) {
                        print(e.toString());
                        Fluttertoast.showToast(msg: e.toString());
                      }
                    }
                  },
                  titleText: 'Save',
                  c1: const Color(0xff374ABE),
                  c2: const Color(0xff64B6FF))
            ],
          ),
        ),
      ),
    );
  }
}
