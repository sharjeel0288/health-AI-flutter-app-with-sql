// ignore_for_file: depend_on_referenced_packages, avoid_print


import 'package:flutter/material.dart';
import 'package:project/screens/welcome_screen.dart';
import 'package:project/screens/Onboarding_screen.dart';
import 'dart:async';
import 'package:is_first_run/is_first_run.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project/screens/login_screen/login_screen.dart';
import 'package:project/users/userPrefences/doctors_retrival.dart';
import 'package:project/users/userPrefences/prediction_retreval.dart';
import 'package:project/variables/data.dart';
import 'package:project/users/userPrefences/user_prefences.dart';

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const HealthApp());
}

class HealthApp extends StatefulWidget {
  const HealthApp({Key? key}) : super(key: key);

  @override
  State<HealthApp> createState() => _HealthAppState();
}

class _HealthAppState extends State<HealthApp> {
  bool? _firstTime;
  int? navigateto;
  @override
  void initState() {
    Firebase.initializeApp();
    print(_firstTime);
    super.initState();
    initPlatformState();
    DoctorRetrival.retiveDoctorsData();
    print('heightttttttttttttttttttttttttttt   $Gheight');

  }

  Future<void> initPlatformState() async {
    await RememberUserPrefs.readUser();
    bool firstRun = await IsFirstRun.isFirstRun();
    setState(() {
      _firstTime = firstRun;
    });
     PredictionRetrival.retivePredictionData();

  }

  Widget getNavigationScreen() {
    if (_firstTime == true) {
      return OnBoardingPage();
    } else if (_firstTime == false && rememberUser == false) {
      return LoginScreen();
    } else {
      return const WelcomeScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   theme: customLightTheme(),
    //   darkTheme: customDarkTheme(),
    //   debugShowCheckedModeBanner: false,
    //   themeMode: ThemeMode.system,
    //   initialRoute:rememberUser==false? WelcomeScreen.id:LoginScreen.id,
    //   // initialRoute:_firstTime==true?OnBoardingPage.id:rememberUser==true? WelcomeScreen.id:LoginScreen.id,
    //   routes: {
    //     OnBoardingPage.id: (context) => OnBoardingPage(),
    //     WelcomeScreen.id: (context) => const WelcomeScreen(),
    //     SettingScreen.id: (context) => SettingScreen(),
    //     HomeScreen.id: (context) => HomeScreen(),
    //     Result.id: (context) => Result(),
    //     LoginScreen.id: (context) => LoginScreen(),
    //     AnalyzeScreen.id: (context) => AnalyzeScreen(),
    //     MyHealth.id: (context) => MyHealth(),
    //   },
    // );
    return MaterialApp(
      home: getNavigationScreen(),
      // home: OnBoardingPage(),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:heart_bpm/heart_bpm.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Heart BPM Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: HomePage(),
//     );
//   }
// }
//   late String temp;

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   List<SensorValue> data = [];
//   List<SensorValue> bpmValues = [];
//   //  Widget chart = BPMChart(data);

//   bool isBPMEnabled = false;
//   Widget? dialog;
//   void onRawData(var val) {
//     setState(() {
//       if (data.length >= 100) data.removeAt(0);
//       data.add(val);
//     });
//   }
//   void onBPM(var value){
//     setState(() {
//               if (bpmValues.length >= 100) bpmValues.removeAt(0);
//               bpmValues.add(
//                   SensorValue(value: value.toDouble(), time: DateTime.now()));
//             });
//   }
//   Widget done(){
//     print(temp);
// return Container(
//             width: 0,
//             height: 0,
//             child: HeartBPMDialog(
//               alpha: 0,
//               context: context,
//               onRawData: (value) {
//                 setState(() {
//                   if (data.length >= 100) data.removeAt(0);
//                   data.add(value);
//                 });
//                 // chart = BPMChart(data);
//               },
//               onBPM: (value) => setState(() {
//                 if (bpmValues.length >= 100) bpmValues.removeAt(0);
//                 bpmValues.add(
//                     SensorValue(value: value.toDouble(), time: DateTime.now()));
//               }),
//               // sampleDelay: 1000 ~/ 20,
//               child: Container(
//                 height: 0,
//                 width: 0,
//                 child: BMPChart(data),
//               ),
//             ),
//           );
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Heart BPM Demo'),
//       ),
//       body: Column(
//         children: [
//           // isBPMEnabled
//           // ?
//           // dialog = Container(
//           //   width: 0,
//           //   height: 0,
//           //   child: HeartBPMDialog(
//           //     alpha: 0,
//           //     context: context,
//           //     onRawData: (value) {
//           //       setState(() {
//           //         if (data.length >= 100) data.removeAt(0);
//           //         data.add(value);
//           //       });
//           //       // chart = BPMChart(data);
//           //     },
//           //     onBPM: (value) => setState(() {
//           //       if (bpmValues.length >= 100) bpmValues.removeAt(0);
//           //       bpmValues.add(
//           //           SensorValue(value: value.toDouble(), time: DateTime.now()));
//           //     }),
//           //     // sampleDelay: 1000 ~/ 20,
//           //     child: Container(
//           //       height: 0,
//           //       width: 0,
//           //       child: BMPChart(data),
//           //     ),
//           //   ),
//           // )
          
//           // : SizedBox(),
//           isBPMEnabled && data.isNotEmpty
//           ?

//           Container(
//             decoration: BoxDecoration(border: Border.all()),
//             height: 180,
//             child: BMPChart(data),
//           )
//           : SizedBox(),
//           isBPMEnabled && bpmValues.isNotEmpty
//           ?
//           Container(
//             decoration: BoxDecoration(border: Border.all()),
//             constraints: BoxConstraints.expand(height: 180),
//             child: BMPChart(bpmValues),
//           )
//           : SizedBox(),
//           Center(
//             child: ElevatedButton.icon(
//               icon: Icon(Icons.favorite_rounded),
//               label: Text(isBPMEnabled ? "Stop measurement" : "Measure BPM"),
//               onPressed: () => setState(() {
//                 if (isBPMEnabled) {
//                   isBPMEnabled = false;
//                   // dialog.
//                 } else
//                   {isBPMEnabled = true;
//                   setState(() {
                    
//                   done();
//                   });
//                   }
                  
//               }),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// Text text(int val) {
//   temp=val.toString();
//   print(temp);
//   return Text(val.toString());
// }

// Widget BMPChart(List<SensorValue> l) {
//   Text t=Text('');
//   for (int i = 0; i < l.length; i++) {
//     t=(text(l[i].value.toInt().abs()));
//   }
//   return Container(
//     child: t,
//   );
// }













// import 'package:flutter/material.dart';
// import 'dart:async';

// import 'package:pedometer/pedometer.dart';
// String formatDate(DateTime d) {
//   return d.toString().substring(0, 19);
// }

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   late Stream<StepCount> _stepCountStream;
//   late Stream<PedestrianStatus> _pedestrianStatusStream;
//   String _status = '?', _steps = '?';

//   @override
//   void initState() {
//     super.initState();
//     initPlatformState();
//   }

//   void onStepCount(StepCount event) {
//     print(event);
//     print('afasfasfasf');
//     setState(() {
//       _steps = event.steps.toString();
//     });
//   }

//   void onPedestrianStatusChanged(PedestrianStatus event) {
//     print(event);
//     setState(() {
//       _status = event.status;
//     });
//   }

//   void onPedestrianStatusError(error) {
//     print('onPedestrianStatusError: $error');
//     setState(() {
//       _status = 'Pedestrian Status not available';
//     });
//     print(_status);
//   }

//   void onStepCountError(error) {
//     print('onStepCountError: $error');
//     setState(() {
//       _steps = 'Step Count not available';
//     });
//   }

//   void initPlatformState() {

//     _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
//     _pedestrianStatusStream
//         .listen(onPedestrianStatusChanged)
//         .onError(onPedestrianStatusError);

//     _stepCountStream = Pedometer.stepCountStream;
//     _stepCountStream.listen(onStepCount).onError(onStepCountError);

//     if (!mounted) return;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Pedometer example app'),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text(
//                 'Steps taken:',
//                 style: TextStyle(fontSize: 30),
//               ),
//               Text(
//                 _steps,
//                 style: TextStyle(fontSize: 60),
//               ),
//               Divider(
//                 height: 100,
//                 thickness: 0,
//                 color: Colors.white,
//               ),
//               Text(
//                 'Pedestrian status:',
//                 style: TextStyle(fontSize: 30),
//               ),
//               Icon(
//                 _status == 'walking'
//                     ? Icons.directions_walk
//                     : _status == 'stopped'
//                         ? Icons.accessibility_new
//                         : Icons.error,
//                 size: 100,
//               ),
//               Center(
//                 child: Text(
//                   _status,
//                   style: _status == 'walking' || _status == 'stopped'
//                       ? TextStyle(fontSize: 30)
//                       : TextStyle(fontSize: 20, color: Colors.red),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
