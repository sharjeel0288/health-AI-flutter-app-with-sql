// ignore_for_file: file_names, depend_on_referenced_packages, use_key_in_widget_constructors, avoid_print

import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:project/api_connection/api_connection.dart';
import 'package:project/components/gradient_button.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project/users/userPrefences/prediction_retreval.dart';
import 'package:project/variables/data.dart';

// ignore: must_be_immutable

class SymptomsAnalyzeScreen extends StatefulWidget {
  @override
  State<SymptomsAnalyzeScreen> createState() => _SymptomsAnalyzeScreenState();
}

class _SymptomsAnalyzeScreenState extends State<SymptomsAnalyzeScreen> {
  List<String> symptopsList = [];
  void addSymptom(String symptom) {
    if (symptopsList.contains(symptom)) {
    } else {
      symptopsList.add(symptom);
      setState(() {});
    }
  }

  void removeSymptom(String symptom) {
    symptopsList.remove(symptom);
    setState(() {});
  }

  final TextEditingController _typeAheadController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Disease prediction'),
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
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TypeAheadField(
                  textFieldConfiguration: TextFieldConfiguration(
                    cursorColor: Colors.black,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: 'Symptoms',
                      filled: true,
                      fillColor: const Color.fromARGB(255, 108, 136, 185),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(50)),
                    ),
                    controller: _typeAheadController,
                  ),
                  suggestionsCallback: (pattern) async {
                    return StateService.getSuggestions(pattern);
                  },
                  transitionBuilder: (context, suggestionsBox, controller) {
                    return suggestionsBox;
                  },
                  itemBuilder: (context, suggestion) {
                    return ListTile(
                      title: Text(suggestion.toString()),
                    );
                  },
                  onSuggestionSelected: (suggestion) {
                    _typeAheadController.clear;
                    setState(() {
                      addSymptom(suggestion.toString());
                    });
                  }),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 250,
              width: double.infinity,
              padding: const EdgeInsets.all(5),
              child: Wrap(
                spacing: 15,
                children: symptopsList.map(
                  (category) {
                    return Chip(
                      elevation: 10,
                      backgroundColor: Colors
                          .primaries[Random().nextInt(Colors.primaries.length)],
                      onDeleted: () {
                        removeSymptom(category);
                      },
                      deleteIcon: const Icon(Icons.remove_circle),
                      label: Text(category),
                    );
                  },
                ).toList(),
              ),
            ),
            Gradientbutton(
                gestureTapCallback: () async {
                  String query = '';
                  for (int i = 0; i < symptopsList.length; i++) {
                    query += '${symptopsList[i]},';
                  }
                  query = query.substring(0, query.length - 1);
                  http.Response response = await http.get(
                      Uri.parse('http://10.0.2.2:5000/symptoms?query=$query'));
                  var resResult = jsonDecode(response.body);
                  try {
                    var res = await http.post(
                      Uri.parse(API.savePrediction),
                      body: {
                        'user_id': GuserId.toString(),
                        'prediction': resResult['prediction']
                      },
                    );
                    if (res.statusCode == 200) {
                      var responseBodyOfStorePrediction = jsonDecode(res.body);
                      if (responseBodyOfStorePrediction['success']) {
                        Fluttertoast.showToast(
                            msg: 'Stored in your health history');
                      } else {
                        Fluttertoast.showToast(msg: 'error');
                      }
                    }
                  } catch (e) {
                    print(e.toString());
                  }
                  Gpredictions.clear();
                  PredictionRetrival.retivePredictionData();
                  Dialogs.materialDialog(
                    color: Colors.white,
                    msg:
                        'This prediction is not 100% correct please visit the doctor for better treatement',
                    title: resResult['prediction'],
                    lottieBuilder: Lottie.asset(
                      'images/diseaseAlert.json',
                      fit: BoxFit.contain,
                    ),
                    context: context,
                  );
                },
                titleText: "Analyze",
                c1: const Color.fromARGB(255, 33, 85, 174),
                c2: const Color.fromARGB(255, 10, 39, 90))
          ],
        ),
      ),
    );
  }
}

class StateService {
  static final List<String> states = [
    'Skin Rash',
    'Nodal Skin Eruptions',
    'Continuous Sneezing',
    'Shivering',
    'Chills',
    'Joint Pain',
    'Stomach Pain',
    'Acidity',
    'Ulcers On Tongue',
    'Muscle Wasting',
    'Vomiting',
    'Burning Micturition',
    'Spotting  urination',
    'Fatigue',
    'Weight Gain',
    'Anxiety',
    'Cold Hands And Feets',
    'Mood Swings',
    'Weight Loss',
    'Restlessness',
    'Lethargy',
    'Patches In Throat',
    'Irregular Sugar Level',
    'Cough',
    'High Fever',
    'Sunken Eyes',
    'Breathlessness',
    'Sweating',
    'Dehydration',
    'Indigestion',
    'Headache',
    'Yellowish Skin',
    'Dark Urine',
    'Nausea',
    'Loss Of Appetite',
    'Pain Behind The Eyes',
    'Back Pain',
    'Constipation',
    'Abdominal Pain',
    'Diarrhoea',
    'Mild Fever',
    'Yellow Urine',
    'Yellowing Of Eyes',
    'Acute Liver Failure',
    'Fluid Overload',
    'Swelling Of Stomach',
    'Swelled Lymph Nodes',
    'Malaise',
    'Blurred And Distorted Vision',
    'Phlegm',
    'Throat Irritation',
    'Redness Of Eyes',
    'Sinus Pressure',
    'Runny Nose',
    'Congestion',
    'Chest Pain',
    'Weakness In Limbs',
    'Fast Heart Rate',
    'Pain During Bowel Movements',
    'Pain In Anal Region',
    'Bloody Stool',
    'Irritation In Anus',
    'Neck Pain',
    'Dizziness',
    'Cramps',
    'Bruising',
    'Obesity',
    'Swollen Legs',
    'Swollen Blood Vessels',
    'Puffy Face And Eyes',
    'Enlarged Thyroid',
    'Brittle Nails',
    'Swollen Extremeties',
    'Excessive Hunger',
    'Extra Marital Contacts',
    'Drying And Tingling Lips',
    'Slurred Speech',
    'Knee Pain',
    'Hip Joint Pain',
    'Muscle Weakness',
    'Stiff Neck',
    'Swelling Joints',
    'Movement Stiffness',
    'Spinning Movements',
    'Loss Of Balance',
    'Unsteadiness',
    'Weakness Of One Body Side',
    'Loss Of Smell',
    'Bladder Discomfort',
    'Foul Smell Of urine',
    'Continuous Feel Of Urine',
    'Passage Of Gases',
    'Internal Itching',
    'Toxic Look (typhos)',
    'Depression',
    'Irritability',
    'Muscle Pain',
    'Altered Sensorium',
    'Red Spots Over Body',
    'Belly Pain',
    'Abnormal Menstruation',
    'Dischromic  Patches',
    'Watering From Eyes',
    'Increased Appetite',
    'Polyuria',
    'Family History',
    'Mucoid Sputum',
    'Rusty Sputum',
    'Lack Of Concentration',
    'Visual Disturbances',
    'Receiving Blood Transfusion',
    'Receiving Unsterile Injections',
    'Coma',
    'Stomach Bleeding',
    'Distention Of Abdomen',
    'History Of Alcohol Consumption',
    'Fluid Overload.1',
    'Blood In Sputum',
    'Prominent Veins On Calf',
    'Palpitations',
    'Painful Walking',
    'Pus Filled Pimples',
    'Blackheads',
    'Scurring',
    'Skin Peeling',
    'Silver Like Dusting',
    'Small Dents In Nails',
    'Inflammatory Nails',
    'Blister',
    'Red Sore Around Nose',
    'Yellow Crust Ooze'
  ];

  static List<String> getSuggestions(String query) {
    List<String> matches = [];
    matches.addAll(states);
    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }
}
