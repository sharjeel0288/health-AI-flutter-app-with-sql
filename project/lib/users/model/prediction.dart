// ignore_for_file: unnecessary_this, non_constant_identifier_names

class Predictions {
  String date, prediction;
  int user_id;

  Predictions(this.date, this.user_id, this.prediction);

  factory Predictions.fromJason(Map<String, dynamic> json) => Predictions(
        json['date'],
        int.parse(json['user_id']),
        json['prediction'],
      );

  Map<String, dynamic> toJason() => {
        'date': this.date,
        'user_id': this.user_id.toString(),
        'prediction': this.prediction,
      };
}
