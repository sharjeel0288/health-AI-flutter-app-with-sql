class API {
  static const hostConnect = 'http://192.168.0.107/api_health_app';
  static const hostConnectUser = '$hostConnect/user';

  //signup user
  static const signUp = '$hostConnect/user/signup.php';
  static const validateEmail = '$hostConnect/user/validate_email.php';
  static const validateEmailUsernamePassword =
      '$hostConnect/user/validate_email_username_password.php';
  static const changePassword = '$hostConnect/user/change_password.php';
  static const deleteAccount = '$hostConnect/user/delete_Account.php';
  static const storeHealthData = '$hostConnect/user/store_health_data.php';
  static const retriveHealthData = '$hostConnect/user/retrive_health_data.php';
  static const retriveDoctorData = '$hostConnect/user/doctors_Retrival.php';
  static const retrivePredictionData = '$hostConnect/user/retrive_predictions.php';
  static const savePrediction = '$hostConnect/user/save_prediction.php';
  
}
