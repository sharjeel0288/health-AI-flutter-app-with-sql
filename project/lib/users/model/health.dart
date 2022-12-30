// ignore_for_file: unnecessary_this, non_constant_identifier_names

class Health {
  int user_id, age, weight, height;
  String sex;

  Health(this.user_id, this.height, this.weight, this.age, this.sex);

  factory Health.fromJason(Map<String, dynamic> json) => Health(
        int.parse(json['user_id']),
        int.parse(json['height']),
        int.parse(json['weight']),
        int.parse(json['age']),
        json['sex'],
      );

  Map<String, dynamic> toJason() => {
        'user_id': this.user_id.toString(),
        'height': this.height.toString(),
        'weight': this.weight.toString(),
        'age': this.age.toString(),
        'sex': this.sex,
      };
}
