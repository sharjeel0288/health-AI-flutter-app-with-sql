// ignore_for_file: depend_on_referenced_packages, avoid_print, use_build_context_synchronously
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:project/screens/welcome_screen.dart';
import 'package:project/users/model/user.dart';
import 'package:project/users/userPrefences/user_prefences.dart';
import 'package:project/utils/helper_functions.dart';
import 'package:email_validator/email_validator.dart';
import 'package:project/utils/constant.dart';
import '../animations/change_screen_animation.dart';
import 'bottom_text.dart';
import 'top_text.dart';
import 'package:http/http.dart' as http;
import 'package:project/api_connection/api_connection.dart';
import 'package:project/variables/data.dart';

enum Screens {
  createAccount,
  welcomeBack,
}

class LoginContent extends StatefulWidget {
  const LoginContent({Key? key}) : super(key: key);

  @override
  State<LoginContent> createState() => _LoginContentState();
}

class _LoginContentState extends State<LoginContent>
    with TickerProviderStateMixin {
  late final List<Widget> createAccountContent;
  late final List<Widget> loginContent;
  String islogin = '';
  validateUserEmail() async {
    try {
      print('in validate email');
      var res = await http.post(
        Uri.parse(API.validateEmail),
        body: {
          'user_email': GuserEmail,
          'user_name': GuserName,
        },
      );
      if (res.statusCode ==
          200) //from flutter app connection with api to server successfull
      {
        var resBodyOfValidateEmail = jsonDecode(res.body);
        if (resBodyOfValidateEmail['Found']) {
          print('email found');
          Fluttertoast.showToast(msg: 'email/username is already in use!');
        } else {
          print('email not found');
          registerAndSaveUserRecord();
        }
      }
    } catch (e) {
      print('fuccccccccccccccccccccccccccccccccccccccccccccck    $e');
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  registerAndSaveUserRecord() async {
    User userModel = User(1, GuserName, GuserEmail, GuserPassword);
    try {
      var res = await http.post(
        Uri.parse(API.signUp),
        body: userModel.toJason(),
      );
      if (res.statusCode ==
          200) //from flutter app connection with api to server successfull
      {
        var resBodyOfSignup = json.decode(res.body);
        if (resBodyOfSignup['success']) {
          print('asfasfsafasfafasfasfasfasf');
          Fluttertoast.showToast(msg: 'SignUp successfully!');
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const WelcomeScreen()),
              (r) => false);
        } else {
          Fluttertoast.showToast(msg: 'Error: try again');
        }
      }
    } catch (e) {
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  loginCredentials() async {
    try {
      print('in logincredentials email');
      var res = await http.post(
        Uri.parse(API.validateEmailUsernamePassword),
        body: {
          'user_email': GuserNameEmail,
          'user_name': GuserNameEmail,
          'user_password': GuserPassword,
        },
      );
      if (res.statusCode ==
          200) //from flutter app connection with api to server successfull
      {
        print('res = 200');
        var resBodyOfLogin = jsonDecode(res.body);
        if (resBodyOfLogin['Found']) {
          print('afsaf');
          print('email found');
          Fluttertoast.showToast(msg: 'signup succesfully!');
          User userInfo = User.fromJason(resBodyOfLogin["userData"]);
          await RememberUserPrefs.saveRememberUser(userInfo);
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const WelcomeScreen()),
              (r) => false);
        } else {
          Fluttertoast.showToast(msg: 'credentials not found!');
          print('invalid credentials not found');
        }
      }
    } catch (e) {
      print('fuccccccccccccccccccccccccccccccccccccccccccccck    $e');
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  Widget inputField(String hint, IconData iconData) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 8),
      child: SizedBox(
        height: 50,
        child: Material(
          elevation: 8,
          shadowColor: Colors.black87,
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(30),
          child: TextField(
            obscureText: hint == 'Password' ? true : false,
            onChanged: (value) {
              if (hint == 'Email') GuserEmail = value;
              if (hint == 'Password') GuserPassword = value;
              if (hint == 'Username') GuserName = value;
              if (hint == 'Email / Username') GuserNameEmail = value;
            },
            onTap: () => print(GuserEmail),
            textAlignVertical: TextAlignVertical.bottom,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.white,
              hintText: hint,
              prefixIcon: Icon(iconData),
            ),
          ),
        ),
      ),
    );
  }

  Widget loginButton(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 135, vertical: 16),
      child: ElevatedButton(
        onPressed: () {
          title == 'Log In' ? islogin = 'login' : islogin = 'signup';
          print('login pressed');
          print('email      $GuserEmail');
          print('username      $GuserName');
          print('password      $GuserPassword');
          print('usernameEmail      $GuserNameEmail');
          print('islogin               $islogin');
          // print('emailllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll'+email +' '+ username);
          final bool isValidEmail = EmailValidator.validate(GuserEmail);
          if (islogin == 'signup') {
            if (!isValidEmail) {
              Fluttertoast.showToast(msg: 'Please enter a valid email!');
            } else if (GuserName == '') {
              Fluttertoast.showToast(msg: 'Please enter username');
            } else if (GuserPassword == '') {
              Fluttertoast.showToast(msg: 'Please enter password');
            } else {
              //validate unique email eg jhon@gmail.com belong to only one person

              validateUserEmail();
            }
          }
          if (islogin == 'login') {
            if (GuserNameEmail == '') {
              Fluttertoast.showToast(msg: 'Please enter valid username/email');
            } else if (GuserPassword == '') {
              Fluttertoast.showToast(msg: 'Please enter password');
            } else {
              //validate unique email eg jhon@gmail.com belong to only one person
              loginCredentials();
            }
          }
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 14),
          backgroundColor: kSecondaryColor,
          shape: const StadiumBorder(),
          elevation: 8,
          shadowColor: Colors.black87,
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget orDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 130, vertical: 8),
      child: Row(
        children: [
          Flexible(
            child: Container(
              height: 1,
              color: kPrimaryColor,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 30),
            child: Text(
              'or',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Flexible(
            child: Container(
              height: 1,
              color: kPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }

  // Widget logos() {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(vertical: 16),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         Image.asset('images/facebook.png',width: 50,),
  //         const SizedBox(width: 24),
  //         Image.asset('images/google.png',width: 50,),
  //       ],
  //     ),
  //   );
  // }

  Widget forgotPassword() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 110),
      child: TextButton(
        onPressed: () {
          Fluttertoast.showToast(msg:'currently not available');
        },
        child: const Text(
          'Forgot Password?',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: kSecondaryColor,
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    createAccountContent = [
      inputField('Username', Ionicons.person_outline),
      inputField('Email', Ionicons.mail_outline),
      inputField('Password', Ionicons.lock_closed_outline),
      loginButton('Sign Up'),
      orDivider(),
      // logos(),
    ];

    loginContent = [
      inputField('Email / Username', Ionicons.mail_outline),
      inputField('Password', Ionicons.lock_closed_outline),
      // logos(),
      loginButton('Log In'),
      forgotPassword(),
    ];

    ChangeScreenAnimation.initialize(
      vsync: this,
      createAccountItems: createAccountContent.length,
      loginItems: loginContent.length,
    );

    for (var i = 0; i < createAccountContent.length; i++) {
      createAccountContent[i] = HelperFunctions.wrapWithAnimatedBuilder(
        animation: ChangeScreenAnimation.createAccountAnimations[i],
        child: createAccountContent[i],
      );
    }

    for (var i = 0; i < loginContent.length; i++) {
      loginContent[i] = HelperFunctions.wrapWithAnimatedBuilder(
        animation: ChangeScreenAnimation.loginAnimations[i],
        child: loginContent[i],
      );
    }

    // super.initState();
    // dbHelper = MyDataBase();
  }

  // @override
  // void dispose() {
  //   ChangeScreenAnimation.dispose();

  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Positioned(
          top: 136,
          left: 24,
          child: TopText(),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: createAccountContent,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: loginContent,
              ),
            ],
          ),
        ),
        const Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: 50),
            child: BottomText(),
          ),
        ),
      ],
    );
  }
}
