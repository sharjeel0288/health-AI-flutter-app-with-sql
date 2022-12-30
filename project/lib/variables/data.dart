// ignore_for_file: non_constant_identifier_names

import 'package:project/users/model/doctor_information.dart';
import 'package:project/users/model/prediction.dart';

String GuserEmail = '',
    GuserPassword = '',
    GuserName = '',
    GuserNameEmail = '',
    Gsex = '';
int Gheight = 0, Gweight = 0, Gage = 0, GuserId = 0;
bool rememberUser = false;
List<DoctorInformation> Gcardiologist = [];

List<DoctorInformation> Gpulmonologist = [];

List<DoctorInformation> Gdermatologist = [];
List<DoctorInformation> Ggastroenterologist = [];

List<DoctorInformation> Ggynaecologist = [];

List<DoctorInformation> Gorthopedic = [];


List<Predictions> Gpredictions=[];