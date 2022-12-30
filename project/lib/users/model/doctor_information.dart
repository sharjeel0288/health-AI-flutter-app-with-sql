// ignore_for_file: unnecessary_this, non_constant_identifier_names

class DoctorInformation {
  int doctor_id;
  String doctor_about,
      doctor_address,
      doctor_days,
      doctor_hours,
      doctor_contact,
      doctor_email,
      doctor_category;
      String doctor_name, doctor_designation, doctor_description;

DoctorInformation(
    this.doctor_id, this.doctor_name, this.doctor_designation,
      this.doctor_description,
      this.doctor_about,
      this.doctor_address,
      this.doctor_category,
      this.doctor_contact,
      this.doctor_days,
      this.doctor_email,
      this.doctor_hours);
      
  factory DoctorInformation.fromJason(Map<String, dynamic> json) => DoctorInformation(
        int.parse(json['doctor_id']),
        json['doctor_about'],
        json['doctor_address'],
        json['doctor_category'],
        json['doctor_contact'],
        json['doctor_days'],
        json['doctor_hours'],
        json['doctor_email'],
          json['doctor_name'],
        json['doctor_designation'],
        json['doctor_description'],
      );
  

  Map<String, dynamic> toJason() => {
        'doctor_id': this.doctor_id.toString(),
        'doctor_address': this.doctor_address,
        'doctor_category': doctor_category,
        'doctor_contact': doctor_contact,
        'doctor_days': doctor_days,
        'doctor_hours': doctor_hours,
        'doctor_email': doctor_email,
        'doctor_name':this.doctor_name,
        'doctor_designation':doctor_designation,
        'doctor_description':doctor_description
      };
}
