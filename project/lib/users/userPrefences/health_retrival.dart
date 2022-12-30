// ignore_for_file: depend_on_referenced_packages, avoid_print

import 'package:project/variables/data.dart';
import 'package:project/users/model/health.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:project/api_connection/api_connection.dart';

class HealthRetrival {
  static Future<void> readHealthData() async {
    // print(
    //     'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
    try {
      var res = await http.post(
        Uri.parse(API.retriveHealthData),
        body: {'user_id': GuserId.toString()},
      );
      print(GuserId);
      if (res.statusCode == 200) {
        print(
            'health data');
        var resBodyOfHealthData = jsonDecode(res.body);
        if (resBodyOfHealthData['Found']) {
          print(
              'health data found');
          Health healthInfo =
              Health.fromJason(resBodyOfHealthData["healthData"]);
          Gage = healthInfo.age;
          Gheight = healthInfo.height;
          Gweight = healthInfo.weight;
          Gsex = healthInfo.sex;
        } else {
          print(
              'health data not found');
        }
      }
    } catch (e) {
      print(
          'eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeerrrrrrrrrrrrrrrrrrrrrrrrrrrrrooooooooooooooooooooooooooooooooooeeeeeeeeeeeeeeeeeeeeeeeee');
      print(e.toString());
    }
  }
}
