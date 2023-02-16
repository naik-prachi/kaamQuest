import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaam_quest/pages/login_page.dart';
import 'package:kaam_quest/pages/welcome_page.dart';

class AuthController extends GetxController {
  //AuthController should be accessible globally
  //hencewhy, need to create a instance of the class
  static AuthController instance = Get.find(); //AuthController.instance...

  //variable for firebase user, will include email, password, name,..
  late Rx<User?> _user;

  //variable for firebase authantication module
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(
        auth.currentUser); //can be typecased as: Rx<User?>(auth.currentUser);

    //our user would be notified, when theres a login or log off
    _user.bindStream(auth.userChanges());

    //_user: listener, _initialScreen: callback function
    //notifies that the user has logged in/out
    //firebase sends the nitification on user's this activity &
    //this notification gets processed in the app here
    ever(_user, _initialScreen);
  }

  //if user hasn't logged in, navigate to LoginPage, else if user has already logged in then to WelcomePage
  _initialScreen(User? user) {
    if (user == null) {
      print("login page");
      Get.offAll(() => LoginPage());
    } else {
      Get.offAll(() => WelcomePage(email: user.email!));
    }
  }

  //for signup process
  void register(String email, password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      Get.snackbar(
        "About User",
        "User message",
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.BOTTOM,
        titleText: AutoSizeText(
          "Account creation failed",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        messageText: AutoSizeText(
          e.toString(),
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      );
    }
  }

  //for login process
  void login(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar(
        "About Login",
        "Login message",
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.BOTTOM,
        titleText: AutoSizeText(
          "Login failed",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        messageText: AutoSizeText(
          e.toString(),
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      );
    }
  }

  Future<void> logOut() async {
    await auth.signOut();
  }
}
