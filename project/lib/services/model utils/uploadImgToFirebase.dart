// ignore_for_file: depend_on_referenced_packages, avoid_print, unnecessary_null_comparison, file_names

import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
Future uploadImageToFirebase(XFile? img)async{
    var file = File(img!.path);
  print(img.path);
    if(img!=null){
      print('in if');
    var snapshot =  await FirebaseStorage.instance.ref()
      .child('analyzeImage/${img.name}')
      .putFile(file)
      .whenComplete(() => print('doneeeeeee'));
      var  imgURL= await snapshot.ref.getDownloadURL();
      print(imgURL);
    }else{
      print('no path recived');
    }
  }