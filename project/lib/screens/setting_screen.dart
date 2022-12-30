// ignore_for_file: depend_on_referenced_packages, use_key_in_widget_constructors, avoid_print, use_build_context_synchronously

import 'dart:io';

import 'package:project/api_connection/api_connection.dart';
import 'package:project/components/gradient_button.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:project/screens/about_screen.dart';
import 'package:project/screens/predictionTable_screen.dart';
import 'package:project/variables/data.dart';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:project/screens/myhealthScreen.dart';
import 'package:project/users/userPrefences/user_prefences.dart';
import 'package:project/utils/constant.dart';
import 'package:draggable_home/draggable_home.dart';

class SettingScreen extends StatefulWidget {
  static String id = 'SettingScreen';
  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  String username = '';
  String? changeCurrentPassword, changeNewPassword;
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    await RememberUserPrefs.readUser();
    setState(() {
      username = GuserName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // theme: customLightTheme(),
      // darkTheme: customDarkTheme(),
      // themeMode: ThemeMode.system,
      body: DraggableHome(
        title: Text(
          "Settings",
          style: TextStyle(
              color: darkmode == false ? Colors.black : Colors.white,
              fontWeight: FontWeight.bold),
        ),
        headerWidget: Container(
          // ignore: prefer_const_constructors
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage("images/profileBackground.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Setting',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CircleAvatar(
                  radius: 80,
                  child: Image.asset(
                    'images/defaultUser.png',
                  ),
                ),
                Text(
                  username,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                //         SimpleUserCard(
                //         userName: "sharjeel ahmed",
                //         userProfilePic: const AssetImage("images/logo.png"),
                // ),
              ],
            ),
          ),
        ),
        backgroundColor: darkmode == false
            ? Colors.white.withOpacity(.94)
            : Colors.black.withOpacity(.94),
        body: [
          SettingsGroup(
            items: [
              SettingsItem(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyHealth()),
                  );
                },
                icons: Icons.local_hospital,
                iconStyle: IconStyle(
                  iconsColor: Colors.white,
                  withBackground: true,
                  backgroundColor: Colors.red,
                ),
                title: 'Yor Health ',
                subtitle: "Update your data for better analysis",
              ),
              SettingsItem(
                onTap: () {
                 
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PredictionTable()),
                  );
                },
                icons: Icons.history,
                iconStyle: IconStyle(
                  iconsColor: Colors.white,
                  withBackground: true,
                  backgroundColor: const Color.fromARGB(255, 119, 69, 4),
                ),
                title: 'Yor Health History',
                subtitle: "Get uptodated",
              ),
              SettingsItem(
                onTap: () {},
                icons: Icons.dark_mode_rounded,
                iconStyle: IconStyle(
                  iconsColor: Colors.white,
                  withBackground: true,
                  backgroundColor: Colors.red,
                ),
                title: 'Dark mode',
                subtitle: "Automatic",
                trailing: Switch.adaptive(
                  activeTrackColor: Colors.lightGreenAccent,
                  activeColor: Colors.green,
                  value: darkmode,
                  onChanged: (value) {
                    setState(() {
                      darkmode = value;
                      print(darkmode);
                    });
                  },
                ),
              ),
            ],
          ),
          SettingsGroup(
            items: [
              SettingsItem(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const About()));
                },
                icons: Icons.info_rounded,
                iconStyle: IconStyle(
                  backgroundColor: Colors.purple,
                ),
                title: 'About',
                subtitle: "About us",
              ),
            ],
          ),
          // You can add a settings title
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: SettingsGroup(
              settingsGroupTitle: "Account",
              items: [
                SettingsItem(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            scrollable: true,
                            title: const Text(
                              'Log Out',
                            ),
                            content: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Center(child: Text('Are you sure?'))),
                            actions: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 150,
                                    child: Gradientbutton(
                                        c1: const Color.fromARGB(
                                            255, 190, 55, 55),
                                        c2: const Color.fromARGB(
                                            255, 255, 100, 100),
                                        gestureTapCallback: () {
                                          RememberUserPrefs.clearPreferencess();
                                          RememberUserPrefs.readUser();
                                        },
                                        titleText: 'Yes'),
                                  ),
                                  SizedBox(
                                    width: 150,
                                    child: Gradientbutton(
                                        c1: const Color(0xff374ABE),
                                        c2: const Color(0xff64B6FF),
                                        gestureTapCallback: () async {
                                          Navigator.pop(context, true);
                                        },
                                        titleText: 'No'),
                                  )
                                ],
                              ),
                            ],
                          );
                        });
                  },
                  icons: Icons.exit_to_app_rounded,
                  title: "Sign Out",
                ),
                SettingsItem(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            scrollable: true,
                            title: const Center(
                                child: Text(
                              'Change password',
                            )),
                            content: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Form(
                                child: Column(
                                  children: <Widget>[
                                    TextFormField(
                                      onChanged: (val) {
                                        changeCurrentPassword = val;
                                      },
                                      decoration: const InputDecoration(
                                        labelText: 'Current password',
                                        icon: Icon(Icons.account_box_outlined),
                                      ),
                                    ),
                                    TextFormField(
                                      onChanged: (val) {
                                        changeNewPassword = val;
                                      },
                                      decoration: const InputDecoration(
                                        labelText: 'New password',
                                        icon: Icon(Icons.account_box_rounded),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            actions: [
                              Gradientbutton(
                                  c1: const Color(0xff374ABE),
                                  c2: const Color(0xff64B6FF),
                                  gestureTapCallback: () async {
                                    if (changeCurrentPassword ==
                                        changeNewPassword) {
                                      Fluttertoast.showToast(
                                          msg:
                                              'new password can not be current password');
                                      print('same password');
                                    } else {
                                      print('popingggg');
                                      try {
                                        print('in validate email');
                                        await RememberUserPrefs.readUser();
                                        var res = await http.post(
                                          Uri.parse(API.changePassword),
                                          body: {
                                            'user_id': GuserId.toString(),
                                            'user_password': changeNewPassword,
                                          },
                                        );
                                        if (res.statusCode ==
                                            200) //from flutter app connection with api to server successfull
                                        {
                                          var resBodyOfValidateEmail =
                                              jsonDecode(res.body);
                                          if (resBodyOfValidateEmail[
                                              'success']) {
                                            print('password change');
                                            Fluttertoast.showToast(
                                                msg: 'password changed!');
                                          } else {
                                            print('email not found');
                                            Fluttertoast.showToast(
                                                msg: 'Try again!');
                                          }
                                        }
                                      } catch (e) {
                                        print(
                                            'fuccccccccccccccccccccccccccccccccccccccccccccck    $e');
                                        Fluttertoast.showToast(
                                            msg: e.toString());
                                      }
                                      Navigator.pop(context, true);
                                    }
                                  },
                                  titleText: 'Confirms')
                            ],
                          );
                        });
                  },
                  icons: CupertinoIcons.repeat,
                  title: "Change password",
                ),
                SettingsItem(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            scrollable: true,
                            title: const Center(
                                child: Text(
                              'Delete account',
                            )),
                            content: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Center(child: Text('Are you sure?'))),
                            actions: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 150,
                                    child: Gradientbutton(
                                        c1: const Color.fromARGB(
                                            255, 190, 55, 55),
                                        c2: const Color.fromARGB(
                                            255, 255, 100, 100),
                                        gestureTapCallback: () async {
                                          try {
                                            print('in validate email');
                                            await RememberUserPrefs.readUser();
                                            var res = await http.post(
                                              Uri.parse(API.deleteAccount),
                                              body: {
                                                'user_id': GuserId.toString(),
                                              },
                                            );
                                            if (res.statusCode ==
                                                200) //from flutter app connection with api to server successfull
                                            {
                                              var resBodyOfValidateEmail =
                                                  jsonDecode(res.body);
                                              if (resBodyOfValidateEmail[
                                                  'success']) {
                                                print('Account Deleted');
                                                Fluttertoast.showToast(
                                                    msg: 'Account Deleted!');
                                              } else {
                                                print('error');
                                                Fluttertoast.showToast(
                                                    msg: 'Try again!');
                                              }
                                            }
                                          } catch (e) {
                                            print(
                                                'fuccccccccccccccccccccccccccccccccccccccccccccck    $e');
                                            Fluttertoast.showToast(
                                                msg: e.toString());
                                          }
                                          Navigator.pop(context, true);
                                          Future.delayed(
                                              const Duration(seconds: 5), () {
                                            exit(1);
                                          });
                                        },
                                        titleText: 'Yes'),
                                  ),
                                  SizedBox(
                                    width: 150,
                                    child: Gradientbutton(
                                        c1: const Color(0xff374ABE),
                                        c2: const Color(0xff64B6FF),
                                        gestureTapCallback: () async {
                                          Navigator.pop(context, true);
                                        },
                                        titleText: 'No'),
                                  )
                                ],
                              ),
                            ],
                          );
                        });
                  },
                  icons: CupertinoIcons.delete_solid,
                  title: "Delete account",
                  titleStyle: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
