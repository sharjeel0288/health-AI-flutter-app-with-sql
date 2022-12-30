// ignore_for_file: depend_on_referenced_packages, library_private_types_in_public_api, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project/utils/constant.dart';
import 'package:project/screens/analyze_screen.dart';
import 'package:project/screens/home_screen.dart';
import 'package:project/screens/setting_screen.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

class WelcomeScreen extends StatelessWidget {
  static String id = 'WelcomeScreen';
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: kThemeData,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Color navigationBarColor = Colors.white;
  int selectedIndex = 0;
  late PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    /// [AnnotatedRegion<SystemUiOverlayStyle>] only for android black navigation bar. 3 button navigation control (legacy)

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: navigationBarColor,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: Colors.grey,
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          children: <Widget>[
            Scaffold(
              body: SettingScreen(),
            ),
            Scaffold(
              body: AnalyzeScreen(),
            ),
            Scaffold(
              body: HomeScreen(),
            ),
          ],
        ),
        bottomNavigationBar: WaterDropNavBar(
          backgroundColor: darkmode == false ? Colors.white : Colors.grey,
          inactiveIconColor: Colors.blueAccent.shade200,
          onItemSelected: (int index) {
            setState(() {
              selectedIndex = index;
              print(selectedIndex);
            });
            pageController.animateToPage(selectedIndex,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeOutQuad);
          },
          selectedIndex: selectedIndex,
          barItems: <BarItem>[
            BarItem(
                filledIcon: Icons.medication_rounded,
                outlinedIcon: Icons.medication_outlined),
            BarItem(
              filledIcon: Icons.health_and_safety_rounded,
              outlinedIcon: Icons.health_and_safety_outlined,
            ),
            BarItem(
              filledIcon: Icons.home_rounded,
              outlinedIcon: Icons.home_outlined,
            ),
          ],
        ),
      ),
    );
  }
}



