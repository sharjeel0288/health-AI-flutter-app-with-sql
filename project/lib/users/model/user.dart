// ignore_for_file: non_constant_identifier_names, unnecessary_this

class User {
  int user_id;
  String user_name, user_email, user_password;

  User(this.user_id, this.user_name, this.user_email, this.user_password);

  factory User.fromJason(Map<String, dynamic> json) => User(
        int.parse(json['user_id']),
        json['user_name'],
        json['user_email'],
        json['user_password'],
      );

  Map<String, dynamic> toJason() => {
        'user_id': this.user_id.toString(),
        'user_name': this.user_name,
        'user_email': this.user_email,
        'user_password': this.user_password,
      };
}
