// ignore_for_file: avoid_print

import 'package:project/users/model/prediction.dart';
import 'package:project/variables/data.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:project/api_connection/api_connection.dart';

class PredictionRetrival {
  static Future<void> retivePredictionData() async {
    print(
        'predictionssssssssssssssssssss');
    try {
      var res = await http.post(Uri.parse(API.retrivePredictionData),
          body: {'user_id': GuserId.toString()});
      if (res.statusCode == 200) {
        var resBodyOfPredictionData = jsonDecode(res.body);
        var predictionRes = resBodyOfPredictionData['predictions'];
        print(predictionRes[0]['doctor_id']);
        print(resBodyOfPredictionData['predictions'].length);
        if (resBodyOfPredictionData['Found']) {
          print('bhai jb milgya tw kiyooon found');

          // var doctorsInfo = resBodyOfPredictionData['predictions'];
          for (var i = 0; i < predictionRes.length; i++) {

            Predictions predictionTObeAdd = Predictions(
              predictionRes[i]['date'],
              int.parse(predictionRes[i]['user_id']),
              predictionRes[i]['prediction'],
            );
            Gpredictions.add(predictionTObeAdd);
          }
          print(Gpredictions);
        } else {
          print(
              'ddddddddddddddddddddddddddddddddddddddddddddddddddddata not found');
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
