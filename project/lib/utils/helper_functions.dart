import 'package:flutter/material.dart';
import 'package:project/components/card.dart';
import 'package:project/variables/data.dart';
import 'package:flutter/cupertino.dart';

class HelperFunctions {
  static Widget wrapWithAnimatedBuilder({
    required Animation<Offset> animation,
    required Widget child,
  }) {
    return AnimatedBuilder(
      animation: animation,
      builder: (_, __) => FractionalTranslation(
        translation: animation.value,
        child: child,
      ),
    );
  }
}

List<Widget> getDoctors(String selected) {
  List<Widget> doctorCard = [];
  doctorCard.add(
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              selected == '' ? 'All doctors' : '${selected}s',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(),
        ],
      ),
    ),
  );
  if (selected == '') {
    for (var i = 0; i < Gcardiologist.length; i++) {
      doctorCard.add(Cards(
          drName: Gcardiologist[i].doctor_name,
          description: Gcardiologist[i].doctor_description,
          designation: Gcardiologist[i].doctor_designation,
          image: 'images/doctor.jpg',
          about: Gcardiologist[i].doctor_about,
          address: Gcardiologist[i].doctor_address,
          dailytimings:
              '${Gcardiologist[i].doctor_days} (${Gcardiologist[i].doctor_hours})',
          contact: Gcardiologist[i].doctor_contact,
          mail: Gcardiologist[i].doctor_email));
    }

    for (var i = 0; i < Gpulmonologist.length; i++) {
      doctorCard.add(Cards(
          drName: Gpulmonologist[i].doctor_name,
          description: Gpulmonologist[i].doctor_description,
          designation: Gpulmonologist[i].doctor_designation,
          image: 'images/doctor.jpg',
          about: Gpulmonologist[i].doctor_about,
          address: Gpulmonologist[i].doctor_address,
          dailytimings:
              '${Gpulmonologist[i].doctor_days} (${Gpulmonologist[i].doctor_hours})',
          contact: Gpulmonologist[i].doctor_contact,
          mail: Gpulmonologist[i].doctor_email));
    }

    for (var i = 0; i < Gdermatologist.length; i++) {
      doctorCard.add(Cards(
          drName: Gdermatologist[i].doctor_name,
          description: Gdermatologist[i].doctor_description,
          designation: Gdermatologist[i].doctor_designation,
          image: 'images/doctor.jpg',
          about: Gdermatologist[i].doctor_about,
          address: Gdermatologist[i].doctor_address,
          dailytimings:
              '${Gdermatologist[i].doctor_days} (${Gdermatologist[i].doctor_hours})',
          contact: Gdermatologist[i].doctor_contact,
          mail: Gdermatologist[i].doctor_email));
    }
    for (var i = 0; i < Ggastroenterologist.length; i++) {
      doctorCard.add(Cards(
          drName: Ggastroenterologist[i].doctor_name,
          description: Ggastroenterologist[i].doctor_description,
          designation: Ggastroenterologist[i].doctor_designation,
          image: 'images/doctor.jpg',
          about: Ggastroenterologist[i].doctor_about,
          address: Ggastroenterologist[i].doctor_address,
          dailytimings:
              '${Ggastroenterologist[i].doctor_days} (${Ggastroenterologist[i].doctor_hours})',
          contact: Ggastroenterologist[i].doctor_contact,
          mail: Ggastroenterologist[i].doctor_email));
    }

    for (var i = 0; i < Ggynaecologist.length; i++) {
      doctorCard.add(Cards(
          drName: Ggynaecologist[i].doctor_name,
          description: Ggynaecologist[i].doctor_description,
          designation: Ggynaecologist[i].doctor_designation,
          image: 'images/doctor.jpg',
          about: Ggynaecologist[i].doctor_about,
          address: Ggynaecologist[i].doctor_address,
          dailytimings:
              '${Ggynaecologist[i].doctor_days} (${Ggynaecologist[i].doctor_hours})',
          contact: Ggynaecologist[i].doctor_contact,
          mail: Ggynaecologist[i].doctor_email));
    }
    for (var i = 0; i < Gorthopedic.length; i++) {
      doctorCard.add(Cards(
          drName: Gorthopedic[i].doctor_name,
          description: Gorthopedic[i].doctor_description,
          designation: Gorthopedic[i].doctor_designation,
          image: 'images/doctor.jpg',
          about: Gorthopedic[i].doctor_about,
          address: Gorthopedic[i].doctor_address,
          dailytimings:
              '${Gorthopedic[i].doctor_days} (${Gorthopedic[i].doctor_hours})',
          contact: Gorthopedic[i].doctor_contact,
          mail: Gorthopedic[i].doctor_email));
    }
  } else if (selected == 'orthopedic') {
    for (var i = 0; i < Gorthopedic.length; i++) {
      doctorCard.add(Cards(
          drName: Gorthopedic[i].doctor_name,
          description: Gorthopedic[i].doctor_description,
          designation: Gorthopedic[i].doctor_designation,
          image: 'images/doctor.jpg',
          about: Gorthopedic[i].doctor_about,
          address: Gorthopedic[i].doctor_address,
          dailytimings:
              '${Gorthopedic[i].doctor_days} (${Gorthopedic[i].doctor_hours})',
          contact: Gorthopedic[i].doctor_contact,
          mail: Gorthopedic[i].doctor_email));
    }
  } else if (selected == 'gynaecologist') {
    for (var i = 0; i < Ggynaecologist.length; i++) {
      doctorCard.add(Cards(
          drName: Ggynaecologist[i].doctor_name,
          description: Ggynaecologist[i].doctor_description,
          designation: Ggynaecologist[i].doctor_designation,
          image: 'images/doctor.jpg',
          about: Ggynaecologist[i].doctor_about,
          address: Ggynaecologist[i].doctor_address,
          dailytimings:
              '${Ggynaecologist[i].doctor_days} (${Ggynaecologist[i].doctor_hours})',
          contact: Ggynaecologist[i].doctor_contact,
          mail: Ggynaecologist[i].doctor_email));
    }
  } else if (selected == 'cardiologist') {
    for (var i = 0; i < Gcardiologist.length; i++) {
      doctorCard.add(Cards(
          drName: Gcardiologist[i].doctor_name,
          description: Gcardiologist[i].doctor_description,
          designation: Gcardiologist[i].doctor_designation,
          image: 'images/doctor.jpg',
          about: Gcardiologist[i].doctor_about,
          address: Gcardiologist[i].doctor_address,
          dailytimings:
              '${Gcardiologist[i].doctor_days} (${Gcardiologist[i].doctor_hours})',
          contact: Gcardiologist[i].doctor_contact,
          mail: Gcardiologist[i].doctor_email));
    }
  } else if (selected == 'pulmonologist') {
    for (var i = 0; i < Gpulmonologist.length; i++) {
      doctorCard.add(Cards(
          drName: Gpulmonologist[i].doctor_name,
          description: Gpulmonologist[i].doctor_description,
          designation: Gpulmonologist[i].doctor_designation,
          image: 'images/doctor.jpg',
          about: Gpulmonologist[i].doctor_about,
          address: Gpulmonologist[i].doctor_address,
          dailytimings:
              '${Gpulmonologist[i].doctor_days} (${Gpulmonologist[i].doctor_hours})',
          contact: Gpulmonologist[i].doctor_contact,
          mail: Gpulmonologist[i].doctor_email));
    }
  } else if (selected == 'gastroenterologist') {
    for (var i = 0; i < Ggastroenterologist.length; i++) {
      doctorCard.add(Cards(
          drName: Ggastroenterologist[i].doctor_name,
          description: Ggastroenterologist[i].doctor_description,
          designation: Ggastroenterologist[i].doctor_designation,
          image: 'images/doctor.jpg',
          about: Ggastroenterologist[i].doctor_about,
          address: Ggastroenterologist[i].doctor_address,
          dailytimings:
              '${Ggastroenterologist[i].doctor_days} (${Ggastroenterologist[i].doctor_hours})',
          contact: Ggastroenterologist[i].doctor_contact,
          mail: Ggastroenterologist[i].doctor_email));
    }
  } else if (selected == 'dermatologist') {
    for (var i = 0; i < Gdermatologist.length; i++) {
      doctorCard.add(Cards(
          drName: Gdermatologist[i].doctor_name,
          description: Gdermatologist[i].doctor_description,
          designation: Gdermatologist[i].doctor_designation,
          image: 'images/doctor.jpg',
          about: Gdermatologist[i].doctor_about,
          address: Gdermatologist[i].doctor_address,
          dailytimings:
              '${Gdermatologist[i].doctor_days} (${Gdermatologist[i].doctor_hours})',
          contact: Gdermatologist[i].doctor_contact,
          mail: Gdermatologist[i].doctor_email));
    }
  }
  return doctorCard;
}
