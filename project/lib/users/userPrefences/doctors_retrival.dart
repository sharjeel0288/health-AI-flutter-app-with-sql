// ignore_for_file: avoid_print

import 'package:project/users/model/doctor_information.dart';
import 'package:project/variables/data.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:project/api_connection/api_connection.dart';

class DoctorRetrival {
  static Future<void> retiveDoctorsData() async {
    print(
        'DDDDDDDDDDDDOoooooooooooooooooooocccccccccccccccccccttttttttttttttooooooooooooooor');
    try {
      var res = await http.post(
        Uri.parse(API.retriveDoctorData),
      );
      if (res.statusCode == 200) {
        print(
            'kkkkkkkkkkkkkkkkkkkkkkkkooooooooooooooooooooooooooooooooooooooooooooooolllllllllllllllll');
        var resBodyOfDoctorData = jsonDecode(res.body);
        var doctorRes = resBodyOfDoctorData['doctorData'];
        print(doctorRes[0]['doctor_id']);
        print(resBodyOfDoctorData['doctorData'].length);
        if (resBodyOfDoctorData['success']) {
          print('bhai jb milgya tw kiyooon found');
          // var doctorsInfo = resBodyOfDoctorData['doctordata'];
          for (var i = 0; i < doctorRes.length; i++) {
          DoctorInformation doctorToBeAdd=DoctorInformation(
          int.parse(  doctorRes[i]['doctor_id']), 
            doctorRes[i]['doctor_name'], 
            doctorRes[i]['doctor_designation'], 
            doctorRes[i]['doctor_description'], 
            doctorRes[i]['doctor_about'], 
            doctorRes[i]['doctor_address'], 
            doctorRes[i]['doctor_category'], 
            doctorRes[i]['doctor_contact'], 
            doctorRes[i]['doctor_days'], 
            doctorRes[i]['doctor_email'], 
            doctorRes[i]['doctor_hours'], 
              );
            if (doctorRes[i]['doctor_designation'].toLowerCase() ==
                'orthopedic') {
              Gorthopedic.add(doctorToBeAdd);
            } else if (doctorRes[i]['doctor_designation'].toLowerCase()==
                'cardiologist') {
              Gcardiologist.add(doctorToBeAdd);
            } else if (doctorRes[i]['doctor_designation'].toLowerCase() ==
                'pulmonologist') {
              Gpulmonologist.add(doctorToBeAdd);
            } else if (doctorRes[i]['doctor_designation'].toLowerCase() ==
                'gastroenterologist') {
              Ggastroenterologist.add(doctorToBeAdd);
            } else if (doctorRes[i]['doctor_designation'].toLowerCase() ==
                'gynaecologist') {
              Ggynaecologist.add(doctorToBeAdd);
            }
          }
        } else {
          print(
              'ddddddddddddddddddddddddddddddddddddddddddddddddddddata not found');
        }
      }
    } catch (e) {
      print('yar nahi karo');
      print(e.toString());
    }
  }
}
