// ignore_for_file: must_be_immutable, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, depend_on_referenced_packages, avoid_print
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DoctorInfo extends StatelessWidget {
  String drName,
      image,
      designation,
      about,
      address,
      dailytimings,
      mail,
      contact;
  DoctorInfo({
    super.key,
    required this.drName,
    required this.designation,
    required this.image,
    required this.about,
    required this.address,
    required this.dailytimings,
    required this.contact,
    required this.mail,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black87),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Image.asset(image, width: 160),
                  const SizedBox(
                    width: 12,
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Text(
                            drName,
                            style: const TextStyle(fontSize: 25),
                          ),
                        ),
                        Container(
                          child: Text(
                            designation,
                            style: const TextStyle(
                                fontSize: 19, color: Colors.grey),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Row(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () async {
                                print('asfasfasfasfasfasf');
                                Uri phoneno = Uri.parse(
                                    'mailto:$mail?subject=News&body=New%20plugin');
                                if (await launchUrl(phoneno)) {
                                } else {
                                  Fluttertoast.showToast(
                                      msg: 'Not available at the moment!');
                                }
                              },
                              child: const IconTile(
                                backColor: Color(0xffFFECDD),
                                imgAssetPath: "assets/email.png",
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                print('asfasfasfasfasfasf');
                                Uri phoneno = Uri.parse('tel:$contact');
                                if (await launchUrl(phoneno)) {
                                } else {
                                  Fluttertoast.showToast(
                                      msg: 'Not available at the moment!');
                                }
                              },
                              child: const IconTile(
                                backColor: Color(0xffFEF2F0),
                                imgAssetPath: "assets/call.png",
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 26,
              ),
              const Text(
                "About",
                style: TextStyle(fontSize: 22),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                about,
                style: const TextStyle(color: Colors.grey, fontSize: 16),
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Image.asset("assets/mappin.png"),
                          const SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Address",
                                style: TextStyle(
                                    color: Colors.black87.withOpacity(0.7),
                                    fontSize: 20),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width - 268,
                                  child: Text(
                                    address,
                                    style: const TextStyle(color: Colors.grey),
                                  ))
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: <Widget>[
                          Image.asset("assets/clock.png"),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Daily Practict",
                                style: TextStyle(
                                    color: Colors.black87.withOpacity(0.7),
                                    fontSize: 20),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width - 268,
                                child: Text(
                                  dailytimings,
                                  style: const TextStyle(color: Colors.grey),
                                ),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  Image.asset(
                    "assets/map.png",
                    width: 180,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class IconTile extends StatelessWidget {
  final String imgAssetPath;
  final Color backColor;

  const IconTile(
      {super.key, required this.imgAssetPath, required this.backColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(right: 16),
      child: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
            color: backColor, borderRadius: BorderRadius.circular(15)),
        child: Image.asset(
          imgAssetPath,
          width: 20,
        ),
      ),
    );
  }
}
