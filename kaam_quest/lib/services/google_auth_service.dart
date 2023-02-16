import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kaam_quest/pages/login_page.dart';
import 'package:kaam_quest/pages/welcome_page.dart';

class GoogleAuthService {
  static GoogleAuthService instance = Get.find();
  // 1. handleAuthState()
  //determince if the user is authenticated.
  /*handleAuthState() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          //String email = FirebaseAuth.instance.currentUser!.displayName!;
          String email = FirebaseAuth.instance.currentUser!.email!;
          return WelcomePage(email: email);
        } else {
          return const LoginPage();
        }
      },
    );
  }*/

  // 2. signInWithGoogle()
  signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(scopes: <String>["email"]).signIn();

    // Obtain the auth details from request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // once signed in, return the UseCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  // 3. signOut()
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
