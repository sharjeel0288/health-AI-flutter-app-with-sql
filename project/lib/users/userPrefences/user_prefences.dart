// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';
import 'package:project/users/userPrefences/health_retrival.dart';
import 'package:project/variables/data.dart';
// ignore: depend_on_referenced_packages
import 'package:shared_preferences/shared_preferences.dart';
import '../model/user.dart';

class RememberUserPrefs {
  static Future<void> saveRememberUser(User userInfo) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String userJsonData = jsonEncode(userInfo.toJason());
    await preferences.setString('currentUser', userJsonData);
  }

  static Future<void> readUser() async {
    User currentUserInfo;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? userInfo = preferences.getString('currentUser');
    if (userInfo != null) {
      Map<String, dynamic> userDataMap = jsonDecode(userInfo);
      currentUserInfo = User.fromJason(userDataMap);
      // print('usssssssssseeeeeeeeeer            ${currentUserInfo.user_email}');
      GuserName=currentUserInfo.user_name;
      GuserEmail=currentUserInfo.user_email;
      GuserPassword=currentUserInfo.user_password;
      GuserId=currentUserInfo.user_id;
      // print('user name     $GuserName   ');
      // print(GuserId);
      rememberUser = true;
      print('ussssssssssssssssssssssssssssssssssssssseeeeeeeeeeeeeeeerrrr');
      HealthRetrival.readHealthData();
     
    print('heightttttttttttttttttttttttttttt   $Gheight');

    } else {
      rememberUser = false;
    }
  }

  static Future<void> clearPreferencess() async {
    SharedPreferences preferencesclear = await SharedPreferences.getInstance();
    await preferencesclear.remove('currentUser');
    // await preferencesclear.clear();
    // ignore: unused_local_variable
    User currentUserInfo;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? userInfo = preferences.getString('currentUser');
    if (userInfo != null) {
      Map<String, dynamic> userDataMap = jsonDecode(userInfo);
      currentUserInfo = User.fromJason(userDataMap);
      // print('usssssssssseeeeeeeeeer            ${currentUserInfo.user_email}');
      rememberUser = true;
    }
    else {
      // print('usssssssssseeeeeeeeeer            not found');
    }
      exit(1);
  }
}
